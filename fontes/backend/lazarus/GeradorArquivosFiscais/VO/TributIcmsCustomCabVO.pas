{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [TRIBUT_ICMS_CUSTOM_CAB] 
                                                                                
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
unit TributIcmsCustomCabVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL, TributIcmsCustomDetVO;

type
  TTributIcmsCustomCabVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FDESCRICAO: String;
    FORIGEM_MERCADORIA: String;

    FListaTributIcmsCustomDetVO: TListaTributIcmsCustomDetVO; //0:N

  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property OrigemMercadoria: String  read FORIGEM_MERCADORIA write FORIGEM_MERCADORIA;

    property ListaTributIcmsCustomDetVO: TListaTributIcmsCustomDetVO read FListaTributIcmsCustomDetVO write FListaTributIcmsCustomDetVO;

  end;

  TListaTributIcmsCustomCabVO = specialize TFPGObjectList<TTributIcmsCustomCabVO>;

implementation

constructor TTributIcmsCustomCabVO.Create;
begin
  inherited;
  FListaTributIcmsCustomDetVO := TListaTributIcmsCustomDetVO.Create; //0:N
end;

destructor TTributIcmsCustomCabVO.Destroy;
begin
  FreeAndNil(FListaTributIcmsCustomDetVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TTributIcmsCustomCabVO);

finalization
  Classes.UnRegisterClass(TTributIcmsCustomCabVO);

end.
