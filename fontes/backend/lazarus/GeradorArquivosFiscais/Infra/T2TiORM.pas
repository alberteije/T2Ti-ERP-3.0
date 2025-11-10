unit T2TiORM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, DB, TypInfo, ZDataset, ZConnection, Dialogs,
  DOM, XMLRead, Contnrs, Variants, VO, Constantes;

type
  { --- Classe gerenciadora da conexão --- }

  { TT2TiConnectionManager }

  TT2TiConnectionManager = class
  private
    class var FConnection: TZConnection;
    class var FBanco: String;
    class procedure ConfigureDefaults;
  public
    class function GetConnection: TZConnection;
    class procedure Configure(const AProtocol, AHost, ADatabase, AUser, APassword: String);
    class property Banco: String read FBanco write FBanco;
    class procedure Connect;
  end;

  { --- Estrutura para mapear propriedades <-> colunas --- }
  TORMPropertyMap = class
  public
    Propriedade: String;
    Coluna: String;
    constructor Create(const APropriedade, AColuna: String);
  end;

  { --- Cacheador de mapeamento XML --- }
  TT2TiORMMapper = class
  private
    class var FCache: TFPHashObjectList; // chave = nome da classe, valor = TFPList de TORMPropertyMap
  public
    class function GetTableName(AObjeto: TObject): String;
    class function GetMap(AObjeto: TObject): TFPList;
    class procedure LoadMapping(AObjeto: TObject);
    class procedure FinalizeCache;
  end;

  { --- Classe principal ORM --- }
  TT2TiORM = class
  public
    class function Inserir(pObjeto: TVO): Integer;
    class function Alterar(pObjeto: TVO): Boolean;
    class function Excluir(pObjeto: TVO): Boolean;
    class function Consultar(pObjeto: TVO; pFiltro: String; pPagina: Integer = -1): TZQuery;
    class function ConsultarLista(pObjeto: TVO; pFiltro: String): TListaVO;
    class function ConsultarUmObjeto(pObjeto: TVO; pFiltro: String): TVO;
    class function ComandoSQL(pConsulta: String): Boolean;
  end;

implementation

var
  CAMINHO_XML: String;

function SafeFieldValue(Query: TZQuery; const FieldName: string; PropInfo: PPropInfo): Variant;
var
  Field: TField;
begin
  Field := Query.FindField(FieldName);

  if not Assigned(Field) then
  begin
    // Campo não existe na query
    case PropInfo^.PropType^.Kind of
      tkInteger, tkInt64: Result := 0;
      tkFloat: Result := 0.0;
      tkString, tkLString, tkUString, tkWString: Result := '';
      tkEnumeration:
        if SameText(PropInfo^.PropType^.Name, 'Boolean') then
          Result := False
        else
          Result := 0;
      else Result := Null;
    end;
    Exit;
  end;

  if Field.IsNull then
  begin
    // Campo existe mas é nulo
    case PropInfo^.PropType^.Kind of
      tkInteger, tkInt64: Result := 0;
      tkFloat: Result := 0.0;
      tkString, tkLString, tkUString, tkWString: Result := '';
      tkEnumeration:
        if SameText(PropInfo^.PropType^.Name, 'Boolean') then
          Result := False
        else
          Result := 0;
      else Result := Null;
    end;
    Exit;
  end;

  // Campo existe e não é nulo - faz conversão segura
  try
    case PropInfo^.PropType^.Kind of
      tkInteger, tkInt64:
        Result := Field.AsInteger;
      tkFloat:
        Result := Field.AsFloat;
      tkString, tkLString, tkUString, tkWString:
        Result := Field.AsString;
      tkEnumeration:
        if SameText(PropInfo^.PropType^.Name, 'Boolean') then
          Result := Field.AsBoolean
        else
          Result := Field.AsInteger;
      else
        Result := Field.Value;
    end;
  except
    on E: Exception do
    begin
      // Em caso de erro na conversão, retorna valor padrão
      case PropInfo^.PropType^.Kind of
        tkInteger, tkInt64: Result := 0;
        tkFloat: Result := 0.0;
        tkString, tkLString, tkUString, tkWString: Result := '';
        tkEnumeration:
          if SameText(PropInfo^.PropType^.Name, 'Boolean') then
            Result := False
          else
            Result := 0;
        else Result := Null;
      end;
    end;
  end;
