{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [NFE_DETALHE] 
                                                                                
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
unit NfeDetalheService;

interface

uses
  NfeDetalhe, NfeDeclaracaoImportacao, NfeDetEspecificoArmamento, NfeDetEspecificoCombustivel, NfeDetEspecificoMedicamento, NfeDetEspecificoVeiculo, NfeDetalheImpostoCofins, NfeDetalheImpostoCofinsSt, NfeDetalheImpostoIcms, NfeDetalheImpostoIcmsUfdest, NfeDetalheImpostoIi, NfeDetalheImpostoIpi, NfeDetalheImpostoIssqn, NfeDetalheImpostoPis, NfeDetalheImpostoPisSt, NfeExportacao, NfeItemRastreado, Produto, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TNfeDetalheService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaNfeDetalhe: TObjectList<TNfeDetalhe>); overload;
    class procedure InserirObjetosFilhos(ANfeDetalhe: TNfeDetalhe);
  public
    class function ConsultarLista: TObjectList<TNfeDetalhe>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TNfeDetalhe>;
    class function ConsultarObjeto(AId: Integer): TNfeDetalhe;
    class procedure Inserir(ANfeDetalhe: TNfeDetalhe);
    class function Alterar(ANfeDetalhe: TNfeDetalhe): Integer;
    class function Excluir(ANfeDetalhe: TNfeDetalhe): Integer;

    // 20200623 - EIJE - movido de private para public para permitir a chamada a partir do NfeCabecalhoService
    class procedure AnexarObjetosVinculados(ANfeDetalhe: TNfeDetalhe); overload;
    class procedure ExcluirObjetosFilhos(ANfeDetalhe: TNfeDetalhe);
  end;

var
  sql: string;


implementation

{ TNfeDetalheService }

class procedure TNfeDetalheService.AnexarObjetosVinculados(ANfeDetalhe: TNfeDetalhe);
begin
  // NfeDeclaracaoImportacao
  sql := 'SELECT * FROM NFE_DECLARACAO_IMPORTACAO WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.ListaNfeDeclaracaoImportacao := GetQuery(sql).AsObjectList<TNfeDeclaracaoImportacao>;

  // NfeDetEspecificoArmamento
  sql := 'SELECT * FROM NFE_DET_ESPECIFICO_ARMAMENTO WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.ListaNfeDetEspecificoArmamento := GetQuery(sql).AsObjectList<TNfeDetEspecificoArmamento>;

  // NfeDetEspecificoCombustivel
  sql := 'SELECT * FROM NFE_DET_ESPECIFICO_COMBUSTIVEL WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetEspecificoCombustivel := GetQuery(sql).AsObject<TNfeDetEspecificoCombustivel>;

  // NfeDetEspecificoMedicamento
  sql := 'SELECT * FROM NFE_DET_ESPECIFICO_MEDICAMENTO WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetEspecificoMedicamento := GetQuery(sql).AsObject<TNfeDetEspecificoMedicamento>;

  // NfeDetEspecificoVeiculo
  sql := 'SELECT * FROM NFE_DET_ESPECIFICO_VEICULO WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetEspecificoVeiculo := GetQuery(sql).AsObject<TNfeDetEspecificoVeiculo>;

  // NfeDetalheImpostoCofins
  sql := 'SELECT * FROM NFE_DETALHE_IMPOSTO_COFINS WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetalheImpostoCofins := GetQuery(sql).AsObject<TNfeDetalheImpostoCofins>;

  // NfeDetalheImpostoCofinsSt
  sql := 'SELECT * FROM NFE_DETALHE_IMPOSTO_COFINS_ST WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetalheImpostoCofinsSt := GetQuery(sql).AsObject<TNfeDetalheImpostoCofinsSt>;

  // NfeDetalheImpostoIcms
  sql := 'SELECT * FROM NFE_DETALHE_IMPOSTO_ICMS WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetalheImpostoIcms := GetQuery(sql).AsObject<TNfeDetalheImpostoIcms>;

  // NfeDetalheImpostoIcmsUfdest
  sql := 'SELECT * FROM NFE_DETALHE_IMPOSTO_ICMS_UFDEST WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetalheImpostoIcmsUfdest := GetQuery(sql).AsObject<TNfeDetalheImpostoIcmsUfdest>;

  // NfeDetalheImpostoIi
  sql := 'SELECT * FROM NFE_DETALHE_IMPOSTO_II WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetalheImpostoIi := GetQuery(sql).AsObject<TNfeDetalheImpostoIi>;

  // NfeDetalheImpostoIpi
  sql := 'SELECT * FROM NFE_DETALHE_IMPOSTO_IPI WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetalheImpostoIpi := GetQuery(sql).AsObject<TNfeDetalheImpostoIpi>;

  // NfeDetalheImpostoIssqn
  sql := 'SELECT * FROM NFE_DETALHE_IMPOSTO_ISSQN WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetalheImpostoIssqn := GetQuery(sql).AsObject<TNfeDetalheImpostoIssqn>;

  // NfeDetalheImpostoPis
  sql := 'SELECT * FROM NFE_DETALHE_IMPOSTO_PIS WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetalheImpostoPis := GetQuery(sql).AsObject<TNfeDetalheImpostoPis>;

  // NfeDetalheImpostoPisSt
  sql := 'SELECT * FROM NFE_DETALHE_IMPOSTO_PIS_ST WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.NfeDetalheImpostoPisSt := GetQuery(sql).AsObject<TNfeDetalheImpostoPisSt>;

  // NfeExportacao
  sql := 'SELECT * FROM NFE_EXPORTACAO WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.ListaNfeExportacao := GetQuery(sql).AsObjectList<TNfeExportacao>;

  // NfeItemRastreado
  sql := 'SELECT * FROM NFE_ITEM_RASTREADO WHERE ID_NFE_DETALHE = ' + ANfeDetalhe.Id.ToString;
  ANfeDetalhe.ListaNfeItemRastreado := GetQuery(sql).AsObjectList<TNfeItemRastreado>;

  // Produto
  sql := 'SELECT * FROM PRODUTO WHERE ID = ' + ANfeDetalhe.IdProduto.ToString;
  ANfeDetalhe.Produto := GetQuery(sql).AsObject<TProduto>;

