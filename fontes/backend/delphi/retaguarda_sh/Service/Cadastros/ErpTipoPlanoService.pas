unit ErpTipoPlanoService;

interface

uses
  ErpTipoPlanoModel, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TErpTipoPlanoService = class(TServiceBase)
  private
    class procedure AttachLinkedObjects(AErpTipoPlanoModelList: TObjectList<TErpTipoPlanoModel>); overload;
    class procedure AttachLinkedObjects(AErpTipoPlanoModel: TErpTipoPlanoModel); overload;
    class procedure InsertChildren(AErpTipoPlanoModel: TErpTipoPlanoModel);
    class procedure DeleteChildren(AErpTipoPlanoModel: TErpTipoPlanoModel);		
  public
    class function GetList: TObjectList<TErpTipoPlanoModel>;
    class function GetListFilter(AWhere: string): TObjectList<TErpTipoPlanoModel>;
    class function GetObject(APk: Integer): TErpTipoPlanoModel;
    class procedure Insert(AErpTipoPlanoModel: TErpTipoPlanoModel);
    class function Update(AErpTipoPlanoModel: TErpTipoPlanoModel): Integer;
    class function Delete(AErpTipoPlanoModel: TErpTipoPlanoModel): Integer;
  end;

var
  sql: string;


implementation

{ TErpTipoPlanoService }

class function TErpTipoPlanoService.GetList: TObjectList<TErpTipoPlanoModel>;
begin
  sql := 'SELECT * FROM erp_tipo_plano';
  try
    Result := GetQuery(sql).AsObjectList<TErpTipoPlanoModel>;
    AttachLinkedObjects(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TErpTipoPlanoService.GetListFilter(AWhere: string): TObjectList<TErpTipoPlanoModel>;
begin
  sql := 'SELECT * FROM erp_tipo_plano where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TErpTipoPlanoModel>;
    AttachLinkedObjects(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TErpTipoPlanoService.GetObject(APk: Integer): TErpTipoPlanoModel;
begin
  sql := 'SELECT * FROM erp_tipo_plano WHERE id = ' + IntToStr(APk);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TErpTipoPlanoModel>;
      AttachLinkedObjects(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TErpTipoPlanoService.Insert(AErpTipoPlanoModel: TErpTipoPlanoModel);
begin
  AErpTipoPlanoModel.Id := InserirBase(AErpTipoPlanoModel, 'erp_tipo_plano');
	InsertChildren(AErpTipoPlanoModel);
end;

class function TErpTipoPlanoService.Update(AErpTipoPlanoModel: TErpTipoPlanoModel): Integer;
begin
  Result := AlterarBase(AErpTipoPlanoModel, 'erp_tipo_plano');
	DeleteChildren(AErpTipoPlanoModel);
  InsertChildren(AErpTipoPlanoModel);
end;

class function TErpTipoPlanoService.Delete(AErpTipoPlanoModel: TErpTipoPlanoModel): Integer;
begin
	DeleteChildren(AErpTipoPlanoModel);
	Result := ExcluirBase(AErpTipoPlanoModel.Id, 'erp_tipo_plano');
end;

class procedure TErpTipoPlanoService.AttachLinkedObjects(AErpTipoPlanoModelList: TObjectList<TErpTipoPlanoModel>);
var
  ErpTipoPlanoModel: TErpTipoPlanoModel;
begin
  for ErpTipoPlanoModel in AErpTipoPlanoModelList do
  begin
    AttachLinkedObjects(ErpTipoPlanoModel);
  end;
end;

class procedure TErpTipoPlanoService.AttachLinkedObjects(AErpTipoPlanoModel: TErpTipoPlanoModel);
begin
end;

class procedure TErpTipoPlanoService.InsertChildren(AErpTipoPlanoModel: TErpTipoPlanoModel);
begin
end;

class procedure TErpTipoPlanoService.DeleteChildren(AErpTipoPlanoModel: TErpTipoPlanoModel);
begin
end;

end.
