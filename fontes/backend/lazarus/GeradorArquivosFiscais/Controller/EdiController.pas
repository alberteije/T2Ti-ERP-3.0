{$notes off}
{$WARNINGS OFF}
unit EdiController;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Controller, Biblioteca, T2TiORM,
  // VOs necessários
  EmpresaVO, FinConfiguracaoBoletoVO, FinParcelaReceberVO, ViewPessoaClienteVO,
  // ACBr
  ACBrBoleto, ACBrBoletoConversao;

type
  TEdiController = class(TController)
  private
    class function ConfigurarACBrBoleto(pIdEmpresa: Integer; pIdContaCaixa: Integer; 
      out ConfiguracaoBoleto: TFinConfiguracaoBoletoVO; out Empresa: TEmpresaVO): Boolean;
    class procedure CarregarParcelasParaRemessa(
      pParcelas: TListaFinParcelaReceberVO; pConfiguracao: TFinConfiguracaoBoletoVO; 
      pCliente: TViewPessoaClienteVO);
  public
    class function GerarRemessa(pFiltro: String): String;
    class function ProcessarRetorno(pArquivoRetorno: String): String;
  end;

implementation

uses
  UDataModule, EmpresaController, FinConfiguracaoBoletoController,
  FinParcelaReceberController, ViewPessoaClienteController;

{ TEdiController }

class function TEdiController.ConfigurarACBrBoleto(
  pIdEmpresa: Integer; pIdContaCaixa: Integer; 
  out ConfiguracaoBoleto: TFinConfiguracaoBoletoVO; 
  out Empresa: TEmpresaVO): Boolean;
