{$notes off}
{$WARNINGS OFF}
unit SpedContabilController;

{$mode objfpc}{$H+}

interface

uses
  Classes, Dialogs, SysUtils, DB, LCLIntf, LCLType, LMessages, Forms, Controller,
  Biblioteca, ACBrECDBlocos, Constantes;

type
  TSpedContabilController = class(TController)
  private
    class procedure GerarBloco0;
    class procedure GerarBlocoI;
    class procedure GerarBlocoJ;
    class function GerarArquivoSpedContabil: Boolean;
  protected
  public
    class function GerarSpedContabil(pFiltro: String): String;
  end;

implementation

uses
  T2TiORM, UDataModule, EmpresaController,
  EmpresaVO, ContabilTermoVO, RegistroCartorioVO, ContabilContaVO,
  ContabilHistoricoVO, ContabilLancamentoCabecalhoVO, ContabilLivroVO,
  ContabilLancamentoDetalheVO, ContabilDreDetalheVO, ContadorVO,
  ViewSpedI155VO, PlanoContaVO;

{ TSpedContabilController }

var
  Empresa: TEmpresaVO;
  FormaEscrituracao, IdEmpresa, VersaoLayout, IdContador: Integer;
  DataInicial, DataFinal, Arquivo, SessaoAtual, FiltroLocal, EscrituracaoForma: String;

{$REGION 'Infra'}
class function TSpedContabilController.GerarSpedContabil(pFiltro: String): String;
var
  ConteudoFiltro: TStringList;
begin
  ConteudoFiltro := TStringList.Create;
  try
    Split('|', pFiltro, ConteudoFiltro);
    {
      0 - Periodo Inicial
      1 - Periodo Final
      2 - Forma Escrituração
      3 - Versãodo Layout
      4 - IdEmpresa
      5 - IdContador
    }
    DataInicial := ConteudoFiltro[0];
    DataFinal := ConteudoFiltro[1];
    FormaEscrituracao := StrToInt(ConteudoFiltro[2]);
    VersaoLayout := StrToInt(ConteudoFiltro[3]);
    IdEmpresa := StrToInt(ConteudoFiltro[4]);
    IdContador := StrToInt(ConteudoFiltro[5]);

    GerarArquivoSpedContabil;

    Result := Arquivo;
  finally
    FreeAndNil(ConteudoFiltro);
  end;
end;
{$ENDREGION}

{$REGION 'Geração Arquivo'}


{$REGION 'Bloco 0 - Abertura, Identificação e Referências'}
class procedure TSpedContabilController.GerarBloco0;
begin
  Empresa := TEmpresaController.ConsultaObjeto('ID=' + IntToStr(IdEmpresa));

  FDataModule.ACBrSpedContabil.Bloco_0.LimpaRegistros;
  with FDataModule.ACBrSpedContabil.Bloco_0 do
  begin
    // REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICAÇÃO DO EMPRESÁRIO OU DA SOCIEDADE EMPRESÁRIA
    with Registro0000 do
    begin
      DT_INI := TextoParaData(DataInicial);
      DT_FIN := TextoParaData(DataFinal);

      NOME := Empresa.RazaoSocial;
      CNPJ := Empresa.CNPJ;
      UF := Empresa.EnderecoPrincipal.UF;
      IE := Empresa.InscricaoEstadual;
      COD_MUN := IntToStr(Empresa.CodigoIbgeCidade);
      IM := Empresa.InscricaoMunicipal;
      IND_SIT_ESP := '';
    end;

    // REGISTRO 0001: ABERTURA DO BLOCO 0
    Registro0001.IND_DAD := 0; // bloco com dados informados = 0 | sem dados inf = 1

    // REGISTRO 0007: OUTRAS INSCRIÇÕES CADASTRAIS DA PESSOA JURÍDICA
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO 0020: ESCRITURAÇÃO CONTÁBIL DESCENTRALIZADA
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO 0180: IDENTIFICAÇÃO DO RELACIONAMENTO COM O PARTICIPANTE
    { Implementado a critério do Participante do T2Ti ERP }
  end;
