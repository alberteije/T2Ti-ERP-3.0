{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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
unit VendaCondicoesPagamentoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  VendaCondicoesParcelasVO;

type
  TVendaCondicoesPagamentoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;
    FDESCRICAO: String;
    FFATURAMENTO_MINIMO: Extended;
    FFATURAMENTO_MAXIMO: Extended;
    FINDICE_CORRECAO: Extended;
    FDIAS_TOLERANCIA: Integer;
    FVALOR_TOLERANCIA: Extended;
    FPRAZO_MEDIO: Integer;
    FVISTA_PRAZO: String;

    //Transientes
    FListaVendaCondicoesParcelasVO: TListaVendaCondicoesParcelasVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Nome: String  read FNOME write FNOME;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property FaturamentoMinimo: Extended  read FFATURAMENTO_MINIMO write FFATURAMENTO_MINIMO;
    property FaturamentoMaximo: Extended  read FFATURAMENTO_MAXIMO write FFATURAMENTO_MAXIMO;
    property IndiceCorrecao: Extended  read FINDICE_CORRECAO write FINDICE_CORRECAO;
    property DiasTolerancia: Integer  read FDIAS_TOLERANCIA write FDIAS_TOLERANCIA;
    property ValorTolerancia: Extended  read FVALOR_TOLERANCIA write FVALOR_TOLERANCIA;
    property PrazoMedio: Integer  read FPRAZO_MEDIO write FPRAZO_MEDIO;
    property VistaPrazo: String  read FVISTA_PRAZO write FVISTA_PRAZO;

    //Transientes
    property ListaVendaCondicoesParcelasVO: TListaVendaCondicoesParcelasVO read FListaVendaCondicoesParcelasVO write FListaVendaCondicoesParcelasVO;


  end;

  TListaVendaCondicoesPagamentoVO = specialize TFPGObjectList<TVendaCondicoesPagamentoVO>;

implementation

constructor TVendaCondicoesPagamentoVO.Create;
begin
  inherited;

  FListaVendaCondicoesParcelasVO := TListaVendaCondicoesParcelasVO.Create;
end;

destructor TVendaCondicoesPagamentoVO.Destroy;
begin
  FreeAndNil(FListaVendaCondicoesParcelasVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TVendaCondicoesPagamentoVO);

finalization
  Classes.UnRegisterClass(TVendaCondicoesPagamentoVO);

end.
