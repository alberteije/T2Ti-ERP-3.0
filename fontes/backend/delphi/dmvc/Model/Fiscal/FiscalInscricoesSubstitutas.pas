﻿{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FISCAL_INSCRICOES_SUBSTITUTAS] 
                                                                                
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
unit FiscalInscricoesSubstitutas;

interface

uses
  Generics.Collections, System.SysUtils,
  FiscalParametro,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFiscalInscricoesSubstitutas = class(TModelBase)
  private
    FId: Integer;
    FIdFiscalParametros: Integer;
    FUf: string;
    FInscricaoEstadual: string;
    FPmpf: string;
      
    FFiscalParametro: TFiscalParametro;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_FISCAL_PARAMETROS')]
		[MVCNameAsAttribute('idFiscalParametros')]
		property IdFiscalParametros: Integer read FIdFiscalParametros write FIdFiscalParametros;
    [MVCColumnAttribute('UF')]
		[MVCNameAsAttribute('uf')]
		property Uf: string read FUf write FUf;
    [MVCColumnAttribute('INSCRICAO_ESTADUAL')]
		[MVCNameAsAttribute('inscricaoEstadual')]
		property InscricaoEstadual: string read FInscricaoEstadual write FInscricaoEstadual;
    [MVCColumnAttribute('PMPF')]
		[MVCNameAsAttribute('pmpf')]
		property Pmpf: string read FPmpf write FPmpf;
      
    [MVCNameAsAttribute('fiscalParametros')]
		property FiscalParametros: TFiscalParametro read FFiscalParametro write FFiscalParametro;
  end;

implementation

{ TFiscalInscricoesSubstitutas }

constructor TFiscalInscricoesSubstitutas.Create;
begin
  inherited;
  FFiscalParametro := TFiscalParametro.Create;
end;

destructor TFiscalInscricoesSubstitutas.Destroy;
begin
  FreeAndNil(FFiscalParametro);
  inherited;
end;

end.