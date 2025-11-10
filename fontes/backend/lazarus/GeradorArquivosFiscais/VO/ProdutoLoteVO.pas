{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PRODUTO_LOTE] 
                                                                                
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
unit ProdutoLoteVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TProdutoLoteVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FCODIGO: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_COMPRA: TDateTime;
    FDATA_FABRICACAO: TDateTime;
    FDATA_VALIDADE: TDateTime;
    FQUANTIDADE: Extended;
    FPRECO_MAXIMO_CONSUMIDOR: Extended;
    FOBSERVACAO: String;

  published 
    property Id: Integer  read FID write FID;
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    property Codigo: String  read FCODIGO write FCODIGO;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property DataCompra: TDateTime  read FDATA_COMPRA write FDATA_COMPRA;
    property DataFabricacao: TDateTime  read FDATA_FABRICACAO write FDATA_FABRICACAO;
    property DataValidade: TDateTime  read FDATA_VALIDADE write FDATA_VALIDADE;
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    property PrecoMaximoConsumidor: Extended  read FPRECO_MAXIMO_CONSUMIDOR write FPRECO_MAXIMO_CONSUMIDOR;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;

  end;

  TListaProdutoLoteVO = specialize TFPGObjectList<TProdutoLoteVO>;

implementation

initialization
  Classes.RegisterClass(TProdutoLoteVO);

finalization
  Classes.UnRegisterClass(TProdutoLoteVO);

end.
