{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_EXTRATO_CONTA_BANCO] 
                                                                                
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
unit FinExtratoContaBancoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFinExtratoContaBancoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FMES_ANO: String;
    FMES: String;
    FANO: String;
    FDATA_MOVIMENTO: TDateTime;
    FDATA_BALANCETE: TDateTime;
    FHISTORICO: String;
    FDOCUMENTO: String;
    FVALOR: Extended;
    FCONCILIADO: String;
    FOBSERVACAO: String;

    //Transientes

  published 
    property Id: Integer  read FID write FID;
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property MesAno: String  read FMES_ANO write FMES_ANO;
    property Mes: String  read FMES write FMES;
    property Ano: String  read FANO write FANO;
    property DataMovimento: TDateTime  read FDATA_MOVIMENTO write FDATA_MOVIMENTO;
    property DataBalancete: TDateTime  read FDATA_BALANCETE write FDATA_BALANCETE;
    property Historico: String  read FHISTORICO write FHISTORICO;
    property Documento: String  read FDOCUMENTO write FDOCUMENTO;
    property Valor: Extended  read FVALOR write FVALOR;
    property Conciliado: String  read FCONCILIADO write FCONCILIADO;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes

  end;

  TListaFinExtratoContaBancoVO = specialize TFPGObjectList<TFinExtratoContaBancoVO>;

implementation


initialization
  Classes.RegisterClass(TFinExtratoContaBancoVO);

finalization
  Classes.UnRegisterClass(TFinExtratoContaBancoVO);

end.
