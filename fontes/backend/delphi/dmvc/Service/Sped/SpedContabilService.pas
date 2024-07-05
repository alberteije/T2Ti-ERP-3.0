{*******************************************************************************
Title: T2Ti ERP
Description: Service para gera��o do arquivo Sped Cont�bil

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
@version 3.0
*******************************************************************************}
unit SpedContabilService;

interface

uses
  Forms, Classes, SQLExpr, SysUtils, Generics.Collections, MVCFramework.DataSet.Utils,
  ServiceBase, Biblioteca, ACBrECDBlocos, Constantes, UDataModule;

type
  TSpedContabilService = class(TServiceBase)
  private
    class procedure GerarBloco0;
    class procedure GerarBlocoI;
    class procedure GerarBlocoJ;
    class function GerarArquivoSpedContabil: Boolean;
  protected
  public
    // consultar
    class function GerarSpedContabil(pFiltro: String): String;
  end;

implementation

uses
  EmpresaService, ContadorService,
  
  // Models - Geral  
  Empresa, Contador;

  // Models - Contabilidade
  (* TODO
  ContabilTermo, RegistroCartorio, ContabilConta,
  ContabilHistorico, ContabilLancamentoCabecalho, ContabilLivro,
  ContabilLancamentoDetalhe, ContabilDreDetalhe,
  ViewSpedI155, PlanoConta;
  *)

{ TSpedContabilService }

var
  Empresa: TEmpresa;
  FormaEscrituracao, IdEmpresa, VersaoLayout: Integer;
  DataInicial, DataFinal, Arquivo, SessaoAtual, FiltroLocal, EscrituracaoForma: string;

{$REGION 'Infra'}
class function TSpedContabilService.GerarSpedContabil(pFiltro: string): string;
var
  ConteudoFiltro: TStringList;
begin
  try
    ConteudoFiltro := TStringList.Create;
    Split('|', pFiltro, ConteudoFiltro);
    {
      0 - Periodo Inicial
      1 - Periodo Final
      2 - Forma de Escritura��o
      3 - Layout da Vers�o
      }
    DataInicial := ConteudoFiltro[0];
    DataFinal := ConteudoFiltro[1];
    FormaEscrituracao := StrToInt(ConteudoFiltro[2]);
    VersaoLayout := StrToInt(ConteudoFiltro[3]);
    //
    GerarArquivoSpedContabil;
    Result := Arquivo;
  finally
    FreeAndNil(ConteudoFiltro);
  end;
end;
{$ENDREGION}

{$REGION 'Gera��o Arquivo'}


{$REGION 'Bloco 0 - Abertura, Identifica��o e Refer�ncias'}
class procedure TSpedContabilService.GerarBloco0;
begin
  Empresa := TEmpresaService.ConsultarObjeto(1);

  FDataModule.ACBrSpedContabil.Bloco_0.LimpaRegistros;
  with FDataModule.ACBrSpedContabil.Bloco_0 do
  begin
    // REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICA��O DO EMPRES�RIO OU DA SOCIEDADE EMPRES�RIA
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

    // REGISTRO 0007: OUTRAS INSCRI��ES CADASTRAIS DA PESSOA JUR�DICA
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO 0020: ESCRITURA��O CONT�BIL DESCENTRALIZADA
    { Implementado a crit�rio do Participante do T2Ti ERP - Para o treinamento a escritura��o ser� centralizada }

    // REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO 0180: IDENTIFICA��O DO RELACIONAMENTO COM O PARTICIPANTE
    { Implementado a crit�rio do Participante do T2Ti ERP }
  end;
end;
{$ENDREGION}

