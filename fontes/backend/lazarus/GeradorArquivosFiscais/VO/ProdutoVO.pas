{ *******************************************************************************
Title: T2Ti ERP
Description:  VO  relacionado à tabela [PRODUTO]

The MIT License

Copyright: Copyright (C) 2014 T2Ti.COM

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
t2ti.com@gmail.com</p>

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
******************************************************************************* }
unit ProdutoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  UnidadeProdutoVO, ProdutoSubGrupoVO, AlmoxarifadoVO, TributGrupoTributarioVO,
  ProdutoMarcaVO, TributIcmsCustomCabVO, ProdutoGrupoVO, FichaTecnicaVO;

type

  TProdutoVO = class(TVO)
  private
    FID: Integer;
    FID_TRIBUT_ICMS_CUSTOM_CAB: Integer;
    FID_UNIDADE_PRODUTO: Integer;
    FID_ALMOXARIFADO: Integer;
    FID_GRUPO_TRIBUTARIO: Integer;
    FID_MARCA_PRODUTO: Integer;
    FID_SUBGRUPO: Integer;
    FGTIN: String;
    FCODIGO_INTERNO: String;
    FNCM: String;
    FNOME: String;
    FDESCRICAO: String;
    FDESCRICAO_PDV: String;
    FVALOR_COMPRA: Extended;
    FVALOR_VENDA: Extended;
    FPRECO_VENDA_MINIMO: Extended;
    FPRECO_SUGERIDO: Extended;

    FCUSTO_UNITARIO: Extended;
    FCUSTO_PRODUCAO: Extended;
    FCUSTO_MEDIO_LIQUIDO: Extended;

    FPRECO_LUCRO_ZERO: Extended;
    FPRECO_LUCRO_MINIMO: Extended;
    FPRECO_LUCRO_MAXIMO: Extended;
    FMARKUP: Extended;
    FQUANTIDADE_ESTOQUE: Extended;
    FQUANTIDADE_ESTOQUE_ANTERIOR: Extended;
    FESTOQUE_MINIMO: Extended;
    FESTOQUE_MAXIMO: Extended;
    FESTOQUE_IDEAL: Extended;
    FEXCLUIDO: String;
    FINATIVO: String;
    FDATA_CADASTRO: TDateTime;
    FFOTO_PRODUTO: String;
    FEX_TIPI: String;
    FCODIGO_LST: String;
    FCLASSE_ABC: String;
    FIAT: String;
    FIPPT: String;
    FTIPO_ITEM_SPED: String;
    FPESO: Extended;
    FPORCENTO_COMISSAO: Extended;
    FPONTO_PEDIDO: Extended;
    FLOTE_ECONOMICO_COMPRA: Extended;
    FALIQUOTA_ICMS_PAF: Extended;
    FALIQUOTA_ISSQN_PAF: Extended;
    FTOTALIZADOR_PARCIAL: String;
    FCODIGO_BALANCA: Integer;
    FDATA_ALTERACAO: TDateTime;
    FTIPO: String;
    FSERVICO: String;

    FUnidadeProdutoSigla: String;
    FAlmoxarifadoNome: String;
    FTributIcmsCustomCabDescricao: String;
    FTributGrupoTributarioDescricao: String;
    FProdutoMarcaNome: String;
    FProdutoGrupoNome: String;
    FProdutoSubGrupoNome: String;

    FImagem: String;
    FTipoImagem: String;

    FUnidadeProdutoVO: TUnidadeProdutoVO;
    FAlmoxarifadoVO: TAlmoxarifadoVO;
    FTributIcmsCustomCabVO: TTributIcmsCustomCabVO;
    FGrupoTributarioVO: TTributGrupoTributarioVO;
    FProdutoMarcaVO: TProdutoMarcaVO;
    FProdutoSubGrupoVO: TProdutoSubGrupoVO;

    FListaFichaTecnicaVO: TListaFichaTecnicaVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer read FID write FID;
    property Gtin: String read FGTIN write FGTIN;
    property Nome: String read FNOME write FNOME;

    property IdUnidadeProduto: Integer read FID_UNIDADE_PRODUTO write FID_UNIDADE_PRODUTO;
    property UnidadeProdutoSigla: String read FUnidadeProdutoSigla write FUnidadeProdutoSigla;

    property IdAlmoxarifado: Integer read FID_ALMOXARIFADO write FID_ALMOXARIFADO;
    property AlmoxarifadoNome: String read FAlmoxarifadoNome write FAlmoxarifadoNome;

    property IdTributIcmsCustomCab: Integer read FID_TRIBUT_ICMS_CUSTOM_CAB write FID_TRIBUT_ICMS_CUSTOM_CAB;
    property TributIcmsCustomCabDescricao: String read FTributIcmsCustomCabDescricao write FTributIcmsCustomCabDescricao;

    property IdGrupoTributario: Integer read FID_GRUPO_TRIBUTARIO write FID_GRUPO_TRIBUTARIO;
    property TributGrupoTributarioDescricao: String read FTributGrupoTributarioDescricao write FTributGrupoTributarioDescricao;

    property IdMarcaProduto: Integer read FID_MARCA_PRODUTO write FID_MARCA_PRODUTO;
    property ProdutoMarcaNome: String read FProdutoMarcaNome write FProdutoMarcaNome;

    property IdSubGrupo: Integer read FID_SUBGRUPO write FID_SUBGRUPO;
    property ProdutoGrupoNome: String read FProdutoGrupoNome write FProdutoGrupoNome;
    property ProdutoSubGrupoNome: String read FProdutoSubGrupoNome write FProdutoSubGrupoNome;

    property CodigoInterno: String read FCODIGO_INTERNO write FCODIGO_INTERNO;
    property Ncm: String read FNCM write FNCM;
    property Descricao: String read FDESCRICAO write FDESCRICAO;
    property DescricaoPdv: String read FDESCRICAO_PDV write FDESCRICAO_PDV;
    property ValorCompra: Extended read FVALOR_COMPRA write FVALOR_COMPRA;
    property ValorVenda: Extended read FVALOR_VENDA write FVALOR_VENDA;
    property PrecoVendaMinimo: Extended read FPRECO_VENDA_MINIMO write FPRECO_VENDA_MINIMO;
    property PrecoSugerido: Extended read FPRECO_SUGERIDO write FPRECO_SUGERIDO;

    property CustoUnitario: Extended read FCUSTO_UNITARIO write FCUSTO_UNITARIO;
    property CustoProducao: Extended read FCUSTO_PRODUCAO write FCUSTO_PRODUCAO;

    property CustoMedioLiquido: Extended read FCUSTO_MEDIO_LIQUIDO write FCUSTO_MEDIO_LIQUIDO;
    property PrecoLucroZero: Extended read FPRECO_LUCRO_ZERO write FPRECO_LUCRO_ZERO;
    property PrecoLucroMinimo: Extended read FPRECO_LUCRO_MINIMO write FPRECO_LUCRO_MINIMO;
    property PrecoLucroMaximo: Extended read FPRECO_LUCRO_MAXIMO write FPRECO_LUCRO_MAXIMO;
    property Markup: Extended read FMARKUP write FMARKUP;
    property QuantidadeEstoque: Extended read FQUANTIDADE_ESTOQUE write FQUANTIDADE_ESTOQUE;
    property QuantidadeEstoqueAnterior: Extended read FQUANTIDADE_ESTOQUE_ANTERIOR write FQUANTIDADE_ESTOQUE_ANTERIOR;
    property EstoqueMinimo: Extended read FESTOQUE_MINIMO write FESTOQUE_MINIMO;
    property EstoqueMaximo: Extended read FESTOQUE_MAXIMO write FESTOQUE_MAXIMO;
    property EstoqueIdeal: Extended read FESTOQUE_IDEAL write FESTOQUE_IDEAL;
    property Excluido: String read FEXCLUIDO write FEXCLUIDO;
    property Inativo: String read FINATIVO write FINATIVO;
    property DataCadastro: TDateTime read FDATA_CADASTRO write FDATA_CADASTRO;
    property FotoProduto: String read FFOTO_PRODUTO write FFOTO_PRODUTO;
    property ExTipi: String read FEX_TIPI write FEX_TIPI;
    property CodigoLst: String read FCODIGO_LST write FCODIGO_LST;
    property ClasseAbc: String read FCLASSE_ABC write FCLASSE_ABC;
    property Iat: String read FIAT write FIAT;
    property Ippt: String read FIPPT write FIPPT;
    property TipoItemSped: String read FTIPO_ITEM_SPED write FTIPO_ITEM_SPED;
    property Peso: Extended read FPESO write FPESO;
    property PorcentoComissao: Extended read FPORCENTO_COMISSAO write FPORCENTO_COMISSAO;
    property PontoPedido: Extended read FPONTO_PEDIDO write FPONTO_PEDIDO;
    property LoteEconomicoCompra: Extended read FLOTE_ECONOMICO_COMPRA write FLOTE_ECONOMICO_COMPRA;
    property AliquotaIcmsPaf: Extended read FALIQUOTA_ICMS_PAF write FALIQUOTA_ICMS_PAF;
    property AliquotaIssqnPaf: Extended read FALIQUOTA_ISSQN_PAF write FALIQUOTA_ISSQN_PAF;
    property TotalizadorParcial: String read FTOTALIZADOR_PARCIAL write FTOTALIZADOR_PARCIAL;
    property CodigoBalanca: Integer read FCODIGO_BALANCA write FCODIGO_BALANCA;
    property DataAlteracao: TDateTime read FDATA_ALTERACAO write FDATA_ALTERACAO;
    property Tipo: String read FTIPO write FTIPO;
    property Servico: String read FSERVICO write FSERVICO;

    property Imagem: String read FImagem write FImagem;
    property TipoImagem: String read FTipoImagem write FTipoImagem;

    property ProdutoSubGrupoVO: TProdutoSubGrupoVO read FProdutoSubGrupoVO write FProdutoSubGrupoVO;

    property UnidadeProdutoVO: TUnidadeProdutoVO read FUnidadeProdutoVO write FUnidadeProdutoVO;

    property AlmoxarifadoVO: TAlmoxarifadoVO read FAlmoxarifadoVO write FAlmoxarifadoVO;

    property TributIcmsCustomCabVO: TTributIcmsCustomCabVO read FTributIcmsCustomCabVO write FTributIcmsCustomCabVO;

    property GrupoTributarioVO: TTributGrupoTributarioVO read FGrupoTributarioVO write FGrupoTributarioVO;

    property ProdutoMarcaVO: TProdutoMarcaVO read FProdutoMarcaVO write FProdutoMarcaVO;

    property ListaFichaTecnicaVO: TListaFichaTecnicaVO read FListaFichaTecnicaVO write FListaFichaTecnicaVO;
end;

  TListaProdutoVO = specialize TFPGObjectList<TProdutoVO>;

implementation

constructor TProdutoVO.Create;
begin
  inherited;

  FUnidadeProdutoVO := TUnidadeProdutoVO.Create;
  FAlmoxarifadoVO := TAlmoxarifadoVO.Create;
  FTributIcmsCustomCabVO := TTributIcmsCustomCabVO.Create;
  FGrupoTributarioVO := TTributGrupoTributarioVO.Create;
  FProdutoMarcaVO := TProdutoMarcaVO.Create;
  FProdutoSubGrupoVO := TProdutoSubGrupoVO.Create;

  ListaFichaTecnicaVO := TListaFichaTecnicaVO.Create;
end;

destructor TProdutoVO.Destroy;
begin
  FreeAndNil(FUnidadeProdutoVO);
  FreeAndNil(FAlmoxarifadoVO);
  FreeAndNil(FTributIcmsCustomCabVO);
  FreeAndNil(FGrupoTributarioVO);
  FreeAndNil(FProdutoMarcaVO);
  FreeAndNil(FProdutoSubGrupoVO);

  FreeAndNil(FListaFichaTecnicaVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TProdutoVO);

finalization
  Classes.UnRegisterClass(TProdutoVO);

end.
