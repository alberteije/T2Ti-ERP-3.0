{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [FIN_CONFIGURACAO_BOLETO] 
                                                                                
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
unit FinConfiguracaoBoletoController;

{$MODE Delphi}

interface

uses
  Classes, Dialogs, SysUtils, DB, LCLIntf, LCLType, LMessages, Forms, Controller,
  VO, ZDataset, FinConfiguracaoBoletoVO;

type
  TFinConfiguracaoBoletoController = class(TController)
  private
  public
    class function Consulta(pFiltro: String; pPagina: Integer): TZQuery;
    class function ConsultaObjeto(pFiltro: String): TFinConfiguracaoBoletoVO;
  end;

implementation

uses UDataModule, T2TiORM, ContaCaixaVO, AgenciaBancoVO, BancoVO;

var
  ObjetoLocal: TFinConfiguracaoBoletoVO;

class function TFinConfiguracaoBoletoController.Consulta(pFiltro: String; pPagina: Integer): TZQuery;
begin
  try
    ObjetoLocal := TFinConfiguracaoBoletoVO.Create;
    Result := TT2TiORM.Consultar(ObjetoLocal, pFiltro, pPagina);
  finally
    ObjetoLocal.Free;
  end;
end;

class function TFinConfiguracaoBoletoController.ConsultaObjeto(pFiltro: String): TFinConfiguracaoBoletoVO;
begin
  try
    Result := TFinConfiguracaoBoletoVO.Create;
    Result := TFinConfiguracaoBoletoVO(TT2TiORM.ConsultarUmObjeto(Result, pFiltro));

    // Objetos Vinculados
    Result.ContaCaixaVO := TContaCaixaVO(TT2TiORM.ConsultarUmObjeto(TContaCaixaVO.Create, 'ID='+IntToStr(Result.IdContaCaixa)));
    Result.ContaCaixaVO.AgenciaBancoVO := TAgenciaBancoVO(TT2TiORM.ConsultarUmObjeto(TAgenciaBancoVO.Create, 'ID='+IntToStr(Result.ContaCaixaVO.IdAgenciaBanco)));
    Result.ContaCaixaVO.AgenciaBancoVO.BancoVO := TBancoVO(TT2TiORM.ConsultarUmObjeto(TBancoVO.Create, 'ID='+IntToStr(Result.ContaCaixaVO.AgenciaBancoVO.IdBanco)));

    Result.ContaCaixaNome := Result.ContaCaixaVO.Nome;

    // Listas

  finally
  end;
end;

initialization
  Classes.RegisterClass(TFinConfiguracaoBoletoController);

finalization
  Classes.UnRegisterClass(TFinConfiguracaoBoletoController);

end.