end;

class procedure TNfeDetalheService.AnexarObjetosVinculados(AListaNfeDetalhe: TObjectList<TNfeDetalhe>);
var
  NfeDetalhe: TNfeDetalhe;
begin
  for NfeDetalhe in AListaNfeDetalhe do
  begin
    AnexarObjetosVinculados(NfeDetalhe);
  end;
end;

class function TNfeDetalheService.ConsultarLista: TObjectList<TNfeDetalhe>;
begin
  sql := 'SELECT * FROM NFE_DETALHE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TNfeDetalhe>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNfeDetalheService.ConsultarListaFiltro(AWhere: string): TObjectList<TNfeDetalhe>;
begin
  sql := 'SELECT * FROM NFE_DETALHE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TNfeDetalhe>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNfeDetalheService.ConsultarObjeto(AId: Integer): TNfeDetalhe;
begin
  sql := 'SELECT * FROM NFE_DETALHE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TNfeDetalhe>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TNfeDetalheService.Inserir(ANfeDetalhe: TNfeDetalhe);
begin
  ANfeDetalhe.ValidarInsercao;
  ANfeDetalhe.Id := InserirBase(ANfeDetalhe, 'NFE_DETALHE');
  InserirObjetosFilhos(ANfeDetalhe);
end;

class function TNfeDetalheService.Alterar(ANfeDetalhe: TNfeDetalhe): Integer;
begin
  ANfeDetalhe.ValidarAlteracao;
  Result := AlterarBase(ANfeDetalhe, 'NFE_DETALHE');
  ExcluirObjetosFilhos(ANfeDetalhe);
  InserirObjetosFilhos(ANfeDetalhe);
end;

class procedure TNfeDetalheService.InserirObjetosFilhos(ANfeDetalhe: TNfeDetalhe);
var
  NfeDeclaracaoImportacao: TNfeDeclaracaoImportacao;
  NfeDetEspecificoArmamento: TNfeDetEspecificoArmamento;
  NfeExportacao: TNfeExportacao;
  NfeItemRastreado: TNfeItemRastreado;
