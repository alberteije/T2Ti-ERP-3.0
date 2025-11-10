{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMPRA_COTACAO] 
                                                                                
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
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit CompraCotacaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  CompraReqCotacaoDetalheVO, CompraFornecedorCotacaoVO, ViewCompraMapaComparativoVO;

type
  TCompraCotacaoVO = class(TVO)
  private
    FID: Integer;
    FDATA_COTACAO: TDateTime;
    FDESCRICAO: String;
    FSITUACAO: String;

    //Transientes
    FListaCompraReqCotacaoDetalheVO: TListaCompraReqCotacaoDetalheVO;
    FListaCompraFornecedorCotacao: TListaCompraFornecedorCotacaoVO;
    FListaMapaComparativo: TListaViewCompraMapaComparativoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property DataCotacao: TDateTime  read FDATA_COTACAO write FDATA_COTACAO;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property Situacao: String  read FSITUACAO write FSITUACAO;

    //Transientes
    property ListaCompraReqCotacaoDetalheVO: TListaCompraReqCotacaoDetalheVO read FListaCompraReqCotacaoDetalheVO write FListaCompraReqCotacaoDetalheVO;

    property ListaCompraFornecedorCotacao: TListaCompraFornecedorCotacaoVO read FListaCompraFornecedorCotacao write FListaCompraFornecedorCotacao;

    property ListaMapaComparativo: TListaViewCompraMapaComparativoVO read FListaMapaComparativo write FListaMapaComparativo;
  end;

  TListaCompraCotacaoVO = specialize TFPGObjectList<TCompraCotacaoVO>;

implementation

constructor TCompraCotacaoVO.Create;
begin
  inherited;

  FListaCompraReqCotacaoDetalheVO := TListaCompraReqCotacaoDetalheVO.Create;
  FListaCompraFornecedorCotacao := TListaCompraFornecedorCotacaoVO.Create;
  FListaMapaComparativo := TListaViewCompraMapaComparativoVO.Create;
end;

destructor TCompraCotacaoVO.Destroy;
begin
  FreeAndNil(FListaCompraReqCotacaoDetalheVO);
  FreeAndNil(FListaCompraFornecedorCotacao);
  FreeAndNil(FListaMapaComparativo);

  inherited;
end;


initialization
  Classes.RegisterClass(TCompraCotacaoVO);

finalization
  Classes.UnRegisterClass(TCompraCotacaoVO);

end.
