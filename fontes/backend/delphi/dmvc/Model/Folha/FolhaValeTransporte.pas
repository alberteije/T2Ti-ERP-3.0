﻿{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_VALE_TRANSPORTE] 
                                                                                
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
unit FolhaValeTransporte;

interface

uses
  Generics.Collections, System.SysUtils,
  EmpresaTransporte, Colaborador,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFolhaValeTransporte = class(TModelBase)
  private
    FId: Integer;
    FIdEmpresaTransporte: Integer;
    FIdColaborador: Integer;
    FQuantidade: Integer;
      
    FEmpresaTransporte: TEmpresaTransporte;
    FColaborador: TColaborador;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_EMPRESA_TRANSP_ITIN')]
		[MVCNameAsAttribute('idEmpresaTransporte')]
		property IdEmpresaTransporte: Integer read FIdEmpresaTransporte write FIdEmpresaTransporte;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('QUANTIDADE')]
		[MVCNameAsAttribute('quantidade')]
		property Quantidade: Integer read FQuantidade write FQuantidade;
      
    [MVCNameAsAttribute('EmpresaTransporte')]
		property EmpresaTransporte: TEmpresaTransporte read FEmpresaTransporte write FEmpresaTransporte;
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
  end;

implementation

{ TFolhaValeTransporte }

constructor TFolhaValeTransporte.Create;
begin
  inherited;
  FEmpresaTransporte := TEmpresaTransporte.Create;
  FColaborador := TColaborador.Create;
end;

destructor TFolhaValeTransporte.Destroy;
begin
  FreeAndNil(FEmpresaTransporte);
  FreeAndNil(FColaborador);
  inherited;
end;

end.