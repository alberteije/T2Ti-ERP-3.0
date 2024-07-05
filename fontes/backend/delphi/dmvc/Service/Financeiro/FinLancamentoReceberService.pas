{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   

@author Albert Eije (alberteije@gmail.com)
@version 1.0.0
*******************************************************************************}
unit FinLancamentoReceberService;

interface

uses
  FinLancamentoReceber, FinParcelaReceber, FinDocumentoOrigem, FinNaturezaFinanceira,
  Cliente, BancoContaCaixa, FinStatusParcela, Pessoa, Empresa, FinConfiguracaoBoleto,
  ViewPessoaCliente,
  EmpresaService, FinConfiguracaoBoletoService, ViewPessoaClienteService,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils,
  IniFiles;

type

  TFinLancamentoReceberService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFinLancamentoReceber: TObjectList<TFinLancamentoReceber>); overload;
    class procedure AnexarObjetosVinculados(AFinLancamentoReceber: TFinLancamentoReceber); overload;
    class procedure InserirObjetosFilhos(AFinLancamentoReceber: TFinLancamentoReceber);
    class procedure ExcluirObjetosFilhos(AFinLancamentoReceber: TFinLancamentoReceber);

    class procedure GerarArquivoIni(AFinLancamentoReceber: TFinLancamentoReceber);
    class procedure GerarArquivoEntradaLimparBoletos;
    class procedure GerarArquivoEntradaGerarBoletos(AFinLancamentoReceber: TFinLancamentoReceber);
    class function PegarRetornoSaida: string;
  public
    class function ConsultarLista: TObjectList<TFinLancamentoReceber>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFinLancamentoReceber>;
    class function ConsultarObjeto(AId: Integer): TFinLancamentoReceber;
    class procedure Inserir(AFinLancamentoReceber: TFinLancamentoReceber);
    class function Alterar(AFinLancamentoReceber: TFinLancamentoReceber): Integer;
    class function Excluir(AFinLancamentoReceber: TFinLancamentoReceber): Integer;

    class function GerarBoleto(AFinLancamentoReceber: TFinLancamentoReceber): string;
  end;

var
  sql: string;


implementation

{ TFinLancamentoReceberService }

class procedure TFinLancamentoReceberService.AnexarObjetosVinculados(AFinLancamentoReceber: TFinLancamentoReceber);
var
  FinParcelaReceber: TFinParcelaReceber;
begin
  // FinParcelaReceber
  sql := 'SELECT * FROM FIN_PARCELA_RECEBER WHERE ID_FIN_LANCAMENTO_RECEBER = ' + AFinLancamentoReceber.Id.ToString;
  AFinLancamentoReceber.ListaFinParcelaReceber := GetQuery(sql).AsObjectList<TFinParcelaReceber>;

  // vincula os status da parcela
  for FinParcelaReceber in AFinLancamentoReceber.ListaFinParcelaReceber do
  begin
    sql := 'SELECT * FROM FIN_STATUS_PARCELA WHERE ID = ' + FinParcelaReceber.IdFinStatusParcela.ToString;
    FinParcelaReceber.FinStatusParcela := GetQuery(sql).AsObject<TFinStatusParcela>;
  end;

  // FinDocumentoOrigem
  sql := 'SELECT * FROM FIN_DOCUMENTO_ORIGEM WHERE ID = ' + AFinLancamentoReceber.IdFinDocumentoOrigem.ToString;
  AFinLancamentoReceber.FinDocumentoOrigem := GetQuery(sql).AsObject<TFinDocumentoOrigem>;

  // FinNaturezaFinanceira
  sql := 'SELECT * FROM FIN_NATUREZA_FINANCEIRA WHERE ID = ' + AFinLancamentoReceber.IdFinNaturezaFinanceira.ToString;
  AFinLancamentoReceber.FinNaturezaFinanceira := GetQuery(sql).AsObject<TFinNaturezaFinanceira>;

  // Cliente
  sql := 'SELECT * FROM CLIENTE WHERE ID = ' + AFinLancamentoReceber.IdCliente.ToString;
  AFinLancamentoReceber.Cliente := GetQuery(sql).AsObject<TCliente>;

  // Pessoa
