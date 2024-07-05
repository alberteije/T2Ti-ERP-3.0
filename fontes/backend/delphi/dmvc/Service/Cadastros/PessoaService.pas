﻿{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [PESSOA] 
                                                                                
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
unit PessoaService;

interface

uses
  Pessoa, PessoaContato, PessoaEndereco, PessoaFisica, PessoaJuridica, PessoaTelefone,
  NivelFormacao, EstadoCivil, Cliente, Fornecedor, Transportadora, Colaborador,
  Contador,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPessoaService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaPessoa: TObjectList<TPessoa>); overload;
    class procedure AnexarObjetosVinculados(APessoa: TPessoa); overload;
    class procedure AtualizarObjetosFilhos(APessoa: TPessoa);
    class procedure ExcluirObjetosFilhos(APessoa: TPessoa);
    class procedure ExcluirObjetosFilhosCriticos(APessoa: TPessoa);
  public
    class function ConsultarLista: TObjectList<TPessoa>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPessoa>;
    class function ConsultarObjeto(AId: Integer): TPessoa;
    class procedure Inserir(APessoa: TPessoa);
    class function Alterar(APessoa: TPessoa): Integer;
    class function Excluir(APessoa: TPessoa): Integer;
  end;

var
  sql: string;


implementation

{ TPessoaService }

class procedure TPessoaService.AnexarObjetosVinculados(APessoa: TPessoa);
begin
  // Cliente
  sql := 'SELECT * FROM CLIENTE WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.Cliente := GetQuery(sql).AsObject<TCliente>;

  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.Colaborador := GetQuery(sql).AsObject<TColaborador>;

  // Contador
  sql := 'SELECT * FROM CONTADOR WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.Contador := GetQuery(sql).AsObject<TContador>;

  // Fornecedor
  sql := 'SELECT * FROM FORNECEDOR WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.Fornecedor := GetQuery(sql).AsObject<TFornecedor>;
  // Transportadora
  sql := 'SELECT * FROM TRANSPORTADORA WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.Transportadora := GetQuery(sql).AsObject<TTransportadora>;
  // PessoaFisica
  sql := 'SELECT * FROM PESSOA_FISICA WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.PessoaFisica := GetQuery(sql).AsObject<TPessoaFisica>;

  if Assigned(APessoa.PessoaFisica) then
  begin
    // Nível Formação -- não foi gerado pelo gerador de códigos
    sql := 'SELECT * FROM NIVEL_FORMACAO WHERE ID = ' + APessoa.PessoaFisica.IdNivelFormacao.ToString;
    APessoa.PessoaFisica.NivelFormacao := GetQuery(sql).AsObject<TNivelFormacao>;
    // Estado Civil -- não foi gerado pelo gerador de códigos
    sql := 'SELECT * FROM ESTADO_CIVIL WHERE ID = ' + APessoa.PessoaFisica.IdEstadoCivil.ToString;
    APessoa.PessoaFisica.EstadoCivil := GetQuery(sql).AsObject<TEstadoCivil>;
  end;
  // PessoaJuridica
  sql := 'SELECT * FROM PESSOA_JURIDICA WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.PessoaJuridica := GetQuery(sql).AsObject<TPessoaJuridica>;

  // PessoaTelefone
  sql := 'SELECT * FROM PESSOA_TELEFONE WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.ListaPessoaTelefone := GetQuery(sql).AsObjectList<TPessoaTelefone>;

  // PessoaContato
  sql := 'SELECT * FROM PESSOA_CONTATO WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.ListaPessoaContato := GetQuery(sql).AsObjectList<TPessoaContato>;

  // PessoaEndereco
  sql := 'SELECT * FROM PESSOA_ENDERECO WHERE ID_PESSOA = ' + APessoa.Id.ToString;
  APessoa.ListaPessoaEndereco := GetQuery(sql).AsObjectList<TPessoaEndereco>;

end;

class procedure TPessoaService.AnexarObjetosVinculados(AListaPessoa: TObjectList<TPessoa>);
var
  Pessoa: TPessoa;
begin
  for Pessoa in AListaPessoa do
  begin
    AnexarObjetosVinculados(Pessoa);
  end;
end;

class function TPessoaService.ConsultarLista: TObjectList<TPessoa>;
begin
  sql := 'SELECT * FROM PESSOA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPessoa>;
  	AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPessoaService.ConsultarListaFiltro(AWhere: string): TObjectList<TPessoa>;
begin
  sql := 'SELECT * FROM PESSOA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPessoa>;
	  AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPessoaService.ConsultarObjeto(AId: Integer): TPessoa;
begin
  sql := 'SELECT * FROM PESSOA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPessoa>;
  	  AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPessoaService.Inserir(APessoa: TPessoa);
begin
  StartTransaction;
  try
    APessoa.ValidarInsercao;
    APessoa.Id := InserirBase(APessoa, 'PESSOA');
    AtualizarObjetosFilhos(APessoa);
    Commit;
  except
    Rollback;
    raise;
  end;
end;

