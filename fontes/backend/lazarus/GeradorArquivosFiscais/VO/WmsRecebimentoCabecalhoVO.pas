{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [WMS_RECEBIMENTO_CABECALHO] 
                                                                                
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
unit WmsRecebimentoCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  WmsRecebimentoDetalheVO;

type
  TWmsRecebimentoCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_WMS_AGENDAMENTO: Integer;
    FDATA_RECEBIMENTO: TDateTime;
    FHORA_INICIO: String;
    FHORA_FIM: String;
    FVOLUME_RECEBIDO: Integer;
    FPESO_RECEBIDO: Extended;
    FINCONSISTENCIA: String;
    FOBSERVACAO: String;

    //Transientes
    FListaWmsRecebimentoDetalheVO: TListaWmsRecebimentoDetalheVO;



  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdWmsAgendamento: Integer  read FID_WMS_AGENDAMENTO write FID_WMS_AGENDAMENTO;
    property DataRecebimento: TDateTime  read FDATA_RECEBIMENTO write FDATA_RECEBIMENTO;
    property HoraInicio: String  read FHORA_INICIO write FHORA_INICIO;
    property HoraFim: String  read FHORA_FIM write FHORA_FIM;
    property VolumeRecebido: Integer  read FVOLUME_RECEBIDO write FVOLUME_RECEBIDO;
    property PesoRecebido: Extended  read FPESO_RECEBIDO write FPESO_RECEBIDO;
    property Inconsistencia: String  read FINCONSISTENCIA write FINCONSISTENCIA;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes
    property ListaWmsRecebimentoDetalheVO: TListaWmsRecebimentoDetalheVO read FListaWmsRecebimentoDetalheVO write FListaWmsRecebimentoDetalheVO;

end;

implementation

constructor TWmsRecebimentoCabecalhoVO.Create;
begin
  inherited;

  FListaWmsRecebimentoDetalheVO := TListaWmsRecebimentoDetalheVO.Create;
end;

destructor TWmsRecebimentoCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaWmsRecebimentoDetalheVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TWmsRecebimentoCabecalhoVO);

finalization
  Classes.UnRegisterClass(TWmsRecebimentoCabecalhoVO);

end.
