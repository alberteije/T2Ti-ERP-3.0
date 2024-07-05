{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NOTA_FISCAL_TIPO] 
                                                                                
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
unit NotaFiscalTipo;

interface

uses
  Generics.Collections, System.SysUtils,
  NotaFiscalModelo, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNotaFiscalTipo = class(TModelBase)
  private
    FId: Integer;
    FIdNotaFiscalModelo: Integer;
    FNome: string;
    FDescricao: string;
    FSerie: string;
    FSerieScan: string;
    FUltimoNumero: Integer;
      
    FNotaFiscalModelo: TNotaFiscalModelo;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NOTA_FISCAL_MODELO')]
		[MVCNameAsAttribute('idNotaFiscalModelo')]
		property IdNotaFiscalModelo: Integer read FIdNotaFiscalModelo write FIdNotaFiscalModelo;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
    [MVCColumnAttribute('SERIE')]
		[MVCNameAsAttribute('serie')]
		property Serie: string read FSerie write FSerie;
    [MVCColumnAttribute('SERIE_SCAN')]
		[MVCNameAsAttribute('serieScan')]
		property SerieScan: string read FSerieScan write FSerieScan;
    [MVCColumnAttribute('ULTIMO_NUMERO')]
		[MVCNameAsAttribute('ultimoNumero')]
		property UltimoNumero: Integer read FUltimoNumero write FUltimoNumero;
      
    [MVCNameAsAttribute('notaFiscalModelo')]
		property NotaFiscalModelo: TNotaFiscalModelo read FNotaFiscalModelo write FNotaFiscalModelo;
  end;

implementation

{ TNotaFiscalTipo }

constructor TNotaFiscalTipo.Create;
begin
  inherited;

  FNotaFiscalModelo := TNotaFiscalModelo.Create;
end;

destructor TNotaFiscalTipo.Destroy;
begin
  FreeAndNil(FNotaFiscalModelo);
  inherited;
end;



end.