end;

{ TT2TiConnectionManager }

class procedure TT2TiConnectionManager.ConfigureDefaults;
begin
  FBanco := 'MySQL';
  if not Assigned(FConnection) then
    FConnection := TZConnection.Create(nil);

  FConnection.Protocol := 'mysql';
  FConnection.HostName := 'localhost';
  FConnection.Database := 'fenix';
  FConnection.User := 'root';
  FConnection.Password := 'root';
end;

class procedure TT2TiConnectionManager.Configure(const AProtocol, AHost, ADatabase, AUser, APassword: String);
begin
  if not Assigned(FConnection) then
    FConnection := TZConnection.Create(nil);
  FConnection.Protocol := AProtocol;
  FConnection.HostName := AHost;
  FConnection.Database := ADatabase;
  FConnection.User := AUser;
  FConnection.Password := APassword;
end;

class procedure TT2TiConnectionManager.Connect;
begin
  if not Assigned(FConnection) then
    ConfigureDefaults; // Garante que haja uma conexão configurada

  if not FConnection.Connected then
  begin
    try
      FConnection.Connect;
    except
      on E: Exception do
        raise Exception.Create('Erro ao conectar ao banco de dados: ' + E.Message);
    end;
  end;
end;

class function TT2TiConnectionManager.GetConnection: TZConnection;
begin
  if not Assigned(FConnection) then
    ConfigureDefaults;
  if not FConnection.Connected then
    FConnection.Connect;
  Result := FConnection;
end;

{ TORMPropertyMap }

constructor TORMPropertyMap.Create(const APropriedade, AColuna: String);
begin
  inherited Create;
  Propriedade := APropriedade;
  Coluna := AColuna;
end;

{ TT2TiORMMapper }

class procedure TT2TiORMMapper.FinalizeCache;
begin
  if Assigned(FCache) then
  begin
    FCache.Free;
    FCache := nil;
  end;
end;

class function TT2TiORMMapper.GetTableName(AObjeto: TObject): String;
var
  Doc: TXMLDocument;
  Node: TDOMNode;
  Caminho: String;
begin
  Caminho := CAMINHO_XML + AObjeto.UnitName + '.xml';
  if not FileExists(Caminho) then
    raise Exception.Create('Arquivo de mapeamento XML não encontrado: ' + Caminho);

  ReadXMLFile(Doc, Caminho);
  try
    Node := Doc.DocumentElement.FirstChild;
    // tentativa segura de ler atributo 'table' ou 'name' conforme o XML
    if Assigned(Node.Attributes.GetNamedItem('table')) then
      Result := Node.Attributes.GetNamedItem('table').NodeValue
    else if Assigned(Node.Attributes.GetNamedItem('name')) then
      Result := Node.Attributes.GetNamedItem('name').NodeValue
    else
      raise Exception.Create('Atributo table/name não encontrado no XML: ' + Caminho);
  finally
    Doc.Free;
  end;
end;

class procedure TT2TiORMMapper.LoadMapping(AObjeto: TObject);
var
  Doc: TXMLDocument;
  Node: TDOMNode;
  Caminho: String;
  i: Integer;
  Lista: TFPList;
  PropMap: TORMPropertyMap;
  AttrName, AttrColumn: TDOMNode;
