{$notes off}
{$WARNINGS OFF}
unit SpedFiscalController;

{$mode objfpc}{$H+}

interface

uses
  Classes, Dialogs, SysUtils, LCLIntf, LCLType, Forms, Controller,
  Biblioteca, ACBrEFDBlocos, Constantes;

type

  { TSpedFiscalController }

  TSpedFiscalController = class(TController)
  private
    class procedure GerarBloco0; // BLOCO 0: ABERTURA, IDENTIFICAÇÃO E REFERÊNCIAS
    class procedure GerarBlocoC; // BLOCO C: DOCUMENTOS FISCAIS I - MERCADORIAS (ICMS/IPI)
    class procedure GerarBlocoE; // BLOCO E: APURAÇÃO DO ICMS E DO IPI
    class procedure GerarBlocoH; // BLOCO H: INVENTÁRIO FÍSICO
    class procedure GerarBloco1; // BLOCO 1: OUTRAS INFORMAÇÕES
    class function GerarArquivoSpedFiscal: Boolean;
  protected
  public
    class function GerarSpedFiscal(pFiltro: String): String;
  end;

implementation

uses
  T2TiORM, UDataModule, EmpresaController,
  // VOs
  EmpresaVO, ContadorVO, UnidadeProdutoVO, ProdutoVO,
  NfeCupomFiscalReferenciadoVO,
  FiscalApuracaoIcmsVO, ProdutoAlteracaoItemVO,
  ViewSpedNfeEmitenteVO, ViewSpedNfeDestinatarioVO, ViewSpedNfeItemVO, UnidadeConversaoVO,
  TributOperacaoFiscalVO, NfeTransporteVO, ViewSpedNfeDetalheVO, ViewSpedC190VO,
  NfeCabecalhoVO;

{ TSpedFiscalController }

var
  Empresa: TEmpresaVO;
  VersaoLeiaute, FinalidadeArquivo, PerfilApresentacao, IdEmpresa, IdContador, Inventario: Integer;
  DataInicial, DataFinal, Arquivo, FiltroLocal: String;

class function TSpedFiscalController.GerarSpedFiscal(pFiltro: String): String;
var
  ConteudoFiltro: TStringList;
begin
  ConteudoFiltro := TStringList.Create;
  try
    Split('|', pFiltro, ConteudoFiltro);
    {
      0 - Periodo Inicial
      1 - Periodo Final
      2 - Versao Leiaute
      3 - Finalidade Arquivo
      4 - Perfil
      5 - IdEmpresa
      6 - Inventario
      7 - IdContador
      }
    DataInicial := ConteudoFiltro[0];
    DataFinal := ConteudoFiltro[1];
    VersaoLeiaute := StrToInt(ConteudoFiltro[2]);
    FinalidadeArquivo := StrToInt(ConteudoFiltro[3]);
    PerfilApresentacao := StrToInt(ConteudoFiltro[4]);
    IdEmpresa := StrToInt(ConteudoFiltro[5]);
    Inventario := StrToInt(ConteudoFiltro[6]);
    IdContador := StrToInt(ConteudoFiltro[7]);

    GerarArquivoSpedFiscal;

    Result := Arquivo;

  finally
    FreeAndNil(ConteudoFiltro);
  end;
end;


class procedure TSpedFiscalController.GerarBloco0;
var
  Contador: TContadorVO;
  ListaProduto: TListaViewSpedNfeItemVO;
  ListaEmitente: TListaViewSpedNfeEmitenteVO;
  ListaDestinatario: TListaViewSpedNfeDestinatarioVO;
  ListaUnidade: TListaUnidadeProdutoVO;
  ListaProdutoAlterado: TListaProdutoAlteracaoItemVO;
  ListaOperacaoFiscal: TListaTributOperacaoFiscalVO;
  UnidadeConversao: TUnidadeConversaoVO;
  UnidadeProduto: TUnidadeProdutoVO;
  ListaParticipante: TStringList;
  ListaSiglaUnidade: TStringList;
  i: Integer;
