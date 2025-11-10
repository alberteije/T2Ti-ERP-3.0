{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
unit EstoqueReajusteCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaColaboradorVO, EstoqueReajusteDetalheVO;

type
  TEstoqueReajusteCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDATA_REAJUSTE: TDateTime;
    FPORCENTAGEM: Extended;
    FTIPO_REAJUSTE: String;

    //Transientes
    FColaboradorPessoaNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;

    FListaEstoqueReajusteDetalheVO: TListaEstoqueReajusteDetalheVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property ColaboradorPessoaNome: String read FColaboradorPessoaNome write FColaboradorPessoaNome;

    property DataReajuste: TDateTime  read FDATA_REAJUSTE write FDATA_REAJUSTE;
    property Porcentagem: Extended  read FPORCENTAGEM write FPORCENTAGEM;
    property TipoReajuste: String  read FTIPO_REAJUSTE write FTIPO_REAJUSTE;


    //Transientes
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;

    property ListaEstoqueReajusteDetalheVO: TListaEstoqueReajusteDetalheVO read FListaEstoqueReajusteDetalheVO write FListaEstoqueReajusteDetalheVO;



  end;

  TListaEstoqueReajusteCabecalhoVO = specialize TFPGObjectList<TEstoqueReajusteCabecalhoVO>;

implementation

constructor TEstoqueReajusteCabecalhoVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;

  FListaEstoqueReajusteDetalheVO := TListaEstoqueReajusteDetalheVO.Create;
end;

destructor TEstoqueReajusteCabecalhoVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);

  FreeAndNil(FListaEstoqueReajusteDetalheVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TEstoqueReajusteCabecalhoVO);

finalization
  Classes.UnRegisterClass(TEstoqueReajusteCabecalhoVO);

end.
