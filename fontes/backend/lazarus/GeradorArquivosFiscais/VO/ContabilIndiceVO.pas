{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_INDICE] 
                                                                                
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
unit ContabilIndiceVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  IndiceEconomicoVO, ContabilIndiceValorVO;

type
  TContabilIndiceVO = class(TVO)
  private
    FID: Integer;
    FID_INDICE_ECONOMICO: Integer;
    FID_EMPRESA: Integer;
    FPERIODICIDADE: String;
    FDIARIO_A_PARTIR_DE: TDateTime;
    FMENSAL_MES_ANO: String;

    //Transientes
    FIndiceEconomicoSigla: String;
    FIndiceEconomicoVO: TIndiceEconomicoVO;

    FListaContabilIndiceValorVO: TListaContabilIndiceValorVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdIndiceEconomico: Integer  read FID_INDICE_ECONOMICO write FID_INDICE_ECONOMICO;
    property IndiceEconomicoSigla: String read FIndiceEconomicoSigla write FIndiceEconomicoSigla;

    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Periodicidade: String  read FPERIODICIDADE write FPERIODICIDADE;
    property DiarioAPartirDe: TDateTime  read FDIARIO_A_PARTIR_DE write FDIARIO_A_PARTIR_DE;
    property MensalMesAno: String  read FMENSAL_MES_ANO write FMENSAL_MES_ANO;


    //Transientes
    property IndiceEconomicoVO: TIndiceEconomicoVO read FIndiceEconomicoVO write FIndiceEconomicoVO;

    property ListaContabilIndiceValorVO: TListaContabilIndiceValorVO read FListaContabilIndiceValorVO write FListaContabilIndiceValorVO;



  end;

  TListaContabilIndiceVO = specialize TFPGObjectList<TContabilIndiceVO>;

implementation

constructor TContabilIndiceVO.Create;
begin
  inherited;

  FIndiceEconomicoVO := TIndiceEconomicoVO.Create;

  FListaContabilIndiceValorVO := TListaContabilIndiceValorVO.Create;
end;

destructor TContabilIndiceVO.Destroy;
begin
  FreeAndNil(FIndiceEconomicoVO);

  FreeAndNil(FListaContabilIndiceValorVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TContabilIndiceVO);

finalization
  Classes.UnRegisterClass(TContabilIndiceVO);

end.