begin
  Result := False;
  ConfiguracaoBoleto := nil;
  Empresa := nil;
  
  try
    // Buscar empresa
    Empresa := TEmpresaController.ConsultaObjeto('ID=' + IntToStr(pIdEmpresa));
    if not Assigned(Empresa) then
      Exit;
    
    // Buscar configuração do boleto
    ConfiguracaoBoleto := TFinConfiguracaoBoletoController.ConsultaObjeto(
      'ID_BANCO_CONTA_CAIXA=' + IntToStr(pIdContaCaixa));
    
    if not Assigned(ConfiguracaoBoleto) then
      Exit;
    
    // Configurar ACBrBoleto
    with FDataModule.ACBrBoleto do
    begin
      // Configurar banco
      if ConfiguracaoBoleto.ContaCaixaVO.AgenciaBancoVO.BancoVO.Codigo = '001' then
        Banco.TipoCobranca := cobBancoDoBrasil
      else if ConfiguracaoBoleto.ContaCaixaVO.AgenciaBancoVO.BancoVO.Codigo = '104' then
        Banco.TipoCobranca := cobCaixaEconomica
      else if ConfiguracaoBoleto.ContaCaixaVO.AgenciaBancoVO.BancoVO.Codigo = '237' then
        Banco.TipoCobranca := cobBradesco
      else if ConfiguracaoBoleto.ContaCaixaVO.AgenciaBancoVO.BancoVO.Codigo = '341' then
        Banco.TipoCobranca := cobItau
      else
        Exit;
      
      // Configurar diretórios
      DirArqRemessa := StringReplace(ConfiguracaoBoleto.CaminhoArquivoRemessa, 
        '/', '\', [rfReplaceAll]);
      DirArqRetorno := StringReplace(ConfiguracaoBoleto.CaminhoArquivoRetorno, 
        '/', '\', [rfReplaceAll]);
      
      // Configurar layout
      if ConfiguracaoBoleto.LayoutRemessa = '240' then
        LayoutRemessa := c240
      else if ConfiguracaoBoleto.LayoutRemessa = '400' then
        LayoutRemessa := c400;
      
      // Configurar cedente
      Cedente.Nome := Empresa.RazaoSocial;
      Cedente.Agencia := ConfiguracaoBoleto.ContaCaixaVO.AgenciaBancoVO.Codigo;
      Cedente.AgenciaDigito := ConfiguracaoBoleto.ContaCaixaVO.AgenciaBancoVO.Digito;
      Cedente.CNPJCPF := Empresa.CNPJ;
      Cedente.Conta := ConfiguracaoBoleto.ContaCaixaVO.Codigo;
      Cedente.ContaDigito := ConfiguracaoBoleto.ContaCaixaVO.Digito;
      Cedente.CodigoCedente := ConfiguracaoBoleto.CodigoCedente;
      Cedente.Convenio := ConfiguracaoBoleto.CodigoConvenio;
      
      if Assigned(Empresa.EnderecoPrincipal) then
      begin
        Cedente.Logradouro := Empresa.EnderecoPrincipal.Logradouro;
        Cedente.Complemento := Empresa.EnderecoPrincipal.Complemento;
        Cedente.Bairro := Empresa.EnderecoPrincipal.Bairro;
        Cedente.CEP := Empresa.EnderecoPrincipal.Cep;
        Cedente.Cidade := Empresa.EnderecoPrincipal.Cidade;
        Cedente.UF := Empresa.EnderecoPrincipal.Uf;
      end;
    end;
    
    Result := True;
    
  except
    on E: Exception do
    begin
      if Assigned(ConfiguracaoBoleto) then
        FreeAndNil(ConfiguracaoBoleto);
      if Assigned(Empresa) then
        FreeAndNil(Empresa);
      raise;
    end;
  end;
end;

class procedure TEdiController.CarregarParcelasParaRemessa(
  pParcelas: TListaFinParcelaReceberVO;
  pConfiguracao: TFinConfiguracaoBoletoVO; pCliente: TViewPessoaClienteVO);
var
  Titulo: TACBrTitulo;
  I: Integer;
  Parcela: TFinParcelaReceberVO;
  Mensagens: TStringList;
begin
  FDataModule.ACBrBoleto.ListadeBoletos.Clear;
  Mensagens := TStringList.Create;
  if pConfiguracao.Mensagem <> '' then
  begin
     Mensagens.Text := pConfiguracao.Mensagem;
  end;

  for I := 0 to pParcelas.Count - 1 do
  begin
    Parcela := TFinParcelaReceberVO(pParcelas.Items[I]);
    
    // Verificar se a parcela deve gerar boleto
    if Parcela.EmitiuBoleto = 'S' then
    begin
      Titulo := FDataModule.ACBrBoleto.CriarTituloNaLista;
      
      // Configurar título
      Titulo.LocalPagamento := pConfiguracao.LocalPagamento;
      Titulo.Vencimento := Parcela.DataVencimento;
      Titulo.DataDocumento := Now;
      Titulo.DataProcessamento := Now;
      Titulo.EspecieDoc := pConfiguracao.Especie;
      
      if pConfiguracao.Aceite = 'S' then
        Titulo.Aceite := atSim
      else
        Titulo.Aceite := atNao;
        
      Titulo.NumeroDocumento := Parcela.BoletoNossoNumero;
      Titulo.Carteira := pConfiguracao.Carteira;
      Titulo.NossoNumero := Parcela.BoletoNossoNumero;

      // Configurar sacado
      if Assigned(pCliente) then
      begin
        Titulo.Sacado.NomeSacado := pCliente.Nome;
        Titulo.Sacado.CNPJCPF := pCliente.CpfCnpj;
        Titulo.Sacado.Logradouro := pCliente.Logradouro;
        Titulo.Sacado.Numero := pCliente.Numero;
        Titulo.Sacado.Bairro := pCliente.Bairro;
        Titulo.Sacado.Cidade := pCliente.Cidade;
        Titulo.Sacado.UF := pCliente.Uf;
        Titulo.Sacado.CEP := pCliente.Cep;
      end;
      
      Titulo.ValorDesconto := Parcela.ValorDesconto;
      Titulo.DataDesconto := Parcela.DescontoAte;
      Titulo.ValorDocumento := Parcela.Valor;
      Titulo.Parcela := Parcela.NumeroParcela;
      Titulo.PercentualMulta := Parcela.TaxaMulta;
      
      Titulo.Instrucao1 := pConfiguracao.Instrucao01;
      Titulo.Instrucao2 := pConfiguracao.Instrucao02;
      
      // Adicionar mensagens personalizadas
      FDataModule.ACBrBoleto.AdicionarMensagensPadroes(Titulo, Mensagens);
    end;
  end;
end;

class function TEdiController.GerarRemessa(pFiltro: String): String;
var
  ConteudoFiltro: TStringList;
  IdEmpresa, IdContaCaixa, IdCliente: Integer;
  ConfiguracaoBoleto: TFinConfiguracaoBoletoVO;
  Empresa: TEmpresaVO;
  Cliente: TViewPessoaClienteVO;
  ListaParcelas: TListaFinParcelaReceberVO;
  FiltroParcelas, NomeArquivo: String;
begin
  Result := '';
  ConteudoFiltro := nil;
  ConfiguracaoBoleto := nil;
  Empresa := nil;
  Cliente := nil;
  ListaParcelas := nil;
  
  try
    ConteudoFiltro := TStringList.Create;
    ConteudoFiltro.StrictDelimiter := True;
    ConteudoFiltro.Delimiter := '|';
    ConteudoFiltro.DelimitedText := pFiltro;

    {
      0 - IdEmpresa
      1 - IdContaCaixa
      2 - IdCliente (opcional)
      3 - Filtro Parcelas (ex: "EMITIU_BOLETO='S' AND DATA_VENCIMENTO >= '2024-01-01'")
    }
    
    IdEmpresa := StrToInt(ConteudoFiltro[0]);
    IdContaCaixa := StrToInt(ConteudoFiltro[1]);
    
    if ConteudoFiltro.Count > 2 then
      IdCliente := StrToInt(ConteudoFiltro[2])
    else
      IdCliente := 0;
    
    if ConteudoFiltro.Count > 3 then
      FiltroParcelas := ConteudoFiltro[3]
    else
      FiltroParcelas := '';
    
    // Configurar ACBrBoleto
    if not ConfigurarACBrBoleto(IdEmpresa, IdContaCaixa, ConfiguracaoBoleto, Empresa) then
      raise Exception.Create('Erro na configuração do boleto');
    
    // Buscar cliente se informado
    if IdCliente > 0 then
      Cliente := TViewPessoaClienteController.ConsultaObjeto('ID=' + IntToStr(IdCliente));
    
    // Buscar parcelas
    ListaParcelas := TListaFinParcelaReceberVO(TT2TiORM.ConsultarLista(TFinParcelaReceberVO.Create, FiltroParcelas));

    if not Assigned(ListaParcelas) or (ListaParcelas.Count = 0) then
      raise Exception.Create('Nenhuma parcela encontrada para geração de remessa');
    
    // Carregar parcelas no ACBrBoleto
    CarregarParcelasParaRemessa(ListaParcelas, ConfiguracaoBoleto, Cliente);
    
    if FDataModule.ACBrBoleto.ListadeBoletos.Count = 0 then
      raise Exception.Create('Nenhuma parcela configurada para emitir boleto');
    
    // Gerar remessa
    NomeArquivo := 'REMESSA_' + FormatDateTime('DDMMYYYYHHMMSS', Now) + '.REM';
    FDataModule.ACBrBoleto.NomeArqRemessa := NomeArquivo;
    
    // Verificar se o diretório existe
    if not DirectoryExists(FDataModule.ACBrBoleto.DirArqRemessa) then
      ForceDirectories(FDataModule.ACBrBoleto.DirArqRemessa);
    
    // Gerar arquivo de remessa
    FDataModule.ACBrBoleto.GerarRemessa(1);
    
    Result := FDataModule.ACBrBoleto.DirArqRemessa + NomeArquivo;
    
  finally
    FreeAndNil(ConteudoFiltro);
    FreeAndNil(ConfiguracaoBoleto);
    FreeAndNil(Empresa);
    FreeAndNil(Cliente);
    FreeAndNil(ListaParcelas);
  end;
end;

class function TEdiController.ProcessarRetorno(pArquivoRetorno: String): String;
var
  I: Integer;
  Titulo: TACBrTitulo;
  ParcelaReceber: TFinParcelaReceberVO;
  ListaLog: TStringList;
begin
  Result := '';
  ListaLog := TStringList.Create;
  
  try
    // Configurar ACBrBoleto para leitura de retorno
    FDataModule.ACBrBoleto.LeCedenteRetorno := True;
    FDataModule.ACBrBoleto.DirArqRetorno := ExtractFileDir(pArquivoRetorno);
    FDataModule.ACBrBoleto.NomeArqRetorno := ExtractFileName(pArquivoRetorno);
    
    // Ler arquivo de retorno
    FDataModule.ACBrBoleto.LerRetorno;

    // Processar cada título
    for I := 0 to FDataModule.ACBrBoleto.ListadeBoletos.Count - 1 do
    begin
      Titulo := FDataModule.ACBrBoleto.ListadeBoletos.Objects[I];
      
      // Buscar parcela pelo nosso número
      ParcelaReceber := TFinParcelaReceberController.ConsultaObjeto(
        'BOLETO_NOSSO_NUMERO=' + QuotedStr(Titulo.NossoNumero));
      
      if not Assigned(ParcelaReceber) then
      begin
        ListaLog.Add('Nosso Número ' + Titulo.NossoNumero + 
          ' não localizado no banco de dados');
      end
      else
      begin
        try
          // Atualizar status da parcela
          ParcelaReceber.IdFinStatusParcela := 2;
          ParcelaReceber.IdFinTipoRecebimento := 6;
          ParcelaReceber.DataRecebimento := Titulo.DataBaixa;
          ParcelaReceber.TaxaMulta := Titulo.PercentualMulta;
          ParcelaReceber.ValorMulta := Titulo.ValorMoraJuros;
          ParcelaReceber.ValorDesconto := Titulo.ValorDesconto;
          ParcelaReceber.Historico := 'RECEBIDO VIA EDI BANCARIO - REFERENCIA: ' + Titulo.Referencia;
          ParcelaReceber.ValorRecebido := Titulo.ValorRecebido;
          
          // Salvar alterações
          TFinParcelaReceberController.Altera(ParcelaReceber);

          ListaLog.Add('Título ' + Titulo.NossoNumero + ' processado com sucesso');
        finally
          FreeAndNil(ParcelaReceber);
        end;
      end;
    end;
    
    Result := ListaLog.Text;
    
  finally
    FreeAndNil(ListaLog);
  end;
end;

initialization
  Classes.RegisterClass(TEdiController);

finalization
  Classes.UnRegisterClass(TEdiController);

end.
{$notes on}
{$WARNINGS ON}