begin
  try
    Empresa := TEmpresaController.ConsultaObjeto('ID=' + IntToStr(IdEmpresa));
    Contador := TContadorVO(TT2TiORM.ConsultarUmObjeto(TContadorVO.Create, 'ID=' + IntToStr(IdContador)));
    ListaEmitente := TListaViewSpedNfeEmitenteVO(TT2TiORM.ConsultarLista(TViewSpedNfeEmitenteVO.Create, 'ID in (select ID_FORNECEDOR from NFE_CABECALHO where DATA_HORA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')'));
    ListaDestinatario := TListaViewSpedNfeDestinatarioVO(TT2TiORM.ConsultarLista(TViewSpedNfeDestinatarioVO.Create, 'ID in (select ID_CLIENTE from NFE_CABECALHO where DATA_HORA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')'));
    ListaProduto := TListaViewSpedNfeItemVO(TT2TiORM.ConsultarLista(TViewSpedNfeItemVO.Create, 'ID in (select ID_PRODUTO from NFE_DETALHE JOIN NFE_CABECALHO ON NFE_DETALHE.ID_NFE_CABECALHO = NFE_CABECALHO.ID' +
                                                           ' where NFE_CABECALHO.DATA_HORA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')'));
    ListaProdutoAlterado := TListaProdutoAlteracaoItemVO(TT2TiORM.ConsultarLista(TProdutoAlteracaoItemVO.Create, 'DATA_INICIAL BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
    ListaOperacaoFiscal := TListaTributOperacaoFiscalVO(TT2TiORM.ConsultarLista(TTributOperacaoFiscalVO.Create, 'ID>0'));


    with FDataModule.ACBrSpedFiscal.Bloco_0 do
    begin
      // REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICAÇÃO DA ENTIDADE
      with Registro0000New do
      begin
        COD_VER := TACBrVersaoLeiaute(VersaoLeiaute);
        COD_FIN := TACBrCodFinalidade(FinalidadeArquivo);
        DT_INI := TextoParaData(DataInicial);
        DT_FIN := TextoParaData(DataFinal);
        IND_PERFIL := TACBrPerfil(PerfilApresentacao);
        NOME := Empresa.RazaoSocial;
        CNPJ := Empresa.CNPJ;
        CPF := '';
        UF := Empresa.EnderecoPrincipal.Uf;
        IE := Empresa.InscricaoEstadual;
        COD_MUN := Empresa.CodigoIbgeCidade;
        IM := Empresa.InscricaoMunicipal;
        SUFRAMA := Empresa.SUFRAMA;
        IND_ATIV := atOutros;
      end;

      // REGISTRO 0001: ABERTURA DO BLOCO 0
      with Registro0001New do
      begin
        IND_MOV := imComDados;

        // REGISTRO 0005: DADOS COMPLEMENTARES DA ENTIDADE
        with Registro0005New do
        begin
          FANTASIA := Empresa.NomeFantasia;
          CEP := Empresa.EnderecoPrincipal.Cep;
          ENDERECO := Empresa.EnderecoPrincipal.Logradouro;
          NUM := Empresa.EnderecoPrincipal.Numero;
          COMPL := Empresa.EnderecoPrincipal.Complemento;
          BAIRRO := Empresa.EnderecoPrincipal.Bairro;
          FONE := Empresa.EnderecoPrincipal.Fone;
          FAX := Empresa.EnderecoPrincipal.Fone;
          EMAIL := Empresa.Email;
        end; // with Registro0005New do

        // REGISTRO 0015: DADOS DO CONTRIBUINTE SUBSTITUTO
        { Implementado a critério do Participante do T2Ti ERP }

        // REGISTRO 0100: DADOS DO CONTABILISTA
        with Registro0100New do
        begin
          NOME := Contador.Nome;
          CPF := Contador.Cpf;
          CRC := Contador.InscricaoCrc;
          CNPJ := Contador.Cnpj;
          CEP := Contador.CEP;
          ENDERECO := Contador.Logradouro;
          NUM := Contador.Numero;
          COMPL := Contador.Complemento;
          BAIRRO := Contador.BAIRRO;
          FONE := Contador.FONE;
          FAX := Contador.FAX;
          EMAIL := Contador.EMAIL;
          COD_MUN := Contador.MunicipioIbge;
        end; // with Registro0100New do

        // REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE
        ListaParticipante := TStringList.Create;
        if assigned(ListaEmitente) then
        begin
          for i := 0 to ListaEmitente.Count - 1 do
          begin
            with Registro0150New do
            begin
              COD_PART := 'F' + IntToStr(TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).Id);
              NOME := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).Nome;
              COD_PAIS := '01058';
              if Length(TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).CpfCnpj) = 11 then
                CPF := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).CpfCnpj
              else
                CNPJ := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).CpfCnpj;
              IE := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).InscricaoEstadual;
              COD_MUN := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).CodigoMunicipio;
              SUFRAMA := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).Suframa.ToString;
              ENDERECO := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).Logradouro;
              NUM := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).Numero;
              COMPL := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).Complemento;
              BAIRRO := TViewSpedNfeEmitenteVO(ListaEmitente.Items[i]).Bairro;
              //
              ListaParticipante.Add(COD_PART);
            end; // with Registro0150New do
          end; // for I := 0 to ListaEmitente.Count - 1 do
        end; // if assigned(ListaEmitente) then

        if assigned(ListaDestinatario) then
        begin
          for i := 0 to ListaDestinatario.Count - 1 do
          begin
            if ListaParticipante.IndexOf(TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).CpfCnpj) = -1 then
            begin
              with Registro0150New do
              begin
                COD_PART := 'C' + IntToStr(TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).Id);
                NOME := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).Nome;
                COD_PAIS := '01058';
                if Length(TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).CpfCnpj) = 11 then
                  CPF := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).CpfCnpj
                else
                  CNPJ := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).CpfCnpj;
                IE := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).InscricaoEstadual;
                COD_MUN := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).CodigoMunicipio;
                SUFRAMA := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).Suframa.ToString;
                ENDERECO := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).Logradouro;
                NUM := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).Numero;
                COMPL := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).Complemento;
                BAIRRO := TViewSpedNfeDestinatarioVO(ListaDestinatario.Items[i]).Bairro;
              end; // with Registro0150New do
            end;
          end; // for I := 0 to ListaDestinatario.Count - 1 do
        end; // if assigned(ListaDestinatario) then

        // REGISTRO 0175: ALTERAÇÃO DA TABELA DE CADASTRO DE PARTICIPANTE
        { Implementado a critério do Participante do T2Ti ERP }

        //REGISTRO 0200: TABELA DE IDENTIFICAÇÃO DO ITEM (PRODUTO E SERVIÇOS)
        ListaSiglaUnidade := TStringList.Create;
        ListaUnidade := TListaUnidadeProdutoVO.Create;
        for i := 0 to ListaProduto.Count - 1 do
        begin
          with Registro0200New do
          begin
            COD_ITEM := IntToStr(TViewSpedNfeItemVO(ListaProduto.Items[i]).Id);
            DESCR_ITEM := TViewSpedNfeItemVO(ListaProduto.Items[i]).NOME;
            COD_BARRA := TViewSpedNfeItemVO(ListaProduto.Items[i]).GTIN;
            COD_ANT_ITEM := '';
            UNID_INV := IntToStr(TViewSpedNfeItemVO(ListaProduto.Items[i]).IdUnidadeProduto);
            TIPO_ITEM := TACBrTipoItem(StrToInt(TViewSpedNfeItemVO(ListaProduto.Items[i]).TipoItemSped));
            COD_NCM := TViewSpedNfeItemVO(ListaProduto.Items[i]).NCM;
            EX_IPI := TViewSpedNfeItemVO(ListaProduto.Items[i]).ExTipi;
            COD_GEN := Copy(TViewSpedNfeItemVO(ListaProduto.Items[i]).NCM, 1, 2);
            COD_LST := TViewSpedNfeItemVO(ListaProduto.Items[i]).CodigoLst;
            ALIQ_ICMS := TViewSpedNfeItemVO(ListaProduto.Items[i]).AliquotaIcmsPaf;

            if ListaSiglaUnidade.IndexOf(IntToStr(TViewSpedNfeItemVO(ListaProduto.Items[i]).IdUnidadeProduto)) = -1 then
            begin
              ListaSiglaUnidade.Add(IntToStr(TViewSpedNfeItemVO(ListaProduto.Items[i]).IdUnidadeProduto));
              UnidadeProduto := TUnidadeProdutoVO.Create;
              UnidadeProduto.Id := TViewSpedNfeItemVO(ListaProduto.Items[i]).IdUnidadeProduto;
              UnidadeProduto.Sigla := TViewSpedNfeItemVO(ListaProduto.Items[i]).Sigla;
              ListaUnidade.Add(UnidadeProduto);

              // REGISTRO 0220: FATORES DE CONVERSÃO DE UNIDADES
              UnidadeConversao := TUnidadeConversaoVO(TT2TiORM.ConsultarUmObjeto(TUnidadeConversaoVO.Create, 'ID_PRODUTO=' + IntToStr(TViewSpedNfeItemVO(ListaProduto.Items[i]).Id) + ' and ID_UNIDADE_PRODUTO=' + IntToStr(UnidadeProduto.Id)));
              if Assigned(UnidadeConversao) then
              begin
                with Registro0220New do
                begin
                  UNID_CONV := IntToStr(UnidadeConversao.IdUnidadeProduto);
                  FAT_CONV := UnidadeConversao.FatorConversao;
                end; // with Registro0200New do
                FreeAndNil(UnidadeConversao);
              end; // if Assigned(UnidadeConversao) then
            end; // if ListaSiglaUnidade.IndexOf(IntToStr(TViewSpedNfeItemVO(ListaProduto.Items[i]).IdUnidadeProduto)) = -1 then
          end; // with Registro0200New do
        end; // for i := 0 to ListaProduto.Count - 1 do

        // REGISTRO 0190: IDENTIFICAÇÃO DAS UNIDADES DE MEDIDA
        for i := 0 to ListaUnidade.Count - 1 do
        begin
          with Registro0190New do
          begin
            UNID := IntToStr(TUnidadeProdutoVO(ListaUnidade.Items[i]).Id);
            DESCR := TUnidadeProdutoVO(ListaUnidade.Items[i]).Sigla;
          end;
        end;

        // REGISTRO 0205: ALTERAÇÃO DO ITEM
        for i := 0 to ListaProdutoAlterado.Count - 1 do
        begin
          with Registro0205New do
          begin
            DESCR_ANT_ITEM := TProdutoAlteracaoItemVO(ListaProdutoAlterado.Items[i]).Nome;
            DT_INI := TProdutoAlteracaoItemVO(ListaProdutoAlterado.Items[i]).DataInicial;
            DT_FIN := TProdutoAlteracaoItemVO(ListaProdutoAlterado.Items[i]).DataFinal;
            COD_ANT_ITEM  := TProdutoAlteracaoItemVO(ListaProdutoAlterado.Items[i]).Codigo;
          end; // with Registro0205New do
        end; // for i := 0 to ListaProdutoAlterado.Count - 1 do

        // REGISTRO 0206: CÓDIGO DE PRODUTO CONFORME TABELA PUBLICADA PELA ANP (COMBUSTÍVEIS)
        { Implementado a critério do Participante do T2Ti ERP }

        // REGISTRO 0210: CONSUMO ESPECÍFICO PADRONIZADO
        { Implementado a critério do Participante do T2Ti ERP }

        // REGISTRO 0300: CADASTRO DE BENS OU COMPONENTES DO ATIVO IMOBILIZADO
        // REGISTRO 0305: INFORMAÇÃO SOBRE A UTILIZAÇÃO DO BEM
        { Implementado a critério do Participante do T2Ti ERP }

        // REGISTRO 0400: TABELA DE NATUREZA DA OPERAÇÃO/PRESTAÇÃO
        for i := 0 to ListaOperacaoFiscal.Count - 1 do
        begin
          with Registro0400New do
          begin
            COD_NAT := IntToStr(TTributOperacaoFiscalVO(ListaOperacaoFiscal.Items[i]).Id);
            DESCR_NAT := TTributOperacaoFiscalVO(ListaOperacaoFiscal.Items[i]).DescricaoNaNf;
          end; // with Registro0400New do
        end; // for i := 0 to ListaOperacaoFiscal.Count - 1 do

        // REGISTRO 0450: TABELA DE INFORMAÇÃO COMPLEMENTAR DO DOCUMENTO FISCAL
        { Implementado a critério do Participante do T2Ti ERP }

        // REGISTRO 0460: TABELA DE OBSERVAÇÕES DO LANÇAMENTO FISCAL
        { Implementado a critério do Participante do T2Ti ERP }

        // REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS
        { Implementado a critério do Participante do T2Ti ERP }

        // REGISTRO 0600: CENTRO DE CUSTOS
        { Implementado a critério do Participante do T2Ti ERP }

      end; // with Registro0001New do
    end; // if (not Assigned(ListaUnidade)) or (not Assigned(ListaProduto))then
  finally
    FreeAndNil(Contador);
    FreeAndNil(ListaProduto);
    FreeAndNil(ListaEmitente);
    FreeAndNil(ListaDestinatario);
    FreeAndNil(ListaUnidade);
    FreeAndNil(ListaProdutoAlterado);
    FreeAndNil(ListaOperacaoFiscal);
    FreeAndNil(ListaParticipante);
    FreeAndNil(ListaSiglaUnidade);
  end;
