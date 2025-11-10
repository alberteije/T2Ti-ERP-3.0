{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [AGENDA_COMPROMISSO] 
                                                                                
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
unit AgendaCompromissoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TAgendaCompromissoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FID_AGENDA_CATEGORIA_COMPROMISSO: Integer;
    FDATA_COMPROMISSO: TDateTime;
    FHORA: TDateTime;
    FDURACAO: TDateTime;
    FONDE: String;
    FDESCRICAO: String;
    FTIPO: Integer;
    FKEYFIELD: String;

    //Transientes



  published
    property Id: Integer  read FID write FID;
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property IdAgendaCategoriaCompromisso: Integer  read FID_AGENDA_CATEGORIA_COMPROMISSO write FID_AGENDA_CATEGORIA_COMPROMISSO;
    property DataCompromisso: TDateTime  read FDATA_COMPROMISSO write FDATA_COMPROMISSO;
    property Hora: TDateTime  read FHORA write FHORA;
    property Duracao: TDateTime  read FDURACAO write FDURACAO;
    property Onde: String  read FONDE write FONDE;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property Tipo: Integer  read FTIPO write FTIPO;
    property Chave: String  read FKEYFIELD write FKEYFIELD;


    //Transientes



  end;

  TListaAgendaCompromissoVO = specialize TFPGObjectList<TAgendaCompromissoVO>;

implementation


initialization
  Classes.RegisterClass(TAgendaCompromissoVO);

finalization
  Classes.UnRegisterClass(TAgendaCompromissoVO);

end.