begin
  if not Assigned(FCache) then
    FCache := TFPHashObjectList.Create(True);

  Caminho := CAMINHO_XML + AObjeto.UnitName + '.xml';
  if not FileExists(Caminho) then
    raise Exception.Create('Arquivo de mapeamento XML não encontrado: ' + Caminho);

  Lista := TFPList.Create;
  ReadXMLFile(Doc, Caminho);
  try
    Node := Doc.DocumentElement.FirstChild;
    for i := 0 to Node.ChildNodes.Count - 1 do
    begin
      if Node.ChildNodes[i].NodeName = 'property' then
      begin
        AttrName := Node.ChildNodes[i].Attributes.GetNamedItem('name');
        AttrColumn := Node.ChildNodes[i].Attributes.GetNamedItem('column');
        if Assigned(AttrName) and Assigned(AttrColumn) then
        begin
          PropMap := TORMPropertyMap.Create(AttrName.NodeValue, AttrColumn.NodeValue);
          Lista.Add(PropMap);
        end;
      end
      else if Node.ChildNodes[i].NodeName = 'id' then
      begin
        // garante que ID seja mapeado também
        AttrName := Node.ChildNodes[i].Attributes.GetNamedItem('name');
        AttrColumn := Node.ChildNodes[i].Attributes.GetNamedItem('column');
        if Assigned(AttrName) and Assigned(AttrColumn) then
        begin
          PropMap := TORMPropertyMap.Create(AttrName.NodeValue, AttrColumn.NodeValue);
          Lista.Add(PropMap);
        end;
      end;
    end;
  finally
    Doc.Free;
  end;

  FCache.Add(AObjeto.ClassName, Lista);
end;

class function TT2TiORMMapper.GetMap(AObjeto: TObject): TFPList;
begin
  if not Assigned(FCache) then
    FCache := TFPHashObjectList.Create(True);

  Result := TFPList(FCache.Find(AObjeto.ClassName));
  if not Assigned(Result) then
  begin
    LoadMapping(AObjeto);
    Result := TFPList(FCache.Find(AObjeto.ClassName));
  end;
end;

{ TT2TiORM }

class function TT2TiORM.Inserir(pObjeto: TVO): Integer;
var
  Query: TZQuery;
  Con: TZConnection;
  TableName, Campos, Params: String;
  I: Integer;
  Props: TFPList;
  PropInfo: TORMPropertyMap;
  TipoProp: PPropInfo;
  TempQuery: TZQuery;
begin
  Result := 0;
  Con := TT2TiConnectionManager.GetConnection;
  TableName := TT2TiORMMapper.GetTableName(pObjeto);
  Props := TT2TiORMMapper.GetMap(pObjeto);

  Campos := '';
  Params := '';

  Query := TZQuery.Create(nil);
  try
    Query.Connection := Con;

    for I := 0 to Props.Count - 1 do
    begin
      PropInfo := TORMPropertyMap(Props[I]);
      if SameText(PropInfo.Propriedade, 'Id') then
        Continue;
      Campos := Campos + PropInfo.Coluna + ',';
      Params := Params + ':' + PropInfo.Coluna + ',';
    end;

    if (Length(Campos) = 0) or (Length(Params) = 0) then
      raise Exception.Create('Nenhuma propriedade mapeada para inserção.');

    Delete(Campos, Length(Campos), 1);
    Delete(Params, Length(Params), 1);

    Query.SQL.Text := Format('INSERT INTO %s (%s) VALUES (%s)', [TableName, Campos, Params]);

    // preenche parâmetros dinamicamente
    for I := 0 to Props.Count - 1 do
    begin
      PropInfo := TORMPropertyMap(Props[I]);
      if SameText(PropInfo.Propriedade, 'Id') then
        Continue;
      TipoProp := GetPropInfo(pObjeto, PropInfo.Propriedade);
      if Assigned(TipoProp) then
      begin
        case TipoProp^.PropType^.Kind of
          tkInteger, tkInt64: Query.ParamByName(PropInfo.Coluna).AsInteger := GetInt64Prop(pObjeto, PropInfo.Propriedade);
          tkFloat: Query.ParamByName(PropInfo.Coluna).AsFloat := GetFloatProp(pObjeto, PropInfo.Propriedade);
          tkString, tkUString, tkAString: Query.ParamByName(PropInfo.Coluna).AsString := GetStrProp(pObjeto, PropInfo.Propriedade);
          else
            Query.ParamByName(PropInfo.Coluna).AsString := VarToStrDef(GetPropValue(pObjeto, PropInfo.Propriedade), '');
        end;
      end;
    end;

    // Execução com transação e captura adequada de exceção (neste trecho, aninhamos para evitar try..except..finally inválido)
    try
      Con.StartTransaction;
      try
        Query.ExecSQL;
        // busca id gerado (apenas para MySQL; para outros bancos adaptar)
        TempQuery := TZQuery.Create(nil);
        try
          TempQuery.Connection := Con;
          if SameText(TT2TiConnectionManager.Banco, 'MySQL') then
          begin
            TempQuery.SQL.Text := 'SELECT LAST_INSERT_ID() AS id';
            TempQuery.Open;
            Result := TempQuery.FieldByName('id').AsInteger;
          end
          else
          begin
            // fallback: tentar SELECT MAX(id)
            TempQuery.SQL.Text := Format('SELECT MAX(id) AS id FROM %s', [TableName]);
            TempQuery.Open;
            Result := TempQuery.FieldByName('id').AsInteger;
          end;
        finally
          TempQuery.Close;
          TempQuery.Free;
        end;
        Con.Commit;
      except
        on E: Exception do
        begin
          if Con.InTransaction then Con.Rollback;
          raise Exception.Create('Erro ao inserir registro: ' + E.Message);
        end;
      end;
    finally
      // nada aqui; o Free do Query é feito no finally externo
    end;
  finally
    Query.Free;
  end;