end;
{$ENDREGION}

{$REGION 'Bloco I - Lançamentos Contábeis'}
class procedure TSpedContabilController.GerarBlocoI;
var
  PlanoConta: TPlanoContaVO;
  ContabilLivro: TContabilLivroVO;
  TermoLivro: TContabilTermoVO;
  RegistroCartorio: TRegistroCartorioVO;
  RegistroI155C, RegistroI155D: TViewSpedI155VO;
  ContaContabil: TContabilContaVO;
  ListaPlanoConta: TListaContabilContaVO;
  ListaHistorico: TListaContabilHistoricoVO;
  ListaLancamentoCabecalho: TListaContabilLancamentoCabecalhoVO;
  ListaLancamentoDetalhe: TListaContabilLancamentoDetalheVO;
  Niveis: TStringList;
  i, j: Integer;
  Credito, Debito, SaldoAnterior: Extended;
begin
  Credito := 0;
  Debito := 0;
  SaldoAnterior := 0;
  Niveis := TStringList.Create;
  FDataModule.ACBrSpedContabil.Bloco_I.LimpaRegistros;

  with FDataModule.ACBrSpedContabil.Bloco_I do
  begin
    // REGISTRO I001: ABERTURA DO BLOCO I
    RegistroI001.IND_DAD := 0;

    // REGISTRO I010: IDENTIFICAÇÃO DA ESCRITURAÇÃO CONTÁBIL
    case FormaEscrituracao of
      0:
        RegistroI010.IND_ESC := 'G';
      1:
        RegistroI010.IND_ESC := 'R';
      2:
        RegistroI010.IND_ESC := 'A';
      3:
        RegistroI010.IND_ESC := 'B';
      4:
        RegistroI010.IND_ESC := 'Z';
    end;
    EscrituracaoForma := RegistroI010.IND_ESC;

    case VersaoLayout of
      0:
        RegistroI010.COD_VER_LC := '1.00';
      1:
        RegistroI010.COD_VER_LC := '2.00';
    end;

    // REGISTRO I012: LIVROS AUXILIARES AO DIÁRIO
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO I015: IDENTIFICAÇÃO DAS CONTAS DA ESCRITURAÇÃO RESUMIDA A QUE SE REFERE A ESCRITURAÇÃO AUXILIAR
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO I020: CAMPOS ADICIONAIS
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO I030: TERMO DE ABERTURA
    ContabilLivro := TContabilLivroVO(TT2TiORM.ConsultarUmObjeto(TContabilLivroVO.Create, 'FORMA_ESCRITURACAO = ' + QuotedStr(EscrituracaoForma) +  ' and COMPETENCIA=' + QuotedStr(FormatDateTime('MM/YYYY', TextoParaData(DataInicial)))));
    if Assigned(ContabilLivro) then
    begin
      TermoLivro := TContabilTermoVO(TT2TiORM.ConsultarUmObjeto(TContabilTermoVO.Create, 'ID_CONTABIL_LIVRO=' + IntToStr(ContabilLivro.Id) + ' and ABERTURA_ENCERRAMENTO=' + QuotedStr('A')));
      RegistroCartorio := TRegistroCartorioVO(TT2TiORM.ConsultarUmObjeto(TRegistroCartorioVO.Create, ''));

      with RegistroI030 do
      begin
        NUM_ORD := TermoLivro.NumeroRegistro;
        NAT_LIVR := ContabilLivro.Descricao;
        QTD_LIN := FDataModule.ACBrSpedContabil.Bloco_9.Registro9999.QTD_LIN;
        NOME := Empresa.RazaoSocial;
        NIRE := RegistroCartorio.NIRE;
        CNPJ := Empresa.CNPJ;
        DT_ARQ := RegistroCartorio.DataRegistro;
        DESC_MUN := Empresa.EnderecoPrincipal.Cidade;
      end;
    end;


    // REGISTRO I050: PLANO DE CONTAS
    PlanoConta := TPlanoContaVO(TT2TiORM.ConsultarUmObjeto(TPlanoContaVO.Create, 'ID=1'));
    if Assigned(PlanoConta) then
    begin
      ListaPlanoConta := TListaContabilContaVO(TT2TiORM.ConsultarLista(TContabilContaVO.Create, 'ID_PLANO_CONTA=' + IntToStr(PlanoConta.Id)));
      if assigned(ListaPlanoConta) then
      begin
        for i := 0 to ListaPlanoConta.Count - 1 do
        begin
          with RegistroI050.New do
          begin
            DT_ALT := TContabilContaVO(ListaPlanoConta.Items[i]).DataInclusao;
            COD_NAT := TContabilContaVO(ListaPlanoConta.Items[i]).CodigoEfd;
            IND_CTA := TContabilContaVO(ListaPlanoConta.Items[i]).Tipo;
            Split('.', TContabilContaVO(ListaPlanoConta.Items[i]).Classificacao, Niveis);
            NIVEL := IntToStr(Niveis.Count);
            COD_CTA := TContabilContaVO(ListaPlanoConta.Items[i]).Classificacao;
            COD_CTA_SUP := '';
            CTA := TContabilContaVO(ListaPlanoConta.Items[i]).Descricao;

            // REGISTRO I051: PLANO DE CONTAS REFERENCIAL
            {
            Observação: A partir da versão 3.X e alterações posteriores do PVA do Sped Contábil, não haverá o plano de
            contas referencial da RFB . Portanto, para as empresas que utilizavam esse plano, não será necessário o preenchimento
            do registro I051.

            Fonte: Manual de Orientação da ECD
            }
          end;
        end;
      end;
    end;

    // REGISTRO I052: INDICAÇÃO DOS CÓDIGOS DE AGLUTINAÇÃO
    { Implementado a critério do Participante do T2Ti ERP }


    // REGISTRO I075: TABELA DE HISTÓRICO PADRONIZADO
    ListaHistorico := TListaContabilHistoricoVO(TT2TiORM.ConsultarLista(TContabilHistoricoVO.Create, ''));
    if assigned(ListaHistorico) then
    begin
      for i := 0 to ListaHistorico.Count - 1 do
      begin
        with RegistroI075.New do
        begin
          COD_HIST := IntToStr(TContabilHistoricoVO(ListaHistorico.Items[i]).Id);
          DESCR_HIST := TContabilHistoricoVO(ListaHistorico.Items[i]).Historico;
        end;
      end;
    end;

    // REGISTRO I100: CENTRO DE CUSTOS
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO I150: SALDOS PERIÓDICOS – IDENTIFICAÇÃO DO PERÍODO
    with RegistroI150.New do
    begin
      DT_INI := TextoParaData(DataInicial);
      DT_FIN := TextoParaData(DataFinal);

      // REGISTRO I151: Hash dos Arquivos que Contêm as Fichas de Lançamento Utilizadas no Período
      { Implementado a critério do Participante do T2Ti ERP }

      // REGISTRO I155: DETALHE DOS SALDOS PERIÓDICOS
      with RegistroI155.New do
      begin
        for i := 0 to ListaPlanoConta.Count - 1 do
        begin
          // Saldo Anterior
          FiltroLocal := 'MES_ANO=' + QuotedStr(PeriodoAnterior(FormatDateTime('MM/YYYY', TextoParaData(DataInicial)))) + ' and TIPO=' + QuotedStr('C');
          RegistroI155C := TViewSpedI155VO(TT2TiORM.ConsultarUmObjeto(TViewSpedI155VO.Create, FiltroLocal));
          if Assigned(RegistroI155C) then
            Credito := RegistroI155C.SomaValor
          else
            Credito := 0;

          FiltroLocal := 'MES_ANO=' + QuotedStr(PeriodoAnterior(FormatDateTime('MM/YYYY', TextoParaData(DataInicial)))) + ' and TIPO=' + QuotedStr('D');
          RegistroI155D := TViewSpedI155VO(TT2TiORM.ConsultarUmObjeto(TViewSpedI155VO.Create, FiltroLocal));
          if Assigned(RegistroI155D) then
            Debito := RegistroI155D.SomaValor
          else
            Debito := 0;

          SaldoAnterior := Credito - Debito;

          COD_CTA := TContabilContaVO(ListaPlanoConta.Items[i]).Classificacao;
          COD_CCUS := '';
          VL_SLD_INI := SaldoAnterior;

          if SaldoAnterior < 0 then
            IND_DC_INI := 'D'
          else
            IND_DC_INI := 'C';

          // Saldo Atual
          FiltroLocal := 'MES_ANO=' + QuotedStr(FormatDateTime('MM/YYYY', TextoParaData(DataInicial))) + ' and TIPO=' + QuotedStr('C');
          RegistroI155C := TViewSpedI155VO(TT2TiORM.ConsultarUmObjeto(TViewSpedI155VO.Create, FiltroLocal));
          if Assigned(RegistroI155C) then
            Credito := RegistroI155C.SomaValor
          else
            Credito := 0;

          FiltroLocal := 'MES_ANO=' + QuotedStr(FormatDateTime('MM/YYYY', TextoParaData(DataInicial))) + ' and TIPO=' + QuotedStr('D');
          RegistroI155D := TViewSpedI155VO(TT2TiORM.ConsultarUmObjeto(TViewSpedI155VO.Create, FiltroLocal));
          if Assigned(RegistroI155D) then
            Debito := RegistroI155D.SomaValor
          else
            Debito := 0;

          VL_DEB := Debito;
          VL_CRED := Credito;
          VL_SLD_FIN := Credito - Debito;

          if (Credito - Debito) < 0 then
            IND_DC_FIN := 'D'
          else
            IND_DC_FIN := 'C';

          // REGISTRO I157: TRANSFERÊNCIA DE SALDOS DE PLANO DE CONTAS ANTERIOR
          { Implementado a critério do Participante do T2Ti ERP }
        end;
      end;
    end;

    // REGISTRO I200: LANÇAMENTO CONTÁBIL
    FiltroLocal := ' (DATA_LANCAMENTO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')';
    ListaLancamentoCabecalho := TListaContabilLancamentoCabecalhoVO(TT2TiORM.ConsultarLista(TContabilLancamentoCabecalhoVO.Create, FiltroLocal));
    if assigned(ListaLancamentoCabecalho) then
    begin
      for i := 0 to ListaLancamentoCabecalho.Count - 1 do
      begin
        with RegistroI200.New do
        begin
          NUM_LCTO := IntToStr(TContabilLancamentoCabecalhoVO(ListaLancamentoCabecalho.Items[i]).Id);
          DT_LCTO := TContabilLancamentoCabecalhoVO(ListaLancamentoCabecalho.Items[i]).DataLancamento;
          VL_LCTO := TContabilLancamentoCabecalhoVO(ListaLancamentoCabecalho.Items[i]).Valor;
          IND_LCTO := 'N';

          // REGISTRO I250: PARTIDAS DO LANÇAMENTO
          ListaLancamentoDetalhe := TListaContabilLancamentoDetalheVO(TT2TiORM.ConsultarLista(TContabilLancamentoDetalheVO.Create, 'ID_CONTABIL_LANCAMENTO_CAB=' + NUM_LCTO));
          if assigned(ListaLancamentoDetalhe) then
          begin
            for j := 0 to ListaLancamentoDetalhe.Count - 1 do
            begin
              with RegistroI250.New do
              begin
                ContaContabil := TContabilContaVO(TT2TiORM.ConsultarUmObjeto(TContabilContaVO.Create, 'ID=' + IntToStr(TContabilLancamentoDetalheVO(ListaLancamentoDetalhe.Items[j]).IdContabilConta)));

                COD_CTA := ContaContabil.Classificacao;
                VL_DC := TContabilLancamentoDetalheVO(ListaLancamentoDetalhe.Items[j]).Valor;
                IND_DC := TContabilLancamentoDetalheVO(ListaLancamentoDetalhe.Items[j]).Tipo;
                COD_HIST_PAD := IntToStr(TContabilLancamentoDetalheVO(ListaLancamentoDetalhe.Items[j]).IdContabilHistorico);
                HIST := TContabilLancamentoDetalheVO(ListaLancamentoDetalhe.Items[j]).Historico;
              end;
            end;
          end;
        end;
      end;
    end;

    // REGISTRO I300: BALANCETES DIÁRIOS – IDENTIFICAÇÃO DA DATA
    // REGISTRO I310: DETALHES DO BALANCETE DIÁRIO
    { Implementados a critério do Participante do T2Ti ERP }

    // REGISTRO I350: SALDOS DAS CONTAS DE RESULTADO ANTES DO ENCERRAMENTO – IDENTIFICAÇÃO DA DATA
    // REGISTRO I355: DETALHES DOS SALDOS DAS CONTAS DE RESULTADO ANTES DO ENCERRAMENTO
    { Implementados a critério do Participante do T2Ti ERP }

    // REGISTRO I500: PARÂMETROS DE IMPRESSÃO E VISUALIZAÇÃO DO LIVRO RAZÃO AUXILIAR COM LEIAUTE PARAMETRIZÁVEL
    // REGISTRO I510: DEFINIÇÃO DE CAMPOS DO LIVRO RAZÃO AUXILIAR COM LEIAUTE PARAMETRIZÁVEL
    // REGISTRO I550: DETALHES DO LIVRO AUXILIAR COM LEIAUTE PARAMETRIZÁVEL
    // REGISTRO I555: TOTAIS NO LIVRO AUXILIAR COM LEIAUTE PARAMETRIZÁVEL
    { Implementados a critério do Participante do T2Ti ERP }
  end;
