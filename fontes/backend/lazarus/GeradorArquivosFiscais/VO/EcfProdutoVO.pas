{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PRODUTO] do PAF
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
@version 1.0                                                                    
*******************************************************************************}
unit EcfProdutoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  UnidadeProdutoVO;

type
  TEcfProdutoVO = class(TVO)
  private
    FID: Integer;
    FID_UNIDADE_PRODUTO: Integer;
    FGTIN: String;
    FCODIGO_INTERNO: String;
    FNOME: String;
    FDESCRICAO: String;
    FDESCRICAO_PDV: String;
    FVALOR_VENDA: Extended;
    FQUANTIDADE_ESTOQUE: Extended;
    FESTOQUE_MINIMO: Extended;
    FESTOQUE_MAXIMO: Extended;
    FIAT: String;
    FIPPT: String;
    FNCM: String;
    FTIPO_ITEM_SPED: String;
    FTAXA_IPI: Extended;
    FTAXA_ISSQN: Extended;
    FTAXA_PIS: Extended;
    FTAXA_COFINS: Extended;
    FTAXA_ICMS: Extended;
    FCST: String;
    FCSOSN: String;
    FTOTALIZADOR_PARCIAL: String;
    FECF_ICMS_ST: String;
    FCODIGO_BALANCA: Integer;
    FPAF_P_ST: String;
    FLOGSS: String;

    FUnidadeProdutoSigla: String;

    FUnidadeEcfProdutoVO: TUnidadeProdutoVO;

  published
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property Gtin: String  read FGTIN write FGTIN;
    property DescricaoPdv: String  read FDESCRICAO_PDV write FDESCRICAO_PDV;

    property IdUnidadeProduto: Integer  read FID_UNIDADE_PRODUTO write FID_UNIDADE_PRODUTO;
    property UnidadeProdutoSigla: String read FUnidadeProdutoSigla write FUnidadeProdutoSigla;

    property CodigoInterno: String  read FCODIGO_INTERNO write FCODIGO_INTERNO;
    property Nome: String  read FNOME write FNOME;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;

    property ValorVenda: Extended  read FVALOR_VENDA write FVALOR_VENDA;
    property QuantidadeEstoque: Extended  read FQUANTIDADE_ESTOQUE write FQUANTIDADE_ESTOQUE;

    property EstoqueMinimo: Extended  read FESTOQUE_MINIMO write FESTOQUE_MINIMO;
    property EstoqueMaximo: Extended  read FESTOQUE_MAXIMO write FESTOQUE_MAXIMO;

    property Iat: String  read FIAT write FIAT;
    property Ippt: String  read FIPPT write FIPPT;
    property Ncm: String  read FNCM write FNCM;

    property TipoItemSped: String  read FTIPO_ITEM_SPED write FTIPO_ITEM_SPED;

    property AliquotaIpi: Extended  read FTAXA_IPI write FTAXA_IPI;
    property AliquotaIssqn: Extended  read FTAXA_ISSQN write FTAXA_ISSQN;
    property AliquotaPis: Extended  read FTAXA_PIS write FTAXA_PIS;
    property AliquotaCofins: Extended  read FTAXA_COFINS write FTAXA_COFINS;
    property AliquotaICMS: Extended  read FTAXA_ICMS write FTAXA_ICMS;

    property Cst: String  read FCST write FCST;
    property Csosn: String  read FCSOSN write FCSOSN;

    property TotalizadorParcial: String  read FTOTALIZADOR_PARCIAL write FTOTALIZADOR_PARCIAL;

    property EcfIcmsSt: String  read FECF_ICMS_ST write FECF_ICMS_ST;
    property CodigoBalanca: Integer  read FCODIGO_BALANCA write FCODIGO_BALANCA;
    property PafProdutoST: String  read FPAF_P_ST write FPAF_P_ST;
    property HashRegistro: String  read FLOGSS write FLOGSS;

    property UnidadeEcfProdutoVO: TUnidadeProdutoVO read FUnidadeEcfProdutoVO write FUnidadeEcfProdutoVO;

  end;

  TListaEcfProdutoVO = specialize TFPGObjectList<TEcfProdutoVO>;

implementation

destructor TEcfProdutoVO.Destroy;
begin
  FreeAndNil(FUnidadeEcfProdutoVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TEcfProdutoVO);

finalization
  Classes.UnRegisterClass(TEcfProdutoVO);

end.