end;

class function TT2TiORM.Alterar(pObjeto: TVO): Boolean;
var
  Query: TZQuery;
  Con: TZConnection;
  TableName, SQLCampos: String;
  I: Integer;
  Props: TFPList;
  PropMap: TORMPropertyMap;
  TipoProp: PPropInfo;
  IdValue: Integer;
begin
  Result := False;
  Con := TT2TiConnectionManager.GetConnection;
  TableName := TT2TiORMMapper.GetTableName(pObjeto);
  Props := TT2TiORMMapper.GetMap(pObjeto);

  Query := TZQuery.Create(nil);
  try
    Query.Connection := Con;
    SQLCampos := '';

    for I := 0 to Props.Count - 1 do
    begin
      PropMap := TORMPropertyMap(Props[I]);
      if SameText(PropMap.Propriedade, 'Id') then
        Continue;
      SQLCampos := SQLCampos + PropMap.Coluna + ' = :' + PropMap.Coluna + ',';
    end;

    if Length(SQLCampos) = 0 then
      raise Exception.Create('Nenhuma coluna para atualização.');

    Delete(SQLCampos, Length(SQLCampos), 1);

    Query.SQL.Text := Format('UPDATE %s SET %s WHERE ID = :ID', [TableName, SQLCampos]);

    // Parâmetros
    for I := 0 to Props.Count - 1 do
    begin
      PropMap := TORMPropertyMap(Props[I]);
      TipoProp := GetPropInfo(pObjeto, PropMap.Propriedade);
      if Assigned(TipoProp) then
      begin
        case TipoProp^.PropType^.Kind of
          tkInteger, tkInt64: Query.ParamByName(PropMap.Coluna).AsInteger := GetInt64Prop(pObjeto, PropMap.Propriedade);
          tkFloat: Query.ParamByName(PropMap.Coluna).AsFloat := GetFloatProp(pObjeto, PropMap.Propriedade);
          tkString, tkUString, tkAString: Query.ParamByName(PropMap.Coluna).AsString := GetStrProp(pObjeto, PropMap.Propriedade);
          else Query.ParamByName(PropMap.Coluna).AsString := VarToStrDef(GetPropValue(pObjeto, PropMap.Propriedade), '');
        end;
      end;
    end;

    IdValue := GetInt64Prop(pObjeto, 'Id');
    Query.ParamByName('ID').AsInteger := IdValue;

    try
      Con.StartTransaction;
      try
        Query.ExecSQL;
        Con.Commit;
        Result := True;
      except
        on E: Exception do
        begin
          if Con.InTransaction then Con.Rollback;
          raise Exception.Create('Erro ao alterar: ' + E.Message);
        end;
      end;
    finally
      // nothing
    end;
  finally
    Query.Free;
  end;
end;

class function TT2TiORM.Excluir(pObjeto: TVO): Boolean;
var
  Query: TZQuery;
  Con: TZConnection;
  TableName: String;
