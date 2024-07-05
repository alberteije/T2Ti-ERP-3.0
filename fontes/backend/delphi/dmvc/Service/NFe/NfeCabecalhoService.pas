{*******************************************************************************
Title: T2Ti ERP Fenix
Description: Service relacionado à tabela [NFE_CABECALHO]

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
unit NfeCabecalhoService;

interface

uses
  NfeCabecalho, NfeAcessoXml, NfeCana, NfeCteReferenciado, NfeCupomFiscalReferenciado,
  NfeDestinatario, NfeDetalhe, NfeEmitente, NfeFatura, NfeInformacaoPagamento,
  NfeLocalEntrega, NfeLocalRetirada, NfeNfReferenciada, NfeProcessoReferenciado,
  NfeProdRuralReferenciada, NfeReferenciada, NfeResponsavelTecnico, NfeTransporte,
  Vendedor, Fornecedor, Cliente, TributOperacaoFiscal, VendaCabecalho,
  ViewPessoaFornecedor, ViewPessoaCliente,
  Empresa, ObjetoNfe, NfeNumero, NfeNumeroService,
  NfeCalculoService, NfeDetalheService, EmpresaService, ControleEstoqueService,
  System.Classes, System.SysUtils, System.Generics.Collections, ServiceBase,
  MVCFramework.DataSet.Utils, StrUtils, IniFiles;

type

  TNfeCabecalhoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaNfeCabecalho: TObjectList<TNfeCabecalho>); overload;
    class procedure AnexarObjetosVinculados(ANfeCabecalho: TNfeCabecalho); overload;
    class procedure InserirObjetosFilhos(ANfeCabecalho: TNfeCabecalho);
    class procedure ExcluirObjetosFilhos(ANfeCabecalho: TNfeCabecalho);
    class procedure ProcessarCalculosNoItem(CalculoNFE: TCalculoNFE; ANfeDetalhe: TNfeDetalhe);
    class function GerarArquivoIniNFe(ANfeCabecalho: TNfeCabecalho): String;

    class procedure CriarNFe(ACaminhoArquivoIni: string);
    class procedure EnviarNFe(ACaminhoArquivoXml: string);
    class procedure ImprimirDanfe(ACaminhoArquivoXml: string);
    class function InutilizarNumero(AObjetoNfe: TObjetoNfe): string;
    class function ApagarArquivoSaida: Boolean;
    class function AguardarArquivoSaida: Boolean;
    class procedure GerarArquivoEntrada(AComando: string);
    class function PegarRetornoSaida(AOperacao: string): string;

  public
    class function ConsultarLista: TObjectList<TNfeCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TNfeCabecalho>;
    class function ConsultarObjeto(AId: Integer): TNfeCabecalho;
    class procedure Inserir(ANfeCabecalho: TNfeCabecalho);
    class function Alterar(ANfeCabecalho: TNfeCabecalho): Integer;
    class function Excluir(ANfeCabecalho: TNfeCabecalho): Integer;

    class procedure CalcularTotais(ANfeCabecalho: TNfeCabecalho);
    class function TransmitirNFe(ANfeCabecalho: TNfeCabecalho): string;
    class function GerarPDFDanfe(AChave: string): string;
  end;

var
  sql: string;
const
  CaminhoComCnpj = 'C:\ACBrMonitor\10793118000178\';


implementation

{ TNfeCabecalhoService }

class procedure TNfeCabecalhoService.AnexarObjetosVinculados(ANfeCabecalho: TNfeCabecalho);
var
  NfeDetalhe: TNfeDetalhe;
begin
  // NfeAcessoXml
  sql := 'SELECT * FROM NFE_ACESSO_XML WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.ListaNfeAcessoXml := GetQuery(sql).AsObjectList<TNfeAcessoXml>;

  // NfeCana
  sql := 'SELECT * FROM NFE_CANA WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.NfeCana := GetQuery(sql).AsObject<TNfeCana>;

  // NfeCteReferenciado
  sql := 'SELECT * FROM NFE_CTE_REFERENCIADO WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.ListaNfeCteReferenciado := GetQuery(sql).AsObjectList<TNfeCteReferenciado>;

  // NfeCupomFiscalReferenciado
  sql := 'SELECT * FROM NFE_CUPOM_FISCAL_REFERENCIADO WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.ListaNfeCupomFiscalReferenciado := GetQuery(sql).AsObjectList<TNfeCupomFiscalReferenciado>;

  // NfeDestinatario
  sql := 'SELECT * FROM NFE_DESTINATARIO WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.NfeDestinatario := GetQuery(sql).AsObject<TNfeDestinatario>;

  // NfeEmitente
  sql := 'SELECT * FROM NFE_EMITENTE WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.NfeEmitente := GetQuery(sql).AsObject<TNfeEmitente>;

  // NfeFatura
  sql := 'SELECT * FROM NFE_FATURA WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.NfeFatura := GetQuery(sql).AsObject<TNfeFatura>;

  // NfeInformacaoPagamento
  sql := 'SELECT * FROM NFE_INFORMACAO_PAGAMENTO WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.NfeInformacaoPagamento := GetQuery(sql).AsObject<TNfeInformacaoPagamento>;

  // NfeLocalEntrega
  sql := 'SELECT * FROM NFE_LOCAL_ENTREGA WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.NfeLocalEntrega := GetQuery(sql).AsObject<TNfeLocalEntrega>;

  // NfeLocalRetirada
  sql := 'SELECT * FROM NFE_LOCAL_RETIRADA WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.NfeLocalRetirada := GetQuery(sql).AsObject<TNfeLocalRetirada>;

  // NfeNfReferenciada
  sql := 'SELECT * FROM NFE_NF_REFERENCIADA WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.ListaNfeNfReferenciada := GetQuery(sql).AsObjectList<TNfeNfReferenciada>;

  // NfeProcessoReferenciado
  sql := 'SELECT * FROM NFE_PROCESSO_REFERENCIADO WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.ListaNfeProcessoReferenciado := GetQuery(sql).AsObjectList<TNfeProcessoReferenciado>;

  // NfeProdRuralReferenciada
  sql := 'SELECT * FROM NFE_PROD_RURAL_REFERENCIADA WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.ListaNfeProdRuralReferenciada := GetQuery(sql).AsObjectList<TNfeProdRuralReferenciada>;

  // NfeReferenciada
  sql := 'SELECT * FROM NFE_REFERENCIADA WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.ListaNfeReferenciada := GetQuery(sql).AsObjectList<TNfeReferenciada>;

  // NfeResponsavelTecnico
  sql := 'SELECT * FROM NFE_RESPONSAVEL_TECNICO WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.NfeResponsavelTecnico := GetQuery(sql).AsObject<TNfeResponsavelTecnico>;

  // NfeTransporte
  sql := 'SELECT * FROM NFE_TRANSPORTE WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.NfeTransporte := GetQuery(sql).AsObject<TNfeTransporte>;

  // Vendedor
  sql := 'SELECT * FROM VENDEDOR WHERE ID = ' + ANfeCabecalho.IdVendedor.ToString;
  ANfeCabecalho.Vendedor := GetQuery(sql).AsObject<TVendedor>;

  // Fornecedor
  sql := 'SELECT * FROM FORNECEDOR WHERE ID = ' + ANfeCabecalho.IdFornecedor.ToString;
  ANfeCabecalho.Fornecedor := GetQuery(sql).AsObject<TFornecedor>;

  // ViewPessoaFornecedor
  if assigned(ANfeCabecalho.Fornecedor) then
  begin
    sql := 'SELECT * FROM VIEW_PESSOA_FORNECEDOR WHERE ID = ' + ANfeCabecalho.IdFornecedor.ToString;
    ANfeCabecalho.Fornecedor.ViewPessoaFornecedor := GetQuery(sql).AsObject<TViewPessoaFornecedor>;
  end;

  // Cliente
  sql := 'SELECT * FROM CLIENTE WHERE ID = ' + ANfeCabecalho.IdCliente.ToString;
  ANfeCabecalho.Cliente := GetQuery(sql).AsObject<TCliente>;

  // ViewPessoaCliente
  if assigned(ANfeCabecalho.Cliente) then
  begin
    sql := 'SELECT * FROM VIEW_PESSOA_CLIENTE WHERE ID = ' + ANfeCabecalho.IdCliente.ToString;
    ANfeCabecalho.Cliente.ViewPessoaCliente := GetQuery(sql).AsObject<TViewPessoaCliente>;
  end;

  // TributOperacaoFiscal
  sql := 'SELECT * FROM TRIBUT_OPERACAO_FISCAL WHERE ID = ' + ANfeCabecalho.IdTributOperacaoFiscal.ToString;
  ANfeCabecalho.TributOperacaoFiscal := GetQuery(sql).AsObject<TTributOperacaoFiscal>;

  // VendaCabecalho
  sql := 'SELECT * FROM VENDA_CABECALHO WHERE ID = ' + ANfeCabecalho.IdVendaCabecalho.ToString;
  ANfeCabecalho.VendaCabecalho := GetQuery(sql).AsObject<TVendaCabecalho>;

  // NfeDetalhe
  sql := 'SELECT * FROM NFE_DETALHE WHERE ID_NFE_CABECALHO = ' + ANfeCabecalho.Id.ToString;
  ANfeCabecalho.ListaNfeDetalhe := GetQuery(sql).AsObjectList<TNfeDetalhe>;

  // 20200623 - EIJE - ITENS VINCULADOS AO DETALHE - INSERIDOS MANUALMENTE - NÃO FOI GERADO PELO GERADOR DE CÓDIGO
  for NfeDetalhe in ANfeCabecalho.ListaNfeDetalhe do
  begin
    TNFEDetalheService.AnexarObjetosVinculados(NfeDetalhe);
  end;