begin
  // NfeDeclaracaoImportacao
  for NfeDeclaracaoImportacao in ANfeDetalhe.ListaNfeDeclaracaoImportacao do
  begin
    NfeDeclaracaoImportacao.IdNfeDetalhe := ANfeDetalhe.Id;
    InserirBase(NfeDeclaracaoImportacao, 'NFE_DECLARACAO_IMPORTACAO');
  end;

  // NfeDetEspecificoArmamento
  for NfeDetEspecificoArmamento in ANfeDetalhe.ListaNfeDetEspecificoArmamento do
  begin
    NfeDetEspecificoArmamento.IdNfeDetalhe := ANfeDetalhe.Id;
    InserirBase(NfeDetEspecificoArmamento, 'NFE_DET_ESPECIFICO_ARMAMENTO');
  end;

  // NfeDetEspecificoCombustivel
  ANfeDetalhe.NfeDetEspecificoCombustivel.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetEspecificoCombustivel, 'NFE_DET_ESPECIFICO_COMBUSTIVEL');

  // NfeDetEspecificoMedicamento
  ANfeDetalhe.NfeDetEspecificoMedicamento.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetEspecificoMedicamento, 'NFE_DET_ESPECIFICO_MEDICAMENTO');

  // NfeDetEspecificoVeiculo
  ANfeDetalhe.NfeDetEspecificoVeiculo.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetEspecificoVeiculo, 'NFE_DET_ESPECIFICO_VEICULO');

  // NfeDetalheImpostoCofins
  ANfeDetalhe.NfeDetalheImpostoCofins.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetalheImpostoCofins, 'NFE_DETALHE_IMPOSTO_COFINS');

  // NfeDetalheImpostoCofinsSt
  ANfeDetalhe.NfeDetalheImpostoCofinsSt.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetalheImpostoCofinsSt, 'NFE_DETALHE_IMPOSTO_COFINS_ST');

  // NfeDetalheImpostoIcms
  ANfeDetalhe.NfeDetalheImpostoIcms.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetalheImpostoIcms, 'NFE_DETALHE_IMPOSTO_ICMS');

  // NfeDetalheImpostoIcmsUfdest
  ANfeDetalhe.NfeDetalheImpostoIcmsUfdest.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetalheImpostoIcmsUfdest, 'NFE_DETALHE_IMPOSTO_ICMS_UFDEST');

  // NfeDetalheImpostoIi
  ANfeDetalhe.NfeDetalheImpostoIi.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetalheImpostoIi, 'NFE_DETALHE_IMPOSTO_II');

  // NfeDetalheImpostoIpi
  ANfeDetalhe.NfeDetalheImpostoIpi.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetalheImpostoIpi, 'NFE_DETALHE_IMPOSTO_IPI');

  // NfeDetalheImpostoIssqn
  ANfeDetalhe.NfeDetalheImpostoIssqn.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetalheImpostoIssqn, 'NFE_DETALHE_IMPOSTO_ISSQN');

  // NfeDetalheImpostoPis
  ANfeDetalhe.NfeDetalheImpostoPis.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetalheImpostoPis, 'NFE_DETALHE_IMPOSTO_PIS');

  // NfeDetalheImpostoPisSt
  ANfeDetalhe.NfeDetalheImpostoPisSt.IdNfeDetalhe := ANfeDetalhe.Id;
  InserirBase(ANfeDetalhe.NfeDetalheImpostoPisSt, 'NFE_DETALHE_IMPOSTO_PIS_ST');

  // NfeExportacao
  for NfeExportacao in ANfeDetalhe.ListaNfeExportacao do
  begin
    NfeExportacao.IdNfeDetalhe := ANfeDetalhe.Id;
    InserirBase(NfeExportacao, 'NFE_EXPORTACAO');
  end;

  // NfeItemRastreado
  for NfeItemRastreado in ANfeDetalhe.ListaNfeItemRastreado do
  begin
    NfeItemRastreado.IdNfeDetalhe := ANfeDetalhe.Id;
    InserirBase(NfeItemRastreado, 'NFE_ITEM_RASTREADO');
  end;

end;

class function TNfeDetalheService.Excluir(ANfeDetalhe: TNfeDetalhe): Integer;
begin
  ANfeDetalhe.ValidarExclusao;
  ExcluirObjetosFilhos(ANfeDetalhe);
  Result := ExcluirBase(ANfeDetalhe.Id, 'NFE_DETALHE');
end;

class procedure TNfeDetalheService.ExcluirObjetosFilhos(ANfeDetalhe: TNfeDetalhe);
begin
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DECLARACAO_IMPORTACAO', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DET_ESPECIFICO_ARMAMENTO', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DET_ESPECIFICO_COMBUSTIVEL', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DET_ESPECIFICO_MEDICAMENTO', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DET_ESPECIFICO_VEICULO', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DETALHE_IMPOSTO_COFINS', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DETALHE_IMPOSTO_COFINS_ST', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DETALHE_IMPOSTO_ICMS', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DETALHE_IMPOSTO_ICMS_UFDEST', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DETALHE_IMPOSTO_II', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DETALHE_IMPOSTO_IPI', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DETALHE_IMPOSTO_ISSQN', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DETALHE_IMPOSTO_PIS', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_DETALHE_IMPOSTO_PIS_ST', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_EXPORTACAO', 'ID_NFE_DETALHE');
  ExcluirFilho(ANfeDetalhe.Id, 'NFE_ITEM_RASTREADO', 'ID_NFE_DETALHE');
end;

end.
