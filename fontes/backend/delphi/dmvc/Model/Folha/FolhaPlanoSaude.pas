﻿{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PLANO_SAUDE] 
                                                                                
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
unit FolhaPlanoSaude;

interface

uses
  Generics.Collections, System.SysUtils,
  Colaborador, OperadoraPlanoSaude, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFolhaPlanoSaude = class(TModelBase)
  private
    FId: Integer;
    FIdColaborador: Integer;
    FIdOperadoraPlanoSaude: Integer;
    FDataInicio: TDateTime;
    FBeneficiario: string;
      
    FColaborador: TColaborador;
    FOperadoraPlanoSaude: TOperadoraPlanoSaude;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('ID_OPERADORA_PLANO_SAUDE')]
		[MVCNameAsAttribute('idOperadoraPlanoSaude')]
		property IdOperadoraPlanoSaude: Integer read FIdOperadoraPlanoSaude write FIdOperadoraPlanoSaude;
    [MVCColumnAttribute('DATA_INICIO')]
		[MVCNameAsAttribute('dataInicio')]
		property DataInicio: TDateTime read FDataInicio write FDataInicio;
    [MVCColumnAttribute('BENEFICIARIO')]
		[MVCNameAsAttribute('beneficiario')]
		property Beneficiario: string read FBeneficiario write FBeneficiario;
      
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
    [MVCNameAsAttribute('operadoraPlanoSaude')]
		property OperadoraPlanoSaude: TOperadoraPlanoSaude read FOperadoraPlanoSaude write FOperadoraPlanoSaude;
  end;

implementation

{ TFolhaPlanoSaude }

constructor TFolhaPlanoSaude.Create;
begin
  inherited;
  FColaborador := TColaborador.Create;
  FOperadoraPlanoSaude := TOperadoraPlanoSaude.Create;
end;

destructor TFolhaPlanoSaude.Destroy;
begin
  FreeAndNil(FColaborador);
  FreeAndNil(FOperadoraPlanoSaude);
  inherited;
end;

end.