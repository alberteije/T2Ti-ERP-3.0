{$notes off}
{$WARNINGS OFF}
unit ReinfController;

{$mode objfpc}{$H+}

interface

uses
  Classes, Dialogs, SysUtils, LCLIntf, LCLType, Forms, Controller,
  Biblioteca, ACBrReinf, pcnConversao, pcnConversaoReinf;

type
  TReinfController = class(TController)
  private
    class procedure GerarEventoR1000;
    class procedure GerarEventoR1070;
    class procedure GerarEventoR2010;
    class procedure GerarEventoR2020;
    class procedure GerarEventoR9000;
    class function GerarArquivoReinf: Boolean;
  protected
  public
    class function GerarReinf(pFiltro: String): String;
  end;

implementation

uses
  T2TiORM, UDataModule, EmpresaController, DateUtils,
  // VOs
  EmpresaVO, ContadorVO, ViewPessoaColaboradorVO, FolhaLancamentoCabecalhoVO,
  FolhaLancamentoDetalheVO, FolhaEventoVO;

{ TReinfController }

var
  Empresa: TEmpresaVO;
  TipoEvento, IdEmpresa, Ambiente, IdContador: Integer;
  DataInicial, DataFinal, Arquivo, FiltroLocal: String;

{$REGION 'Infra'}
class function TReinfController.GerarReinf(pFiltro: String): String;
var
  ConteudoFiltro: TStringList;
begin
  try
    ConteudoFiltro := TStringList.Create;
    Split('|', pFiltro, ConteudoFiltro);
    {
      0 - Periodo Inicial
      1 - Periodo Final
      2 - Tipo Evento
      3 - IdEmpresa
      4 - Ambiente (1-Produção, 2-Homologação)
      5 - IdContador
    }
    DataInicial := ConteudoFiltro[0];
    DataFinal := ConteudoFiltro[1];
    TipoEvento := StrToInt(ConteudoFiltro[2]);
    IdEmpresa := StrToInt(ConteudoFiltro[3]);
    Ambiente := StrToInt(ConteudoFiltro[4]);
    IdContador := StrToInt(ConteudoFiltro[5]);
    //
    GerarArquivoReinf;
    Result := Arquivo;
  finally
    FreeAndNil(ConteudoFiltro);
  end;
end;
{$ENDREGION}

{$REGION 'Geração Arquivo'}

{$REGION 'EVENTO R-1000: Informações do Contribuinte'}
class procedure TReinfController.GerarEventoR1000;
var
  Contador: TContadorVO;
begin
  try
    Empresa := TEmpresaController.ConsultaObjeto('ID=' + IntToStr(IdEmpresa));
    Contador := TContadorVO(TT2TiORM.ConsultarUmObjeto(TContadorVO.Create, 'ID=' + IntToStr(IdContador)));

    with FDataModule.ACBrReinf.Eventos.ReinfEventos.R1000.New do
    begin
      with evtInfoContri do
      begin
        Sequencial := 0;

        IdeEvento.ProcEmi := peAplicEmpregador;
        IdeEvento.VerProc := '1.0';

        ideContri.TpInsc := tiCNPJ;
        ideContri.NrInsc := Empresa.CNPJ;

        // Período de validade das informações
        infoContribuinte.IdePeriodo.IniValid := Copy(DataInicial, 1, 7); // AAAA-MM
        infoContribuinte.IdePeriodo.FimValid := Copy(DataFinal, 1, 7);   // AAAA-MM

        with infoContribuinte.InfoCadastro do
        begin
          // Classificação Tributária conforme CRT da empresa
          case Empresa.CRT of
            '1': ClassTrib := ct09;  // ct09 - Simples Nacional
            '2': ClassTrib := ct10; // ct10 - Simples Nacional - excesso
            '3': ClassTrib := ct11; // ct11 - Regime Normal
            else ClassTrib := ct11;
          end;

          indEscrituracao := TindEscrituracao(0);    // ieOriginal
          indDesoneracao := TindDesoneracao(0);      // idNaoAplicavel
          indAcordoIsenMulta := TindAcordoIsenMulta(0); // iamNaoAplicavel
          indSitPJ := TindSitPJ(0);                  // spjNaoInformado
          indUniao := '';
          dtTransfFinsLucr := 0;
          dtObito := 0;
          indPertIRRF := '';

          // Dados de Contato
          with Contato do
          begin
            NmCtt := Contador.NOME;
            CpfCtt := Contador.CPF;
            FoneFixo := Contador.FONE;
            FoneCel := '';
            email := Contador.EMAIL;
          end;

          // Software House (dados do desenvolvedor)
          SoftwareHouse.Clear;
          with SoftwareHouse.New do
          begin
            CnpjSoftHouse := '10793118000178';
            NmRazao := 'T2Ti Tecnologia da Informação LTDA';
            NmCont := 'Suporte T2Ti';
            Telefone := '61996103234';
            email := 't2ti.com@gmail.com';
          end;
        end;

        // Se necessário, pode-se adicionar nova validade
        // infoContribuinte.NovaValidade.IniValid := Copy(DataInicial, 1, 7);
        // infoContribuinte.NovaValidade.FimValid := Copy(DataFinal, 1, 7);
      end;
    end;

  finally
    FreeAndNil(Contador);
  end;