begin
  Result := False;
  Con := TT2TiConnectionManager.GetConnection;
  TableName := TT2TiORMMapper.GetTableName(pObjeto);

  Query := TZQuery.Create(nil);
  try
    Query.Connection := Con;
    Query.SQL.Text := Format('DELETE FROM %s WHERE ID = :ID', [TableName]);
    Query.ParamByName('ID').AsInteger := GetInt64Prop(pObjeto, 'Id');

    try
      Con.StartTransaction;
      try
        Query.ExecSQL;
        Con.Commit;
        Result := True;
      except
        on E: Exception do
        begin
          if Con.InTransaction then Con.Rollback;
          raise;
        end;
      end;
    finally
      // nothing
    end;
  finally
    Query.Free;
  end;
end;

class function TT2TiORM.Consultar(pObjeto: TVO; pFiltro: String; pPagina: Integer): TZQuery;
var
  Query: TZQuery;
  Con: TZConnection;
  TableName, SQLText: String;
begin
  Con := TT2TiConnectionManager.GetConnection;
  TableName := TT2TiORMMapper.GetTableName(pObjeto);

  SQLText := 'SELECT * FROM ' + TableName;
  if pFiltro <> '' then
    SQLText := SQLText + ' WHERE ' + pFiltro;

  if pPagina >= 0 then
    SQLText := SQLText + Format(' LIMIT %d OFFSET %d', [TConstantes.QUANTIDADE_POR_PAGINA, pPagina]);

  Query := TZQuery.Create(nil);
  Query.Connection := Con;
  Query.SQL.Text := SQLText;
  Query.Open;
  Result := Query;
end;

class function TT2TiORM.ConsultarLista(pObjeto: TVO; pFiltro: String): TListaVO;
var
  Query: TZQuery;
  I: Integer;
  NovoObj: TVO;
  PropMap: TORMPropertyMap;
  Props: TFPList;
  ClasseRef: TPersistentClass;
  PropInfo: PPropInfo;
begin
  Result := TListaVO.Create;
  Query := Consultar(pObjeto, pFiltro);
  try
    Props := TT2TiORMMapper.GetMap(pObjeto);
    ClasseRef := TPersistentClass(GetClass(pObjeto.ClassName));

    while not Query.EOF do
    begin
      NovoObj := TVO(ClasseRef.Create);
      for I := 0 to Props.Count - 1 do
      begin
        PropMap := TORMPropertyMap(Props[I]);
        PropInfo := GetPropInfo(NovoObj, PropMap.Propriedade);

        if Assigned(PropInfo) and Assigned(Query.FindField(PropMap.Coluna)) then
          SetPropValue(
            NovoObj,
            PropMap.Propriedade,
            SafeFieldValue(Query, PropMap.Coluna, PropInfo)
          );
      end;

      Result.Add(NovoObj);
      Query.Next;
    end;

  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TT2TiORM.ConsultarUmObjeto(pObjeto: TVO; pFiltro: String): TVO;
var
  Lista: TListaVO;
begin
  Lista := ConsultarLista(pObjeto, pFiltro);
  try
    if Lista.Count > 0 then
    begin
      Result := TVO(Lista[0]);
      Lista.Extract(Result);
    end
    else
      Result := nil;
  finally
    Lista.Free;
  end;
end;

class function TT2TiORM.ComandoSQL(pConsulta: String): Boolean;
var
  Query: TZQuery;
  Con: TZConnection;
begin
  Result := False;
  Con := TT2TiConnectionManager.GetConnection;
  Query := TZQuery.Create(nil);
  try
    Query.Connection := Con;
    Query.SQL.Text := pConsulta;
    try
      Con.StartTransaction;
      try
        Query.ExecSQL;
        Con.Commit;
        Result := True;
      except
        on E: Exception do
        begin
          if Con.InTransaction then Con.Rollback;
          raise;
        end;
      end;
    finally
      // nothing
    end;
  finally
    Query.Free;
  end;
end;

initialization
  CAMINHO_XML := ExtractFilePath(Application.ExeName) + 'VO' + DirectorySeparator;

finalization
  TT2TiORMMapper.FinalizeCache;

end.

