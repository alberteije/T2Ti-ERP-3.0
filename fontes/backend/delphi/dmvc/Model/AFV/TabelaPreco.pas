{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TABELA_PRECO] 
                                                                                
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
unit TabelaPreco;

interface

uses
  Generics.Collections, System.SysUtils,
  TabelaPrecoProduto, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TTabelaPreco = class(TModelBase)
  private
    FId: Integer;
    FNome: string;
    FPrincipal: string;
    FCoeficiente: Extended;
      
    FListaTabelaPrecoProduto: TObjectList<TTabelaPrecoProduto>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('PRINCIPAL')]
		[MVCNameAsAttribute('principal')]
		property Principal: string read FPrincipal write FPrincipal;
    [MVCColumnAttribute('COEFICIENTE')]
		[MVCNameAsAttribute('coeficiente')]
		property Coeficiente: Extended read FCoeficiente write FCoeficiente;
      
    [MapperListOf(TTabelaPrecoProduto)]
	[MVCNameAsAttribute('listaTabelaPrecoProduto')]
	property ListaTabelaPrecoProduto: TObjectList<TTabelaPrecoProduto> read FListaTabelaPrecoProduto write FListaTabelaPrecoProduto;
  end;

implementation

{ TTabelaPreco }

constructor TTabelaPreco.Create;
begin
  inherited;

  FListaTabelaPrecoProduto := TObjectList<TTabelaPrecoProduto>.Create;
end;

destructor TTabelaPreco.Destroy;
begin
  FreeAndNil(FListaTabelaPrecoProduto);
  inherited;
end;

end.