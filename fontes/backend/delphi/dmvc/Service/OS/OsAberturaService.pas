{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [OS_ABERTURA] 
                                                                                
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
unit OsAberturaService;

interface

uses
  OsAbertura, OsAberturaEquipamento, OsEvolucao, OsProdutoServico, OsStatus, Cliente, Colaborador, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TOsAberturaService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaOsAbertura: TObjectList<TOsAbertura>); overload;
    class procedure AnexarObjetosVinculados(AOsAbertura: TOsAbertura); overload;
    class procedure InserirObjetosFilhos(AOsAbertura: TOsAbertura);
    class procedure ExcluirObjetosFilhos(AOsAbertura: TOsAbertura);
  public
    class function ConsultarLista: TObjectList<TOsAbertura>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TOsAbertura>;
    class function ConsultarObjeto(AId: Integer): TOsAbertura;
    class procedure Inserir(AOsAbertura: TOsAbertura);
    class function Alterar(AOsAbertura: TOsAbertura): Integer;
    class function Excluir(AOsAbertura: TOsAbertura): Integer;
  end;

var
  sql: string;


implementation

{ TOsAberturaService }

class procedure TOsAberturaService.AnexarObjetosVinculados(AOsAbertura: TOsAbertura);
begin
  // OsAberturaEquipamento
  sql := 'SELECT * FROM OS_ABERTURA_EQUIPAMENTO WHERE ID_OS_ABERTURA = ' + AOsAbertura.Id.ToString;
  AOsAbertura.ListaOsAberturaEquipamento := GetQuery(sql).AsObjectList<TOsAberturaEquipamento>;

  // OsEvolucao
  sql := 'SELECT * FROM OS_EVOLUCAO WHERE ID_OS_ABERTURA = ' + AOsAbertura.Id.ToString;
  AOsAbertura.ListaOsEvolucao := GetQuery(sql).AsObjectList<TOsEvolucao>;

  // OsProdutoServico
  sql := 'SELECT * FROM OS_PRODUTO_SERVICO WHERE ID_OS_ABERTURA = ' + AOsAbertura.Id.ToString;
  AOsAbertura.ListaOsProdutoServico := GetQuery(sql).AsObjectList<TOsProdutoServico>;

  // OsStatus
  sql := 'SELECT * FROM OS_STATUS WHERE ID = ' + AOsAbertura.IdOsStatus.ToString;
  AOsAbertura.OsStatus := GetQuery(sql).AsObject<TOsStatus>;

  // Cliente
  sql := 'SELECT * FROM CLIENTE WHERE ID = ' + AOsAbertura.IdCliente.ToString;
  AOsAbertura.Cliente := GetQuery(sql).AsObject<TCliente>;

  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + AOsAbertura.IdColaborador.ToString;
  AOsAbertura.Colaborador := GetQuery(sql).AsObject<TColaborador>;

end;

class procedure TOsAberturaService.AnexarObjetosVinculados(AListaOsAbertura: TObjectList<TOsAbertura>);
var
  OsAbertura: TOsAbertura;
begin
  for OsAbertura in AListaOsAbertura do
  begin
    AnexarObjetosVinculados(OsAbertura);
  end;
end;

class function TOsAberturaService.ConsultarLista: TObjectList<TOsAbertura>;
begin
  sql := 'SELECT * FROM OS_ABERTURA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TOsAbertura>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TOsAberturaService.ConsultarListaFiltro(AWhere: string): TObjectList<TOsAbertura>;
begin
  sql := 'SELECT * FROM OS_ABERTURA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TOsAbertura>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TOsAberturaService.ConsultarObjeto(AId: Integer): TOsAbertura;
begin
  sql := 'SELECT * FROM OS_ABERTURA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TOsAbertura>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TOsAberturaService.Inserir(AOsAbertura: TOsAbertura);
begin
  AOsAbertura.ValidarInsercao;
  AOsAbertura.Id := InserirBase(AOsAbertura, 'OS_ABERTURA');
  InserirObjetosFilhos(AOsAbertura);
end;

class function TOsAberturaService.Alterar(AOsAbertura: TOsAbertura): Integer;
begin
  AOsAbertura.ValidarAlteracao;
  Result := AlterarBase(AOsAbertura, 'OS_ABERTURA');
  ExcluirObjetosFilhos(AOsAbertura);
  InserirObjetosFilhos(AOsAbertura);
end;

class procedure TOsAberturaService.InserirObjetosFilhos(AOsAbertura: TOsAbertura);
var
  OsAberturaEquipamento: TOsAberturaEquipamento;
  OsEvolucao: TOsEvolucao;
  OsProdutoServico: TOsProdutoServico;
begin
  // OsAberturaEquipamento
  for OsAberturaEquipamento in AOsAbertura.ListaOsAberturaEquipamento do
  begin
    OsAberturaEquipamento.IdOsAbertura := AOsAbertura.Id;
    InserirBase(OsAberturaEquipamento, 'OS_ABERTURA_EQUIPAMENTO');
  end;

  // OsEvolucao
  for OsEvolucao in AOsAbertura.ListaOsEvolucao do
  begin
    OsEvolucao.IdOsAbertura := AOsAbertura.Id;
    InserirBase(OsEvolucao, 'OS_EVOLUCAO');
  end;

  // OsProdutoServico
  for OsProdutoServico in AOsAbertura.ListaOsProdutoServico do
  begin
    OsProdutoServico.IdOsAbertura := AOsAbertura.Id;
    InserirBase(OsProdutoServico, 'OS_PRODUTO_SERVICO');
  end;

end;

class function TOsAberturaService.Excluir(AOsAbertura: TOsAbertura): Integer;
begin
  AOsAbertura.ValidarExclusao;
  ExcluirObjetosFilhos(AOsAbertura);
  Result := ExcluirBase(AOsAbertura.Id, 'OS_ABERTURA');
end;

class procedure TOsAberturaService.ExcluirObjetosFilhos(AOsAbertura: TOsAbertura);
begin
  ExcluirFilho(AOsAbertura.Id, 'OS_ABERTURA_EQUIPAMENTO', 'ID_OS_ABERTURA');
  ExcluirFilho(AOsAbertura.Id, 'OS_EVOLUCAO', 'ID_OS_ABERTURA');
  ExcluirFilho(AOsAbertura.Id, 'OS_PRODUTO_SERVICO', 'ID_OS_ABERTURA');
end;

end.
