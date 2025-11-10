{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CHEQUE] 
                                                                                
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
unit ChequeVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  TalonarioChequeVO;

type
  TChequeVO = class(TVO)
  private
    FID: Integer;
    FID_TALONARIO_CHEQUE: Integer;
    FNUMERO: Integer;
    FSTATUS_CHEQUE: String;
    FDATA_STATUS: TDateTime;

    //Transientes
    FTalonarioChequeTalao: String;

    FTalonarioChequeVO: TTalonarioChequeVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdTalonarioCheque: Integer  read FID_TALONARIO_CHEQUE write FID_TALONARIO_CHEQUE;

    property TalonarioChequeTalao: String read FTalonarioChequeTalao write FTalonarioChequeTalao;

    property Numero: Integer  read FNUMERO write FNUMERO;
    property StatusCheque: String  read FSTATUS_CHEQUE write FSTATUS_CHEQUE;
    property DataStatus: TDateTime  read FDATA_STATUS write FDATA_STATUS;


    //Transientes
    property TalonarioChequeVO: TTalonarioChequeVO read FTalonarioChequeVO write FTalonarioChequeVO;

  end;

  TListaChequeVO = specialize TFPGObjectList<TChequeVO>;

implementation

constructor TChequeVO.Create;
begin
  inherited;

  FTalonarioChequeVO := TTalonarioChequeVO.Create;
end;

destructor TChequeVO.Destroy;
begin
  FreeAndNil(FTalonarioChequeVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TChequeVO);

finalization
  Classes.UnRegisterClass(TChequeVO);

end.
