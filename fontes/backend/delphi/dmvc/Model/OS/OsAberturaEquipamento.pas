{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [OS_ABERTURA_EQUIPAMENTO] 
                                                                                
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
unit OsAberturaEquipamento;

interface

uses
  Generics.Collections, System.SysUtils,
  OsEquipamento, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TOsAberturaEquipamento = class(TModelBase)
  private
    FId: Integer;
    FIdOsEquipamento: Integer;
    FIdOsAbertura: Integer;
    FNumeroSerie: string;
    FTipoCobertura: string;
      
    FOsEquipamento: TOsEquipamento;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_OS_EQUIPAMENTO')]
		[MVCNameAsAttribute('idOsEquipamento')]
		property IdOsEquipamento: Integer read FIdOsEquipamento write FIdOsEquipamento;
    [MVCColumnAttribute('ID_OS_ABERTURA')]
		[MVCNameAsAttribute('idOsAbertura')]
		property IdOsAbertura: Integer read FIdOsAbertura write FIdOsAbertura;
    [MVCColumnAttribute('NUMERO_SERIE')]
		[MVCNameAsAttribute('numeroSerie')]
		property NumeroSerie: string read FNumeroSerie write FNumeroSerie;
    [MVCColumnAttribute('TIPO_COBERTURA')]
		[MVCNameAsAttribute('tipoCobertura')]
		property TipoCobertura: string read FTipoCobertura write FTipoCobertura;
      
    [MVCNameAsAttribute('osEquipamento')]
		property OsEquipamento: TOsEquipamento read FOsEquipamento write FOsEquipamento;
  end;

implementation

{ TOsAberturaEquipamento }

constructor TOsAberturaEquipamento.Create;
begin
  inherited;

  FOsEquipamento := TOsEquipamento.Create;
end;

destructor TOsAberturaEquipamento.Destroy;
begin
  FreeAndNil(FOsEquipamento);
  inherited;
end;



end.