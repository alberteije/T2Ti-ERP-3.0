{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_LANCAMENTO_CABECALHO] 
                                                                                
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
unit ContabilLancamentoCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ContabilLoteVO, ContabilLancamentoDetalheVO;

type
  TContabilLancamentoCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FID_CONTABIL_LOTE: Integer;
    FDATA_LANCAMENTO: TDateTime;
    FDATA_INCLUSAO: TDateTime;
    FTIPO: String;
    FLIBERADO: String;
    FVALOR: Extended;

    //Transientes
    FLoteDescricao: String;

    FContabilLoteVO: TContabilLoteVO;

    FListaContabilLancamentoDetalheVO: TListaContabilLancamentoDetalheVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;

    property IdContabilLote: Integer  read FID_CONTABIL_LOTE write FID_CONTABIL_LOTE;
    property LoteDescricao: String read FLoteDescricao write FLoteDescricao;

    property DataLancamento: TDateTime  read FDATA_LANCAMENTO write FDATA_LANCAMENTO;
    property DataInclusao: TDateTime  read FDATA_INCLUSAO write FDATA_INCLUSAO;
    property Tipo: String  read FTIPO write FTIPO;
    property Liberado: String  read FLIBERADO write FLIBERADO;
    property Valor: Extended  read FVALOR write FVALOR;


    //Transientes
    property ContabilLoteVO: TContabilLoteVO read FContabilLoteVO write FContabilLoteVO;

    property ListaContabilLancamentoDetalheVO: TListaContabilLancamentoDetalheVO read FListaContabilLancamentoDetalheVO write FListaContabilLancamentoDetalheVO;


  end;

  TListaContabilLancamentoCabecalhoVO = specialize TFPGObjectList<TContabilLancamentoCabecalhoVO>;

implementation

constructor TContabilLancamentoCabecalhoVO.Create;
begin
  inherited;

  FContabilLoteVO := TContabilLoteVO.Create;

  FListaContabilLancamentoDetalheVO := TListaContabilLancamentoDetalheVO.Create;
end;

destructor TContabilLancamentoCabecalhoVO.Destroy;
begin
  FreeAndNil(FContabilLoteVO);

  FreeAndNil(FListaContabilLancamentoDetalheVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TContabilLancamentoCabecalhoVO);

finalization
  Classes.UnRegisterClass(TContabilLancamentoCabecalhoVO);

end.
