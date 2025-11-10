{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PATRIM_BEM] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2016 T2Ti.COM                                          
                                                                                
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
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit PatrimBemVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  SetorVO, PatrimGrupoBemVO, PatrimTipoAquisicaoBemVO, PatrimEstadoConservacaoVO,
  PatrimDocumentoBemVO, PatrimDepreciacaoBemVO, PatrimMovimentacaoBemVO,
  ViewPessoaFornecedorVO, ViewPessoaColaboradorVO;

type
  TPatrimBemVO = class(TVO)
  private
    FID: Integer;
    FID_CENTRO_RESULTADO: Integer;
    FID_PATRIM_TIPO_AQUISICAO_BEM: Integer;
    FID_PATRIM_ESTADO_CONSERVACAO: Integer;
    FID_PATRIM_GRUPO_BEM: Integer;
    FID_SETOR: Integer;
    FID_FORNECEDOR: Integer;
    FID_COLABORADOR: Integer;
    FNUMERO_NB: String;
    FNOME: String;
    FDESCRICAO: String;
    FNUMERO_SERIE: String;
    FDATA_AQUISICAO: TDateTime;
    FDATA_ACEITE: TDateTime;
    FDATA_CADASTRO: TDateTime;
    FDATA_CONTABILIZADO: TDateTime;
    FDATA_VISTORIA: TDateTime;
    FDATA_MARCACAO: TDateTime;
    FDATA_BAIXA: TDateTime;
    FVENCIMENTO_GARANTIA: TDateTime;
    FNUMERO_NOTA_FISCAL: String;
    FCHAVE_NFE: String;
    FVALOR_ORIGINAL: Extended;
    FVALOR_COMPRA: Extended;
    FVALOR_ATUALIZADO: Extended;
    FVALOR_BAIXA: Extended;
    FDEPRECIA: String;
    FMETODO_DEPRECIACAO: String;
    FINICIO_DEPRECIACAO: TDateTime;
    FULTIMA_DEPRECIACAO: TDateTime;
    FTIPO_DEPRECIACAO: String;
    FTAXA_ANUAL_DEPRECIACAO: Extended;
    FTAXA_MENSAL_DEPRECIACAO: Extended;
    FTAXA_DEPRECIACAO_ACELERADA: Extended;
    FTAXA_DEPRECIACAO_INCENTIVADA: Extended;
    FFUNCAO: String;

    //Transientes
    FSetorNome: String;
    FColaboradorPessoaNome: String;
    FFornecedorPessoaNome: String;
    FPatrimGrupoBemNome: String;
    FPatrimTipoAquisicaoBemNome: String;
    FPatrimEstadoConservacaoNome: String;

    FSetorVO: TSetorVO;
    FColaboradorVO: TViewPessoaColaboradorVO;
    FFornecedorVO: TViewPessoaFornecedorVO;
    FPatrimGrupoBemVO: TPatrimGrupoBemVO;
    FPatrimTipoAquisicaoBemVO: TPatrimTipoAquisicaoBemVO;
    FPatrimEstadoConservacaoVO: TPatrimEstadoConservacaoVO;

    FListaPatrimDocumentoBemVO: TListaPatrimDocumentoBemVO;
    FListaPatrimDepreciacaoBemVO: TListaPatrimDepreciacaoBemVO;
    FListaPatrimMovimentacaoBemVO: TListaPatrimMovimentacaoBemVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdCentroResultado: Integer  read FID_CENTRO_RESULTADO write FID_CENTRO_RESULTADO;

    property IdPatrimTipoAquisicaoBem: Integer  read FID_PATRIM_TIPO_AQUISICAO_BEM write FID_PATRIM_TIPO_AQUISICAO_BEM;
    property PatrimTipoAquisicaoBemNome: String read FPatrimTipoAquisicaoBemNome write FPatrimTipoAquisicaoBemNome;

    property IdPatrimEstadoConservacao: Integer  read FID_PATRIM_ESTADO_CONSERVACAO write FID_PATRIM_ESTADO_CONSERVACAO;
    property PatrimEstadoConservacaoNome: String read FPatrimEstadoConservacaoNome write FPatrimEstadoConservacaoNome;

    property IdPatrimGrupoBem: Integer  read FID_PATRIM_GRUPO_BEM write FID_PATRIM_GRUPO_BEM;
    property PatrimGrupoBemNome: String read FPatrimGrupoBemNome write FPatrimGrupoBemNome;

    property IdSetor: Integer  read FID_SETOR write FID_SETOR;
    property SetorNome: String read FSetorNome write FSetorNome;

    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    property FornecedorPessoaNome: String read FFornecedorPessoaNome write FFornecedorPessoaNome;

    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property ColaboradorPessoaNome: String read FColaboradorPessoaNome write FColaboradorPessoaNome;

    property NumeroNb: String  read FNUMERO_NB write FNUMERO_NB;
    property Nome: String  read FNOME write FNOME;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property NumeroSerie: String  read FNUMERO_SERIE write FNUMERO_SERIE;
    property DataAquisicao: TDateTime  read FDATA_AQUISICAO write FDATA_AQUISICAO;
    property DataAceite: TDateTime  read FDATA_ACEITE write FDATA_ACEITE;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property DataContabilizado: TDateTime  read FDATA_CONTABILIZADO write FDATA_CONTABILIZADO;
    property DataVistoria: TDateTime  read FDATA_VISTORIA write FDATA_VISTORIA;
    property DataMarcacao: TDateTime  read FDATA_MARCACAO write FDATA_MARCACAO;
    property DataBaixa: TDateTime  read FDATA_BAIXA write FDATA_BAIXA;
    property VencimentoGarantia: TDateTime  read FVENCIMENTO_GARANTIA write FVENCIMENTO_GARANTIA;
    property NumeroNotaFiscal: String  read FNUMERO_NOTA_FISCAL write FNUMERO_NOTA_FISCAL;
    property ChaveNfe: String  read FCHAVE_NFE write FCHAVE_NFE;
    property ValorOriginal: Extended  read FVALOR_ORIGINAL write FVALOR_ORIGINAL;
    property ValorCompra: Extended  read FVALOR_COMPRA write FVALOR_COMPRA;
    property ValorAtualizado: Extended  read FVALOR_ATUALIZADO write FVALOR_ATUALIZADO;
    property ValorBaixa: Extended  read FVALOR_BAIXA write FVALOR_BAIXA;
    property Deprecia: String  read FDEPRECIA write FDEPRECIA;
    property MetodoDepreciacao: String  read FMETODO_DEPRECIACAO write FMETODO_DEPRECIACAO;
    property InicioDepreciacao: TDateTime  read FINICIO_DEPRECIACAO write FINICIO_DEPRECIACAO;
    property UltimaDepreciacao: TDateTime  read FULTIMA_DEPRECIACAO write FULTIMA_DEPRECIACAO;
    property TipoDepreciacao: String  read FTIPO_DEPRECIACAO write FTIPO_DEPRECIACAO;
    property TaxaAnualDepreciacao: Extended  read FTAXA_ANUAL_DEPRECIACAO write FTAXA_ANUAL_DEPRECIACAO;
    property TaxaMensalDepreciacao: Extended  read FTAXA_MENSAL_DEPRECIACAO write FTAXA_MENSAL_DEPRECIACAO;
    property TaxaDepreciacaoAcelerada: Extended  read FTAXA_DEPRECIACAO_ACELERADA write FTAXA_DEPRECIACAO_ACELERADA;
    property TaxaDepreciacaoIncentivada: Extended  read FTAXA_DEPRECIACAO_INCENTIVADA write FTAXA_DEPRECIACAO_INCENTIVADA;
    property Funcao: String  read FFUNCAO write FFUNCAO;


    //Transientes
    property SetorVO: TSetorVO read FSetorVO write FSetorVO;

    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    property FornecedorVO: TViewPessoaFornecedorVO read FFornecedorVO write FFornecedorVO;

    property PatrimGrupoBemVO: TPatrimGrupoBemVO read FPatrimGrupoBemVO write FPatrimGrupoBemVO;

    property PatrimTipoAquisicaoBemVO: TPatrimTipoAquisicaoBemVO read FPatrimTipoAquisicaoBemVO write FPatrimTipoAquisicaoBemVO;

    property PatrimEstadoConservacaoVO: TPatrimEstadoConservacaoVO read FPatrimEstadoConservacaoVO write FPatrimEstadoConservacaoVO;


    property ListaPatrimDocumentoBemVO: TListaPatrimDocumentoBemVO read FListaPatrimDocumentoBemVO write FListaPatrimDocumentoBemVO;

    property ListaPatrimDepreciacaoBemVO: TListaPatrimDepreciacaoBemVO read FListaPatrimDepreciacaoBemVO write FListaPatrimDepreciacaoBemVO;

    property ListaPatrimMovimentacaoBemVO: TListaPatrimMovimentacaoBemVO read FListaPatrimMovimentacaoBemVO write FListaPatrimMovimentacaoBemVO;



  end;

  TListaPatrimBemVO = specialize TFPGObjectList<TPatrimBemVO>;

