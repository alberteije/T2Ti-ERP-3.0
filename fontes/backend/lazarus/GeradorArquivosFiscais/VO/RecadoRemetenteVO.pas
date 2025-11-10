{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [RECADO_REMETENTE] 
                                                                                
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
unit RecadoRemetenteVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  RecadoDestinatarioVO;

type
  TRecadoRemetenteVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDATA_ENVIO: TDateTime;
    FHORA_ENVIO: String;
    FASSUNTO: String;
    FTEXTO: String;

    //Transientes
    FRecadoDestinatarioVO: TRecadoDestinatarioVO;



  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property DataEnvio: TDateTime  read FDATA_ENVIO write FDATA_ENVIO;
    property HoraEnvio: String  read FHORA_ENVIO write FHORA_ENVIO;
    property Assunto: String  read FASSUNTO write FASSUNTO;
    property Texto: String  read FTEXTO write FTEXTO;


    //Transientes
    property RecadoDestinatarioVO: TRecadoDestinatarioVO read FRecadoDestinatarioVO write FRecadoDestinatarioVO;



  end;

  TListaRecadoRemetenteVO = specialize TFPGObjectList<TRecadoRemetenteVO>;

implementation

constructor TRecadoRemetenteVO.Create;
begin
  inherited;

  FRecadoDestinatarioVO := TRecadoDestinatarioVO.Create;
end;

destructor TRecadoRemetenteVO.Destroy;
begin
  FreeAndNil(FRecadoDestinatarioVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TRecadoRemetenteVO);

finalization
  Classes.UnRegisterClass(TRecadoRemetenteVO);

end.
