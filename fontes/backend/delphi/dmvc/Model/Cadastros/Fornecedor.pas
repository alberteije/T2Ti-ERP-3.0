﻿{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [FORNECEDOR] 
                                                                                
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
unit Fornecedor;

interface

uses
  System.SysUtils,
  ViewPessoaFornecedor,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFornecedor = class(TModelBase)
  private
    FId: Integer;
    FIdPessoa: Integer;
    FDesde: TDateTime;
    FDataCadastro: TDateTime;
    FObservacao: string;

    FViewPessoaFornecedor: TViewPessoaFornecedor;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_PESSOA')]
		[MVCNameAsAttribute('idPessoa')]
		property IdPessoa: Integer read FIdPessoa write FIdPessoa;
    [MVCColumnAttribute('DESDE')]
		[MVCNameAsAttribute('desde')]
		property Desde: TDateTime read FDesde write FDesde;
    [MVCColumnAttribute('DATA_CADASTRO')]
		[MVCNameAsAttribute('dataCadastro')]
		property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    [MVCColumnAttribute('OBSERVACAO')]
		[MVCNameAsAttribute('observacao')]
		property Observacao: string read FObservacao write FObservacao;

    [MVCNameAsAttribute('viewPessoaFornecedor')]
  	property ViewPessoaFornecedor: TViewPessoaFornecedor read FViewPessoaFornecedor write FViewPessoaFornecedor;
  end;

implementation

{ TFornecedor }

uses Pessoa;

constructor TFornecedor.Create;
begin
  inherited;
  FViewPessoaFornecedor := TViewPessoaFornecedor.Create;
end;

destructor TFornecedor.Destroy;
begin
  FreeAndNil(FViewPessoaFornecedor);
  inherited;
end;

end.