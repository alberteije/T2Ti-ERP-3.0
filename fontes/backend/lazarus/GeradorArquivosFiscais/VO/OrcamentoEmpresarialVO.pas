{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ORCAMENTO_EMPRESARIAL] 
                                                                                
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
unit OrcamentoEmpresarialVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  OrcamentoDetalheVO, OrcamentoPeriodoVO;

type
  TOrcamentoEmpresarialVO = class(TVO)
  private
    FID: Integer;
    FID_ORCAMENTO_PERIODO: Integer;
    FNOME: String;
    FDESCRICAO: String;
    FDATA_INICIAL: TDateTime;
    FNUMERO_PERIODOS: Integer;
    FDATA_BASE: TDateTime;

    //Transientes
    FOrcamentoPeriodoNome: String;
    FOrcamentoPeriodoCodigo: String;

    FOrcamentoPeriodoVO: TOrcamentoPeriodoVO;

    FListaOrcamentoDetalheVO: TListaOrcamentoDetalheVO;


  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdOrcamentoPeriodo: Integer  read FID_ORCAMENTO_PERIODO write FID_ORCAMENTO_PERIODO;
    property OrcamentoPeriodoCodigo: String read FOrcamentoPeriodoCodigo write FOrcamentoPeriodoCodigo;
    property OrcamentoPeriodoNome: String read FOrcamentoPeriodoNome write FOrcamentoPeriodoNome;

    property Nome: String  read FNOME write FNOME;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property DataInicial: TDateTime  read FDATA_INICIAL write FDATA_INICIAL;
    property NumeroPeriodos: Integer  read FNUMERO_PERIODOS write FNUMERO_PERIODOS;
    property DataBase: TDateTime  read FDATA_BASE write FDATA_BASE;

    property OrcamentoPeriodoVO: TOrcamentoPeriodoVO read FOrcamentoPeriodoVO write FOrcamentoPeriodoVO;

    property ListaOrcamentoDetalheVO: TListaOrcamentoDetalheVO read FListaOrcamentoDetalheVO write FListaOrcamentoDetalheVO;

  end;

  TListaOrcamentoEmpresarialVO = specialize TFPGObjectList<TOrcamentoEmpresarialVO>;

implementation

constructor TOrcamentoEmpresarialVO.Create;
begin
  inherited;

  FOrcamentoPeriodoVO := TOrcamentoPeriodoVO.Create;

  FListaOrcamentoDetalheVO := TListaOrcamentoDetalheVO.Create;
end;

destructor TOrcamentoEmpresarialVO.Destroy;
begin
  FreeAndNil(FOrcamentoPeriodoVO);

  FreeAndNil(FListaOrcamentoDetalheVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TOrcamentoEmpresarialVO);

finalization
  Classes.UnRegisterClass(TOrcamentoEmpresarialVO);

end.
