{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [INVENTARIO_CONTAGEM_DET] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
unit InventarioContagemDet;

interface

uses
  Generics.Collections, System.SysUtils,
  Produto, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TInventarioContagemDet = class(TModelBase)
  private
    FId: Integer;
    FIdInventarioContagemCab: Integer;
    FIdProduto: Integer;
    FContagem01: Extended;
    FContagem02: Extended;
    FContagem03: Extended;
    FFechadoContagem: string;
    FQuantidadeSistema: Extended;
    FAcuracidade: Extended;
    FDivergencia: Extended;
      
    FProduto: TProduto;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_INVENTARIO_CONTAGEM_CAB')]
		[MVCNameAsAttribute('idInventarioContagemCab')]
		property IdInventarioContagemCab: Integer read FIdInventarioContagemCab write FIdInventarioContagemCab;
    [MVCColumnAttribute('ID_PRODUTO')]
		[MVCNameAsAttribute('idProduto')]
		property IdProduto: Integer read FIdProduto write FIdProduto;
    [MVCColumnAttribute('CONTAGEM01')]
		[MVCNameAsAttribute('contagem01')]
		property Contagem01: Extended read FContagem01 write FContagem01;
    [MVCColumnAttribute('CONTAGEM02')]
		[MVCNameAsAttribute('contagem02')]
		property Contagem02: Extended read FContagem02 write FContagem02;
    [MVCColumnAttribute('CONTAGEM03')]
		[MVCNameAsAttribute('contagem03')]
		property Contagem03: Extended read FContagem03 write FContagem03;
    [MVCColumnAttribute('FECHADO_CONTAGEM')]
		[MVCNameAsAttribute('fechadoContagem')]
		property FechadoContagem: string read FFechadoContagem write FFechadoContagem;
    [MVCColumnAttribute('QUANTIDADE_SISTEMA')]
		[MVCNameAsAttribute('quantidadeSistema')]
		property QuantidadeSistema: Extended read FQuantidadeSistema write FQuantidadeSistema;
    [MVCColumnAttribute('ACURACIDADE')]
		[MVCNameAsAttribute('acuracidade')]
		property Acuracidade: Extended read FAcuracidade write FAcuracidade;
    [MVCColumnAttribute('DIVERGENCIA')]
		[MVCNameAsAttribute('divergencia')]
		property Divergencia: Extended read FDivergencia write FDivergencia;
      
    [MVCNameAsAttribute('produto')]
		property Produto: TProduto read FProduto write FProduto;
  end;

implementation

{ TInventarioContagemDet }

constructor TInventarioContagemDet.Create;
begin
  inherited;
  FProduto := TProduto.Create;
end;

destructor TInventarioContagemDet.Destroy;
begin
  FreeAndNil(FProduto);
  inherited;
end;

end.