end;

class procedure TSpedFiscalController.GerarBlocoC;
var
  NfeTransporte: TNfeTransporteVO;
  ListaNFeCabecalho: TListaNfeCabecalhoVO;
  ListaNFeDetalhe: TListaViewSpedNfeDetalheVO;
  ListaNFeAnalitico: TListaViewSpedC190VO;
  ListaCupomNFe: TListaNfeCupomFiscalReferenciadoVO;
  Produto: TProdutoVO;
  i, j, k, l, m, g: Integer;
  //ListaImpressora: TListaEcfImpressoraVO;
  //ListaNF2Cabecalho: TListaEcfNotaFiscalCabecalhoVO;
  //ListaNF2CabecalhoCanceladas: TListaEcfNotaFiscalCabecalhoVO;
  //ListaC300: TListaViewSpedC300VO;
  //ListaC321: TListaViewSpedC321VO;
  //ListaC370: TListaViewSpedC370VO;
  //ListaC390: TListaViewSpedC390VO;
  //ListaC425: TListaViewSpedC425VO;
  //ListaC490: TListaViewSpedC490VO;
  //ListaR02: TListaEcfR02VO;
  //ListaR03: TListaEcfR03VO;
  //ListaR04: TListaEcfVendaCabecalhoVO;
  //ListaR05: TListaEcfVendaDetalheVO;
  //
  //EcfNotaFiscalCabecalho: TEcfNotaFiscalCabecalhoVO;