class function TPessoaService.Alterar(APessoa: TPessoa): Integer;
begin
  StartTransaction;
  try
    APessoa.ValidarAlteracao;
    Result := AlterarBase(APessoa, 'PESSOA');
    ExcluirObjetosFilhos(APessoa);
    AtualizarObjetosFilhos(APessoa);
    Commit;
  except
    Rollback;
    raise;
  end;
end;

class procedure TPessoaService.AtualizarObjetosFilhos(APessoa: TPessoa);
var
  PessoaContato: TPessoaContato;
  PessoaEndereco: TPessoaEndereco;
  PessoaTelefone: TPessoaTelefone;
begin
  // Cliente
  APessoa.Cliente.IdPessoa := APessoa.Id;
  if APessoa.Cliente.Id > 0 then
    AlterarBase(APessoa.Cliente, 'CLIENTE')
  else
    InserirBase(APessoa.Cliente, 'CLIENTE');
  // Colaborador
  APessoa.Colaborador.IdPessoa := APessoa.Id;
  if APessoa.Colaborador.Id > 0 then

    AlterarBase(APessoa.Colaborador, 'COLABORADOR')

  else

    InserirBase(APessoa.Colaborador, 'COLABORADOR');

  // Contador
  APessoa.Contador.IdPessoa := APessoa.Id;
  if APessoa.Contador.Id > 0 then

    AlterarBase(APessoa.Contador, 'CONTADOR')

  else

    InserirBase(APessoa.Contador, 'CONTADOR');

  // Fornecedor
  APessoa.Fornecedor.IdPessoa := APessoa.Id;
  if APessoa.Fornecedor.Id > 0 then
    AlterarBase(APessoa.Fornecedor, 'FORNECEDOR')
  else
    InserirBase(APessoa.Fornecedor, 'FORNECEDOR');
  // Transportadora
  APessoa.Transportadora.IdPessoa := APessoa.Id;
  if APessoa.Transportadora.Id > 0 then
    AlterarBase(APessoa.Transportadora, 'TRANSPORTADORA')
  else
    InserirBase(APessoa.Transportadora, 'TRANSPORTADORA');
  // PessoaFisica
  if APessoa.PessoaFisica.Cpf <> '' then
  begin
    APessoa.PessoaFisica.IdPessoa := APessoa.Id;
    InserirBase(APessoa.PessoaFisica, 'PESSOA_FISICA');

  end;

  // PessoaJuridica
  if APessoa.PessoaJuridica.Cnpj <> '' then
  begin
    APessoa.PessoaJuridica.IdPessoa := APessoa.Id;
    InserirBase(APessoa.PessoaJuridica, 'PESSOA_JURIDICA');

  end;
  // PessoaContato
  for PessoaContato in APessoa.ListaPessoaContato do
  begin
    PessoaContato.IdPessoa := APessoa.Id;
    InserirBase(PessoaContato, 'PESSOA_CONTATO');
  end;

  // PessoaEndereco
  for PessoaEndereco in APessoa.ListaPessoaEndereco do
  begin
    PessoaEndereco.IdPessoa := APessoa.Id;
    InserirBase(PessoaEndereco, 'PESSOA_ENDERECO');
  end;

  // PessoaTelefone
  for PessoaTelefone in APessoa.ListaPessoaTelefone do
  begin
    PessoaTelefone.IdPessoa := APessoa.Id;
    InserirBase(PessoaTelefone, 'PESSOA_TELEFONE');
  end;

end;

class function TPessoaService.Excluir(APessoa: TPessoa): Integer;
begin
  StartTransaction;
  try
    APessoa.ValidarExclusao;
    ExcluirObjetosFilhos(APessoa);
    ExcluirObjetosFilhosCriticos(APessoa);
    Result := ExcluirBase(APessoa.Id, 'PESSOA');
    Commit;
  except
    Rollback;
    raise;
  end;
end;

class procedure TPessoaService.ExcluirObjetosFilhos(APessoa: TPessoa);
begin
  ExcluirFilho(APessoa.Id, 'PESSOA_CONTATO', 'ID_PESSOA');
  ExcluirFilho(APessoa.Id, 'PESSOA_ENDERECO', 'ID_PESSOA');
  ExcluirFilho(APessoa.Id, 'PESSOA_FISICA', 'ID_PESSOA');
  ExcluirFilho(APessoa.Id, 'PESSOA_JURIDICA', 'ID_PESSOA');
  ExcluirFilho(APessoa.Id, 'PESSOA_TELEFONE', 'ID_PESSOA');
end;

class procedure TPessoaService.ExcluirObjetosFilhosCriticos(APessoa: TPessoa);
begin
  // objetos vinculados 1:1 que tem grande change de causar erros no momento da
  // exclusão, pois são vinculados a várias outras tabelas do ERP
  ExcluirFilho(APessoa.Id, 'CLIENTE', 'ID_PESSOA');
  ExcluirFilho(APessoa.Id, 'FORNECEDOR', 'ID_PESSOA');
  ExcluirFilho(APessoa.Id, 'TRANSPORTADORA', 'ID_PESSOA');
  ExcluirFilho(APessoa.Id, 'COLABORADOR', 'ID_PESSOA');
  ExcluirFilho(APessoa.Id, 'CONTADOR', 'ID_PESSOA');
end;

end.
