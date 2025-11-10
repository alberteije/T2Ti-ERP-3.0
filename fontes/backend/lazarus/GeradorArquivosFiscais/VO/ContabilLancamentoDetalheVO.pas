{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_LANCAMENTO_DETALHE] 
                                                                                
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
unit ContabilLancamentoDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  DB, ContabilContaVO;

type
  TContabilLancamentoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_CONTABIL_CONTA: Integer;
    FID_CONTABIL_HISTORICO: Integer;
    FID_CONTABIL_LANCAMENTO_CAB: Integer;
    FHISTORICO: String;
    FVALOR: Extended;
    FTIPO: String;

    //Transientes
    FContabilContaClassificacao: String;

    FContabilContaVO: TContabilContaVO;



  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdContabilConta: Integer  read FID_CONTABIL_CONTA write FID_CONTABIL_CONTA;
    property ContabilConta: String read FContabilContaClassificacao write FContabilContaClassificacao;

    property IdContabilHistorico: Integer  read FID_CONTABIL_HISTORICO write FID_CONTABIL_HISTORICO;
    property IdContabilLancamentoCab: Integer  read FID_CONTABIL_LANCAMENTO_CAB write FID_CONTABIL_LANCAMENTO_CAB;
    property Historico: String  read FHISTORICO write FHISTORICO;
    property Valor: Extended  read FVALOR write FVALOR;
    property Tipo: String  read FTIPO write FTIPO;


    //Transientes
    property ContabilContaVO: TContabilContaVO read FContabilContaVO write FContabilContaVO;



  end;

  TListaContabilLancamentoDetalheVO = specialize TFPGObjectList<TContabilLancamentoDetalheVO>;

implementation

constructor TContabilLancamentoDetalheVO.Create;
begin
  inherited;

  FContabilContaVO := TContabilContaVO.Create;
end;

destructor TContabilLancamentoDetalheVO.Destroy;
begin
  FreeAndNil(FContabilContaVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TContabilLancamentoDetalheVO);

finalization
  Classes.UnRegisterClass(TContabilLancamentoDetalheVO);

end.