begin
  try
    with FDataModule.ACBrSpedFiscal.Bloco_C do
    begin
      // REGISTRO C001: ABERTURA DO BLOCO C
      with RegistroC001New do
      begin
        IND_MOV := imComDados;

        //ListaNF2Cabecalho := TListaEcfNotaFiscalCabecalhoVO(TT2TiORM.ConsultarLista(TEcfNotaFiscalCabecalhoVO.Create, 'DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
        //ListaNF2CabecalhoCanceladas := TListaEcfNotaFiscalCabecalhoVO(TT2TiORM.ConsultarLista(TEcfNotaFiscalCabecalhoVO.Create, 'CANCELADA = ' + QuotedStr('S') + ' and DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
        ListaNFeCabecalho := TListaNfeCabecalhoVO(TT2TiORM.ConsultarLista(TNfeCabecalhoVO.Create, 'DATA_HORA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));

        { Perfil A }
        if PerfilApresentacao = 0 then
        begin
          if assigned(ListaNFeCabecalho) then
          begin
            for i := 0 to ListaNFeCabecalho.Count - 1 do
            begin
              // REGISTRO C100: NOTA FISCAL (CÓDIGO 01), NOTA FISCAL AVULSA (CÓDIGO 1B), NOTA FISCAL DE PRODUTOR (CÓDIGO 04), NF-e (CÓDIGO 55) e NFC-e (CÓDIGO 65)
              with RegistroC100New do
              begin
                IND_OPER := TACBrTipoOperacao(TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).TipoOperacao);
                IND_EMIT := edEmissaoPropria;
                if TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).IdCliente > 0 then
                  COD_PART := 'C' + IntToStr(TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).IdCliente)
                else
                  COD_PART := 'F' + IntToStr(TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).IdFornecedor);
                COD_MOD := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).CodigoModelo;

                (*
                  4.1.2- Tabela Situação do Documento
                  Código Descrição
                  00 Documento regular
                  01 Documento regular extemporâneo
                  02 Documento cancelado
                  03 Documento cancelado extemporâneo
                  04 NFe denegada
                  05 Nfe – Numeração inutilizada
                  06 Documento Fiscal Complementar
                  07 Documento Fiscal Complementar extemporâneo.
                  08 Documento Fiscal emitido com base em Regime Especial ou Norma Específica
                *)
                if TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).StatusNota = 0 then
                  COD_SIT := sdRegular
                else
                  COD_SIT := sdCancelado;
                SER := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Serie;
                NUM_DOC := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Numero;
                CHV_NFE := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ChaveAcesso;
                DT_DOC := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).DataHoraEmissao;
                DT_E_S := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).DataHoraEntradaSaida;
                VL_DOC := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorTotal;
                IND_PGTO := TACBrTipoPagamento(TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).IndicadorFormaPagamento);
                VL_DESC := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorDesconto;
                VL_ABAT_NT := 0;
                VL_MERC := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorTotalProdutos;
                //
                NfeTransporte := TNfeTransporteVO(TT2TiORM.ConsultarUmObjeto(TNfeTransporteVO.Create, 'ID_NFE_CABECALHO=' + IntToStr(TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Id)));

                if Assigned(NfeTransporte) then
                begin
                  IND_FRT := TACBrTipoFrete(NfeTransporte.ModalidadeFrete);
                  FreeAndNil(NfeTransporte);
                end;

                VL_FRT := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorFrete;
                VL_SEG := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorSeguro;
                VL_OUT_DA := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorDespesasAcessorias;
                VL_BC_ICMS := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).BaseCalculoIcms;
                VL_ICMS := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorIcms;
                VL_BC_ICMS_ST := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).BaseCalculoIcmsSt;
                VL_ICMS_ST := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorIcmsSt;
                VL_IPI := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorIpi;
                VL_PIS := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorPis;
                VL_COFINS := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorCofins;
                VL_PIS_ST := 0;
                VL_COFINS_ST := 0;

                // REGISTRO C105: OPERAÇÕES COM ICMS ST RECOLHIDO PARA UF DIVERSA DO DESTINATÁRIO DO DOCUMENTO FISCAL (CÓDIGO 55).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C110: INFORMAÇÃO COMPLEMENTAR DA NOTA FISCAL (CÓDIGO 01, 1B, 04 e 55).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C111: PROCESSO REFERENCIADO
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C112: DOCUMENTO DE ARRECADAÇÃO REFERENCIADO.
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C113: DOCUMENTO FISCAL REFERENCIADO.
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C114: CUPOM FISCAL REFERENCIADO
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C115: LOCAL DA COLETA E/OU ENTREGA (CÓDIGO 01, 1B E 04).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C116: CUPOM FISCAL ELETRÔNICO REFERENCIADO
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C120: COMPLEMENTO DE DOCUMENTO - OPERAÇÕES DE IMPORTAÇÃO (CÓDIGOS 01 e 55).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C130: ISSQN, IRRF E PREVIDÊNCIA SOCIAL.
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C140: FATURA (CÓDIGO 01)
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C141: VENCIMENTO DA FATURA (CÓDIGO 01).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C160: VOLUMES TRANSPORTADOS (CÓDIGO 01 E 04) - EXCETO COMBUSTÍVEIS.
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C165: OPERAÇÕES COM COMBUSTÍVEIS (CÓDIGO 01).
                { Implementado a critério do Participante do T2Ti ERP }

                try
                  // REGISTRO C170: ITENS DO DOCUMENTO (CÓDIGO 01, 1B, 04 e 55).
                  ListaNFeDetalhe := TListaViewSpedNfeDetalheVO(TT2TiORM.ConsultarLista(TViewSpedNfeDetalheVO.Create, 'ID_NFE_CABECALHO=' + IntToStr(TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Id)));
                  if assigned(ListaNFeDetalhe) then
                  begin
                    for j := 0 to ListaNFeDetalhe.Count - 1 do
                    begin
                      with RegistroC170New do
                      begin
                        NUM_ITEM := IntToStr(TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).NumeroItem);
                        COD_ITEM := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).Gtin;
                        DESCR_COMPL := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).NomeProduto;
                        QTD := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).QuantidadeComercial;
                        UNID := IntToStr(TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).IdUnidadeProduto);
                        VL_ITEM := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorTotal;
                        VL_DESC := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorDesconto;
                        IND_MOV := mfSim;
                        CST_ICMS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).CstIcms;
                        CFOP := IntToStr(TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).Cfop);
                        COD_NAT := IntToStr(TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).IdTributOperacaoFiscal);
                        VL_BC_ICMS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).BaseCalculoIcms;
                        ALIQ_ICMS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaIcms;
                        VL_ICMS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorIcms;
                        VL_BC_ICMS_ST := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorBaseCalculoIcmsSt;
                        ALIQ_ST := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaIcmsSt;
                        VL_ICMS_ST := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorIcmsSt;
                        IND_APUR := iaMensal;
                        CST_IPI := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).CstIpi;
                        COD_ENQ := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).EnquadramentoIpi;
                        VL_BC_IPI := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorBaseCalculoIpi;
                        ALIQ_IPI := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaIpi;
                        VL_IPI := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorIpi;
                        CST_PIS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).CstPis;
                        VL_BC_PIS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorBaseCalculoPis;
                        ALIQ_PIS_PERC := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaPisPercentual;
                        QUANT_BC_PIS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).QuantidadeVendidaPis;
                        ALIQ_PIS_R := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaPisReais;
                        VL_PIS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorPis;
                        CST_COFINS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).CstCofins;
                        VL_BC_COFINS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).BaseCalculoCofins;
                        ALIQ_COFINS_PERC := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaCofinsPercentual;
                        QUANT_BC_COFINS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).QuantidadeVendidaCofins;
                        ALIQ_COFINS_R := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaCofinsReais;
                        VL_COFINS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorCofins;
                        COD_CTA := '';
                      end; // with RegistroC170New do
                    end; // for j := 0 to ListaNFeDetalhe.Count - 1 do
                  end; // if Assigned(ListaNFeDetalhe) then
                finally
                  FreeAndNil(ListaNFeDetalhe);
                end;

                // REGISTRO C171: ARMAZENAMENTO DE COMBUSTIVEIS (código 01, 55).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C172: OPERAÇÕES COM ISSQN (CÓDIGO 01)
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C173: OPERAÇÕES COM MEDICAMENTOS (CÓDIGO 01 e 55).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C174: OPERAÇÕES COM ARMAS DE FOGO (CÓDIGO 01).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C175: OPERAÇÕES COM VEÍCULOS NOVOS (CÓDIGO 01 e 55).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C176: RESSARCIMENTO DE ICMS EM OPERAÇÕES COM SUBSTITUIÇÃO TRIBUTÁRIA (CÓDIGO 01, 55).
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C177: OPERAÇÕES COM PRODUTOS SUJEITOS A SELO DE CONTROLE IPI.
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C178: OPERAÇÕES COM PRODUTOS SUJEITOS À TRIBUTAÇÀO DE IPI POR UNIDADE OU QUANTIDADE DE PRODUTO.
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C179: INFORMAÇÕES COMPLEMENTARES ST (CÓDIGO 01).
                { Implementado a critério do Participante do T2Ti ERP }

                try
                  // REGISTRO C190: REGISTRO ANALÍTICO DO DOCUMENTO (CÓDIGO 01, 1B, 04 ,55 e 65).
                  ListaNFeAnalitico := TListaViewSpedC190VO(TT2TiORM.ConsultarLista(TViewSpedC190VO.Create, 'ID=' + IntToStr(TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Id)));
                  if assigned(ListaNFeAnalitico) then
                  begin
                    for j := 0 to ListaNFeAnalitico.Count - 1 do
                    begin
                      with RegistroC190New do
                      begin
                        CST_ICMS := TViewSpedC190VO(ListaNFeAnalitico.Items[j]).CstIcms;
                        CFOP := IntToStr(TViewSpedC190VO(ListaNFeAnalitico.Items[j]).CFOP);
                        ALIQ_ICMS := TViewSpedC190VO(ListaNFeAnalitico.Items[j]).AliquotaICMS;
                        VL_OPR := TViewSpedC190VO(ListaNFeAnalitico.Items[j]).SomaValorOperacao;
                        VL_BC_ICMS := TViewSpedC190VO(ListaNFeAnalitico.Items[j]).SomaBaseCalculoIcms;
                        VL_ICMS := TViewSpedC190VO(ListaNFeAnalitico.Items[j]).SomaValorIcms;
                        VL_BC_ICMS_ST := TViewSpedC190VO(ListaNFeAnalitico.Items[j]).SomaBaseCalculoIcmsSt;
                        VL_ICMS_ST := TViewSpedC190VO(ListaNFeAnalitico.Items[j]).SomaValorIcmsSt;
                        VL_RED_BC := TViewSpedC190VO(ListaNFeAnalitico.Items[j]).SomaVlRedBc;
                        VL_IPI := TViewSpedC190VO(ListaNFeAnalitico.Items[j]).SomaValorIpi;
                        COD_OBS := '';
                      end; // with RegistroC190New do
                    end; // for j := 0 to ListaNFeAnalitico.Count - 1 do
                  end; // if Assigned(ListaNFeAnalitico) then
                finally
                  FreeAndNil(ListaNFeAnalitico);
                end;
                // REGISTRO C195: OBSERVAÇOES DO LANÇAMENTO FISCAL (CÓDIGO 01, 1B E 55)
                { Implementado a critério do Participante do T2Ti ERP }

                // REGISTRO C197: OUTRAS OBRIGAÇÕES TRIBUTÁRIAS, AJUSTES E INFORMAÇÕES DE VALORES PROVENIENTES DE DOCUMENTO FISCAL.
                { Implementado a critério do Participante do T2Ti ERP }

              end; // with RegistroC100New do
            end; // for i := 0 to ListaNFeCabecalho.Count - 1 do
          end; // if Assigned(ListaNFeCabecalho) then

          //if assigned(ListaNF2Cabecalho) then
          //begin
          //  for i := 0 to ListaNF2Cabecalho.Count - 1 do
          //  begin
          //    // REGISTRO C350: NOTA FISCAL DE VENDA A CONSUMIDOR (CÓDIGO 02)
          //    with RegistroC350New do
          //    begin
          //      SER := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).Serie;
          //      SUB_SER := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).SubSerie;
          //      NUM_DOC := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).Numero;
          //      DT_DOC := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).DataEmissao;
          //      CNPJ_CPF := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).CpfCnpjCliente;
          //      VL_MERC := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).TotalProdutos;
          //      VL_DOC := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).TotalNF;
          //      VL_DESC := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).Desconto;
          //      VL_PIS := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).PIS;
          //      VL_COFINS := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).COFINS;
          //      COD_CTA := '';
          //
          //      try
          //        // REGISTRO C370: ITENS DO DOCUMENTO (CÓDIGO 02)
          //        ListaC370 := TListaViewSpedC370VO(TT2TiORM.ConsultarLista(TViewSpedC370VO.Create, 'DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
          //        if assigned(ListaC370) then
          //        begin
          //          for j := 0 to ListaC370.Count - 1 do
          //          begin
          //            with RegistroC370New do
          //            begin
          //              NUM_ITEM := IntToStr(TViewSpedC370VO(ListaC370.Items[j]).Item);
          //              COD_ITEM := IntToStr(TViewSpedC370VO(ListaC370.Items[j]).IdProduto);
          //              QTD := TViewSpedC370VO(ListaC370.Items[j]).Quantidade;
          //              UNID := IntToStr(TViewSpedC370VO(ListaC370.Items[j]).IdUnidadeProduto);
          //              VL_ITEM := TViewSpedC370VO(ListaC370.Items[j]).ValorTotal;
          //              VL_DESC := TViewSpedC370VO(ListaC370.Items[j]).Desconto;
          //            end; // with RegistroC370New do
          //          end; // for j := 0 to ListaNF2Detalhe.Count - 1 do
          //        end; // if Assigned(ListaNF2Detalhe) then
          //        // end;//with RegistroC350New do
          //      finally
          //        FreeAndNil(ListaC370);
          //      end;
          //
          //      try
          //        // REGISTRO C390: REGISTRO ANALÍTICO DAS NOTAS FISCAIS DE VENDA A CONSUMIDOR (CÓDIGO 02)
          //        ListaC390 := TListaViewSpedC390VO(TT2TiORM.ConsultarLista(TViewSpedC390VO.Create, 'DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
          //        if assigned(ListaC390) then
          //        begin
          //          for l := 0 to ListaC390.Count - 1 do
          //          begin
          //            with RegistroC390New do
          //            begin
          //              CST_ICMS := TViewSpedC390VO(ListaC390.Items[l]).CST;
          //              CFOP := IntToStr(TViewSpedC390VO(ListaC390.Items[l]).CFOP);
          //              ALIQ_ICMS := TViewSpedC390VO(ListaC390.Items[l]).TaxaICMS;
          //              VL_OPR := TViewSpedC390VO(ListaC390.Items[l]).SomaItem;
          //              VL_BC_ICMS := TViewSpedC390VO(ListaC390.Items[l]).SomaBaseICMS;
          //              VL_ICMS := TViewSpedC390VO(ListaC390.Items[l]).SomaICMS;
          //              VL_RED_BC := TViewSpedC390VO(ListaC390.Items[l]).SomaICMSOutras;
          //            end; // with RegistroC390New do
          //          end; // for i := 0 to ListaC390.Count - 1 do
          //        end; // if Assigned(ListaC390) then
          //      finally
          //        FreeAndNil(ListaC390);
          //      end;
          //
          //    end; // with RegistroC350New do
          //  end; // for i := 0 to ListaNF2Cabecalho.Count - 1 do
          //end; // if Assigned(ListaNF2Cabecalho) then

        end; // if PerfilApresentacao = 0 then (Perfil A)


        { Perfil B }
        if PerfilApresentacao = 1 then
        begin
          // REGISTRO C300: RESUMO DIÁRIO DAS NOTAS FISCAIS DE VENDA A CONSUMIDOR (CÓDIGO 02)
          //ListaC300 := TListaViewSpedC300VO(TT2TiORM.ConsultarLista(TViewSpedC300VO.Create, 'DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
          //if assigned(ListaC300) then
          //begin
          //  for i := 0 to ListaC300.Count - 1 do
          //  begin
          //    with RegistroC300New do
          //    begin
          //      COD_MOD := '2';
          //      SER := TViewSpedC300VO(ListaC300.Items[i]).Serie;
          //      SUB := TViewSpedC300VO(ListaC300.Items[i]).Subserie;
          //
          //      FiltroLocal := 'SERIE = ' + QuotedStr(SER) + ' and SUBSERIE = ' + QuotedStr(SUB) + ' and (DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')';
          //
          //      EcfNotaFiscalCabecalho := TEcfNotaFiscalCabecalhoVO(TT2TiORM.ConsultarUmObjeto(TEcfNotaFiscalCabecalhoVO.Create, 'ID=' + IntToStr(TT2TiORM.SelectMin('ECF_NOTA_FISCAL_CABECALHO', FiltroLocal))));
          //      if Assigned(EcfNotaFiscalCabecalho) then
          //      begin
          //        NUM_DOC_INI := EcfNotaFiscalCabecalho.Numero;
          //        FreeAndNil(EcfNotaFiscalCabecalho);
          //      end;
          //
          //      EcfNotaFiscalCabecalho := TEcfNotaFiscalCabecalhoVO(TT2TiORM.ConsultarUmObjeto(TEcfNotaFiscalCabecalhoVO.Create, 'ID=' + IntToStr(TT2TiORM.SelectMax('ECF_NOTA_FISCAL_CABECALHO', FiltroLocal))));
          //      if Assigned(EcfNotaFiscalCabecalho) then
          //      begin
          //        NUM_DOC_FIN := EcfNotaFiscalCabecalho.Numero;
          //        FreeAndNil(EcfNotaFiscalCabecalho);
          //      end;
          //
          //      DT_DOC := TViewSpedC300VO(ListaC300.Items[i]).DataEmissao;
          //      VL_DOC := TViewSpedC300VO(ListaC300.Items[i]).SomaTotalNf;
          //      VL_PIS := TViewSpedC300VO(ListaC300.Items[i]).SomaPis;
          //      VL_COFINS := TViewSpedC300VO(ListaC300.Items[i]).SomaCofins;
          //    end; // with RegistroC300New do
          //  end; // for i := 0 to ListaC300.Count - 1 do
          //end; // if assigned(ListaC300) then
          //
          //// REGISTRO C310: DOCUMENTOS CANCELADOS DE NOTAS FISCAIS DE VENDA A CONSUMIDOR (CÓDIGO 02).
          //if assigned(ListaNF2CabecalhoCanceladas) then
          //begin
          //  for i := 0 to ListaNF2CabecalhoCanceladas.Count - 1 do
          //  begin
          //    with RegistroC310New do
          //    begin
          //      NUM_DOC_CANC := TEcfNotaFiscalCabecalhoVO(ListaNF2CabecalhoCanceladas.Items[i]).Numero;
          //    end; // with RegistroC310New do
          //  end; // for i := 0 to ListaNF2CabecalhoCanceladas.Count - 1 do
          //end; // if Assigned(ListaNF2CabecalhoCanceladas) then
          //
          //// REGISTRO C320: REGISTRO ANALÍTICO DO RESUMO DIÁRIO DAS NOTAS FISCAIS DE VENDA A CONSUMIDOR (CÓDIGO 02). ---> igual ao C390
          //ListaC390 := TListaViewSpedC390VO(TT2TiORM.ConsultarLista(TViewSpedC390VO.Create, 'DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
          //if assigned(ListaC390) then
          //begin
          //  for i := 0 to ListaC390.Count - 1 do
          //  begin
          //    with RegistroC320New do
          //    begin
          //      CST_ICMS := TViewSpedC390VO(ListaC390.Items[i]).CST;
          //      CFOP := IntToStr(TViewSpedC390VO(ListaC390.Items[i]).CFOP);
          //      ALIQ_ICMS := TViewSpedC390VO(ListaC390.Items[i]).TaxaICMS;
          //      VL_OPR := TViewSpedC390VO(ListaC390.Items[i]).SomaItem;
          //      VL_BC_ICMS := TViewSpedC390VO(ListaC390.Items[i]).SomaBaseICMS;
          //      VL_ICMS := TViewSpedC390VO(ListaC390.Items[i]).SomaICMS;
          //      VL_RED_BC := TViewSpedC390VO(ListaC390.Items[i]).SomaICMSOutras;
          //    end; // with RegistroC320New do
          //  end; // for i := 0 to ListaC390.Count - 1 do
          //end; // if Assigned(ListaC390) then
          //
          //// REGISTRO C321: ITENS DO RESUMO DIÁRIO DOS DOCUMENTOS (CÓDIGO 02).
          //ListaC321 := TListaViewSpedC321VO(TT2TiORM.ConsultarLista(TViewSpedC321VO.Create, 'DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
          //if assigned(ListaC321) then
          //begin
          //  for i := 0 to ListaC321.Count - 1 do
          //  begin
          //    with RegistroC321New do
          //    begin
          //      COD_ITEM := IntToStr(TViewSpedC321VO(ListaC321.Items[i]).IdProduto);
          //      QTD := TViewSpedC321VO(ListaC321.Items[i]).SomaQuantidade;
          //      UNID := TViewSpedC321VO(ListaC321.Items[i]).DescricaoUnidade;
          //      VL_ITEM := TViewSpedC321VO(ListaC321.Items[i]).SomaItem;
          //      VL_DESC := TViewSpedC321VO(ListaC321.Items[i]).SomaDesconto;
          //      VL_BC_ICMS := TViewSpedC321VO(ListaC321.Items[i]).SomaBaseICMS;
          //      VL_ICMS := TViewSpedC321VO(ListaC321.Items[i]).SomaICMS;
          //      VL_PIS := TViewSpedC321VO(ListaC321.Items[i]).SomaPIS;
          //      VL_COFINS := TViewSpedC321VO(ListaC321.Items[i]).SomaCOFINS;
          //    end; // with RegistroC321New do
          //  end; // for i := 0 to ListaC321.Count - 1 do
          //end; // if Assigned(ListaC321) then

        end; // if PerfilApresentacao = 1 then (Perfil B)

        { Ambos os Perfis - Equipamentos ECF }
        //ListaImpressora := TListaEcfImpressoraVO(TT2TiORM.ConsultarLista(TEcfImpressoraVO.Create, 'ID>0'));
        //if assigned(ListaImpressora) then
        //begin
        //  for i := 0 to ListaImpressora.Count - 1 do
        //  begin
        //    // REGISTRO C400: EQUIPAMENTO ECF (CÓDIGO 02, 2D e 60).
        //    with RegistroC400New do
        //    begin
        //      COD_MOD := TEcfImpressoraVO(ListaImpressora.Items[i]).ModeloDocumentoFiscal;
        //      ECF_MOD := TEcfImpressoraVO(ListaImpressora.Items[i]).Modelo;
        //      ECF_FAB := TEcfImpressoraVO(ListaImpressora.Items[i]).Serie;
        //      ECF_CX := IntToStr(TEcfImpressoraVO(ListaImpressora.Items[i]).Numero);
        //
        //      try
        //        // verifica se existe movimento no periodo para aquele ECF
        //        FiltroLocal := 'ID_ECF_IMPRESSORA='+IntToStr(TEcfImpressoraVO(ListaImpressora.Items[i]).Id) + ' and (DATA_MOVIMENTO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')';
        //        ListaR02 := TListaEcfR02VO(TT2TiORM.ConsultarLista(TEcfR02VO.Create, FiltroLocal));
        //        if assigned(ListaR02) then
        //        begin
        //          for j := 0 to ListaR02.Count - 1 do
        //          begin
        //            // REGISTRO C405: REDUÇÃO Z (CÓDIGO 02, 2D e 60).
        //            with RegistroC405New do
        //            begin
        //              DT_DOC := TEcfR02VO(ListaR02.Items[j]).DataMovimento;
        //              CRO := TEcfR02VO(ListaR02.Items[j]).CRO;
        //              CRZ := TEcfR02VO(ListaR02.Items[j]).CRZ;
        //              NUM_COO_FIN := TEcfR02VO(ListaR02.Items[j]).COO;
        //              GT_FIN := TEcfR02VO(ListaR02.Items[j]).GrandeTotal;
        //              VL_BRT := TEcfR02VO(ListaR02.Items[j]).VendaBruta;
        //
        //              // REGISTRO C410: PIS E COFINS TOTALIZADOS NO DIA (CÓDIGO 02 e 2D).
        //              { Implementado a critério do Participante do T2Ti ERP }
        //
        //              try
        //                ListaR03 := TListaEcfR03VO(TT2TiORM.ConsultarLista(TEcfR03VO.Create, 'ID_ECF_R02=' + IntToStr(TEcfR02VO(ListaR02.Items[j]).Id)));
        //                if assigned(ListaR03) then
        //                begin
        //                  for k := 0 to ListaR03.Count - 1 do
        //                  begin
        //                    // REGISTRO C420: REGISTRO DOS TOTALIZADORES PARCIAIS DA REDUÇÃO Z (COD 02, 2D e 60).
        //                    with RegistroC420New do
        //                    begin
        //                      if length(TEcfR03VO(ListaR03.Items[k]).TotalizadorParcial) = 8 then //T01T1700
        //                        COD_TOT_PAR := Copy(TEcfR03VO(ListaR03.Items[k]).TotalizadorParcial, 2, length(TEcfR03VO(ListaR03.Items[k]).TotalizadorParcial))
        //                      else
        //                        COD_TOT_PAR := TEcfR03VO(ListaR03.Items[k]).TotalizadorParcial;
        //                      VLR_ACUM_TOT := TEcfR03VO(ListaR03.Items[k]).ValorAcumulado;
        //                      if length(trim(COD_TOT_PAR)) = 7 then
        //                        NR_TOT := StrToInt(Copy(COD_TOT_PAR, 1, 2))
        //                      else
        //                        NR_TOT := 0;
        //                    end; // with RegistroC420New do
        //
        //                    if PerfilApresentacao = 1 then
        //                    begin
        //                      try
        //                        // REGISTRO C425: RESUMO DE ITENS DO MOVIMENTO DIÁRIO (CÓDIGO 02 e 2D).
        //                        FiltroLocal := 'TOTALIZADOR_PARCIAL not like ' + QuotedStr('%CAN%') + 'and TOTALIZADOR_PARCIAL not like ' + QuotedStr('%S%') + ' and (DATA_VENDA BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal) + ')';
        //                        ListaC425 := TListaViewSpedC425VO(TT2TiORM.ConsultarLista(TViewSpedC425VO.Create, FiltroLocal));
        //                        if assigned(ListaC425) then
        //                        begin
        //                          for l := 0 to ListaC425.Count - 1 do
        //                          begin
        //                            with RegistroC425New do
        //                            begin
        //                              COD_ITEM := IntToStr(TViewSpedC425VO(ListaC425.Items[l]).IdEcfProduto);
        //                              UNID := TViewSpedC425VO(ListaC425.Items[l]).DescricaoUnidade;
        //                              QTD := TViewSpedC425VO(ListaC425.Items[l]).SomaQuantidade;
        //                              VL_ITEM := TViewSpedC425VO(ListaC425.Items[l]).SomaItem;
        //                              VL_PIS := TViewSpedC425VO(ListaC425.Items[l]).SomaPIS;
        //                              VL_COFINS := TViewSpedC425VO(ListaC425.Items[l]).SomaCOFINS;
        //                            end; // with RegistroC425New do
        //                          end; // for l := 0 to ListaC425.Count - 1 do
        //                        end; // if Assigned(ListaC425) then
        //                      finally
        //                        FreeAndNil(ListaC425);
        //                      end;
        //                    end; // if PerfilApresentacao = 1 then
        //                  end; // for k := 0 to ListaR03.Count - 1 do
        //                end; // if Assigned(ListaR03) then
        //
        //              finally
        //                FreeAndNil(ListaR03);
        //              end;
        //
        //              // se tiver o perfil A, gera o C460 com C470
        //              if PerfilApresentacao = 0 then
        //              begin
        //                try
        //                  ListaR04 := TListaEcfVendaCabecalhoVO(TT2TiORM.ConsultarLista(TEcfVendaCabecalhoVO.Create, 'DATA_VENDA BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
        //                  if assigned(ListaR04) then
        //                  begin
        //                    for l := 0 to ListaR04.Count - 1 do
        //                    begin
        //                      // REGISTRO C460: DOCUMENTO FISCAL EMITIDO POR ECF (CÓDIGO 02, 2D e 60).
        //                      with RegistroC460New do
        //                      begin
        //                        COD_MOD := '2D';
        //                        if TEcfVendaCabecalhoVO(ListaR04.Items[l]).StatusVenda = 'C' then
        //                          COD_SIT := sdCancelado
        //                        else
        //                          COD_SIT := sdRegular;
        //
        //                        if COD_SIT = sdRegular then
        //                        begin
        //                          DT_DOC := TEcfVendaCabecalhoVO(ListaR04.Items[l]).DataVenda;
        //                          VL_DOC := TEcfVendaCabecalhoVO(ListaR04.Items[l]).ValorFinal;
        //                          VL_PIS := TEcfVendaCabecalhoVO(ListaR04.Items[l]).PIS;
        //                          VL_COFINS := TEcfVendaCabecalhoVO(ListaR04.Items[l]).COFINS;
        //                          CPF_CNPJ := TEcfVendaCabecalhoVO(ListaR04.Items[l]).CpfCnpjCliente;
        //                          NOM_ADQ := TEcfVendaCabecalhoVO(ListaR04.Items[l]).NomeCliente;
        //                        end; // if COD_SIT = sdRegular then
        //
        //                        NUM_DOC := IntToStr(TEcfVendaCabecalhoVO(ListaR04.Items[l]).Coo);
        //
        //                        // REGISTRO C465: COMPLEMENTO DO CUPOM FISCAL ELETRÔNICO EMITIDO POR ECF – CF-e-ECF (CÓDIGO 60).
        //                        { Implementado a critério do Participante do T2Ti ERP }
        //
        //                        if COD_SIT = sdRegular then
        //                        begin
        //                          try
        //                            // REGISTRO C470: ITENS DO DOCUMENTO FISCAL EMITIDO POR ECF (CÓDIGO 02 e 2D).
        //                            ListaR05 := TListaEcfVendaDetalheVO(TT2TiORM.ConsultarLista(TEcfVendaDetalheVO.Create, 'ID_ECF_VENDA_CABECALHO = '+ IntToStr(TEcfVendaCabecalhoVO(ListaR04.Items[l]).Id)));
        //                            if assigned(ListaR05) then
        //                            begin
        //                              for m := 0 to ListaR05.Count - 1 do
        //                              begin
        //                                with RegistroC470New do
        //                                begin
        //                                  COD_MOD := '2D';
        //                                  COD_ITEM := IntToStr(TEcfVendaDetalheVO(ListaR05.Items[m]).IdEcfProduto);
        //                                  QTD := TEcfVendaDetalheVO(ListaR05.Items[m]).Quantidade;
        //                                  Produto := TProdutoVO(TT2TiORM.ConsultarUmObjeto(TProdutoVO.Create, 'ID=' + IntToStr(TEcfVendaDetalheVO(ListaR05.Items[m]).IdEcfProduto)));
        //                                  UNID := IntToStr(Produto.IdUnidade);
        //                                  VL_ITEM := TEcfVendaDetalheVO(ListaR05.Items[m]).TotalItem;
        //                                  CST_ICMS := TEcfVendaDetalheVO(ListaR05.Items[m]).CST;
        //                                  CFOP := IntToStr(TEcfVendaDetalheVO(ListaR05.Items[m]).CFOP);
        //                                  ALIQ_ICMS := TEcfVendaDetalheVO(ListaR05.Items[m]).TaxaIcms;
        //                                  VL_PIS := TEcfVendaDetalheVO(ListaR05.Items[m]).PIS;
        //                                  VL_COFINS := TEcfVendaDetalheVO(ListaR05.Items[m]).COFINS;
        //                                end; // with RegistroC470New do
        //                              end; // for m := 0 to ListaR05.Count - 1 do
        //                            end; // if Assigned(ListaR05) then
        //                          finally
        //                            FreeAndNil(ListaR05);
        //                          end;
        //                        end; // if COD_SIT = sdRegular then
        //                      end; // with RegistroC460New do
        //                    end; // for l := 0 to ListaR04.Count - 1 do
        //                  end; // if Assigned(ListaR04) then
        //
        //                finally
        //                  FreeAndNil(ListaR04);
        //                end;
        //              end; // if PerfilApresentacao = 0 then
        //
        //              try
        //                // REGISTRO C490: REGISTRO ANALÍTICO DO MOVIMENTO DIÁRIO (CÓDIGO 02, 2D e 60).
        //                ListaC490 := TListaViewSpedC490VO(TT2TiORM.ConsultarLista(TViewSpedC490VO.Create, 'DATA_VENDA BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal)));
        //                if assigned(ListaC490) then
        //                begin
        //                  for g := 0 to ListaC490.Count - 1 do
        //                  begin
        //                    with RegistroC490New do
        //                    begin
        //                      CST_ICMS := TViewSpedC490VO(ListaC490.Items[g]).CST;
        //                      CFOP := IntToStr(TViewSpedC490VO(ListaC490.Items[g]).CFOP);
        //                      ALIQ_ICMS := TViewSpedC490VO(ListaC490.Items[g]).TaxaICMS;
        //                      VL_OPR := TViewSpedC490VO(ListaC490.Items[g]).SomaItem;
        //                      VL_BC_ICMS := TViewSpedC490VO(ListaC490.Items[g]).SomaBaseICMS;
        //                      VL_ICMS := TViewSpedC490VO(ListaC490.Items[g]).SomaICMS;
        //                    end; // with RegistroC490New do
        //                  end; // for g := 0 to ListaC490.Count - 1 do
        //                end; // if Assigned(ListaC490) then
        //                // REGISTRO C495: RESUMO MENSAL DE ITENS DO ECF POR ESTABELECIMENTO (CÓDIGO 02 e 2D).
        //                { Implementado a critério do Participante do T2Ti ERP }
        //              finally
        //                FreeAndNil(ListaC490);
        //              end;
        //
        //            end; // with RegistroC405New do
        //          end; // for j := 0 to ListaR02.Count - 1 do
        //        end; // if Assigned(ListaR02) then
        //
        //      finally
        //        FreeAndNil(ListaR02);
        //      end;
        //
        //    end; // with RegistroC400New do
        //  end; // for i := 0 to ListaImpressora.Count - 1 do
        //end; // if Assigned(ListaImpressora) then

        // REGISTRO C500: NOTA FISCAL/CONTA DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL CONSUMO FORNECIMENTO DE GÁS (CÓDIGO 28).
        // REGISTRO C510: ITENS DO DOCUMENTO NOTA FISCAL/CONTA ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE GÁS (CÓDIGO 28).
        // REGISTRO C590: REGISTRO ANALÍTICO DO DOCUMENTO - NOTA FISCAL/CONTA DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL CONSUMO FORNECIMENTO DE GÁS (CÓDIGO 28).
        // REGISTRO C600: CONSOLIDAÇÃO DIÁRIA DE NOTAS FISCAIS/CONTAS DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE GÁS (CÓDIGO 28) (EMPRESAS NÃO OBRIGADAS AO CONVÊNIO ICMS 115/03).
        // REGISTRO C601: DOCUMENTOS CANCELADOS - CONSOLIDAÇÃO DIÁRIA DE NOTAS FISCAIS/CONTAS DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE GÁS (CÓDIGO 28)
        // REGISTRO C610: ITENS DO DOCUMENTO CONSOLIDADO (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE GÁS (CÓDIGO 28) (EMPRESAS NÃO OBRIGADAS AO CONVÊNIO ICMS 115/03).
        // REGISTRO C690: REGISTRO ANALÍTICO DOS DOCUMENTOS (NOTAS FISCAIS/CONTAS DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE GÁS (CÓDIGO 28)
        // REGISTRO C700: CONSOLIDAÇÃO DOS DOCUMENTOS NF/CONTA ENERGIA ELÉTRICA (CÓD 06), EMITIDAS EM VIA ÚNICA (EMPRESAS OBRIGADAS À ENTREGA DO ARQUIVO PREVISTO NO CONVÊNIO ICMS 115/03) E NOTA FISCAL/CONTA DE FORNECIMENTO DE GÁS CANALIZADO (CÓDIGO 28)
        // REGISTRO C790: REGISTRO ANALÍTICO DOS DOCUMENTOS (CÓDIGOS 06 e 28).
        // REGISTRO C791: REGISTRO DE INFORMAÇÕES DE ST POR UF (COD 06)
        { Não Implementados }

        // REGISTRO C800: CUPOM FISCAL ELETRÔNICO (CÓDIGO 59)
        // REGISTRO C850: REGISTRO ANALÍTICO DO CF-E (CODIGO 59)
        // REGISTRO C860: IDENTIFICAÇÃO DO EQUIPAMENTO SAT-CF-E
        // REGISTRO C890: RESUMO DIÁRIO DO CF-E (CÓDIGO 59) POR EQUIPAMENTO SATCF-E
        { Não Implementados }

      end; // with RegistroC001New do
    end; // with FDataModule.ACBrSpedFiscal.Bloco_C do
  finally
    //FreeAndNil(ListaImpressora);
    //FreeAndNil(ListaNF2Cabecalho);
    //FreeAndNil(ListaNF2CabecalhoCanceladas);
    FreeAndNil(ListaNFeCabecalho);
    FreeAndNil(ListaNFeDetalhe);
    FreeAndNil(ListaNFeAnalitico);
    FreeAndNil(ListaCupomNFe);
    //FreeAndNil(ListaC300);
    //FreeAndNil(ListaC321);
    //FreeAndNil(ListaC390);
  end;