{$REGION 'Bloco I - Lan�amentos Cont�beis'}
class procedure TSpedContabilService.GerarBlocoI;
var
  (* TODO
  PlanoConta: TPlanoConta;
  ContabilLivro: TContabilLivro;
  TermoLivro: TContabilTermo;
  RegistroCartorio: TRegistroCartorio;
  RegistroI155C, RegistroI155D: TViewSpedI155;
  ContaContabil: TContabilConta;
  ListaPlanoConta: TObjectList<TContabilContaVO>;
  ListaHistorico: TObjectList<TContabilHistoricoVO>;
  ListaLancamentoCabecalho: TObjectList<TContabilLancamentoCabecalhoVO>;
  ListaLancamentoDetalhe: TObjectList<TContabilLancamentoDetalheVO>;
  *)
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

    // REGISTRO I010: IDENTIFICA��O DA ESCRITURA��O CONT�BIL
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

    // REGISTRO I012: LIVROS AUXILIARES AO DI�RIO
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO I015: IDENTIFICA��O DAS CONTAS DA ESCRITURA��O RESUMIDA A QUE SE REFERE A ESCRITURA��O AUXILIAR
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO I020: CAMPOS ADICIONAIS
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO I030: TERMO DE ABERTURA
    (* TODO
    ContabilLivro := GetQuery(FiltroLocal).AsObject<TContabilLivroVO>('FORMA_ESCRITURACAO = ' + QuotedStr(EscrituracaoForma) +  ' and COMPETENCIA=' + QuotedStr(FormatDateTime('MM/YYYY', TextoParaData(DataInicial))), False);
    if Assigned(ContabilLivro) then
    begin
      TermoLivro := GetQuery(FiltroLocal).AsObject<TContabilTermoVO>('ID_CONTABIL_LIVRO=' + IntToStr(ContabilLivro.Id) + ' and ABERTURA_ENCERRAMENTO=' + QuotedStr('A'), False);
      RegistroCartorio := GetQuery(FiltroLocal).AsObject<TRegistroCartorioVO>('ID_EMPRESA=1', False);

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
    *)

    // REGISTRO I050: PLANO DE CONTAS
    (* TODO
    PlanoConta := GetQuery(FiltroLocal).AsObject<TPlanoContaVO>('ID_EMPRESA=1', False);
    if Assigned(PlanoConta) then
    begin
      ListaPlanoConta := GetQuery(FiltroLocal).AsObjectList<TContabilContaVO>('ID_PLANO_CONTA=' + IntToStr(PlanoConta.Id), '-1', False);
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
            Observa��o: A partir da vers�o 3.X e altera��es posteriores do PVA do Sped Cont�bil, n�o haver� o plano de
            contas referencial da RFB . Portanto, para as empresas que utilizavam esse plano, n�o ser� necess�rio o preenchimento
            do registro I051.

            Fonte: Manual de Orienta��o da ECD
            }
          end;
        end;
      end;
    end;
    *)

    // REGISTRO I052: INDICA��O DOS C�DIGOS DE AGLUTINA��O
    { Implementado a crit�rio do Participante do T2Ti ERP }


    // REGISTRO I075: TABELA DE HIST�RICO PADRONIZADO
    (* TODO
    ListaHistorico := GetQuery(FiltroLocal).AsObjectList<TContabilHistoricoVO>('ID_EMPRESA=1', '-1', False);
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
    *)

    // REGISTRO I100: CENTRO DE CUSTOS
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO I150: SALDOS PERI�DICOS � IDENTIFICA��O DO PER�ODO
    with RegistroI150.New do
    begin
      DT_INI := TextoParaData(DataInicial);
      DT_FIN := TextoParaData(DataFinal);

      // REGISTRO I151: Hash dos Arquivos que Cont�m as Fichas de Lan�amento Utilizadas no Per�odo
      { Implementado a crit�rio do Participante do T2Ti ERP }

      (* TODO
      // REGISTRO I155: DETALHE DOS SALDOS PERI�DICOS
      with RegistroI155.New do
      begin
        for i := 0 to ListaPlanoConta.Count - 1 do
        begin
          // Saldo Anterior
          FiltroLocal := 'MES_ANO=' + QuotedStr(PeriodoAnterior(FormatDateTime('MM/YYYY', TextoParaData(DataInicial)))) + ' and TIPO=' + QuotedStr('C');
          RegistroI155C := GetQuery(FiltroLocal).AsObject<TViewSpedI155VO>(FiltroLocal, False);
          if Assigned(RegistroI155C) then
            Credito := RegistroI155C.SomaValor
          else
            Credito := 0;

          FiltroLocal := 'MES_ANO=' + QuotedStr(PeriodoAnterior(FormatDateTime('MM/YYYY', TextoParaData(DataInicial)))) + ' and TIPO=' + QuotedStr('D');
          RegistroI155D := GetQuery(FiltroLocal).AsObject<TViewSpedI155VO>(FiltroLocal, False);
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
          RegistroI155C := GetQuery(FiltroLocal).AsObject<TViewSpedI155VO>(FiltroLocal, False);
          if Assigned(RegistroI155C) then
            Credito := RegistroI155C.SomaValor
          else
            Credito := 0;

          FiltroLocal := 'MES_ANO=' + QuotedStr(FormatDateTime('MM/YYYY', TextoParaData(DataInicial))) + ' and TIPO=' + QuotedStr('D');
          RegistroI155D := GetQuery(FiltroLocal).AsObject<TViewSpedI155VO>(FiltroLocal, False);
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

          // REGISTRO I157: TRANSFER�NCIA DE SALDOS DE PLANO DE CONTAS ANTERIOR
          { Implementado a crit�rio do Participante do T2Ti ERP }
        end;
      end;
      *)
    end;

    // REGISTRO I200: LAN�AMENTO CONT�BIL
    (*
    FiltroLocal := 'ID_EMPRESA=1' + ' and (DATA_LANCAMENTO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')';
    ListaLancamentoCabecalho := GetQuery(FiltroLocal).AsObjectList<TContabilLancamentoCabecalhoVO>;
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

          // REGISTRO I250: PARTIDAS DO LAN�AMENTO
          ListaLancamentoDetalhe := GetQuery(FiltroLocal).AsObjectList<TContabilLancamentoDetalheVO>('ID_CONTABIL_LANCAMENTO_CAB=' + NUM_LCTO, '-1', True);
          if assigned(ListaLancamentoDetalhe) then
          begin
            for j := 0 to ListaLancamentoDetalhe.Count - 1 do
            begin
              with RegistroI250.New do
              begin
                ContaContabil := GetQuery(FiltroLocal).AsObject<TContabilContaVO>('ID=' + IntToStr(TContabilLancamentoDetalheVO(ListaLancamentoDetalhe.Items[j]).IdContabilConta), False);

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
    *)
    // REGISTRO I300: BALANCETES DI�RIOS � IDENTIFICA��O DA DATA
    // REGISTRO I310: DETALHES DO BALANCETE DI�RIO
    { Implementados a crit�rio do Participante do T2Ti ERP }

    // REGISTRO I350: SALDOS DAS CONTAS DE RESULTADO ANTES DO ENCERRAMENTO � IDENTIFICA��O DA DATA
    // REGISTRO I355: DETALHES DOS SALDOS DAS CONTAS DE RESULTADO ANTES DO ENCERRAMENTO
    { Implementados a crit�rio do Participante do T2Ti ERP }

    // REGISTRO I500: PAR�METROS DE IMPRESS�O E VISUALIZA��O DO LIVRO RAZ�O AUXILIAR COM LEIAUTE PARAMETRIZ�VEL
    // REGISTRO I510: DEFINI��O DE CAMPOS DO LIVRO RAZ�O AUXILIAR COM LEIAUTE PARAMETRIZ�VEL
    // REGISTRO I550: DETALHES DO LIVRO AUXILIAR COM LEIAUTE PARAMETRIZ�VEL
    // REGISTRO I555: TOTAIS NO LIVRO AUXILIAR COM LEIAUTE PARAMETRIZ�VEL
    { Implementados a crit�rio do Participante do T2Ti ERP }
  end;