end;

class procedure TNfeCabecalhoService.AnexarObjetosVinculados(AListaNfeCabecalho: TObjectList<TNfeCabecalho>);
var
  NfeCabecalho: TNfeCabecalho;
begin
  for NfeCabecalho in AListaNfeCabecalho do
  begin
    AnexarObjetosVinculados(NfeCabecalho);
  end;
end;

class function TNfeCabecalhoService.ConsultarLista: TObjectList<TNfeCabecalho>;
begin
  sql := 'SELECT * FROM NFE_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TNfeCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNfeCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TNfeCabecalho>;
begin
  sql := 'SELECT * FROM NFE_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TNfeCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNfeCabecalhoService.ConsultarObjeto(AId: Integer): TNfeCabecalho;
begin
  sql := 'SELECT * FROM NFE_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TNfeCabecalho>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TNfeCabecalhoService.Inserir(ANfeCabecalho: TNfeCabecalho);
var
  NfeNumero: TNfeNumero;
begin
  ANfeCabecalho.ValidarInsercao;
  CalcularTotais(ANfeCabecalho);
  ANfeCabecalho.Id := InserirBase(ANfeCabecalho, 'NFE_CABECALHO');

  NfeNumero := TNfeNumeroService.ConsultarObjeto(1);

  ANfeCabecalho.CodigoNumerico := Format('%.*d', [7, NfeNumero.Numero]);
  ANfeCabecalho.CodigoNumerico := '9' + ANfeCabecalho.CodigoNumerico;
  ANfeCabecalho.Numero := Format('%.*d', [9, NfeNumero.Numero]);
  ANfeCabecalho.Serie := NfeNumero.Serie;
  ANfeCabecalho.VersaoProcessoEmissao := '100';

  NfeNumero.Numero := NfeNumero.Numero + 1;
  AlterarBase(NfeNumero, 'NFE_NUMERO');

  AlterarBase(ANfeCabecalho, 'NFE_CABECALHO');
  InserirObjetosFilhos(ANfeCabecalho);
end;

class function TNfeCabecalhoService.Alterar(ANfeCabecalho: TNfeCabecalho): Integer;
begin
  ANfeCabecalho.ValidarAlteracao;
  CalcularTotais(ANfeCabecalho);
  Result := AlterarBase(ANfeCabecalho, 'NFE_CABECALHO');
  ExcluirObjetosFilhos(ANfeCabecalho);
  InserirObjetosFilhos(ANfeCabecalho);
end;

class procedure TNfeCabecalhoService.InserirObjetosFilhos(ANfeCabecalho: TNfeCabecalho);
var
  NfeAcessoXml: TNfeAcessoXml;
  NfeCteReferenciado: TNfeCteReferenciado;
  NfeCupomFiscalReferenciado: TNfeCupomFiscalReferenciado;
  NfeDetalhe: TNfeDetalhe;
  NfeNfReferenciada: TNfeNfReferenciada;
  NfeProcessoReferenciado: TNfeProcessoReferenciado;
  NfeProdRuralReferenciada: TNfeProdRuralReferenciada;
  NfeReferenciada: TNfeReferenciada;
