{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [WMS_RUA] 
                                                                                
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
unit WmsRuaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  WmsEstanteVO;

type
  TWmsRuaVO = class(TVO)
  private
    FID: Integer;
    FCODIGO: String;
    FNOME: String;
    FQUANTIDADE_ESTANTE: Integer;

    //Transientes
    FListaWmsEstanteVO: TListaWmsEstanteVO;



  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property Codigo: String  read FCODIGO write FCODIGO;
    property Nome: String  read FNOME write FNOME;
    property QuantidadeEstante: Integer  read FQUANTIDADE_ESTANTE write FQUANTIDADE_ESTANTE;


    //Transientes
    property ListaWmsEstanteVO: TListaWmsEstanteVO read FListaWmsEstanteVO write FListaWmsEstanteVO;

end;

implementation

constructor TWmsRuaVO.Create;
begin
  inherited;

  FListaWmsEstanteVO := TListaWmsEstanteVO.Create;
end;

destructor TWmsRuaVO.Destroy;
begin
  FreeAndNil(FListaWmsEstanteVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TWmsRuaVO);

finalization
  Classes.UnRegisterClass(TWmsRuaVO);

end.