implementation

constructor TPatrimBemVO.Create;
begin
  inherited;

  FSetorVO := TSetorVO.Create;
  FColaboradorVO := TViewPessoaColaboradorVO.Create;
  FFornecedorVO := TViewPessoaFornecedorVO.Create;
  FPatrimGrupoBemVO := TPatrimGrupoBemVO.Create;
  FPatrimTipoAquisicaoBemVO := TPatrimTipoAquisicaoBemVO.Create;
  FPatrimEstadoConservacaoVO := TPatrimEstadoConservacaoVO.Create;

  FListaPatrimDocumentoBemVO := TListaPatrimDocumentoBemVO.Create;
  FListaPatrimDepreciacaoBemVO := TListaPatrimDepreciacaoBemVO.Create;
  FListaPatrimMovimentacaoBemVO := TListaPatrimMovimentacaoBemVO.Create;
end;

destructor TPatrimBemVO.Destroy;
begin
  FreeAndNil(FSetorVO);
  FreeAndNil(FColaboradorVO);
  FreeAndNil(FFornecedorVO);
  FreeAndNil(FPatrimGrupoBemVO);
  FreeAndNil(FPatrimTipoAquisicaoBemVO);
  FreeAndNil(FPatrimEstadoConservacaoVO);

  FreeAndNil(FListaPatrimDocumentoBemVO);
  FreeAndNil(FListaPatrimDepreciacaoBemVO);
  FreeAndNil(FListaPatrimMovimentacaoBemVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TPatrimBemVO);

finalization
  Classes.UnRegisterClass(TPatrimBemVO);

end.
