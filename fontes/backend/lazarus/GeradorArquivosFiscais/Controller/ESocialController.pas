{$notes off}
{$WARNINGS OFF}
unit ESocialController;

{$mode objfpc}{$H+}

interface

uses
  Classes, Dialogs, SysUtils, DB, LCLIntf, LCLType, LMessages, Forms, Controller,
  Biblioteca, Constantes, ACBreSocial, pcnConversao, pcesConversaoeSocial,
  T2TiORM, UDataModule, EmpresaController,
  // VOs existentes
  EmpresaVO, ViewPessoaColaboradorVO, FolhaEventoVO, FolhaParametroVO,
  FolhaLancamentoCabecalhoVO, FolhaLancamentoDetalheVO, FolhaRescisaoVO,
  PontoFechamentoJornadaVO, PontoParametroVO, FeriasPeriodoAquisitivoVO,
  FolhaTipoAfastamentoVO, FolhaAfastamentoVO, FolhaHistoricoSalarialVO,
  FolhaPlanoSaudeVO, FolhaValeTransporteVO, FolhaLancamentoComissaoVO,
  FolhaFechamentoVO, FolhaInssVO, SalarioMinimoVO, CboVO,
  FeriadosVO, OperadoraPlanoSaudeVO, EmpresaTransporteItinerarioVO,
  PontoClassificacaoJornadaVO, PontoHorarioVO, PontoEscalaVO, PontoTurmaVO,
  SetorVO;

type
  TESocialController = class(TController)
  private
    class procedure GerarS1000; // Informações do Empregador/Contribuinte
    class procedure GerarS1005; // Tabela de Estabelecimentos
    class procedure GerarS1010; // Tabela de Rubricas
    class procedure GerarS1020; // Tabela de Lotações
    class procedure GerarS1200; // Remuneração de Trabalhador
    class procedure GerarS1202; // Remuneração de Servidor RPPS
    class procedure GerarS1210; // Pagamentos
    class procedure GerarS1250; // Aquisição de Produção Rural
    class procedure GerarS1260; // Comercialização de Produção Rural
    class procedure GerarS1300; // Contribuição Sindical Patronal
    class procedure GerarS2200; // Cadastramento Inicial do Vínculo
    class procedure GerarS2205; // Alteração de Dados do Trabalhador
    class procedure GerarS2206; // Alteração de Contrato de Trabalho
    class procedure GerarS2210; // Comunicação de Acidente de Trabalho
    class procedure GerarS2220; // Monitoramento da Saúde do Trabalhador
    class procedure GerarS2230; // Afastamento Temporário
    class procedure GerarS2299; // Desligamento
    class procedure GerarS2300; // Trabalhador Sem Vínculo de Emprego/Estatutário
    class procedure GerarS2400; // Cadastro de Beneficiário Entidades
    class procedure GerarS3000; // Exclusão de Eventos
    class function GerarArquivosESocial: Boolean;
  protected
  public
    class function GerarESocial(pFiltro: String): String;
  end;

implementation

uses
  DateUtils, StrUtils;

var
  Empresa: TEmpresaVO;
  DataInicial, DataFinal, Arquivo, Competencia: String;
  IdEmpresa: Integer;
  FolhaParametro: TFolhaParametroVO;
  FolhaFechamento: TFolhaFechamentoVO;

{ TESocialController }

class function TESocialController.GerarESocial(pFiltro: String): String;
var
  ConteudoFiltro: TStringList;
begin
  ConteudoFiltro := TStringList.Create;
  try
    Split('|', pFiltro, ConteudoFiltro);

    DataInicial := ConteudoFiltro[0];
    DataFinal := ConteudoFiltro[1];
    Competencia := ConteudoFiltro[2];
    IdEmpresa := StrToInt(ConteudoFiltro[3]);

    // Consulta dados da empresa
    Empresa := TEmpresaController.ConsultaObjeto('ID=' + IntToStr(IdEmpresa));
    
    // Consulta parâmetros da folha
    FolhaParametro := TFolhaParametroVO(TT2TiORM.ConsultarUmObjeto(TFolhaParametroVO.Create, 
      'COMPETENCIA=' + QuotedStr(Competencia)));
      
    // Consulta fechamento atual
    FolhaFechamento := TFolhaFechamentoVO(TT2TiORM.ConsultarUmObjeto(TFolhaFechamentoVO.Create, ''));

    GerarArquivosESocial;

    Result := Arquivo;

  finally
    FreeAndNil(ConteudoFiltro);
  end;
end;

{$REGION 'Geração Arquivos'}

