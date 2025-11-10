{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_MARCACAO] 
                                                                                
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
unit PontoMarcacaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  PontoFechamentoJornadaVO;

type
  TPontoMarcacaoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FID_PONTO_RELOGIO: Integer;
    FNSR: Integer;
    FDATA_MARCACAO: TDateTime;
    FHORA_MARCACAO: String;
    FTIPO_MARCACAO: String;
    FTIPO_REGISTRO: String;
    FPAR_ENTRADA_SAIDA: String;
    FJUSTIFICATIVA: String;

    //Transientes
    //FListaPontoMarcacao: TListaPontoMarcacaoVO;
    FListaPontoFechamentoJornada: TListaPontoFechamentoJornadaVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property IdPontoRelogio: Integer  read FID_PONTO_RELOGIO write FID_PONTO_RELOGIO;
    property Nsr: Integer  read FNSR write FNSR;
    property DataMarcacao: TDateTime  read FDATA_MARCACAO write FDATA_MARCACAO;
    property HoraMarcacao: String  read FHORA_MARCACAO write FHORA_MARCACAO;
    property TipoMarcacao: String  read FTIPO_MARCACAO write FTIPO_MARCACAO;
    property TipoRegistro: String  read FTIPO_REGISTRO write FTIPO_REGISTRO;
    property ParEntradaSaida: String  read FPAR_ENTRADA_SAIDA write FPAR_ENTRADA_SAIDA;
    property Justificativa: String  read FJUSTIFICATIVA write FJUSTIFICATIVA;


    //Transientes
    /// EXERCICIO: Nós precisamos dessa lista, mas ela só será criada logo abaixo, como fazer para utilizá-la?
    //property ListaPontoMarcacao: TListaPontoMarcacaoVO read FListaPontoMarcacao write FListaPontoMarcacao;
    property ListaPontoFechamentoJornada: TListaPontoFechamentoJornadaVO read FListaPontoFechamentoJornada write FListaPontoFechamentoJornada;


  end;

  TListaPontoMarcacaoVO = specialize TFPGObjectList<TPontoMarcacaoVO>;

implementation

constructor TPontoMarcacaoVO.Create;
begin
  inherited;

  //FListaPontoMarcacao := TListaPontoMarcacaoVO.Create;
  FListaPontoFechamentoJornada := TListaPontoFechamentoJornadaVO.Create;
end;

destructor TPontoMarcacaoVO.Destroy;
begin
  //FreeAndNil(FListaPontoMarcacao);
  FreeAndNil(FListaPontoFechamentoJornada);

  inherited;
end;

initialization
  Classes.RegisterClass(TPontoMarcacaoVO);

finalization
  Classes.UnRegisterClass(TPontoMarcacaoVO);

end.
