unit PdvTipoPlanoService;

interface

uses
  PdvTipoPlanoModel, 
  PdvPlanoPagamentoModel, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPdvTipoPlanoService = class(TServiceBase)
  private
    class procedure AttachLinkedObjects(APdvTipoPlanoModelList: TObjectList<TPdvTipoPlanoModel>); overload;
    class procedure AttachLinkedObjects(APdvTipoPlanoModel: TPdvTipoPlanoModel); overload;
    class procedure InsertChildren(APdvTipoPlanoModel: TPdvTipoPlanoModel);
    class procedure DeleteChildren(APdvTipoPlanoModel: TPdvTipoPlanoModel);		
  public
    class function GetList: TObjectList<TPdvTipoPlanoModel>;
    class function GetListFilter(AWhere: string): TObjectList<TPdvTipoPlanoModel>;
    class function GetObject(APk: Integer): TPdvTipoPlanoModel;
    class procedure Insert(APdvTipoPlanoModel: TPdvTipoPlanoModel);
    class function Update(APdvTipoPlanoModel: TPdvTipoPlanoModel): Integer;
    class function Delete(APdvTipoPlanoModel: TPdvTipoPlanoModel): Integer;
  end;

var
  sql: string;


implementation

{ TPdvTipoPlanoService }

class function TPdvTipoPlanoService.GetList: TObjectList<TPdvTipoPlanoModel>;
begin
  sql := 'SELECT * FROM pdv_tipo_plano';
  try
    Result := GetQuery(sql).AsObjectList<TPdvTipoPlanoModel>;
    AttachLinkedObjects(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPdvTipoPlanoService.GetListFilter(AWhere: string): TObjectList<TPdvTipoPlanoModel>;
begin
  sql := 'SELECT * FROM pdv_tipo_plano where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPdvTipoPlanoModel>;
    AttachLinkedObjects(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPdvTipoPlanoService.GetObject(APk: Integer): TPdvTipoPlanoModel;
begin
  sql := 'SELECT * FROM pdv_tipo_plano WHERE id = ' + IntToStr(APk);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPdvTipoPlanoModel>;
      AttachLinkedObjects(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPdvTipoPlanoService.Insert(APdvTipoPlanoModel: TPdvTipoPlanoModel);
begin
  APdvTipoPlanoModel.Id := InsertBase(APdvTipoPlanoModel, 'pdv_tipo_plano');
	InsertChildren(APdvTipoPlanoModel);
end;

class function TPdvTipoPlanoService.Update(APdvTipoPlanoModel: TPdvTipoPlanoModel): Integer;
begin
  Result := UpdateBase(APdvTipoPlanoModel, 'pdv_tipo_plano');
	DeleteChildren(APdvTipoPlanoModel);
  InsertChildren(APdvTipoPlanoModel);
end;

class function TPdvTipoPlanoService.Delete(APdvTipoPlanoModel: TPdvTipoPlanoModel): Integer;
begin
	DeleteChildren(APdvTipoPlanoModel);
	Result := DeleteBase(APdvTipoPlanoModel.Id, 'pdv_tipo_plano');
end;

class procedure TPdvTipoPlanoService.AttachLinkedObjects(APdvTipoPlanoModelList: TObjectList<TPdvTipoPlanoModel>);
var
  PdvTipoPlanoModel: TPdvTipoPlanoModel;
begin
  for PdvTipoPlanoModel in APdvTipoPlanoModelList do
  begin
    AttachLinkedObjects(PdvTipoPlanoModel);
  end;
end;

class procedure TPdvTipoPlanoService.AttachLinkedObjects(APdvTipoPlanoModel: TPdvTipoPlanoModel);
begin
  // PdvPlanoPagamentoModel
	sql := 'SELECT * FROM pdv_plano_pagamento WHERE id_pdv_tipo_plano = ' + APdvTipoPlanoModel.Id.ToString; 
	APdvTipoPlanoModel.PdvPlanoPagamentoModelList := GetQuery(sql).AsObjectList<TPdvPlanoPagamentoModel>; 

end;

class procedure TPdvTipoPlanoService.InsertChildren(APdvTipoPlanoModel: TPdvTipoPlanoModel);
var
	PdvPlanoPagamentoModel: TPdvPlanoPagamentoModel;
begin
  // PdvPlanoPagamentoModel 
	for PdvPlanoPagamentoModel in APdvTipoPlanoModel.PdvPlanoPagamentoModelList do 
	begin 
	  PdvPlanoPagamentoModel.IdPdvTipoPlano := APdvTipoPlanoModel.Id;
	  InsertBase(PdvPlanoPagamentoModel, 'pdv_plano_pagamento'); 
	end; 

end;

class procedure TPdvTipoPlanoService.DeleteChildren(APdvTipoPlanoModel: TPdvTipoPlanoModel);
begin
  DeleteChild(APdvTipoPlanoModel.Id, 'pdv_plano_pagamento', 'id_pdv_tipo_plano');
end;

end.