end;

class procedure TSpedFiscalController.GerarBlocoE;
var
  i: Integer;
  ApuracaoIcms: TFiscalApuracaoIcmsVO;
begin
  try
    with FDataModule.ACBrSpedFiscal.Bloco_E do
    begin
      // REGISTRO E001: ABERTURA DO BLOCO E
      with RegistroE001New do
      begin
        IND_MOV := imComDados;

        // REGISTRO E100: PERÍODO DA APURAÇÃO DO ICMS.
        with RegistroE100New do
        begin
          DT_INI := TextoParaData(DataInicial);
          DT_FIN := TextoParaData(DataFinal);
        end;
      end; // with RegistroE100New do

      // REGISTRO E110: APURAÇÃO DO ICMS – OPERAÇÕES PRÓPRIAS.
      ApuracaoIcms := TFiscalApuracaoIcmsVO(TT2TiORM.ConsultarUmObjeto(TFiscalApuracaoIcmsVO.Create, 'COMPETENCIA=' + QuotedStr(FormatDateTime('MM/YYYY', TextoParaData(DataInicial)))));
      if assigned(ApuracaoIcms) then
      begin
        with RegistroE110New do
        begin
          VL_TOT_DEBITOS := ApuracaoIcms.ValorTotalDebito;
          VL_AJ_DEBITOS := ApuracaoIcms.ValorAjusteDebito;
          VL_TOT_AJ_DEBITOS := ApuracaoIcms.ValorTotalAjusteDebito;
          VL_ESTORNOS_CRED := ApuracaoIcms.ValorEstornoCredito;
          VL_TOT_CREDITOS := ApuracaoIcms.ValorTotalCredito;
          VL_AJ_CREDITOS := ApuracaoIcms.ValorAjusteCredito;
          VL_TOT_AJ_CREDITOS := ApuracaoIcms.ValorTotalAjusteCredito;
          VL_ESTORNOS_DEB := ApuracaoIcms.ValorEstornoDebito;
          VL_SLD_CREDOR_ANT := ApuracaoIcms.ValorSaldoCredorAnterior;
          VL_SLD_APURADO := ApuracaoIcms.ValorSaldoApurado;
          VL_TOT_DED := ApuracaoIcms.ValorTotalDeducao;
          VL_ICMS_RECOLHER := ApuracaoIcms.ValorIcmsRecolher;
          VL_SLD_CREDOR_TRANSPORTAR := ApuracaoIcms.ValorSaldoCredorTransp;
          DEB_ESP := ApuracaoIcms.ValorDebitoEspecial;

          with RegistroE116New do
          begin
            COD_OR := '000';
            VL_OR := ApuracaoIcms.ValorIcmsRecolher;
            DT_VCTO := TextoParaData(DataFinal);
            COD_REC := '1';
            NUM_PROC := '';
            IND_PROC := opNenhum;
            PROC := '';
            TXT_COMPL := '';
            MES_REF := '';
          end; // with RegistroE116New do
        end; // with RegistroE110New do
      end; // if Assigned(ListaE110) then
    end; // with FDataModule.ACBrSpedFiscal.Bloco_E do
  finally
    FreeAndNil(ApuracaoIcms);
  end;