end;
{$ENDREGION}

{$REGION 'EVENTO R-1070: Tabela de Processos'}
class procedure TReinfController.GerarEventoR1070;
begin
  // Evento opcional para processos administrativos/judiciais
  // Pode ser implementado posteriormente conforme necessidade
  {
  with FDataModule.ACBrReinf.Eventos.ReinfEventos.R1070.New do
  begin
    with evtTabProcesso do
    begin
      Sequencial := 0;
      // ModoLancamento := TModoLancamento(0);

      IdeEvento.ProcEmi := TpProcEmi(0);
      IdeEvento.VerProc := '1.0';

      ideContri.TpInsc := TpTpInsc(1);
      ideContri.NrInsc := OnlyNumber(Empresa.CNPJ);

      with infoProcesso do
      begin
        ideProcesso.tpProc := TpTpProc(1); // tpAdministrativo
        ideProcesso.nrProc := '123456';
        ideProcesso.IniValid := Copy(DataInicial, 1, 7);
        ideProcesso.FimValid := Copy(DataFinal, 1, 7);
        ideProcesso.indAutoria := TpTpAutoria(1); // taContribuinte

        // Informações de suspensão (se houver)
        ideProcesso.infoSusp.Clear;
        with ideProcesso.infoSusp.New do
        begin
          codSusp := '12345678';
          indSusp := TpIndSusp(1); // siLiminarMandadoSeguranca
          dtDecisao := Now;
          indDeposito := TpIndDeposito(1); // tpSim
        end;

        // Dados do processo judicial
        ideProcesso.DadosProcJud.UfVara := Empresa.EnderecoPrincipal.UF;
        ideProcesso.DadosProcJud.codMunic := StrToIntDef(Empresa.CodigoIbgeCidade, 0);
        ideProcesso.DadosProcJud.idVara := '01';
      end;
    end;
  end;
  }
end;
{$ENDREGION}

{$REGION 'EVENTO R-2010: Serviços Tomados'}
class procedure TReinfController.GerarEventoR2010;
var
  ListaColaboradores: TListaViewPessoaColaboradorVO;
  TotalServicos, TotalBaseRet, TotalRet: Currency;
  i: Integer;
begin
  try
    Empresa := TEmpresaController.ConsultaObjeto('ID=' + IntToStr(IdEmpresa));

    // Consulta colaboradores ativos
    ListaColaboradores := TListaViewPessoaColaboradorVO(TT2TiORM.ConsultarLista(
      TViewPessoaColaboradorVO.Create,
      'DATA_DEMISSAO IS NULL OR DATA_DEMISSAO > ' + QuotedStr(DataFinal)));

    TotalServicos := 0;
    TotalBaseRet := 0;
    TotalRet := 0;

    // Aqui você implementaria o cálculo real baseado na folha de pagamento
    // Por enquanto, valores de exemplo
    if assigned(ListaColaboradores) then
    begin
      for i := 0 to ListaColaboradores.Count - 1 do
      begin
        // Simulação de valores - substituir por cálculo real
        TotalServicos := TotalServicos + 1000.00;
        TotalBaseRet := TotalBaseRet + 1000.00;
        TotalRet := TotalRet + 110.00;
      end;
    end;

    // Só gera evento se houver valores
    if TotalServicos > 0 then
    begin
      with FDataModule.ACBrReinf.Eventos.ReinfEventos.R2010.New do
      begin
        with evtServTom do
        begin
          Sequencial := 0;

          ideEvento.indRetif := trOriginal; // trOriginal
          // ideEvento.NrRecibo := ''; // Preencher apenas para retificação
          ideEvento.perApur := Copy(DataInicial, 1, 7); // AAAA-MM
          IdeEvento.ProcEmi := peAplicEmpregador; // peAplicEmpregador
          IdeEvento.VerProc := '1.0';

          ideContri.TpInsc := tiCNPJ; // tiCNPJ
          ideContri.NrInsc := Empresa.CNPJ;

          with infoServTom do
          begin
            with ideEstabObra do
            begin
              tpInscEstab := tiCNPJ; // tiCNPJ
              nrInscEstab := Empresa.CNPJ;
              indObra := ioNaoeObraDeConstrucaoCivil; // ioNaoeObraDeConstrucaoCivil

              with idePrestServ do
              begin
                // Para serviços tomados, o prestador é genérico neste exemplo
                // Na implementação real, usar dados reais dos fornecedores
                cnpjPrestador := '12345678000123';
                vlrTotalBruto := TotalServicos;
                vlrTotalBaseRet := TotalBaseRet;
                vlrTotalRetPrinc := TotalRet;
                vlrTotalRetAdic := 0.00;
                vlrTotalNRetPrinc := 0.00;
                vlrTotalNRetAdic := 0.00;
                indCPRB := TpIndCPRB(1); // icNaoContribuintePrevidenciariaReceitaBruta

                nfs.Clear;
                with nfs.New do
                begin
                  serie := '1';
                  numDocto := '001';
                  dtEmissaoNF := TextoParaData(DataInicial);
                  vlrBruto := TotalServicos;
                  obs := 'Serviços tomados no período';

                  infoTpServ.Clear;
                  with infoTpServ.New do
                  begin
                    tpServico := '100000001'; // Código da tabela 06 - Consultoria
                    vlrBaseRet := TotalBaseRet;
                    vlrRetencao := TotalRet;
                    vlrRetSub := 0.00;
                    vlrNRetPrinc := 0.00;
                    vlrServicos15 := 0.00;
                    vlrServicos20 := 0.00;
                    vlrServicos25 := 0.00;
                    vlrAdicional := 0.00;
                    vlrNRetAdic := 0.00;
                  end;
                end;

                // Processos de retenção principal (se houver)
                infoProcRetPr.Clear;
                // infoProcRetAd.Clear; // Processos de retenção adicional
              end;
            end;
          end;
        end;
      end;
    end;

  finally
    FreeAndNil(ListaColaboradores);
  end;
