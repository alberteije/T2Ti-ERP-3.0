{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [EMPRESA] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
@version 1.0
*******************************************************************************}
unit EmpresaController;

{$MODE Delphi}

interface

uses
  Classes, Dialogs, SysUtils, DB, LCLIntf, LCLType, LMessages, Forms, Controller,
  EmpresaVO, VO, ZDataset;

type
  TEmpresaController = class(TController)
  private
  public
    class function Consulta(pFiltro: String; pPagina: Integer): TZQuery;
    class function ConsultaObjeto(pFiltro: String): TEmpresaVO;

  end;

implementation

uses UDataModule, T2TiORM, EmpresaEnderecoVO;

var
  ObjetoLocal: TEmpresaVO;

class function TEmpresaController.Consulta(pFiltro: String; pPagina: Integer): TZQuery;
begin
  try
    ObjetoLocal := TEmpresaVO.Create;
    Result := TT2TiORM.Consultar(ObjetoLocal, pFiltro, pPagina);
  finally
    ObjetoLocal.Free;
  end;
end;

class function TEmpresaController.ConsultaObjeto(pFiltro: String): TEmpresaVO;
var
  I: Integer;
begin
  try
    Result := TEmpresaVO.Create;
    Result := TEmpresaVO(TT2TiORM.ConsultarUmObjeto(Result, pFiltro));

    Filtro := 'ID_EMPRESA = ' + IntToStr(Result.Id);

    // Objetos Vinculados

    // Listas
    Result.ListaEmpresaEnderecoVO := TListaEmpresaEnderecoVO(TT2TiORM.ConsultarLista(TEmpresaEnderecoVO.Create, Filtro));

    for I := 0 to Result.ListaEmpresaEnderecoVO.Count - 1 do
    begin
      if Result.ListaEmpresaEnderecoVO[I].Principal = 'S' then
      begin
        Result.EnderecoPrincipal := Result.ListaEmpresaEnderecoVO[I];
      end;
    end;

  finally
  end;
end;

initialization
  Classes.RegisterClass(TEmpresaController);

finalization
  Classes.UnRegisterClass(TEmpresaController);

end.