end;
{$ENDREGION}

{$REGION 'Bloco J - Demonstrações Contábeis'}
class procedure TSpedContabilController.GerarBlocoJ;
var
  i: Integer;
  ContabilLivro: TContabilLivroVO;
  TermoLivro: TContabilTermoVO;
  RegistroCartorio: TRegistroCartorioVO;
  ListaDreDetalhe: TListaContabilDreDetalheVO;
  Contador: TContadorVO;
begin
  FDataModule.ACBrSpedContabil.Bloco_J.LimpaRegistros;

  with FDataModule.ACBrSpedContabil.Bloco_J do
  begin
    // REGISTRO J001: ABERTURA DO BLOCO J
    RegistroJ001.IND_DAD := 0;

    // REGISTRO J005: DEMONSTRAÇÕES CONTÁBEIS
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO J100: BALANÇO PATRIMONIAL
    { Implementado a critério do Participante do T2Ti ERP }

    //REGISTRO J150: DEMONSTRAÇÃO DO RESULTADO DO EXERCÍCIO
    { Implementado a critério do Participante do T2Ti ERP }
    ListaDreDetalhe := TListaContabilDreDetalheVO(TT2TiORM.ConsultarLista(TContabilDreDetalheVO.Create, 'ID>0'));
    if assigned(ListaDreDetalhe) then
    begin
      for i := 0 to ListaDreDetalhe.Count - 1 do
      begin
      end;
    end;

    // REGISTRO J200: TABELA DE HISTÓRICO DE FATOS CONTÁBEIS QUE MODIFICAM A CONTA LUCROS ACUMULADOS OU A CONTA PREJUÍZOS ACUMULADOS OU TODO O PATRIMÔNIO LÍQUIDO
    // REGISTRO J210: DLPA – DEMONSTRAÇÃO DE LUCROS OU PREJUÍZOS ACUMULADOS/DMPL – DEMONSTRAÇÃO DE MUTAÇÕES DO PATRIMÔNIO LÍQUIDO
    // REGISTRO J215: FATO CONTÁBIL QUE ALTERA A CONTA LUCROS ACUMULADOS OU A CONTA PREJUÍZOS ACUMULADOS OU TODO O PATRIMÔNIO LÍQUIDO
    { Implementados a critério do Participante do T2Ti ERP }

    // REGISTRO J310: DEMONSTRAÇÃO DO FLUXO DE CAIXA
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO J410: DEMONSTRAÇÃO DO VALOR ADICIONADO
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO J800: OUTRAS INFORMAÇÕES
    { Implementado a critério do Participante do T2Ti ERP }

    // REGISTRO J900: TERMO DE ENCERRAMENTO
    ContabilLivro := TContabilLivroVO(TT2TiORM.ConsultarUmObjeto(TContabilLivroVO.Create, 'FORMA_ESCRITURACAO = ' + QuotedStr(EscrituracaoForma) +  ' and COMPETENCIA=' + QuotedStr(FormatDateTime('MM/YYYY', TextoParaData(DataInicial)))));
    if Assigned(ContabilLivro) then
    begin
      TermoLivro := TContabilTermoVO(TT2TiORM.ConsultarUmObjeto(TContabilTermoVO.Create, 'ID_CONTABIL_LIVRO=' + IntToStr(ContabilLivro.Id) + ' and ABERTURA_ENCERRAMENTO=' + QuotedStr('E')));
      RegistroCartorio := TRegistroCartorioVO(TT2TiORM.ConsultarUmObjeto(TRegistroCartorioVO.Create, ''));

      with RegistroJ900 do
      begin
        NUM_ORD := TermoLivro.NumeroRegistro;
        NAT_LIVRO := ContabilLivro.Descricao;
        QTD_LIN := FDataModule.ACBrSpedContabil.Bloco_9.Registro9999.QTD_LIN;
        NOME := Empresa.RazaoSocial;
        DT_INI_ESCR := TermoLivro.EscrituracaoInicio;
        DT_FIN_ESCR := TermoLivro.EscrituracaoFim;
      end;
    end;

    // REGISTRO J930: IDENTIFICAÇÃO DOS SIGNATÁRIOS DA ESCRITURAÇÃO
    Contador := TContadorVO(TT2TiORM.ConsultarUmObjeto(TContadorVO.Create, 'ID=' + IntToStr(IdContador)));
    with RegistroJ930.New do
    begin
      IDENT_NOM := Contador.Nome;
      IDENT_CPF := Contador.Cpf;
      IDENT_QUALIF := 'Contador';
      COD_ASSIN := '900';
      IND_CRC := Contador.InscricaoCrc;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Gerar Arquivo'}
class function TSpedContabilController.GerarArquivoSpedContabil: Boolean;
begin
  Result := False;

  with FDataModule.ACBrSpedContabil do
  begin
    DT_INI := TextoParaData(DataInicial);
    DT_FIN := TextoParaData(DataFinal);
  end;

  GerarBloco0;
  GerarBlocoI;
  GerarBlocoJ;

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Arquivos\Sped\') then
    ForceDirectories(ExtractFilePath(Application.ExeName) + '\Arquivos\Sped\');

  Arquivo := 'SpedContabil' + FormatDateTime('DDMMYYYYhhmmss', Now) + '.txt';

  FDataModule.ACBrSPEDContabil.Path := ExtractFilePath(Application.ExeName) + 'Arquivos\Sped\';
  FDataModule.ACBrSPEDContabil.Arquivo := Arquivo;
  FDataModule.ACBrSpedContabil.SaveFileTXT;

  Arquivo := FDataModule.ACBrSPEDContabil.Path + Arquivo;

  Result := True;
end;
{$ENDREGION}

{$ENDREGION}

initialization
  Classes.RegisterClass(TSpedContabilController);

finalization
  Classes.UnRegisterClass(TSpedContabilController);


end.
{$notes on}
{$WARNINGS ON}
