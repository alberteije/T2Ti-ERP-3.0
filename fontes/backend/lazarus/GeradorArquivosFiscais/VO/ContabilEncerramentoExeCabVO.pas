{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_ENCERRAMENTO_EXE_CAB] 
                                                                                
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
unit ContabilEncerramentoExeCabVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ContabilEncerramentoExeDetVO;

type
  TContabilEncerramentoExeCabVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FDATA_INICIO: TDateTime;
    FDATA_FIM: TDateTime;
    FDATA_INCLUSAO: TDateTime;
    FMOTIVO: String;

    //Transientes
    FListaContabilEncerramentoExeDetVO: TListaContabilEncerramentoExeDetVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    property DataInclusao: TDateTime  read FDATA_INCLUSAO write FDATA_INCLUSAO;
    property Motivo: String  read FMOTIVO write FMOTIVO;


    //Transientes
    property ListaContabilEncerramentoExeDetVO: TListaContabilEncerramentoExeDetVO read FListaContabilEncerramentoExeDetVO write FListaContabilEncerramentoExeDetVO;


  end;

  TListaContabilEncerramentoExeCabVO = specialize TFPGObjectList<TContabilEncerramentoExeCabVO>;

implementation

constructor TContabilEncerramentoExeCabVO.Create;
begin
  inherited;

  FListaContabilEncerramentoExeDetVO := TListaContabilEncerramentoExeDetVO.Create;
end;

destructor TContabilEncerramentoExeCabVO.Destroy;
begin
  FreeAndNil(FListaContabilEncerramentoExeDetVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TContabilEncerramentoExeCabVO);

finalization
  Classes.UnRegisterClass(TContabilEncerramentoExeCabVO);

end.
