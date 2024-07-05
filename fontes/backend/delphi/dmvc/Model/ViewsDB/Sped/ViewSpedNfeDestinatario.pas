{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_NFE_DESTINATARIO] 
                                                                                
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
unit ViewSpedNfeDestinatario;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TViewSpedNfeDestinatario = class(TModelBase)
  private
    FId: Integer;
    FNome: string;
    FCpf: string;
    FCnpj: string;
    FInscricaoEstadual: string;
    FCodigoMunicipio: Integer;
    FSuframa: Integer;
    FLogradouro: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('CPF')]
		[MVCNameAsAttribute('cpf')]
		property Cpf: string read FCpf write FCpf;
    [MVCColumnAttribute('CNPJ')]
		[MVCNameAsAttribute('cnpj')]
		property Cnpj: string read FCnpj write FCnpj;
    [MVCColumnAttribute('INSCRICAO_ESTADUAL')]
		[MVCNameAsAttribute('inscricaoEstadual')]
		property InscricaoEstadual: string read FInscricaoEstadual write FInscricaoEstadual;
    [MVCColumnAttribute('CODIGO_MUNICIPIO')]
		[MVCNameAsAttribute('codigoMunicipio')]
		property CodigoMunicipio: Integer read FCodigoMunicipio write FCodigoMunicipio;
    [MVCColumnAttribute('SUFRAMA')]
		[MVCNameAsAttribute('suframa')]
		property Suframa: Integer read FSuframa write FSuframa;
    [MVCColumnAttribute('LOGRADOURO')]
		[MVCNameAsAttribute('logradouro')]
		property Logradouro: string read FLogradouro write FLogradouro;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('COMPLEMENTO')]
		[MVCNameAsAttribute('complemento')]
		property Complemento: string read FComplemento write FComplemento;
    [MVCColumnAttribute('BAIRRO')]
		[MVCNameAsAttribute('bairro')]
		property Bairro: string read FBairro write FBairro;
      
  end;

implementation

{ TViewSpedNfeDestinatario }





end.