{$REGION 'S1000 - Informações do Empregador/Contribuinte'}
class procedure TESocialController.GerarS1000;
begin
  with FDataModule.ACBreSocial.Eventos.Iniciais.S1000.New do
  begin
    with evtInfoEmpregador do
    begin
      sequencial := 0;
      modoLancamento := mlInclusao;

      with ideEvento do
      begin
        procEmi := peAplicEmpregador;
        verProc := '1.0';
      end;

      with ideEmpregador do
      begin
        tpInsc := tiCNPJ;
        nrInsc := Empresa.CNPJ;
      end;

      with infoEmpregador do
      begin
        with idePeriodo do
        begin
          iniValid := Competencia;
          fimValid := '2099-12';
        end;

        with infoCadastro do
        begin
          // Classificação tributária baseada nos parâmetros da empresa
          classTrib := ct01; // MEI - Ajustar conforme necessidade
          indCoop := icNaoecooperativa;
          indConstr := iconNaoeConstrutora;
          indDesFolha := idfNaoAplicavel;
          indPorte := tpNao;
          indOptRegEletron := iorNaooptou;
          
          if Assigned(FolhaParametro) then
          begin
            if FolhaParametro.ContribuiPis = 'S' then
              indTribFolhaPisCofins := snfSim
            else
              indTribFolhaPisCofins := snfNao;
          end
          else
          begin
            indTribFolhaPisCofins := snfNao;
          end;

          // Configurações adicionais podem ser implementadas aqui
          // baseadas nos dados da empresa e parâmetros
        end;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'S1005 - Tabela de Estabelecimentos'}
class procedure TESocialController.GerarS1005;
begin
  with FDataModule.ACBreSocial.Eventos.Iniciais.S1005.New do
  begin
    with evtTabEstab do
    begin
      Sequencial := 0;
      ModoLancamento := mlInclusao;

      with ideEvento do
      begin
        procEmi := peAplicEmpregador;
        verProc := '1.0';
      end;

      with ideEmpregador do
      begin
        tpInsc := tiCNPJ;
        nrInsc := Empresa.CNPJ;
      end;

      with infoEstab do
      begin
        with ideEstab do
        begin
          tpInsc := tiCNPJ;
          nrInsc := Empresa.CNPJ; // Usando o CNPJ da matriz
          iniValid := Competencia;
          fimValid := '2099-12';
        end;

        with DadosEstab do
        begin
          // CNAE principal da empresa
          cnaePrep := Empresa.CodigoCnaePrincipal;

          with aliqGilrat do
          begin
            // Alíquota RAT padrão - ajustar conforme atividade
            aliqRat := arat1; // 1%
            fap := 1.0; // Fator Acidentário Previdenciário
          end;

          // Configurações adicionais para estabelecimento
          // podem ser implementadas conforme necessidade
        end;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'S1010 - Tabela de Rubricas'}
class procedure TESocialController.GerarS1010;
var
  ListaEventos: TListaFolhaEventoVO;
  i: Integer;
begin
  ListaEventos := TListaFolhaEventoVO(TT2TiORM.ConsultarLista(TFolhaEventoVO.Create, ''));
  
  if Assigned(ListaEventos) then
  begin
    try
      for i := 0 to ListaEventos.Count - 1 do
      begin
        with FDataModule.ACBreSocial.Eventos.Tabelas.S1010.New do
        begin
          with evtTabRubrica do
          begin
            sequencial := i;
            modoLancamento := mlInclusao;

            with ideEvento do
            begin
              procEmi := peAplicEmpregador;
              verProc := '1.0';
            end;

            with ideEmpregador do
            begin
              tpInsc := tiCNPJ;
              nrInsc := Empresa.CNPJ;
            end;

            with infoRubrica do
            begin
              with ideRubrica do
              begin
                codRubr := TFolhaEventoVO(ListaEventos.Items[i]).Codigo;
                ideTabRubr := '001'; // Tabela padrão
                iniValid := Competencia;
                fimValid := '2099-12';
              end;

              with dadosRubrica do
              begin
                dscRubr := TFolhaEventoVO(ListaEventos.Items[i]).Nome;
                // Natureza da rubrica - ajustar conforme tipo
                natRubr := 1001; // Vencimento
                tpRubr := tpVencimento;
                
                // Códigos de incidência baseados na configuração do evento
                codIncCP := cicNaoeBasedeCalculo;
                codIncIRRF := ciiNaoeBasedeCalculo;
                codIncFGTS := cdfNaoeBasedeCalculo;
                
                observacao := 'Rubrica: ' + TFolhaEventoVO(ListaEventos.Items[i]).Descricao;
              end;
            end;
          end;
        end;
      end;
    finally
      ListaEventos.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'S1020 - Tabela de Lotações'}