begin
  // NfeDetalhe
  for NfeDetalhe in ANfeCabecalho.ListaNfeDetalhe do
  begin
    NfeDetalhe.Id := 0;
    NfeDetalhe.IdNfeCabecalho := ANfeCabecalho.Id;
    TNfeDetalheService.Inserir(NfeDetalhe);

    // Atualizar Estoque
    if ANfeCabecalho.TipoOperacao = '0' then // entrada
      TControleEstoqueService.AtualizarEstoque(NfeDetalhe.Produto, NfeDetalhe.Produto.QuantidadeEstoque, 'I')
    else
      TControleEstoqueService.AtualizarEstoque(NfeDetalhe.Produto, NfeDetalhe.Produto.QuantidadeEstoque, 'D');
  end;

  // NfeAcessoXml
  for NfeAcessoXml in ANfeCabecalho.ListaNfeAcessoXml do
  begin
    NfeAcessoXml.IdNfeCabecalho := ANfeCabecalho.Id;
    InserirBase(NfeAcessoXml, 'NFE_ACESSO_XML');
  end;

  // NfeCana
  ANfeCabecalho.NfeCana.IdNfeCabecalho := ANfeCabecalho.Id;
  InserirBase(ANfeCabecalho.NfeCana, 'NFE_CANA');

  // NfeCteReferenciado
  for NfeCteReferenciado in ANfeCabecalho.ListaNfeCteReferenciado do
  begin
    NfeCteReferenciado.IdNfeCabecalho := ANfeCabecalho.Id;
    InserirBase(NfeCteReferenciado, 'NFE_CTE_REFERENCIADO');
  end;

  // NfeCupomFiscalReferenciado
  for NfeCupomFiscalReferenciado in ANfeCabecalho.ListaNfeCupomFiscalReferenciado do
  begin
    NfeCupomFiscalReferenciado.IdNfeCabecalho := ANfeCabecalho.Id;
    InserirBase(NfeCupomFiscalReferenciado, 'NFE_CUPOM_FISCAL_REFERENCIADO');
  end;

  // NfeDestinatario
  ANfeCabecalho.NfeDestinatario.IdNfeCabecalho := ANfeCabecalho.Id;
  InserirBase(ANfeCabecalho.NfeDestinatario, 'NFE_DESTINATARIO');

  // NfeEmitente
  ANfeCabecalho.NfeEmitente.IdNfeCabecalho := ANfeCabecalho.Id;
  InserirBase(ANfeCabecalho.NfeEmitente, 'NFE_EMITENTE');

  // NfeFatura
  ANfeCabecalho.NfeFatura.IdNfeCabecalho := ANfeCabecalho.Id;
  InserirBase(ANfeCabecalho.NfeFatura, 'NFE_FATURA');

  // NfeInformacaoPagamento
  ANfeCabecalho.NfeInformacaoPagamento.IdNfeCabecalho := ANfeCabecalho.Id;
  InserirBase(ANfeCabecalho.NfeInformacaoPagamento, 'NFE_INFORMACAO_PAGAMENTO');

  // NfeLocalEntrega
  ANfeCabecalho.NfeLocalEntrega.IdNfeCabecalho := ANfeCabecalho.Id;
  InserirBase(ANfeCabecalho.NfeLocalEntrega, 'NFE_LOCAL_ENTREGA');

  // NfeLocalRetirada
  ANfeCabecalho.NfeLocalRetirada.IdNfeCabecalho := ANfeCabecalho.Id;
  InserirBase(ANfeCabecalho.NfeLocalRetirada, 'NFE_LOCAL_RETIRADA');

  // NfeNfReferenciada
  for NfeNfReferenciada in ANfeCabecalho.ListaNfeNfReferenciada do
  begin
    NfeNfReferenciada.IdNfeCabecalho := ANfeCabecalho.Id;
    InserirBase(NfeNfReferenciada, 'NFE_NF_REFERENCIADA');
  end;

  // NfeProcessoReferenciado
  for NfeProcessoReferenciado in ANfeCabecalho.ListaNfeProcessoReferenciado do
  begin
    NfeProcessoReferenciado.IdNfeCabecalho := ANfeCabecalho.Id;
    InserirBase(NfeProcessoReferenciado, 'NFE_PROCESSO_REFERENCIADO');
  end;

  // NfeProdRuralReferenciada
  for NfeProdRuralReferenciada in ANfeCabecalho.ListaNfeProdRuralReferenciada do
  begin
    NfeProdRuralReferenciada.IdNfeCabecalho := ANfeCabecalho.Id;
    InserirBase(NfeProdRuralReferenciada, 'NFE_PROD_RURAL_REFERENCIADA');
  end;

  // NfeReferenciada
  for NfeReferenciada in ANfeCabecalho.ListaNfeReferenciada do
  begin
    NfeReferenciada.IdNfeCabecalho := ANfeCabecalho.Id;
    InserirBase(NfeReferenciada, 'NFE_REFERENCIADA');
  end;

  // NfeResponsavelTecnico
  ANfeCabecalho.NfeResponsavelTecnico.IdNfeCabecalho := ANfeCabecalho.Id;
  InserirBase(ANfeCabecalho.NfeResponsavelTecnico, 'NFE_RESPONSAVEL_TECNICO');

  // NfeTransporte
  ANfeCabecalho.NfeTransporte.IdNfeCabecalho := ANfeCabecalho.Id;
  InserirBase(ANfeCabecalho.NfeTransporte, 'NFE_TRANSPORTE');
end;

class function TNfeCabecalhoService.Excluir(ANfeCabecalho: TNfeCabecalho): Integer;
begin
  ANfeCabecalho.ValidarExclusao;
  ExcluirObjetosFilhos(ANfeCabecalho);
  Result := ExcluirBase(ANfeCabecalho.Id, 'NFE_CABECALHO');
end;

class procedure TNfeCabecalhoService.ExcluirObjetosFilhos(ANfeCabecalho: TNfeCabecalho);
var
  NfeDetalhe: TNfeDetalhe;
