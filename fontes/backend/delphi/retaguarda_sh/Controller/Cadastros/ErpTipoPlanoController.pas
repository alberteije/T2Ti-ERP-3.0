unit ErpTipoPlanoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ErpTipoPlano')]
  [MVCPath('/erp-tipo-plano')]
  TErpTipoPlanoController = class(TMVCController)
  public
    [MVCDoc('Returns a list of objects')]
    [MVCPath('/($param)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetList(Context: TWebContext);

  end;

implementation

{ TErpTipoPlanoController }

uses ErpTipoPlanoService, ErpTipoPlanoModel, Commons, Filtro;

procedure TErpTipoPlanoController.GetList(Context: TWebContext);
var
  FilterUrl, FilterWhere: string;
  FilterObj: TFiltro;
begin
  FilterWhere := Context.Request.Params['filter'];
  try
    if FilterWhere = '' then
    begin
      Render<TErpTipoPlanoModel>(TErpTipoPlanoService.GetList);
    end
    else begin
      // define Filter object
      FilterObj := TFiltro.Create(FilterWhere);
      Render<TErpTipoPlanoModel>(TErpTipoPlanoService.GetListFilter(FilterObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Error [GetList ErpTipoPlano] - Exception: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;


end.