class procedure TESocialController.GerarS1020;
var
  ListaSetores: TListaSetorVO;
  i: Integer;
begin
  with FDataModule.ACBreSocial.Eventos.Tabelas.S1020.New do
  begin
    with evtTabLotacao do
    begin
      sequencial := 0;
      modoLancamento := mlInclusao;

      with ideEvento do
      begin
        procEmi := peAplicEmpregador;
        verProc := '1.0';
      end;

      with ideEmpregador do
      begin
        tpInsc := tiCNPJ;
        nrInsc := Empresa.CNPJ;
      end;

      with infoLotacao do
      begin
        with ideLotacao do
        begin
          codLotacao := '001'; // Código da lotação principal
          iniValid := Competencia;
          fimValid := '2099-12';
        end;

        with dadosLotacao do
        begin
          tpLotacao := '01'; // Administrativa
          tpInsc := tiCNPJ;
          nrInsc := Empresa.CNPJ;

          with fPasLotacao do
          begin
            fpas := '515'; // Comércio - ajustar conforme atividade
            codTercs := '0000';
            codTercsSusp := '';
          end;
        end;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'S1200 - Remuneração de Trabalhador'}
class procedure TESocialController.GerarS1200;
var
  ListaColaboradores: TListaViewPessoaColaboradorVO;
  ListaLancamentos: TListaFolhaLancamentoCabecalhoVO;
  FiltroColaborador, FiltroLancamentos: String;
  i, j: Integer;
begin
  // Filtra colaboradores ativos no período
  FiltroColaborador := 'DATA_DEMISSAO IS NULL OR DATA_DEMISSAO >= ' + QuotedStr(DataInicial);
  ListaColaboradores := TListaViewPessoaColaboradorVO(TT2TiORM.ConsultarLista(TViewPessoaColaboradorVO.Create, FiltroColaborador));
  
  if Assigned(ListaColaboradores) then
  begin
    try
      for i := 0 to ListaColaboradores.Count - 1 do
      begin
        // Filtra lançamentos do colaborador no período
        FiltroLancamentos := 'ID_COLABORADOR=' + IntToStr(TViewPessoaColaboradorVO(ListaColaboradores.Items[i]).Id) +
                           ' AND COMPETENCIA=' + QuotedStr(Competencia);
        ListaLancamentos := TListaFolhaLancamentoCabecalhoVO(TT2TiORM.ConsultarLista(TFolhaLancamentoCabecalhoVO.Create, FiltroLancamentos));
        
        if Assigned(ListaLancamentos) then
        begin
          try
            for j := 0 to ListaLancamentos.Count - 1 do
            begin
              with FDataModule.ACBreSocial.Eventos.Periodicos.S1200.New do
              begin
                with evtRemun do
                begin
                  Sequencial := (i * 100) + j;

                  with ideEvento do
                  begin
                    indRetif := ireOriginal;
                    IndApuracao := iapuMensal;
                    perApur := Competencia;
                    ProcEmi := peAplicEmpregador;
                    VerProc := '1.0';
                  end;

                  IdeEmpregador.TpInsc := tiCNPJ;
                  IdeEmpregador.NrInsc := Empresa.CNPJ;

                  with ideTrabalhador do
                  begin
                    CpfTrab := TViewPessoaColaboradorVO(ListaColaboradores.Items[i]).CpfCnpj;
                    // NIS pode ser implementado se disponível
                    
                    // Informações complementares
                    with infoComplem do
                    begin
                      NmTrab := TViewPessoaColaboradorVO(ListaColaboradores.Items[i]).Nome;
                      // Outros dados podem ser adicionados conforme disponibilidade
                    end;
                  end;

                  // Demais detalhes da remuneração podem ser implementados
                  // baseados nos lançamentos da folha
                end;
              end;
            end;
          finally
            ListaLancamentos.Free;
          end;
        end;
      end;
    finally
      ListaColaboradores.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'S1202 - Remuneração de Servidor RPPS'}
class procedure TESocialController.GerarS1202;
begin
  // Implementação similar ao S1200 para servidores RPPS
  // A ser implementado conforme necessidade específica
end;
{$ENDREGION}

{$REGION 'S1210 - Pagamentos'}
class procedure TESocialController.GerarS1210;
begin
  // Implementação para eventos de pagamentos
  // A ser implementado conforme necessidade específica
end;
{$ENDREGION}