end;
{$ENDREGION}

{$REGION 'EVENTO R-2020: Serviços Prestados'}
class procedure TReinfController.GerarEventoR2020;
var
  ListaColaboradores: TListaViewPessoaColaboradorVO;
  TotalServicos, TotalBaseRet, TotalRet: Currency;
  i: Integer;
begin
  try
    Empresa := TEmpresaController.ConsultaObjeto('ID=' + IntToStr(IdEmpresa));

    // Consulta colaboradores ativos
    ListaColaboradores := TListaViewPessoaColaboradorVO(TT2TiORM.ConsultarLista(
      TViewPessoaColaboradorVO.Create,
      'DATA_DEMISSAO IS NULL OR DATA_DEMISSAO > ' + QuotedStr(DataFinal)));

    TotalServicos := 0;
    TotalBaseRet := 0;
    TotalRet := 0;

    // Cálculo de exemplo - substituir por cálculo real
    if assigned(ListaColaboradores) then
    begin
      for i := 0 to ListaColaboradores.Count - 1 do
      begin
        TotalServicos := TotalServicos + 1500.00;
        TotalBaseRet := TotalBaseRet + 1500.00;
        TotalRet := TotalRet + 165.00;
      end;
    end;

    // Só gera evento se houver valores
    if TotalServicos > 0 then
    begin
      with FDataModule.ACBrReinf.Eventos.ReinfEventos.R2020.New do
      begin
        with evtServPrest do
        begin
          Sequencial := 0;

          ideEvento.indRetif := trOriginal; // trOriginal
          // ideEvento.NrRecibo := '';
          ideEvento.perApur := Copy(DataInicial, 1, 7); // AAAA-MM
          IdeEvento.ProcEmi := peAplicEmpregador; // peAplicEmpregador
          IdeEvento.VerProc := '1.0';

          ideContri.TpInsc := tiCNPJ; // tiCNPJ
          ideContri.NrInsc := Empresa.CNPJ;

          with infoServPrest do
          begin
            with ideEstabPrest do
            begin
              tpInscEstabPrest := tiCNPJ; // tiCNPJ
              nrInscEstabPrest := Empresa.CNPJ;

              with ideTomador do
              begin
                // Tomador genérico - na implementação real usar dados reais dos clientes
                tpInscTomador := tiCNPJ; // tiCNPJ
                nrInscTomador := '98765432000198';
                indObra := ioNaoeObraDeConstrucaoCivil; // ioNaoeObraDeConstrucaoCivil
                vlrTotalBruto := TotalServicos;
                vlrTotalBaseRet := TotalBaseRet;
                vlrTotalRetPrinc := TotalRet;
                vlrTotalRetAdic := 0.00;
                vlrTotalNRetPrinc := 0.00;
                vlrTotalNRetAdic := 0.00;

                nfs.Clear;
                with nfs.New do
                begin
                  serie := '1';
                  numDocto := '001';
                  dtEmissaoNF := TextoParaData(DataInicial);
                  vlrBruto := TotalServicos;
                  obs := 'Serviços prestados no período';

                  infoTpServ.Clear;
                  with infoTpServ.New do
                  begin
                    tpServico := '100000002'; // Código da tabela 06 - Assessoria
                    vlrBaseRet := TotalBaseRet;
                    vlrRetencao := TotalRet;
                    vlrRetSub := 0.00;
                    vlrNRetPrinc := 0.00;
                    vlrServicos15 := 0.00;
                    vlrServicos20 := 0.00;
                    vlrServicos25 := 0.00;
                    vlrAdicional := 0.00;
                    vlrNRetAdic := 0.00;
                  end;
                end;

                // Processos de retenção (se houver)
                infoProcRetPr.Clear;
                // infoProcRetAd.Clear;
              end;
            end;
          end;
        end;
      end;
    end;

  finally
    FreeAndNil(ListaColaboradores);
  end;