end;
{$ENDREGION}

{$REGION 'Bloco J - Demonstra��es Cont�beis'}
class procedure TSpedContabilService.GerarBlocoJ;
var
  i: Integer;
  (* TODO
  ContabilLivro: TContabilLivro;
  TermoLivro: TContabilTermo;
  RegistroCartorio: TRegistroCartorio;
  ListaDreDetalhe: TObjectList<TContabilDreDetalheVO>;
  *)
  Contador: TContador;
begin
  FDataModule.ACBrSpedContabil.Bloco_J.LimpaRegistros;

  with FDataModule.ACBrSpedContabil.Bloco_J do
  begin
    // REGISTRO J001: ABERTURA DO BLOCO J
    RegistroJ001.IND_DAD := 0;

    // REGISTRO J005: DEMONSTRA��ES CONT�BEIS
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO J100: BALAN�O PATRIMONIAL
    { Implementado a crit�rio do Participante do T2Ti ERP }

    //REGISTRO J150: DEMONSTRA��O DO RESULTADO DO EXERC�CIO
    { Implementado a crit�rio do Participante do T2Ti ERP }
    (* TODO
    ListaDreDetalhe := GetQuery(FiltroLocal).AsObjectList<TContabilDreDetalheVO>('ID>0', '-1', False);
    if assigned(ListaDreDetalhe) then
    begin
      for i := 0 to ListaDreDetalhe.Count - 1 do
      begin
      end;
    end;
    *)

    // REGISTRO J200: TABELA DE HIST�RICO DE FATOS CONT�BEIS QUE MODIFICAM A CONTA LUCROS ACUMULADOS OU A CONTA PREJU�ZOS ACUMULADOS OU TODO O PATRIM�NIO L�QUIDO
    // REGISTRO J210: DLPA � DEMONSTRA��O DE LUCROS OU PREJU�ZOS ACUMULADOS/DMPL � DEMONSTRA��O DE MUTA��ES DO PATRIM�NIO L�QUIDO
    // REGISTRO J215: FATO CONT�BIL QUE ALTERA A CONTA LUCROS ACUMULADOS OU A CONTA PREJU�ZOS ACUMULADOS OU TODO O PATRIM�NIO L�QUIDO
    { Implementados a crit�rio do Participante do T2Ti ERP }

    // REGISTRO J310: DEMONSTRA��O DO FLUXO DE CAIXA
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO J410: DEMONSTRA��O DO VALOR ADICIONADO
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO J800: OUTRAS INFORMA��ES
    { Implementado a crit�rio do Participante do T2Ti ERP }

    // REGISTRO J900: TERMO DE ENCERRAMENTO
    (* TODO
    ContabilLivro := GetQuery(FiltroLocal).AsObject<TContabilLivroVO>('FORMA_ESCRITURACAO = ' + QuotedStr(EscrituracaoForma) +  ' and COMPETENCIA=' + QuotedStr(FormatDateTime('MM/YYYY', TextoParaData(DataInicial))), False);
    if Assigned(ContabilLivro) then
    begin
      TermoLivro := GetQuery(FiltroLocal).AsObject<TContabilTermoVO>('ID_CONTABIL_LIVRO=' + IntToStr(ContabilLivro.Id) + ' and ABERTURA_ENCERRAMENTO=' + QuotedStr('E'), False);
      RegistroCartorio := GetQuery(FiltroLocal).AsObject<TRegistroCartorioVO>('ID_EMPRESA=1', False);

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
    *)

    // REGISTRO J930: IDENTIFICA��O DOS SIGNAT�RIOS DA ESCRITURA��O
    Contador := TContadorService.ConsultarObjeto(1);
    with RegistroJ930.New do
    begin
      IDENT_NOM := 'Contador.Nome';
      IDENT_CPF := 'Contador.Cpf';
      IDENT_QUALIF := 'Contador';
      COD_ASSIN := '900';
      IND_CRC := Contador.CrcInscricao;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Gerar Arquivo'}
class function TSpedContabilService.GerarArquivoSpedContabil: Boolean;
begin
  Result := False;
  try
    try
      with FDataModule.ACBrSpedContabil do
      begin
        DT_INI := TextoParaData(DataInicial);
        DT_FIN := TextoParaData(DataFinal);
      end;

	    GerarBloco0;
  	  GerarBlocoI;
	    GerarBlocoJ;

      Arquivo := 'SpedContabil' + FormatDateTime('DDMMYYYYhhmmss', Now) + '.txt';

      FDataModule.ACBrSPEDContabil.Path := 'C:\T2Ti\Sped\ECD\';
      FDataModule.ACBrSPEDContabil.Arquivo := Arquivo;
      FDataModule.ACBrSpedContabil.SaveFileTXT;

      Arquivo := FDataModule.ACBrSPEDContabil.Path + Arquivo;

      Result := True;
    except
      Result := False;
    end;
  finally
    FreeAndNil(Empresa);
  end;
end;
{$ENDREGION}

{$ENDREGION}


end.