//  sql := 'SELECT * FROM PESSOA WHERE ID = ' + AFinLancamentoReceber.Cliente.IdPessoa.ToString;
//  AFinLancamentoReceber.Cliente.Pessoa := GetQuery(sql).AsObject<TPessoa>;

  // BancoContaCaixa
  sql := 'SELECT * FROM BANCO_CONTA_CAIXA WHERE ID = ' + AFinLancamentoReceber.IdBancoContaCaixa.ToString;
  AFinLancamentoReceber.BancoContaCaixa := GetQuery(sql).AsObject<TBancoContaCaixa>;

end;

class procedure TFinLancamentoReceberService.AnexarObjetosVinculados(AListaFinLancamentoReceber: TObjectList<TFinLancamentoReceber>);
var
  FinLancamentoReceber: TFinLancamentoReceber;
begin
  for FinLancamentoReceber in AListaFinLancamentoReceber do
  begin
    AnexarObjetosVinculados(FinLancamentoReceber);
  end;
end;

class function TFinLancamentoReceberService.ConsultarLista: TObjectList<TFinLancamentoReceber>;
begin
  sql := 'SELECT * FROM FIN_LANCAMENTO_RECEBER ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFinLancamentoReceber>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinLancamentoReceberService.ConsultarListaFiltro(AWhere: string): TObjectList<TFinLancamentoReceber>;
begin
  sql := 'SELECT * FROM FIN_LANCAMENTO_RECEBER where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFinLancamentoReceber>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinLancamentoReceberService.ConsultarObjeto(AId: Integer): TFinLancamentoReceber;
begin
  sql := 'SELECT * FROM FIN_LANCAMENTO_RECEBER WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFinLancamentoReceber>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFinLancamentoReceberService.Inserir(AFinLancamentoReceber: TFinLancamentoReceber);
begin
  AFinLancamentoReceber.ValidarInsercao;
  AFinLancamentoReceber.Id := InserirBase(AFinLancamentoReceber, 'FIN_LANCAMENTO_RECEBER');
  InserirObjetosFilhos(AFinLancamentoReceber);
end;

class function TFinLancamentoReceberService.Alterar(AFinLancamentoReceber: TFinLancamentoReceber): Integer;
begin
  AFinLancamentoReceber.ValidarAlteracao;
  Result := AlterarBase(AFinLancamentoReceber, 'FIN_LANCAMENTO_RECEBER');
  ExcluirObjetosFilhos(AFinLancamentoReceber);
  InserirObjetosFilhos(AFinLancamentoReceber);
end;

class procedure TFinLancamentoReceberService.InserirObjetosFilhos(AFinLancamentoReceber: TFinLancamentoReceber);
var
  FinParcelaReceber: TFinParcelaReceber;
begin
  // FinParcelaReceber
  for FinParcelaReceber in AFinLancamentoReceber.ListaFinParcelaReceber do
  begin
    FinParcelaReceber.IdFinLancamentoReceber := AFinLancamentoReceber.Id;
    InserirBase(FinParcelaReceber, 'FIN_PARCELA_RECEBER');
  end;

end;

class function TFinLancamentoReceberService.Excluir(AFinLancamentoReceber: TFinLancamentoReceber): Integer;
begin
  AFinLancamentoReceber.ValidarExclusao;
  ExcluirObjetosFilhos(AFinLancamentoReceber);
  Result := ExcluirBase(AFinLancamentoReceber.Id, 'FIN_LANCAMENTO_RECEBER');
end;

class procedure TFinLancamentoReceberService.ExcluirObjetosFilhos(AFinLancamentoReceber: TFinLancamentoReceber);
begin
  ExcluirFilho(AFinLancamentoReceber.Id, 'FIN_PARCELA_RECEBER', 'ID_FIN_LANCAMENTO_RECEBER');
