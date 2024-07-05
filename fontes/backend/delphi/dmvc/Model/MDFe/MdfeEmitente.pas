{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_EMITENTE] 
                                                                                
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
unit MdfeEmitente;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TMdfeEmitente = class(TModelBase)
  private
    FId: Integer;
    FIdMdfeCabecalho: Integer;
    FNome: string;
    FFantasia: string;
    FCnpj: string;
    FIe: Integer;
    FLogradouro: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCodigoMunicipio: string;
    FNomeMunicipio: string;
    FCep: string;
    FUf: string;
    FTelefone: string;
    FEmail: string;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_MDFE_CABECALHO')]
		[MVCNameAsAttribute('idMdfeCabecalho')]
		property IdMdfeCabecalho: Integer read FIdMdfeCabecalho write FIdMdfeCabecalho;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('FANTASIA')]
		[MVCNameAsAttribute('fantasia')]
		property Fantasia: string read FFantasia write FFantasia;
    [MVCColumnAttribute('CNPJ')]
		[MVCNameAsAttribute('cnpj')]
		property Cnpj: string read FCnpj write FCnpj;
    [MVCColumnAttribute('IE')]
		[MVCNameAsAttribute('ie')]
		property Ie: Integer read FIe write FIe;
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
    [MVCColumnAttribute('CODIGO_MUNICIPIO')]
		[MVCNameAsAttribute('codigoMunicipio')]
		property CodigoMunicipio: string read FCodigoMunicipio write FCodigoMunicipio;
    [MVCColumnAttribute('NOME_MUNICIPIO')]
		[MVCNameAsAttribute('nomeMunicipio')]
		property NomeMunicipio: string read FNomeMunicipio write FNomeMunicipio;
    [MVCColumnAttribute('CEP')]
		[MVCNameAsAttribute('cep')]
		property Cep: string read FCep write FCep;
    [MVCColumnAttribute('UF')]
		[MVCNameAsAttribute('uf')]
		property Uf: string read FUf write FUf;
    [MVCColumnAttribute('TELEFONE')]
		[MVCNameAsAttribute('telefone')]
		property Telefone: string read FTelefone write FTelefone;
    [MVCColumnAttribute('EMAIL')]
		[MVCNameAsAttribute('email')]
		property Email: string read FEmail write FEmail;
      
  end;

implementation

{ TMdfeEmitente }



end.