end;
{$ENDREGION}

{$REGION 'EVENTO R-9000: Exclusão de Eventos'}
class procedure TReinfController.GerarEventoR9000;
begin
  // Evento de exclusão - geralmente usado para corrigir eventos enviados incorretamente
  // Pode ser implementado conforme necessidade
  {
  with FDataModule.ACBrReinf.Eventos.ReinfEventos.R9000.New do
  begin
    with evtExclusao do
    begin
      Sequencial := 0;

      IdeEvento.ProcEmi := TpProcEmi(0);
      IdeEvento.VerProc := '1.0';

      ideContri.TpInsc := TpTpInsc(1);
      ideContri.NrInsc := OnlyNumber(Empresa.CNPJ);

      with infoExclusao do
      begin
        // Para excluir um evento específico
        // tpEvento := 'R-2010';
        // nrRecEvt := '123456789012345678901234567890123456';
        // perApur := Copy(DataInicial, 1, 7);
      end;
    end;
  end;
  }
end;
{$ENDREGION}

{$REGION 'Gerar Arquivo'}
class function TReinfController.GerarArquivoReinf: Boolean;
var
  i: Integer;
  PathSalvar: String;
begin
  Result := False;
  try
    try
      // Configurações básicas do Reinf
      with FDataModule.ACBrReinf do
      begin
        Configuracoes.WebServices.Ambiente := taHomologacao;
        Configuracoes.WebServices.Salvar := True;
        Configuracoes.Arquivos.Salvar := True;

        // Define o path onde salvar os arquivos
        PathSalvar := ExtractFilePath(Application.ExeName) + 'Arquivos\Reinf\';
        Configuracoes.Arquivos.PathSalvar := PathSalvar;
      end;

      // Limpa eventos anteriores
      FDataModule.ACBrReinf.Eventos.Clear;
      FDataModule.ACBrReinf.Eventos.ReinfEventos.Clear;

      // Gera eventos conforme o tipo solicitado
      case TipoEvento of
        0: begin // Todos os eventos
             GerarEventoR1000;
             GerarEventoR2010;
             GerarEventoR2020;
           end;
        1: begin // Apenas informações do contribuinte
             GerarEventoR1000;
           end;
        2: begin // Apenas serviços tomados
             GerarEventoR2010;
           end;
        3: begin // Apenas serviços prestados
             GerarEventoR2020;
           end;
        4: begin // Apenas tabela de processos
             GerarEventoR1070;
           end;
      end;

      // Verifica se há eventos para gerar
      if FDataModule.ACBrReinf.Eventos.ReinfEventos.Count = 0 then
        raise Exception.Create('Nenhum evento gerado para o período informado.');

      // Cria diretório se não existir
      if not DirectoryExists(PathSalvar) then
        ForceDirectories(PathSalvar);

      FDataModule.ACBrReinf.Eventos.SaveToFiles; // apenas salva os arquivos em disco
      //FDataModule.ACBrReinf.Eventos.GerarXMLs;
      //FDataModule.ACBrReinf.Enviar;

      // Verifica se arquivos foram gerados
      if FDataModule.ACBrReinf.Eventos.Gerados.Count = 0 then
        raise Exception.Create('Nenhum arquivo XML foi gerado.');

      // Pega o caminho do primeiro arquivo gerado
      Arquivo := FDataModule.ACBrReinf.Eventos.Gerados.Items[0].PathNome;
      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gerar EFD-Reinf: ' + E.Message);
      end;
    end;
  finally
    FreeAndNil(Empresa);
  end;
end;
{$ENDREGION}

{$ENDREGION}

initialization
  Classes.RegisterClass(TReinfController);

finalization
  Classes.UnRegisterClass(TReinfController);

end.
{$notes on}
{$WARNINGS ON}
