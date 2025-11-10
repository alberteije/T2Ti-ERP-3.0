{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_EVENTO] 
                                                                                
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
unit FolhaEventoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFolhaEventoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FCODIGO: String;
    FNOME: String;
    FDESCRICAO: String;
    FTIPO: String;
    FUNIDADE: String;
    FBASE_CALCULO: String;
    FTAXA: Extended;
    FRUBRICA_ESOCIAL: String;
    FCOD_INCIDENCIA_PREVIDENCIA: String;
    FCOD_INCIDENCIA_IRRF: String;
    FCOD_INCIDENCIA_FGTS: String;
    FCOD_INCIDENCIA_SINDICATO: String;
    FREPERCUTE_DSR: String;
    FREPERCUTE_13: String;
    FREPERCUTE_FERIAS: String;
    FREPERCUTE_AVISO: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Codigo: String  read FCODIGO write FCODIGO;
    property Nome: String  read FNOME write FNOME;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property Tipo: String  read FTIPO write FTIPO;
    property Unidade: String  read FUNIDADE write FUNIDADE;
    property BaseCalculo: String  read FBASE_CALCULO write FBASE_CALCULO;
    property Taxa: Extended  read FTAXA write FTAXA;
    property RubricaEsocial: String  read FRUBRICA_ESOCIAL write FRUBRICA_ESOCIAL;
    property CodIncidenciaPrevidencia: String  read FCOD_INCIDENCIA_PREVIDENCIA write FCOD_INCIDENCIA_PREVIDENCIA;
    property CodIncidenciaIrrf: String  read FCOD_INCIDENCIA_IRRF write FCOD_INCIDENCIA_IRRF;
    property CodIncidenciaFgts: String  read FCOD_INCIDENCIA_FGTS write FCOD_INCIDENCIA_FGTS;
    property CodIncidenciaSindicato: String  read FCOD_INCIDENCIA_SINDICATO write FCOD_INCIDENCIA_SINDICATO;
    property RepercuteDsr: String  read FREPERCUTE_DSR write FREPERCUTE_DSR;
    property Repercute13: String  read FREPERCUTE_13 write FREPERCUTE_13;
    property RepercuteFerias: String  read FREPERCUTE_FERIAS write FREPERCUTE_FERIAS;
    property RepercuteAviso: String  read FREPERCUTE_AVISO write FREPERCUTE_AVISO;


    //Transientes



  end;

  TListaFolhaEventoVO = specialize TFPGObjectList<TFolhaEventoVO>;

implementation


initialization
  Classes.RegisterClass(TFolhaEventoVO);

finalization
  Classes.UnRegisterClass(TFolhaEventoVO);

end.
