{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SOCIO_PARTICIPACAO_SOCIETARIA] 
                                                                                
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
unit SocioParticipacaoSocietariaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TSocioParticipacaoSocietariaVO = class(TVO)
  private
    FID: Integer;
    FID_SOCIO: Integer;
    FCNPJ: String;
    FRAZAO_SOCIAL: String;
    FDATA_ENTRADA: TDateTime;
    FDATA_SAIDA: TDateTime;
    FPARTICIPACAO: Extended;
    FDIRIGENTE: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdSocio: Integer  read FID_SOCIO write FID_SOCIO;
    property Cnpj: String  read FCNPJ write FCNPJ;
    property RazaoSocial: String  read FRAZAO_SOCIAL write FRAZAO_SOCIAL;
    property DataEntrada: TDateTime  read FDATA_ENTRADA write FDATA_ENTRADA;
    property DataSaida: TDateTime  read FDATA_SAIDA write FDATA_SAIDA;
    property Participacao: Extended  read FPARTICIPACAO write FPARTICIPACAO;
    property Dirigente: String  read FDIRIGENTE write FDIRIGENTE;


    //Transientes



  end;

  TListaSocioParticipacaoSocietariaVO = specialize TFPGObjectList<TSocioParticipacaoSocietariaVO>;

implementation


initialization
  Classes.RegisterClass(TSocioParticipacaoSocietariaVO);

finalization
  Classes.UnRegisterClass(TSocioParticipacaoSocietariaVO);

end.