begin
  // NfeDetalhe 20200623 - EIJE - Inserido o bloco abaixo para excluir os filhos do item
  for NfeDetalhe in ANfeCabecalho.ListaNfeDetalhe do
  begin
    TNfeDetalheService.ExcluirObjetosFilhos(NfeDetalhe);
  end;

  ExcluirFilho(ANfeCabecalho.Id, 'NFE_ACESSO_XML', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_CANA', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_CTE_REFERENCIADO', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_CUPOM_FISCAL_REFERENCIADO', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_DESTINATARIO', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_DETALHE', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_EMITENTE', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_FATURA', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_INFORMACAO_PAGAMENTO', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_LOCAL_ENTREGA', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_LOCAL_RETIRADA', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_NF_REFERENCIADA', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_PROCESSO_REFERENCIADO', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_PROD_RURAL_REFERENCIADA', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_REFERENCIADA', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_RESPONSAVEL_TECNICO', 'ID_NFE_CABECALHO');
  ExcluirFilho(ANfeCabecalho.Id, 'NFE_TRANSPORTE', 'ID_NFE_CABECALHO');
end;

class procedure TNfeCabecalhoService.CalcularTotais(ANfeCabecalho: TNfeCabecalho);
var
  TotalProdutos, ValorFrete, ValorSeguro, ValorOutrasDespesas, Desconto, BaseCalculoIcms, ValorIcms, BaseCalculoIcmsSt, ValorIcmsSt, ValorIpi, ValorPis, ValorCofins, ValorNotaFiscal: Double;
  TotalServicos, BaseCalculoIssqn, ValorIssqn, ValorPisIssqn, ValorCofinsIssqn: Double;
  //
  NfeDetalhe: TNfeDetalhe;
  Empresa: TEmpresa;
  CalculoNFE: TCalculoNFE;
begin
  TotalProdutos := 0;
  ValorFrete := 0;
  ValorSeguro := 0;
  ValorOutrasDespesas := 0;
  Desconto := 0;
  BaseCalculoIcms := 0;
  ValorIcms := 0;
  BaseCalculoIcmsSt := 0;
  ValorIcmsSt := 0;
  ValorIpi := 0;
  ValorPis := 0;
  ValorCofins := 0;
  //
  TotalServicos := 0;
  BaseCalculoIssqn := 0;
  ValorIssqn := 0;
  ValorPisIssqn := 0;
  ValorCofinsIssqn := 0;

  // Pega a empresa
  Empresa := TEmpresaService.ConsultarObjeto(1); // É possível pegar os dados da NfeEmitente, dependendo da estratégia definida pelo desenvolvedor

  try
    // Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
    if ANfeCabecalho.TributOperacaoFiscal.Cfop > 0 then
    begin
      for NfeDetalhe in ANfeCabecalho.ListaNfeDetalhe do
      begin
        TotalServicos := TotalServicos + NfeDetalhe.ValorTotal;
        ValorFrete := ValorFrete + NfeDetalhe.ValorFrete;
        ValorSeguro := ValorSeguro + NfeDetalhe.ValorSeguro;
        ValorOutrasDespesas := ValorOutrasDespesas + NfeDetalhe.ValorOutrasDespesas;
        Desconto := Desconto + NfeDetalhe.ValorDesconto;
        BaseCalculoIssqn := BaseCalculoIssqn + NfeDetalhe.NfeDetalheImpostoIssqn.BaseCalculoIssqn;
        ValorIssqn := ValorIssqn + NfeDetalhe.NfeDetalheImpostoIssqn.ValorIssqn;
        ValorPisIssqn := ValorPisIssqn + NfeDetalhe.NfeDetalheImpostoPis.ValorPis;
        ValorCofinsIssqn := ValorCofinsIssqn + ValorPisIssqn + NfeDetalhe.NfeDetalheImpostoCofins.ValorCofins;
      end;
      //
      ValorNotaFiscal := TotalServicos + ValorPis + ValorCofins + ValorOutrasDespesas - Desconto;
      ANfeCabecalho.ValorServicos := TotalServicos;
    end
    else
    begin
      CalculoNFE := TCalculoNFE.Create;
      if Empresa.Crt <> '' then
        CalculoNFE.CrtEmissor := StrToInt(Empresa.Crt);
      CalculoNFE.UFemissor := Empresa.CodigoIbgeUf;
      if ANfeCabecalho.NfeDestinatario.Cnpj <> '' then
        CalculoNFE.TipoCliente := 'J'
      else
        CalculoNFE.TipoCliente := 'F';
      CalculoNFE.UFCliente := ANfeCabecalho.NfeDestinatario.Uf;

      for NfeDetalhe in ANfeCabecalho.ListaNfeDetalhe do
      begin
        ProcessarCalculosNoItem(CalculoNFE, NfeDetalhe);

        TotalProdutos := TotalProdutos + NfeDetalhe.ValorTotal;
        ValorFrete := ValorFrete + NfeDetalhe.ValorFrete;
        ValorSeguro := ValorSeguro + NfeDetalhe.ValorSeguro;
        ValorOutrasDespesas := ValorOutrasDespesas + NfeDetalhe.ValorOutrasDespesas;
        Desconto := Desconto + NfeDetalhe.ValorDesconto;
        BaseCalculoIcms := BaseCalculoIcms + NfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms;
        ValorIcms := ValorIcms + NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms;
        BaseCalculoIcmsSt := BaseCalculoIcmsSt + NfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt;
        ValorIcmsSt := ValorIcmsSt + NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt;
        ValorIpi := ValorIpi + NfeDetalhe.NfeDetalheImpostoIpi.ValorIpi;
        ValorPis := ValorPis + NfeDetalhe.NfeDetalheImpostoPis.ValorPis;
        ValorCofins := ValorCofins + NfeDetalhe.NfeDetalheImpostoCofins.ValorCofins;
      end;
      //
      ValorNotaFiscal := TotalProdutos + ValorIcmsSt + ValorPis + ValorCofins + ValorIpi + ValorOutrasDespesas - Desconto;
    end;

    ANfeCabecalho.ValorTotalProdutos := TotalProdutos;
    ANfeCabecalho.ValorFrete := ValorFrete;
    ANfeCabecalho.ValorSeguro := ValorSeguro;
    ANfeCabecalho.ValorDespesasAcessorias := ValorOutrasDespesas;
    ANfeCabecalho.ValorDesconto := Desconto;
    ANfeCabecalho.BaseCalculoIcms := BaseCalculoIcms;
    ANfeCabecalho.ValorIcms := ValorIcms;
    ANfeCabecalho.BaseCalculoIcmsSt := BaseCalculoIcmsSt;
    ANfeCabecalho.ValorIcmsSt := ValorIcmsSt;
    ANfeCabecalho.ValorIPI := ValorIpi;
    ANfeCabecalho.ValorPIS := ValorPis;
    ANfeCabecalho.ValorCOFINS := ValorCofins;
    //
    ANfeCabecalho.BaseCalculoIssqn := BaseCalculoIssqn;
    ANfeCabecalho.ValorIssqn := ValorIssqn;
    ANfeCabecalho.ValorPisIssqn := ValorPisIssqn;
    ANfeCabecalho.ValorCofinsIssqn := ValorCofinsIssqn;
    //
    ANfeCabecalho.ValorTotal := ValorNotaFiscal;
  finally
    FreeAndNil(Empresa);
  end;
end;

class procedure TNfeCabecalhoService.ProcessarCalculosNoItem(CalculoNFE: TCalculoNFE; ANfeDetalhe: TNfeDetalhe);
begin
  try
    CalculoNFE.ValorBrutoProdutos := ANfeDetalhe.ValorBrutoProduto;
    CalculoNFE.ValorFrete := ANfeDetalhe.ValorFrete;
    CalculoNFE.ValorSeguro := ANfeDetalhe.ValorSeguro;
    CalculoNFE.ValorOutrasDespesas := ANfeDetalhe.ValorOutrasDespesas;
    CalculoNFE.ValorDesconto := ANfeDetalhe.ValorDesconto;
    CalculoNFE.CstIcms := ANfeDetalhe.NfeDetalheImpostoIcms.CstIcms;
    CalculoNFE.Csosn := ANfeDetalhe.NfeDetalheImpostoIcms.Csosn;
    CalculoNFE.ModalidadeBcIcms := ANfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms;
    CalculoNFE.TaxaReducaoBcIcms := ANfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms;
    CalculoNFE.AliquotaIcms := ANfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms;
    CalculoNFE.AliquotaIcmsInter := ANfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms;
    CalculoNFE.ModalidadeBcIcmsSt := ANfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt;
    CalculoNFE.PercentualMvaIcmsSt := ANfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt;
    CalculoNFE.ReducaoBcIcmsSt := ANfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt;
    CalculoNFE.AliquotaIcmsSt := ANfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt;
    CalculoNFE.AliquotaCreditoIcmsSn := ANfeDetalhe.NfeDetalheImpostoIcms.AliquotaCreditoIcmsSn;
    CalculoNFE.CstIpi := ANfeDetalhe.NfeDetalheImpostoIpi.CstIpi;
    CalculoNFE.AliquotaIpi := ANfeDetalhe.NfeDetalheImpostoIpi.AliquotaIpi;
    CalculoNFE.CstPis := ANfeDetalhe.NfeDetalheImpostoPis.CstPis;
    CalculoNFE.AliquotaPis := ANfeDetalhe.NfeDetalheImpostoPis.AliquotaPisPercentual;
    CalculoNFE.AliquotaPisReais := ANfeDetalhe.NfeDetalheImpostoPis.AliquotaPisReais;
    CalculoNFE.CstCofins := ANfeDetalhe.NfeDetalheImpostoCofins.CstCofins;
    CalculoNFE.AliquotaCofins := ANfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsPercentual;
    CalculoNFE.AliquotaCofinsReais := ANfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsReais;

    CalculoNFE := TNFeCalculoService.Calcular(CalculoNFE);

    { Valores ICMS }
    ANfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms := CalculoNFE.BaseCalculoIcms;
    ANfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt := CalculoNFE.ReducaoBcIcmsSt;
    ANfeDetalhe.NfeDetalheImpostoIcms.ValorIcms := CalculoNFE.ValorIcms;
    // valores de ICMS ST
    ANfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt := CalculoNFE.BaseCalculoIcmsSt;
    ANfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt := CalculoNFE.ValorIcmsSt;
    // credito de icmssn
    ANfeDetalhe.NfeDetalheImpostoIcms.ValorCreditoIcmsSn := CalculoNFE.ValorCreditoIcmsSn;

    { Valores IPI }
    ANfeDetalhe.NfeDetalheImpostoIpi.ValorBaseCalculoIpi := CalculoNFE.BaseCalculoIpi;
    ANfeDetalhe.NfeDetalheImpostoIpi.ValorIpi := CalculoNFE.ValorIpi;

    { Valores PIS }
    ANfeDetalhe.NfeDetalheImpostoPis.ValorBaseCalculoPis := CalculoNFE.BaseCalculoPis;
    ANfeDetalhe.NfeDetalheImpostoPis.ValorPis := CalculoNFE.ValorPis;

    { Valores COFINS }
    ANfeDetalhe.NfeDetalheImpostoCofins.BaseCalculoCofins := CalculoNFE.BaseCalculoCofins;
    ANfeDetalhe.NfeDetalheImpostoCofins.ValorCofins := CalculoNFE.ValorCofins;
  finally
  end;
end;

class function TNfeCabecalhoService.TransmitirNFe(ANfeCabecalho: TNfeCabecalho): string;
var
  CaminhoArquivoIni, CaminhoArquivoXml, Chave: string;
begin
  // primeiro passo - gerar o arquivo INI com a NF-e
  CaminhoArquivoIni := GerarArquivoIniNFe(ANfeCabecalho);
  // chama o método para criar a nota
  CriarNFe(CaminhoArquivoIni);
  // pega o caminho do XML criado
  CaminhoArquivoXml := PegarRetornoSaida('ARQUIVO-XML');
  if CaminhoArquivoXml.Contains('ERRO') then
  begin
    Result := CaminhoArquivoXml;
    exit;
  end;

  // chama o método para criar e enviar a nota
  EnviarNFe(CaminhoArquivoXml);
  // PegarRetornoSaida
  Result := PegarRetornoSaida('Envio');
  if not Result.Contains('ERRO') then
  begin
    // chama o método para gerar o PDF
    ImprimirDanfe(CaminhoArquivoXml);
    // captura o retorno do arquivo SAI
    Result := PegarRetornoSaida('ARQUIVO-PDF');
    // se chegou aqui, atualiza a chave de acesso e o status da nota
    ANfeCabecalho.StatusNota := '4';
    Chave := ReverseString(Result);
    Chave := Copy(Chave, pos('-', Chave)+1, Chave.Length);
    Chave := Copy(Chave, 1, pos('\', Chave)-1);
    ANfeCabecalho.ChaveAcesso := ReverseString(Chave);
    ANfeCabecalho.DigitoChaveAcesso := Copy(Chave, Chave.Length, 1);
    AlterarBase(ANfeCabecalho, 'NFE_CABECALHO');
  end;
end;

class function TNfeCabecalhoService.GerarPDFDanfe(AChave: string): string;
var
  CaminhoArquivoXml: string;
begin
  // pega o caminho do arquivo XML da nota em contingência
  CaminhoArquivoXml := CaminhoComCnpj + 'LOG_NFe\' + AChave + '-nfe.xml';
  // chama o método para gerar o PDF
  ImprimirDanfe(CaminhoArquivoXml);
  // captura o retorno do arquivo SAI
  Result := PegarRetornoSaida('ARQUIVO-PDF');
end;

class procedure TNfeCabecalhoService.CriarNFe(ACaminhoArquivoIni: string);
begin
  ApagarArquivoSaida;
  GerarArquivoEntrada('NFE.CriarNFe("' + ACaminhoArquivoIni + '")');
  AguardarArquivoSaida;
end;

class procedure TNfeCabecalhoService.EnviarNFe(ACaminhoArquivoXml: string);
begin
  ApagarArquivoSaida;
  GerarArquivoEntrada('NFE.EnviarNFe("' + ACaminhoArquivoXml + '", "001", , , , "1", , )');
  AguardarArquivoSaida;
end;

class procedure TNfeCabecalhoService.ImprimirDanfe(ACaminhoArquivoXml: string);
begin
  ApagarArquivoSaida;
  GerarArquivoEntrada('NFE.ImprimirDANFEPDF("'+ ACaminhoArquivoXml + '", , , "1",)');
  AguardarArquivoSaida;
end;

class function TNfeCabecalhoService.InutilizarNumero(AObjetoNfe: TObjetoNfe): string;
begin
  ApagarArquivoSaida;

  GerarArquivoEntrada('NFE.InutilizarNFe('
      +AObjetoNfe.Cnpj +', '
      +AObjetoNfe.Justificativa+', '
      +AObjetoNfe.Ano+', '
      +AObjetoNfe.Modelo+', '
      +AObjetoNfe.Serie+', '
      +AObjetoNfe.NumeroInicial+', '
      +AObjetoNfe.NumeroFinal+')');

  AguardarArquivoSaida;
  Result := PegarRetornoSaida('Inutilizacao');
end;

class procedure TNfeCabecalhoService.GerarArquivoEntrada(AComando: string);
var
  ArquivoEntrada: TextFile;
begin
  AssignFile(ArquivoEntrada, PWideChar(CaminhoComCnpj + 'ent.txt'));
  Rewrite(ArquivoEntrada);
  Writeln(ArquivoEntrada, AComando);
  CloseFile(ArquivoEntrada);
end;

class function TNfeCabecalhoService.ApagarArquivoSaida: Boolean;
begin
  DeleteFile(PWideChar(CaminhoComCnpj + 'sai.txt'));
end;

class function TNfeCabecalhoService.AguardarArquivoSaida: Boolean;
var
  TempoEspera: Integer;
begin
  Result := False;
  TempoEspera := 0;
  // aguarda o arquivo de saída
  while not FileExists(CaminhoComCnpj + 'sai.txt') do
  begin
    Sleep(1000);
    Inc(TempoEspera);

    if TempoEspera > 30 then
    begin
      // ocorreu algum problema, demorou 10 segundos esperando o arquivo sai
      Exit;
    end;

    Result := True;
  end;
end;

class function TNfeCabecalhoService.PegarRetornoSaida(AOperacao: string): string;
var
  ArquivoSaida: TIniFile;
  Resposta, Motivo, CodigoStatus, CaminhoArquivoXml, CaminhoArquivoPdf: string;
  ArquivoCompleto: TStringList;
begin
  Result := '';

  ArquivoSaida := TIniFile.Create(CaminhoComCnpj + 'sai.txt');
  ArquivoCompleto := TStringList.Create;
  ArquivoCompleto.LoadFromFile(CaminhoComCnpj + 'sai.txt');

  CodigoStatus := ArquivoSaida.ReadString(AOperacao, 'CStat', '');
  Motivo := ArquivoSaida.ReadString(AOperacao, 'XMotivo', '');

  try
    if AOperacao = 'ARQUIVO-XML' then // não está no formato INI
    begin
      CaminhoArquivoXml := ArquivoCompleto[0];
      CaminhoArquivoXml := StringReplace(CaminhoArquivoXml, 'OK: ', '', [rfReplaceAll, rfIgnoreCase]);
      CaminhoArquivoXml := Trim(CaminhoArquivoXml);
      Result := CaminhoArquivoXml;
    end
    else if AOperacao = 'ARQUIVO-PDF' then // não está no formato INI
    begin
      CaminhoArquivoPdf := ArquivoCompleto.Text;
      CaminhoArquivoPdf := StringReplace(CaminhoArquivoPdf, 'OK: Arquivo criado em: ', '', [rfReplaceAll, rfIgnoreCase]);
      Result := Trim(CaminhoArquivoPdf);
    end
    else if AOperacao = 'Cancelamento' then
    begin
      Result := Motivo;
    end
    else if AOperacao = 'Consulta' then
    begin
      Result := Motivo;
    end
    else if AOperacao = 'Inutilizacao' then // não está no formato INI
    begin
      Result := ArquivoCompleto.Text;
    end;

    if not MatchStr(CodigoStatus, // se o status não for um dos que estiverem nessa lista, vamos retornar um erro.
        [
        '',     // efetuando alguma operação que não retorna código de status
        '100',  // Autorizado o uso da NF-e
        '102',  // Inutilização de número homologado
        '135'   // Evento registrado e vinculado a NF-e (cancelamento)
        ]
    ) then
    begin
      Result := '[ERRO] - [' + CodigoStatus + '] ' + Motivo;
    end;
  finally
    ArquivoSaida.Free;
    ArquivoCompleto.Free;
  end;
end;

class function TNfeCabecalhoService.GerarArquivoIniNFe(ANfeCabecalho: TNfeCabecalho): String;
var
  NFeIni: TIniFile;
  Empresa: TEmpresa;
  NfeDetalhe: TNfeDetalhe;
  I: Integer;
  IncrementoBloco, CaminhoArquivoIni: string;
begin
  // Pega a empresa
  Empresa := TEmpresaService.ConsultarObjeto(1); // É possível pegar os dados da NfeEmitente, dependendo da estratégia definida pelo desenvolvedor
  // cria o arquivo
  CaminhoArquivoIni := 'c:\t2ti\nfe\ini\' + ANfeCabecalho.Numero + '.ini';
  NFeIni := TIniFile.Create(CaminhoArquivoIni);
  Result := CaminhoArquivoIni;

  try
    //*******************************************************************************************
    //  [infNFe]
    //*******************************************************************************************
    NFeIni.WriteString('infNFe', 'versao', '4.00');

    //*******************************************************************************************
    //  [Identificacao]
    //*******************************************************************************************
    NFeIni.WriteString('Identificacao', 'cNF', ANfeCabecalho.CodigoNumerico);
    NFeIni.WriteString('Identificacao', 'natOp', ANfeCabecalho.NaturezaOperacao);
    NFeIni.WriteString('Identificacao', 'mod', '55');
    NFeIni.WriteString('Identificacao', 'serie', ANfeCabecalho.Serie);
    NFeIni.WriteString('Identificacao', 'nNF', ANfeCabecalho.Numero);
    NFeIni.WriteString('Identificacao', 'dhEmi', DateTimeToStr(ANfeCabecalho.DataHoraEmissao));
    NFeIni.WriteString('Identificacao', 'dhSaiEnt', '');
    NFeIni.WriteString('Identificacao', 'tpNF', ANfeCabecalho.TipoOperacao);    //0=Entrada; 1=Saída
    NFeIni.WriteString('Identificacao', 'idDest', ANfeCabecalho.LocalDestino);  // 1=Operação interna; 2=Operação interestadual; 3=Operação com exterior.
    NFeIni.WriteString('Identificacao', 'tpImp', ANfeCabecalho.FormatoImpressaoDanfe);
    NFeIni.WriteString('Identificacao', 'tpEmis', ANfeCabecalho.TipoEmissao);
    NFeIni.WriteString('Identificacao', 'finNFe', ANfeCabecalho.FinalidadeEmissao);
    NFeIni.WriteString('Identificacao', 'indFinal', ANfeCabecalho.ConsumidorOperacao); //0=Normal; 1=Consumidor final;
    NFeIni.WriteString('Identificacao', 'indPres', ANfeCabecalho.ConsumidorPresenca);
    NFeIni.WriteString('Identificacao', 'procEmi', ANfeCabecalho.ProcessoEmissao);
    NFeIni.WriteString('Identificacao', 'verProc', ANfeCabecalho.VersaoProcessoEmissao);
    NFeIni.WriteString('Identificacao', 'dhCont', '');
    NFeIni.WriteString('Identificacao', 'xJust', '');
    NFeIni.WriteString('Identificacao', 'tpAmb', '2'); // altera para '1' quando em produção ou trazer de tabela ADM

    //*******************************************************************************************
    //  [Emitente]
    //*******************************************************************************************
    NFeIni.WriteString('Emitente', 'CNPJCPF', Empresa.Cnpj);
    NFeIni.WriteString('Emitente', 'xNome', Empresa.RazaoSocial);
    NFeIni.WriteString('Emitente', 'xFant', Empresa.NomeFantasia);
    NFeIni.WriteString('Emitente', 'IE', Empresa.InscricaoEstadual);
    NFeIni.WriteString('Emitente', 'IEST', '');
    NFeIni.WriteString('Emitente', 'IM', Empresa.InscricaoMunicipal);
    NFeIni.WriteString('Emitente', 'CNAE', Empresa.CodigoCnaePrincipal);
    NFeIni.WriteString('Emitente', 'CRT', Empresa.Crt);
    NFeIni.WriteString('Emitente', 'xLgr', Empresa.EnderecoPrincipal.Logradouro);
    NFeIni.WriteString('Emitente', 'nro', Empresa.EnderecoPrincipal.Numero);
    NFeIni.WriteString('Emitente', 'xCpl', Empresa.EnderecoPrincipal.Complemento);
    NFeIni.WriteString('Emitente', 'xBairro', Empresa.EnderecoPrincipal.Bairro);
    NFeIni.WriteString('Emitente', 'cMun', Empresa.CodigoIbgeCidade.ToString);
    NFeIni.WriteString('Emitente', 'xMun', Empresa.EnderecoPrincipal.Cidade);
    NFeIni.WriteString('Emitente', 'UF', Empresa.EnderecoPrincipal.Uf);
    NFeIni.WriteString('Emitente', 'CEP', Empresa.EnderecoPrincipal.Cep);
    NFeIni.WriteString('Emitente', 'cPais', '1058');
    NFeIni.WriteString('Emitente', 'xPais', 'BRASIL');
    NFeIni.WriteString('Emitente', 'Fone', '');
    NFeIni.WriteString('Emitente', 'cUF', Empresa.CodigoIbgeUf.ToString);
    NFeIni.WriteString('Emitente', 'cMunFG', '');

    //*******************************************************************************************
    //  [Destinatario]
    //*******************************************************************************************
    if ANfeCabecalho.NfeDestinatario.Cnpj <> '' then
      NFeIni.WriteString('Destinatario', 'CNPJCPF', ANfeCabecalho.NfeDestinatario.Cnpj)
    else
      NFeIni.WriteString('Destinatario', 'CNPJCPF', ANfeCabecalho.NfeDestinatario.Cpf);
    NFeIni.WriteString('Destinatario', 'xNome', ANfeCabecalho.NfeDestinatario.Nome);
    NFeIni.WriteString('Destinatario', 'indIEDest', ANfeCabecalho.NfeDestinatario.IndicadorIe);
    NFeIni.WriteString('Destinatario', 'IE', ANfeCabecalho.NfeDestinatario.InscricaoEstadual);
    NFeIni.WriteString('Destinatario', 'email', ANfeCabecalho.NfeDestinatario.Email);
    NFeIni.WriteString('Destinatario', 'xLgr', ANfeCabecalho.NfeDestinatario.Logradouro);
    NFeIni.WriteString('Destinatario', 'nro', ANfeCabecalho.NfeDestinatario.Numero);
    NFeIni.WriteString('Destinatario', 'xCpl', ANfeCabecalho.NfeDestinatario.Complemento);
    NFeIni.WriteString('Destinatario', 'xBairro', ANfeCabecalho.NfeDestinatario.Bairro);
    NFeIni.WriteString('Destinatario', 'cMun', ANfeCabecalho.NfeDestinatario.CodigoMunicipio.ToString);
    NFeIni.WriteString('Destinatario', 'xMun', ANfeCabecalho.NfeDestinatario.NomeMunicipio);
    NFeIni.WriteString('Destinatario', 'UF', ANfeCabecalho.NfeDestinatario.Uf);
    NFeIni.WriteString('Destinatario', 'CEP', ANfeCabecalho.NfeDestinatario.Cep);
    NFeIni.WriteString('Destinatario', 'cPais', ANfeCabecalho.NfeDestinatario.CodigoPais.ToString);
    NFeIni.WriteString('Destinatario', 'xPais', ANfeCabecalho.NfeDestinatario.NomePais);
    NFeIni.WriteString('Destinatario', 'Fone', '');

    //*******************************************************************************************
    //  Detalhes - Produtos e Impostos
    //*******************************************************************************************
    I := 0;
    for NfeDetalhe in ANfeCabecalho.ListaNfeDetalhe do
    begin
      Inc(I);
      IncrementoBloco := StringOfChar('0', 3 - Length(IntToStr(I))) + IntToStr(I);

      /// [Produto]
      NFeIni.WriteString('Produto' + IncrementoBloco, 'cProd', NfeDetalhe.Gtin);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'cEAN', NfeDetalhe.Gtin);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'xProd', NfeDetalhe.NomeProduto);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'ncm', NfeDetalhe.Ncm);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'CEST', NfeDetalhe.Cest);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'EXTIPI', '');//NfeDetalhe.Extipi.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'CFOP', NfeDetalhe.Cfop.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'uCom', NfeDetalhe.UnidadeComercial);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'qCom', NfeDetalhe.QuantidadeComercial.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'vUnCom', NfeDetalhe.ValorUnitarioComercial.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'vProd', NfeDetalhe.ValorTotal.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'cEANTrib', NfeDetalhe.GtinUnidadeTributavel);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'uTrib', NfeDetalhe.UnidadeTributavel);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'qTrib', NfeDetalhe.QuantidadeTributavel.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'vUnTrib', NfeDetalhe.ValorUnitarioTributavel.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'vFrete', NfeDetalhe.ValorFrete.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'vSeg', NfeDetalhe.ValorSeguro.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'vDesc', NfeDetalhe.ValorDesconto.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'vOutro', NfeDetalhe.ValorOutrasDespesas.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'indTot', NfeDetalhe.EntraTotal);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'xPed', ANfeCabecalho.CompraPedido);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'nItemPed', NfeDetalhe.ItemPedidoCompra.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'nFCI', NfeDetalhe.NumeroFci);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'nRECOPI', NfeDetalhe.NumeroRecopi);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'pDevol', NfeDetalhe.PercentualDevolvido.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'vIPIDevol', NfeDetalhe.ValorIpiDevolvido.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'vTotTrib', NfeDetalhe.ValorTotalTributos.ToString);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'infAdProd', NfeDetalhe.InformacoesAdicionais);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'indEscala', NfeDetalhe.IndicadorEscalaRelevante);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'CNPJFab', NfeDetalhe.CnpjFabricante);
      NFeIni.WriteString('Produto' + IncrementoBloco, 'cBenef', NfeDetalhe.CodigoBeneficioFiscal);

      { Detalhes -- Impostos }
      // Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
      if ANfeCabecalho.TributOperacaoFiscal.Cfop > 0 then
      begin
        /// [ISSQN]
        NFeIni.WriteString('ISSQN' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoIssqn.BaseCalculoIssqn.ToString);
        NFeIni.WriteString('ISSQN' + IncrementoBloco, 'vAliq', NfeDetalhe.NfeDetalheImpostoIssqn.AliquotaIssqn.ToString);
        NFeIni.WriteString('ISSQN' + IncrementoBloco, 'vISSQN', NfeDetalhe.NfeDetalheImpostoIssqn.ValorIssqn.ToString);
        NFeIni.WriteString('ISSQN' + IncrementoBloco, 'cMunFG', NfeDetalhe.NfeDetalheImpostoIssqn.MunicipioIssqn.ToString);
        NFeIni.WriteString('ISSQN' + IncrementoBloco, 'cListServ', NfeDetalhe.NfeDetalheImpostoIssqn.ItemListaServicos.ToString);
      end
      else
      begin
        /// [ICMS]
        if Empresa.Crt = '1' then  //1-Simples Nacional
        begin
          NFeIni.WriteString('ICMS' + IncrementoBloco, 'CSOSN', NfeDetalhe.NfeDetalheImpostoIcms.Csosn);

          // csosn 101
          if NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '101' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pCredSN', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaCreditoIcmsSn.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vCredICMSSN', NfeDetalhe.NfeDetalheImpostoIcms.ValorCreditoIcmsSn.ToString);
          end

          // csosn 102, 103, 300, 400
          else if (NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '102')
               or (NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '103')
               or (NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '300')
               or (NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '400') then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
          end

          // csosn 201
          else if NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '201' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBCST', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pMVAST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBCST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBCST', NfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMSST', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMSST', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pCredSN', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaCreditoIcmsSn.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vCredICMSSN', NfeDetalhe.NfeDetalheImpostoIcms.ValorCreditoIcmsSn.ToString);
          end

          // csosn 202, 203
          else if (NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '202')
               or (NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '203') then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBCST', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pMVAST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBCST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBCST', NfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMSST', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMSST', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString);
          end

          // csosn 500
          else if NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '500' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBCSTRet', NfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcmsStRetido.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMSSTRet', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsStRetido.ToString);
          end

          // csosn 900
          else if NfeDetalhe.NfeDetalheImpostoIcms.Csosn = '900' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBC', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoIcms.ValorBCIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBC', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMS', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBCST', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pMVAST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBCST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBCST', NfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMSST', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMSST', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pCredSN', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaCreditoIcmsSn.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vCredICMSSN', NfeDetalhe.NfeDetalheImpostoIcms.ValorCreditoIcmsSn.ToString);
          end;
        end

        else
        begin
          NFeIni.WriteString('ICMS' + IncrementoBloco, 'CST', NfeDetalhe.NfeDetalheImpostoIcms.CstIcms);

          // 00 Tributada integralmente
          if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '00' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBC', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoIcms.ValorBCIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMS', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
          end

          // 10 Tributada e com cobranca do ICMS por ST
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '10' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBC', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoIcms.ValorBCIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMS', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBCST', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pMVAST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBCST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBCST', NfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMSST', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMSST', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString);
          end

          // 20 Tributada com reducao de base de calculo
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '20' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBC', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBC', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoIcms.ValorBCIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMS', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
          end

          // 30 Isenta ou nao tributada e com cobranca do ICMS por ST
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '30' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBCST', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pMVAST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBCST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBCST', NfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMSST', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMSST', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString);
          end

          // 40 Isenta
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '40' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'motDesICMS', NfeDetalhe.NfeDetalheImpostoIcms.MotivoDesoneracaoIcms);
          end

          // 41 Nao tributada
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '41' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'motDesICMS', NfeDetalhe.NfeDetalheImpostoIcms.MotivoDesoneracaoIcms);
          end

          // 50 Suspencao
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '50' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'motDesICMS', NfeDetalhe.NfeDetalheImpostoIcms.MotivoDesoneracaoIcms);
          end

          // 51 Diferimento preenchimento do ICMS depende da UF
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '51' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBC', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBC', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoIcms.ValorBCIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMS', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
          end

          // 60 ICMS cobrado anteriormente por ST
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '60' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBCSTRet', NfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcmsStRetido.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMSSTRet', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsStRetido.ToString);
          end

          // 70 ICMS com reducao de base de calculo e cobranca de ICMS por ST
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '70' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBC', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBC', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoIcms.ValorBCIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMS', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBCST', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pMVAST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBCST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBCST', NfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMSST', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMSST', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString);
          end

          // 90 Outros
          else if NfeDetalhe.NfeDetalheImpostoIcms.CstIcms = '90' then
          begin
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'orig', NfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBC', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoIcms.ValorBCIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBC', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMS', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMS', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'modBCST', NfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pMVAST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pRedBCST', NfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vBCST', NfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'pICMSST', NfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString);
            NFeIni.WriteString('ICMS' + IncrementoBloco, 'vICMSST', NfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString);
          end;
        end;

        /// [IPI]
        NFeIni.WriteString('IPI' + IncrementoBloco, 'CST', NfeDetalhe.NfeDetalheImpostoIpi.CstIpi);
        NFeIni.WriteString('IPI' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoIpi.ValorBaseCalculoIpi.ToString);
        NFeIni.WriteString('IPI' + IncrementoBloco, 'pIPI', NfeDetalhe.NfeDetalheImpostoIpi.AliquotaIpi.ToString);
        NFeIni.WriteString('IPI' + IncrementoBloco, 'vIPI', NfeDetalhe.NfeDetalheImpostoIpi.ValorIpi.ToString);

        /// [PIS]
        NFeIni.WriteString('PIS' + IncrementoBloco, 'CST', NfeDetalhe.NfeDetalheImpostoPis.CstPis);
        NFeIni.WriteString('PIS' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoPis.ValorBaseCalculoPis.ToString);
        if NfeDetalhe.NfeDetalheImpostoPis.CstPis = '01' then
          NFeIni.WriteString('PIS' + IncrementoBloco, 'pPIS', NfeDetalhe.NfeDetalheImpostoPis.AliquotaPisPercentual.ToString)
        else if NfeDetalhe.NfeDetalheImpostoPis.CstPis = '02' then
          NFeIni.WriteString('PIS' + IncrementoBloco, 'pPIS', NfeDetalhe.NfeDetalheImpostoPis.AliquotaPisReais.ToString);
        NFeIni.WriteString('PIS' + IncrementoBloco, 'vPIS', NfeDetalhe.NfeDetalheImpostoPis.ValorPis.ToString);

        /// [COFINS]
        NFeIni.WriteString('COFINS' + IncrementoBloco, 'CST', NfeDetalhe.NfeDetalheImpostoCofins.CstCofins);
        NFeIni.WriteString('COFINS' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoCofins.BaseCalculoCofins.ToString);
        if NfeDetalhe.NfeDetalheImpostoCofins.CstCofins = '01' then
          NFeIni.WriteString('COFINS' + IncrementoBloco, 'pCOFINS', NfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsPercentual.ToString)
        else if NfeDetalhe.NfeDetalheImpostoCofins.CstCofins = '02' then
          NFeIni.WriteString('COFINS' + IncrementoBloco, 'pCOFINS', NfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsReais.ToString);
        NFeIni.WriteString('COFINS' + IncrementoBloco, 'vCOFINS', NfeDetalhe.NfeDetalheImpostoCofins.ValorCofins.ToString);

        /// [II]
        if Assigned(NfeDetalhe.NfeDetalheImpostoIi) then
        begin
          NFeIni.WriteString('II' + IncrementoBloco, 'vBC', NfeDetalhe.NfeDetalheImpostoII.ValorBCII.ToString);
          NFeIni.WriteString('II' + IncrementoBloco, 'vDespAdu', NfeDetalhe.NfeDetalheImpostoIi.ValorDespesasAduaneiras.ToString);
          NFeIni.WriteString('II' + IncrementoBloco, 'vII', NfeDetalhe.NfeDetalheImpostoIi.ValorImpostoImportacao.ToString);
          NFeIni.WriteString('II' + IncrementoBloco, 'vIOF', NfeDetalhe.NfeDetalheImpostoIi.ValorIof.ToString);
        end;

      end;
    end;

    //*******************************************************************************************
    //  [Total]
    //*******************************************************************************************
    NFeIni.WriteString('Total', 'vNF', ANfeCabecalho.ValorTotal.ToString);
    NFeIni.WriteString('Total', 'vBC', ANfeCabecalho.BaseCalculoIcms.ToString);
    NFeIni.WriteString('Total', 'vICMS', ANfeCabecalho.ValorIcms.ToString);
    NFeIni.WriteString('Total', 'vBCST', ANfeCabecalho.BaseCalculoIcmsSt.ToString);
    NFeIni.WriteString('Total', 'vST', ANfeCabecalho.ValorIcmsSt.ToString);
    NFeIni.WriteString('Total', 'vProd', ANfeCabecalho.ValorTotalProdutos.ToString);
    NFeIni.WriteString('Total', 'vFrete', ANfeCabecalho.ValorFrete.ToString);
    NFeIni.WriteString('Total', 'vSeg', ANfeCabecalho.ValorSeguro.ToString);
    NFeIni.WriteString('Total', 'vDesc', ANfeCabecalho.ValorDesconto.ToString);
    NFeIni.WriteString('Total', 'vII', ANfeCabecalho.ValorImpostoImportacao.ToString);
    NFeIni.WriteString('Total', 'vIPI', ANfeCabecalho.ValorIpi.ToString);
    NFeIni.WriteString('Total', 'vPIS', ANfeCabecalho.ValorPis.ToString);
    NFeIni.WriteString('Total', 'vCOFINS', ANfeCabecalho.ValorCofins.ToString);
    NFeIni.WriteString('Total', 'vOutro', ANfeCabecalho.ValorDespesasAcessorias.ToString);
    NFeIni.WriteString('Total', 'vNF', ANfeCabecalho.ValorTotal.ToString);

    //*******************************************************************************************
    //  [ISSQNtot]
    //*******************************************************************************************
    NFeIni.WriteString('ISSQNtot', 'vServ', ANfeCabecalho.ValorServicos.ToString);
    NFeIni.WriteString('ISSQNtot', 'vBC', ANfeCabecalho.BaseCalculoIssqn.ToString);
    NFeIni.WriteString('ISSQNtot', 'vISS', ANfeCabecalho.ValorIssqn.ToString);
    NFeIni.WriteString('ISSQNtot', 'vPIS', ANfeCabecalho.ValorPisIssqn.ToString);
    NFeIni.WriteString('ISSQNtot', 'vCOFINS', ANfeCabecalho.ValorCofinsIssqn.ToString);

    //*******************************************************************************************
    //  [retTrib]
    //*******************************************************************************************
    NFeIni.WriteString('retTrib', 'vRetPIS', ANfeCabecalho.ValorRetidoPis.ToString);
    NFeIni.WriteString('retTrib', 'vRetCOFINS', ANfeCabecalho.ValorRetidoCofins.ToString);
    NFeIni.WriteString('retTrib', 'vRetCSLL', ANfeCabecalho.ValorRetidoCsll.ToString);
    NFeIni.WriteString('retTrib', 'vBCIRRF', ANfeCabecalho.BaseCalculoIrrf.ToString);
    NFeIni.WriteString('retTrib', 'vIRRF', ANfeCabecalho.ValorRetidoIrrf.ToString);
    NFeIni.WriteString('retTrib', 'vBCRetPrev', ANfeCabecalho.BaseCalculoPrevidencia.ToString);
    NFeIni.WriteString('retTrib', 'vRetPrev', ANfeCabecalho.ValorRetidoPrevidencia.ToString);

    //*******************************************************************************************
    //  [PAG]
    //*******************************************************************************************
    NFeIni.WriteString('PAG001', 'tpag', '01');
    NFeIni.WriteString('PAG001', 'vPag', ANfeCabecalho.ValorTotal.ToString);
    NFeIni.WriteString('PAG001', 'indPag', '0');
    NFeIni.WriteString('PAG001', 'vTroco', '0');

    //*******************************************************************************************
    //  [DadosAdicionais]
    //*******************************************************************************************
    NFeIni.WriteString('DadosAdicionais', 'infAdFisco', '');
    NFeIni.WriteString('DadosAdicionais', 'infCpl', '');

  finally
    NFeIni.Free;
    Empresa.Free;
  end;
end;

end.
