{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TABELA_PRECO_PRODUTO] 
                                                                                
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
unit TabelaPrecoProduto;

interface

uses
  Generics.Collections, System.SysUtils,
  Produto, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TTabelaPrecoProduto = class(TModelBase)
  private
    FId: Integer;
    FIdTabelaPreco: Integer;
    FIdProduto: Integer;
    FPreco: Extended;
      
    FProduto: TProduto;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_TABELA_PRECO')]
		[MVCNameAsAttribute('idTabelaPreco')]
		property IdTabelaPreco: Integer read FIdTabelaPreco write FIdTabelaPreco;
    [MVCColumnAttribute('ID_PRODUTO')]
		[MVCNameAsAttribute('idProduto')]
		property IdProduto: Integer read FIdProduto write FIdProduto;
    [MVCColumnAttribute('PRECO')]
		[MVCNameAsAttribute('preco')]
		property Preco: Extended read FPreco write FPreco;
      
    [MVCNameAsAttribute('produto')]
		property Produto: TProduto read FProduto write FProduto;
  end;

implementation

{ TTabelaPrecoProduto }

constructor TTabelaPrecoProduto.Create;
begin
  inherited;

  FProduto := TProduto.Create;
end;

destructor TTabelaPrecoProduto.Destroy;
begin
  FreeAndNil(FProduto);
  inherited;
end;



end.