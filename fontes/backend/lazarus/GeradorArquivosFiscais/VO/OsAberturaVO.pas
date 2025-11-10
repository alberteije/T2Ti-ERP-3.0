{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [OS_ABERTURA] 
                                                                                
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
unit OsAberturaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  OsProdutoServicoVO, OsAberturaEquipamentoVO, OsEvolucaoVO;

type
  TOsAberturaVO = class(TVO)
  private
    FID: Integer;
    FID_OS_STATUS: Integer;
    FID_COLABORADOR: Integer;
    FID_CLIENTE: Integer;
    FNUMERO: String;
    FDATA_INICIO: TDateTime;
    FHORA_INICIO: String;
    FDATA_PREVISAO: TDateTime;
    FHORA_PREVISAO: String;
    FDATA_FIM: TDateTime;
    FHORA_FIM: String;
    FNOME_CONTATO: String;
    FFONE_CONTATO: String;
    FOBSERVACAO_CLIENTE: String;
    FOBSERVACAO_ABERTURA: String;

    FListaOsProdutoServicoVO: TListaOsProdutoServicoVO;
    FListaOsEquipamentoVO: TListaOsAberturaEquipamentoVO;
    FListaOsEvolucaoVO: TListaOsEvolucaoVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdOsStatus: Integer  read FID_OS_STATUS write FID_OS_STATUS;
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    property Numero: String  read FNUMERO write FNUMERO;
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    property HoraInicio: String  read FHORA_INICIO write FHORA_INICIO;
    property DataPrevisao: TDateTime  read FDATA_PREVISAO write FDATA_PREVISAO;
    property HoraPrevisao: String  read FHORA_PREVISAO write FHORA_PREVISAO;
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    property HoraFim: String  read FHORA_FIM write FHORA_FIM;
    property NomeContato: String  read FNOME_CONTATO write FNOME_CONTATO;
    property FoneContato: String  read FFONE_CONTATO write FFONE_CONTATO;
    property ObservacaoCliente: String  read FOBSERVACAO_CLIENTE write FOBSERVACAO_CLIENTE;
    property ObservacaoAbertura: String  read FOBSERVACAO_ABERTURA write FOBSERVACAO_ABERTURA;


    property ListaOsProdutoServicoVO: TListaOsProdutoServicoVO read FListaOsProdutoServicoVO write FListaOsProdutoServicoVO;

    property ListaOsEquipamentoVO: TListaOsAberturaEquipamentoVO read FListaOsEquipamentoVO write FListaOsEquipamentoVO;

    property ListaOsEvolucaoVO: TListaOsEvolucaoVO read FListaOsEvolucaoVO write FListaOsEvolucaoVO;



  end;

  TListaOsAberturaVO = specialize TFPGObjectList<TOsAberturaVO>;

implementation

constructor TOsAberturaVO.Create;
begin
  inherited;

  FListaOsProdutoServicoVO := TListaOsProdutoServicoVO.Create;
  FListaOsEquipamentoVO := TListaOsAberturaEquipamentoVO.Create;
  FListaOsEvolucaoVO := TListaOsEvolucaoVO.Create;
end;

destructor TOsAberturaVO.Destroy;
begin
  FreeAndNil(FListaOsProdutoServicoVO);
  FreeAndNil(FListaOsEquipamentoVO);
  FreeAndNil(FListaOsEvolucaoVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TOsAberturaVO);

finalization
  Classes.UnRegisterClass(TOsAberturaVO);

end.
