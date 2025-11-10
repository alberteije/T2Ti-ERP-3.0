{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FERIAS_PERIODO_AQUISITIVO] 
                                                                                
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
unit FeriasPeriodoAquisitivoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFeriasPeriodoAquisitivoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDATA_INICIO: TDateTime;
    FDATA_FIM: TDateTime;
    FSITUACAO: String;
    FLIMITE_PARA_GOZO: TDateTime;
    FDESCONTAR_FALTAS: String;
    FDESCONSIDERAR_AFASTAMENTO: String;
    FAFASTAMENTO_PREVIDENCIA: Integer;
    FAFASTAMENTO_SEM_REMUN: Integer;
    FAFASTAMENTO_COM_REMUN: Integer;
    FDIAS_DIREITO: Integer;
    FDIAS_GOZADOS: Integer;
    FDIAS_FALTAS: Integer;
    FDIAS_RESTANTES: Integer;

    //Transientes


    /// EXERCICIO
    ///  Inclua o nome do colaborador


  published 
    property Id: Integer  read FID write FID;
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    property Situacao: String  read FSITUACAO write FSITUACAO;
    property LimiteParaGozo: TDateTime  read FLIMITE_PARA_GOZO write FLIMITE_PARA_GOZO;
    property DescontarFaltas: String  read FDESCONTAR_FALTAS write FDESCONTAR_FALTAS;
    property DesconsiderarAfastamento: String  read FDESCONSIDERAR_AFASTAMENTO write FDESCONSIDERAR_AFASTAMENTO;
    property AfastamentoPrevidencia: Integer  read FAFASTAMENTO_PREVIDENCIA write FAFASTAMENTO_PREVIDENCIA;
    property AfastamentoSemRemun: Integer  read FAFASTAMENTO_SEM_REMUN write FAFASTAMENTO_SEM_REMUN;
    property AfastamentoComRemun: Integer  read FAFASTAMENTO_COM_REMUN write FAFASTAMENTO_COM_REMUN;
    property DiasDireito: Integer  read FDIAS_DIREITO write FDIAS_DIREITO;
    property DiasGozados: Integer  read FDIAS_GOZADOS write FDIAS_GOZADOS;
    property DiasFaltas: Integer  read FDIAS_FALTAS write FDIAS_FALTAS;
    property DiasRestantes: Integer  read FDIAS_RESTANTES write FDIAS_RESTANTES;


    //Transientes



  end;

  TListaFeriasPeriodoAquisitivoVO = specialize TFPGObjectList<TFeriasPeriodoAquisitivoVO>;

implementation


initialization
  Classes.RegisterClass(TFeriasPeriodoAquisitivoVO);

finalization
  Classes.UnRegisterClass(TFeriasPeriodoAquisitivoVO);

end.