end;

class procedure TSpedFiscalController.GerarBlocoH;
var
  ListaProduto: TListaProdutoVO;
  i: Integer;
  TotalGeral: Extended;
begin
  try
    TotalGeral := 0;
    with FDataModule.ACBrSpedFiscal.Bloco_H do
    begin
      // REGISTRO H001: ABERTURA DO BLOCO H
      with RegistroH001New do
      begin
        if Inventario = 0 then
          IND_MOV := imSemDados
        else
          IND_MOV := imComDados;

        ListaProduto := TListaProdutoVO(TT2TiORM.ConsultarLista(TProdutoVO.Create, 'ID > 0'));
        for i := 0 to ListaProduto.Count - 1 do
        begin
          TotalGeral := TotalGeral + ArredondaTruncaValor('A', TProdutoVO(ListaProduto.Items[i]).QuantidadeEstoque * TProdutoVO(ListaProduto.Items[i]).ValorCompra, TConstantes.DECIMAIS_VALOR);
        end;

        // REGISTRO H005: TOTAIS DO INVENTÁRIO
        with RegistroH005New do
        begin
          DT_INV := TextoParaData(DataFinal);
          VL_INV := TotalGeral;
          MOT_INV := TACBrMotivoInventario(Inventario);

          // REGISTRO H010: INVENTÁRIO.
          for i := 0 to ListaProduto.Count - 1 do
          begin
            with RegistroH010New do
            begin
              COD_ITEM := IntToStr(TProdutoVO(ListaProduto.Items[i]).Id);
              UNID := IntToStr(TProdutoVO(ListaProduto.Items[i]).IdUnidadeProduto);
              QTD := TProdutoVO(ListaProduto.Items[i]).QuantidadeEstoque;
              VL_UNIT := TProdutoVO(ListaProduto.Items[i]).ValorCompra;
              VL_ITEM := ArredondaTruncaValor('A', QTD * VL_UNIT, TConstantes.DECIMAIS_VALOR);
              IND_PROP := TACBrPosseItem(0);
            end; // with RegistroH010New do
          end; // for i := 0 to ListaProduto.Count - 1 do

        end; // with RegistroH005New do

        // REGISTRO H020: Informação complementar do Inventário.
        { Implementado a critério do Participante do T2Ti ERP }

      end; //with RegistroH001New do

    end;
  finally
    FreeAndNil(ListaProduto);
  end;
