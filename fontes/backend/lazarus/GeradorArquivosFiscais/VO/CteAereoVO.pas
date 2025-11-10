{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_AEREO] 
                                                                                
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
unit CteAereoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TCteAereoVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_CABECALHO: Integer;
    FNUMERO_MINUTA: Integer;
    FNUMERO_CONHECIMENTO: Integer;
    FDATA_PREVISTA_ENTREGA: TDateTime;
    FID_EMISSOR: String;
    FID_INTERNA_TOMADOR: String;
    FTARIFA_CLASSE: String;
    FTARIFA_CODIGO: String;
    FTARIFA_VALOR: Extended;
    FCARGA_DIMENSAO: String;
    FCARGA_INFORMACAO_MANUSEIO: Integer;
    FCARGA_ESPECIAL: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdCteCabecalho: Integer  read FID_CTE_CABECALHO write FID_CTE_CABECALHO;
    property NumeroMinuta: Integer  read FNUMERO_MINUTA write FNUMERO_MINUTA;
    property NumeroConhecimento: Integer  read FNUMERO_CONHECIMENTO write FNUMERO_CONHECIMENTO;
    property DataPrevistaEntrega: TDateTime  read FDATA_PREVISTA_ENTREGA write FDATA_PREVISTA_ENTREGA;
    property IdEmissor: String  read FID_EMISSOR write FID_EMISSOR;
    property IdInternaTomador: String  read FID_INTERNA_TOMADOR write FID_INTERNA_TOMADOR;
    property TarifaClasse: String  read FTARIFA_CLASSE write FTARIFA_CLASSE;
    property TarifaCodigo: String  read FTARIFA_CODIGO write FTARIFA_CODIGO;
    property TarifaValor: Extended  read FTARIFA_VALOR write FTARIFA_VALOR;
    property CargaDimensao: String  read FCARGA_DIMENSAO write FCARGA_DIMENSAO;
    property CargaInformacaoManuseio: Integer  read FCARGA_INFORMACAO_MANUSEIO write FCARGA_INFORMACAO_MANUSEIO;
    property CargaEspecial: String  read FCARGA_ESPECIAL write FCARGA_ESPECIAL;


    //Transientes



  end;

  TListaCteAereoVO = specialize TFPGObjectList<TCteAereoVO>;

implementation


initialization
  Classes.RegisterClass(TCteAereoVO);

finalization
  Classes.UnRegisterClass(TCteAereoVO);

end.