end;

class function TFinLancamentoReceberService.GerarBoleto(AFinLancamentoReceber: TFinLancamentoReceber): string;
begin
  // primeiro passo - gerar o arquivo INI com os Titulos
  GerarArquivoIni(AFinLancamentoReceber);
  // segundo passo - limpar a lista de boletos
  GerarArquivoEntradaLimparBoletos;
  sleep(100);
  // terceiro passo - criar o arquivo de entrada para o ACBRMonitor
  GerarArquivoEntradaGerarBoletos(AFinLancamentoReceber);
  // quarto passo - Pegar o retorno e enviar para o controller
  Result := PegarRetornoSaida;
end;

class procedure TFinLancamentoReceberService.GerarArquivoIni(AFinLancamentoReceber: TFinLancamentoReceber);
var
  ArquivoIni: TIniFile;
  Empresa: TEmpresa;
  Parcela: TFinParcelaReceber;
  Cliente: TViewPessoaCliente;
  ConfiguracaoBoleto: TFinConfiguracaoBoleto;
  I: Integer;
  IncrementoBloco: string;
begin
  FormatSettings.DecimalSeparator := ',';

  // Pega a empresa
  Empresa := TEmpresaService.ConsultarObjeto(1);
  // Pega as configurações do boleto
  ConfiguracaoBoleto := TFinConfiguracaoBoletoService.ConsultarObjeto(1);
  // Pega o cliente
  Cliente := TViewPessoaClienteService.ConsultarObjeto(AFinLancamentoReceber.IdCliente);

  // cria o arquivo
  ArquivoIni := TIniFile.Create('c:\t2ti\boletos\ini\' + AFinLancamentoReceber.Id.ToString + '.ini');

  try
    //*******************************************************************************************
    //  [Cedente]
    //*******************************************************************************************
    ArquivoIni.WriteString('Cedente', 'Nome', Empresa.RazaoSocial);
    ArquivoIni.WriteString('Cedente', 'CNPJCPF', Empresa.Cnpj);
    ArquivoIni.WriteString('Cedente', 'Logradouro', Empresa.EnderecoPrincipal.Logradouro);
    ArquivoIni.WriteString('Cedente', 'Numero', Empresa.EnderecoPrincipal.Numero);
    ArquivoIni.WriteString('Cedente', 'Bairro', Empresa.EnderecoPrincipal.Bairro);
    ArquivoIni.WriteString('Cedente', 'Cidade', Empresa.EnderecoPrincipal.Cidade);
    ArquivoIni.WriteString('Cedente', 'CEP', Empresa.EnderecoPrincipal.Cep);
    ArquivoIni.WriteString('Cedente', 'Complemento', Empresa.EnderecoPrincipal.Complemento);
    ArquivoIni.WriteString('Cedente', 'UF', Empresa.EnderecoPrincipal.Uf);
    ArquivoIni.WriteString('Cedente', 'CodigoCedente', ConfiguracaoBoleto.CodigoCedente);
    ArquivoIni.WriteString('Cedente', 'Convenio', ConfiguracaoBoleto.CodigoConvenio);

    //*******************************************************************************************
    //  [Conta]
    //*******************************************************************************************
    ArquivoIni.WriteString('Conta', 'Agencia', ConfiguracaoBoleto.BancoContaCaixa.BancoAgencia.Numero);
    ArquivoIni.WriteString('Conta', 'AgenciaDigito', ConfiguracaoBoleto.BancoContaCaixa.BancoAgencia.Digito);
    ArquivoIni.WriteString('Conta', 'Conta', ConfiguracaoBoleto.BancoContaCaixa.Numero);
    ArquivoIni.WriteString('Conta', 'ContaDigito', ConfiguracaoBoleto.BancoContaCaixa.Digito);

    //*******************************************************************************************
    //  [Banco]
    //*******************************************************************************************
    ArquivoIni.WriteString('Banco', 'Numero', ConfiguracaoBoleto.BancoContaCaixa.BancoAgencia.Banco.Codigo);
    ArquivoIni.WriteString('Banco', 'CNAB', ConfiguracaoBoleto.LayoutRemessa);

    //*******************************************************************************************
    //  Títulos
    //*******************************************************************************************
    I := 0;
    for Parcela in AFinLancamentoReceber.ListaFinParcelaReceber do
    begin
      if Parcela.EmitiuBoleto = 'S' then
      begin
        Inc(I);
        //IncrementoBloco := StringOfChar('0', 3 - Length(IntToStr(I))) + IntToStr(I);
        IncrementoBloco := IntToStr(I);

        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'NumeroDocumento', Parcela.BoletoNossoNumero);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'NossoNumero', Parcela.BoletoNossoNumero);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'Carteira', ConfiguracaoBoleto.Carteira);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'LocalPagamento', ConfiguracaoBoleto.LocalPagamento);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'Vencimento', DateTimeToStr(Parcela.DataVencimento));
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'DataDocumento', DateTimeToStr(Parcela.DataVencimento));
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'DataProcessamento', DateTimeToStr(Now));
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'Aceite', ConfiguracaoBoleto.Aceite);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'TotalParcelas', AFinLancamentoReceber.QuantidadeParcela.ToString);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'ValorDesconto', Parcela.ValorDesconto.ToString);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'DataDesconto', DateTimeToStr(Parcela.DescontoAte));
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'ValorDocumento', Parcela.Valor.ToString);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'Parcela', Parcela.NumeroParcela.ToString);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'PercentualMulta', Parcela.TaxaMulta.ToString);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'Instrucao1', ConfiguracaoBoleto.Instrucao01);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'Instrucao2', ConfiguracaoBoleto.Instrucao02);

        // Sacado
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'Sacado.NomeSacado', Cliente.Nome);
        ArquivoIni.WriteString('Titulo' + IncrementoBloco, 'Sacado.CNPJCPF', Cliente.CpfCnpj);
      end;
    end;

  finally
    ArquivoIni.Free;
    Empresa.Free;
    Cliente.Free;
    ConfiguracaoBoleto.Free;
    FormatSettings.DecimalSeparator := '.';
  end;