end;

class procedure TSpedFiscalController.GerarBloco1;
var
  i: Integer;
begin
  try
    with FDataModule.ACBrSpedFiscal.Bloco_1 do
    begin
      // REGISTRO 1001: ABERTURA DO BLOCO 1
      with Registro1001New do
      begin
        IND_MOV := imComDados;

        // REGISTRO 1010: OBRIGATORIEDADE DE REGISTROS DO BLOCO 1
        with Registro1010New do
        begin
          IND_EXP := 'N';        //1100
          IND_CCRF := 'N';       //1200
          IND_COMB := 'N';       //1300
          IND_USINA := 'N';      //1390
          IND_VA := 'N';         //1400
          IND_EE := 'N';         //1500
          IND_CART := 'N';       //1600
          IND_FORM := 'N';       //1700
          IND_AER := 'N';        //1800
        end; // with Registro1010New do

        // REGISTRO 1100: REGISTRO DE INFORMAÇÕES SOBRE EXPORTAÇÃO
        { Não Implementado - IND_EXP = 'N' }

        // REGISTRO 1200: CONTROLE DE CRÉDITOS FISCAIS - ICMS
        { Não Implementado - IND_CCRF = 'N' }

        // REGISTRO 1300: CONTROLE DA SUBSTITUIÇÃO TRIBUTÁRIA DO ICMS - OPERAÇÕES PRÓPRIAS
        { Não Implementado - IND_COMB = 'N' }

        // REGISTRO 1390: CONTROLE DE PRODUÇÃO DE AÇÚCAR E ÁLCOOL
        { Não Implementado - IND_USINA = 'N' }

        // REGISTRO 1400: INVENTÁRIO FÍSICO DE PRODUTOS SUJEITOS À TRIBUTAÇÃO IPI (EM ELABORAÇÃO)
        { Não Implementado - IND_VA = 'N' }

        // REGISTRO 1500: CONTROLE DO CRÉDITO DE ICMS DO ATIVO PERMANENTE - CIAP
        { Não Implementado - IND_EE = 'N' }

        // REGISTRO 1600: OPERAÇÕES COM CARTÃO DE CRÉDITO E/OU DÉBITO
        { Não Implementado - IND_CART = 'N' }

        // REGISTRO 1700: DOCUMENTOS FISCAIS UTILIZADOS
        { Não Implementado - IND_FORM = 'N' }

        // REGISTRO 1800: OPERAÇÕES COM TRANSPORTE AÉREO DE CARGA
        { Não Implementado - IND_AER = 'N' }

      end; //with Registro1001New do
    end;
  finally
    // Não há objetos para liberar neste bloco
  end;
