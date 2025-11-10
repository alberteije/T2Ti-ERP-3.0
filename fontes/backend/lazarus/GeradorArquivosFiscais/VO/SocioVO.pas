{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SOCIO] 
                                                                                
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
unit SocioVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  SocioDependenteVO, SocioParticipacaoSocietariaVO;

type
  TSocioVO = class(TVO)
  private
    FID: Integer;
    FID_QUADRO_SOCIETARIO: Integer;
    FLOGRADOURO: String;
    FNUMERO: Integer;
    FCOMPLEMENTO: String;
    FBAIRRO: String;
    FMUNICIPIO: String;
    FUF: String;
    FCEP: String;
    FFONE: String;
    FCELULAR: String;
    FEMAIL: String;
    FPARTICIPACAO: Extended;
    FQUOTAS: Integer;
    FINTEGRALIZAR: Extended;
    FDATA_INGRESSO: TDateTime;
    FDATA_SAIDA: TDateTime;

    //Transientes
    FListaSocioDependenteVO : TListaSocioDependenteVO;
    FListaSocioParticipacaoSocietariaVO: TListaSocioParticipacaoSocietariaVO;


  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdQuadroSocietario: Integer  read FID_QUADRO_SOCIETARIO write FID_QUADRO_SOCIETARIO;
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    property Numero: Integer  read FNUMERO write FNUMERO;
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    property Bairro: String  read FBAIRRO write FBAIRRO;
    property Municipio: String  read FMUNICIPIO write FMUNICIPIO;
    property Uf: String  read FUF write FUF;
    property Cep: String  read FCEP write FCEP;
    property Fone: String  read FFONE write FFONE;
    property Celular: String  read FCELULAR write FCELULAR;
    property Email: String  read FEMAIL write FEMAIL;
    property Participacao: Extended  read FPARTICIPACAO write FPARTICIPACAO;
    property Quotas: Integer  read FQUOTAS write FQUOTAS;
    property Integralizar: Extended  read FINTEGRALIZAR write FINTEGRALIZAR;
    property DataIngresso: TDateTime  read FDATA_INGRESSO write FDATA_INGRESSO;
    property DataSaida: TDateTime  read FDATA_SAIDA write FDATA_SAIDA;


    //Transientes
    property ListaSocioDependenteVO: TListaSocioDependenteVO read FListaSocioDependenteVO write FListaSocioDependenteVO;

    property ListaSocioParticipacaoSocietariaVO: TListaSocioParticipacaoSocietariaVO read FListaSocioParticipacaoSocietariaVO write FListaSocioParticipacaoSocietariaVO;


  end;

  TListaSocioVO = specialize TFPGObjectList<TSocioVO>;

implementation

constructor TSocioVO.Create;
begin
  inherited;

  FListaSocioDependenteVO := TListaSocioDependenteVO.Create;
  FListaSocioParticipacaoSocietariaVO := TListaSocioParticipacaoSocietariaVO.Create;
end;

destructor TSocioVO.Destroy;
begin
  FreeAndNil(FListaSocioDependenteVO);
  FreeAndNil(FListaSocioParticipacaoSocietariaVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TSocioVO);

finalization
  Classes.UnRegisterClass(TSocioVO);

end.
