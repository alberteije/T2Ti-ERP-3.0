{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [EMPRESA] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************}
unit EmpresaService;

interface

uses
  Empresa, EmpresaContato, EmpresaEndereco, EmpresaTelefone, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TEmpresaService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaEmpresa: TObjectList<TEmpresa>); overload;
    class procedure AnexarObjetosVinculados(AEmpresa: TEmpresa); overload;
    class procedure InserirObjetosFilhos(AEmpresa: TEmpresa);
    class procedure ExcluirObjetosFilhos(AEmpresa: TEmpresa);
  public
    class function ConsultarLista: TObjectList<TEmpresa>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TEmpresa>;
    class function ConsultarObjeto(AId: Integer): TEmpresa;
    class procedure Inserir(AEmpresa: TEmpresa);
    class function Alterar(AEmpresa: TEmpresa): Integer;
    class function Excluir(AEmpresa: TEmpresa): Integer;
  end;

var
  sql: string;


implementation

{ TEmpresaService }

class procedure TEmpresaService.AnexarObjetosVinculados(AEmpresa: TEmpresa);
begin
  // EmpresaContato
  sql := 'SELECT * FROM EMPRESA_CONTATO WHERE ID_EMPRESA = ' + AEmpresa.Id.ToString;
  AEmpresa.ListaEmpresaContato := GetQuery(sql).AsObjectList<TEmpresaContato>;

  // EmpresaEndereco
  sql := 'SELECT * FROM EMPRESA_ENDERECO WHERE ID_EMPRESA = ' + AEmpresa.Id.ToString;
  AEmpresa.ListaEmpresaEndereco := GetQuery(sql).AsObjectList<TEmpresaEndereco>;

  // EmpresaTelefone
  sql := 'SELECT * FROM EMPRESA_TELEFONE WHERE ID_EMPRESA = ' + AEmpresa.Id.ToString;
  AEmpresa.ListaEmpresaTelefone := GetQuery(sql).AsObjectList<TEmpresaTelefone>;

  // Endereço Principal
  sql := 'SELECT * FROM EMPRESA_ENDERECO WHERE ID_EMPRESA = ' + AEmpresa.Id.ToString + ' and PRINCIPAL="S"';
  AEmpresa.EnderecoPrincipal := GetQuery(sql).AsObject<TEmpresaEndereco>;

end;

class procedure TEmpresaService.AnexarObjetosVinculados(AListaEmpresa: TObjectList<TEmpresa>);
var
  Empresa: TEmpresa;
begin
  for Empresa in AListaEmpresa do
  begin
    AnexarObjetosVinculados(Empresa);
  end;
end;

class function TEmpresaService.ConsultarLista: TObjectList<TEmpresa>;
begin
  sql := 'SELECT * FROM EMPRESA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TEmpresa>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEmpresaService.ConsultarListaFiltro(AWhere: string): TObjectList<TEmpresa>;
begin
  sql := 'SELECT * FROM EMPRESA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TEmpresa>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEmpresaService.ConsultarObjeto(AId: Integer): TEmpresa;
begin
  sql := 'SELECT * FROM EMPRESA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TEmpresa>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TEmpresaService.Inserir(AEmpresa: TEmpresa);
begin
  AEmpresa.ValidarInsercao;
  AEmpresa.Id := InserirBase(AEmpresa, 'EMPRESA');
  InserirObjetosFilhos(AEmpresa);
end;

class function TEmpresaService.Alterar(AEmpresa: TEmpresa): Integer;
begin
  AEmpresa.ValidarAlteracao;
  Result := AlterarBase(AEmpresa, 'EMPRESA');
  ExcluirObjetosFilhos(AEmpresa);
  InserirObjetosFilhos(AEmpresa);
end;

class procedure TEmpresaService.InserirObjetosFilhos(AEmpresa: TEmpresa);
var
  EmpresaContato: TEmpresaContato;
  EmpresaEndereco: TEmpresaEndereco;
  EmpresaTelefone: TEmpresaTelefone;
begin
  // EmpresaContato
  for EmpresaContato in AEmpresa.ListaEmpresaContato do
  begin
    EmpresaContato.IdEmpresa := AEmpresa.Id;
    InserirBase(EmpresaContato, 'EMPRESA_CONTATO');
  end;

  // EmpresaEndereco
  for EmpresaEndereco in AEmpresa.ListaEmpresaEndereco do
  begin
    EmpresaEndereco.IdEmpresa := AEmpresa.Id;
    InserirBase(EmpresaEndereco, 'EMPRESA_ENDERECO');
  end;

  // EmpresaTelefone
  for EmpresaTelefone in AEmpresa.ListaEmpresaTelefone do
  begin
    EmpresaTelefone.IdEmpresa := AEmpresa.Id;
    InserirBase(EmpresaTelefone, 'EMPRESA_TELEFONE');
  end;

end;

class function TEmpresaService.Excluir(AEmpresa: TEmpresa): Integer;
begin
  AEmpresa.ValidarExclusao;
  ExcluirObjetosFilhos(AEmpresa);
  Result := ExcluirBase(AEmpresa.Id, 'EMPRESA');
end;

class procedure TEmpresaService.ExcluirObjetosFilhos(AEmpresa: TEmpresa);
begin
  ExcluirFilho(AEmpresa.Id, 'EMPRESA_CONTATO', 'ID_EMPRESA');
  ExcluirFilho(AEmpresa.Id, 'EMPRESA_ENDERECO', 'ID_EMPRESA');
  ExcluirFilho(AEmpresa.Id, 'EMPRESA_TELEFONE', 'ID_EMPRESA');
end;

end.