{$REGION 'S1250 - Aquisição de Produção Rural'}
class procedure TESocialController.GerarS1250;
begin
  // Implementação para aquisição de produção rural
  // A ser implementado conforme necessidade específica
end;
{$ENDREGION}

{$REGION 'S1260 - Comercialização de Produção Rural'}
class procedure TESocialController.GerarS1260;
begin
  // Implementação para comercialização de produção rural
  // A ser implementado conforme necessidade específica
end;
{$ENDREGION}

{$REGION 'S1300 - Contribuição Sindical Patronal'}
class procedure TESocialController.GerarS1300;
begin
  with FDataModule.ACBreSocial.Eventos.Periodicos.S1300.New do
  begin
    with EvtContrSindPatr do
    begin
      Sequencial := 0;

      with IdeEvento do
      begin
        indRetif := ireOriginal;
        IndApuracao := iapuMensal;
        perApur := Competencia;
        ProcEmi := peAplicEmpregador;
        VerProc := '1.0';
      end;

      IdeEmpregador.TpInsc := tiCNPJ;
      IdeEmpregador.NrInsc := Empresa.CNPJ;

      // Contribuição sindical - valores podem ser parametrizados
      ContribSind.Clear;

      with ContribSind.New do
      begin
        cnpjSindic := ''; // CNPJ do sindicato - parametrizar
        vlrContribSind := 0.00; // Valor da contribuição - calcular
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Eventos de Trabalhador - S2200, S2205, S2206, etc.'}
class procedure TESocialController.GerarS2200;
begin
  // Cadastramento inicial de vínculo
  // A ser implementado conforme necessidade
end;

class procedure TESocialController.GerarS2205;
begin
  // Alteração de dados do trabalhador
  // A ser implementado conforme necessidade
end;

class procedure TESocialController.GerarS2206;
begin
  // Alteração de contrato de trabalho
  // A ser implementado conforme necessidade
end;

class procedure TESocialController.GerarS2210;
begin
  // Comunicação de acidente de trabalho
  // A ser implementado conforme necessidade
end;

class procedure TESocialController.GerarS2220;
begin
  // Monitoramento da saúde do trabalhador
  // A ser implementado conforme necessidade
end;

class procedure TESocialController.GerarS2230;
begin
  // Afastamento temporário
  // A ser implementado conforme necessidade
end;

class procedure TESocialController.GerarS2299;
begin
  // Desligamento
  // A ser implementado conforme necessidade
end;

class procedure TESocialController.GerarS2300;
begin
  // Trabalhador sem vínculo
  // A ser implementado conforme necessidade
end;

class procedure TESocialController.GerarS2400;
begin
  // Cadastro de beneficiário
  // A ser implementado conforme necessidade
end;

class procedure TESocialController.GerarS3000;
begin
  // Exclusão de eventos
  // A ser implementado conforme necessidade
end;
{$ENDREGION}

{$REGION 'Gerar Arquivo'}
class function TESocialController.GerarArquivosESocial: Boolean;
begin
  Result := False;

  // Limpa eventos anteriores
  FDataModule.ACBreSocial.Eventos.Clear;

  // Gera os eventos necessários
  GerarS1000;  // Informações do Empregador
  GerarS1005;  // Estabelecimentos
  GerarS1010;  // Rubricas
  GerarS1020;  // Lotações
  GerarS1200;  // Remuneração
  GerarS1300;  // Contribuição Sindical

  // Processa os eventos: Gerar, Assinar, Validar
  try
    FDataModule.ACBreSocial.Eventos.Gerar;
    //FDataModule.ACBreSocial.Eventos.Assinar;
    //FDataModule.ACBreSocial.Eventos.Validar;

    // Cria diretório se não existir
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Arquivos\eSocial\') then
      ForceDirectories(ExtractFilePath(Application.ExeName) + '\Arquivos\eSocial\');

    // Define nome do arquivo
    Arquivo := 'eSocial_' + FormatDateTime('DDMMYYYYhhmmss', Now) + '.xml';

    // Configura path e salva
    FDataModule.ACBreSocial.Configuracoes.Arquivos.PathSalvar := ExtractFilePath(Application.ExeName) + 'Arquivos\eSocial\';
    FDataModule.ACBreSocial.Eventos.SaveToFiles; // Apenas salva os arquivos em disco
    Result := True;
    
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao gerar eSocial: ' + E.Message);
    end;
  end;
end;
{$ENDREGION}

{$ENDREGION}

initialization
  Classes.RegisterClass(TESocialController);

finalization
  Classes.UnRegisterClass(TESocialController);

end.
{$notes on}
{$WARNINGS ON}