end;


class function TSpedFiscalController.GerarArquivoSpedFiscal: Boolean;
begin
  Result := False;

  with FDataModule.ACBrSpedFiscal do
  begin
    DT_INI := TextoParaData(DataInicial);
    DT_FIN := TextoParaData(DataFinal);
  end;

  GerarBloco0;
  GerarBlocoC;
  // BLOCO D: DOCUMENTOS FISCAIS II - SERVIÇOS (ICMS).
  { Implementado a critério do Participante do T2Ti ERP }
  GerarBlocoE;
  // BLOCO G – CONTROLE DO CRÉDITO DE ICMS DO ATIVO PERMANENTE CIAP
  { Implementado a critério do Participante do T2Ti ERP }
  if Inventario > 0 then
    GerarBlocoH;
  GerarBloco1;

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Arquivos\Sped\') then
    ForceDirectories(ExtractFilePath(Application.ExeName) + '\Arquivos\Sped\');

  Arquivo := 'SpedFiscal' + FormatDateTime('DDMMYYYYhhmmss', Now) + '.txt';

  FDataModule.ACBrSpedFiscal.Path := ExtractFilePath(Application.ExeName) + 'Arquivos\Sped\';
  FDataModule.ACBrSpedFiscal.Arquivo := Arquivo;
  FDataModule.ACBrSpedFiscal.SaveFileTXT;

  Arquivo := FDataModule.ACBrSpedFiscal.Path + Arquivo;

  Result := True;
end;

initialization
  Classes.RegisterClass(TSpedFiscalController);

finalization
  Classes.UnRegisterClass(TSpedFiscalController);

end.
{$notes on}
{$WARNINGS ON}