end;

class procedure TFinLancamentoReceberService.GerarArquivoEntradaLimparBoletos;
var
  ArquivoEntrada: TextFile;
begin
  try
    // apaga o arquivo 'SAI.TXT'
    DeleteFile('c:\ACBrMonitor\SAI.TXT');

    // cria o arquivo 'ENT.TXT' - limpa a lista de boletos
    AssignFile(ArquivoEntrada, 'c:\ACBrMonitor\ENT.TXT');
    Rewrite(ArquivoEntrada);
    Writeln(ArquivoEntrada, 'BOLETO.LimparLista');
  finally
    CloseFile(ArquivoEntrada);
  end;
end;

class procedure TFinLancamentoReceberService.GerarArquivoEntradaGerarBoletos(AFinLancamentoReceber: TFinLancamentoReceber);
var
  ArquivoEntrada: TextFile;
begin
  try
    // apaga o arquivo 'SAI.TXT'
    DeleteFile('c:\ACBrMonitor\SAI.TXT');

    // cria o arquivo 'ENT.TXT' - limpa a lista de boletos
    AssignFile(ArquivoEntrada, 'c:\ACBrMonitor\ENT.TXT');
    Rewrite(ArquivoEntrada);
    Writeln(ArquivoEntrada, 'BOLETO.IncluirTitulos("c:\t2ti\boletos\ini\' + AFinLancamentoReceber.Id.ToString + '.ini", "I")');
  finally
    CloseFile(ArquivoEntrada);
  end;
end;

class function TFinLancamentoReceberService.PegarRetornoSaida: string;
var
  ArquivoSaida: TIniFile;
begin
  while not FileExists('C:\ACBrMonitor\sai.txt') do
  begin
  end;

  result := 'C:\T2Ti\Boletos\PDF\boleto.pdf';
end;

end.
