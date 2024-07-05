{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [SINDICATO] 
                                                                                
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
unit Sindicato;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TSindicato = class(TModelBase)
  private
    FId: Integer;
    FNome: string;
    FCodigoBanco: Integer;
    FCodigoAgencia: Integer;
    FContaBanco: string;
    FCodigoCedente: string;
    FLogradouro: string;
    FNumero: string;
    FBairro: string;
    FMunicipioIbge: Integer;
    FUf: string;
    FFone1: string;
    FFone2: string;
    FEmail: string;
    FTipoSindicato: string;
    FDataBase: TDateTime;
    FPisoSalarial: Extended;
    FCnpj: string;
    FClassificacaoContabilConta: string;
      
  public
    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('CODIGO_BANCO')]
		[MVCNameAsAttribute('codigoBanco')]
		property CodigoBanco: Integer read FCodigoBanco write FCodigoBanco;
    [MVCColumnAttribute('CODIGO_AGENCIA')]
		[MVCNameAsAttribute('codigoAgencia')]
		property CodigoAgencia: Integer read FCodigoAgencia write FCodigoAgencia;
    [MVCColumnAttribute('CONTA_BANCO')]
		[MVCNameAsAttribute('contaBanco')]
		property ContaBanco: string read FContaBanco write FContaBanco;
    [MVCColumnAttribute('CODIGO_CEDENTE')]
		[MVCNameAsAttribute('codigoCedente')]
		property CodigoCedente: string read FCodigoCedente write FCodigoCedente;
    [MVCColumnAttribute('LOGRADOURO')]
		[MVCNameAsAttribute('logradouro')]
		property Logradouro: string read FLogradouro write FLogradouro;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('BAIRRO')]
		[MVCNameAsAttribute('bairro')]
		property Bairro: string read FBairro write FBairro;
    [MVCColumnAttribute('MUNICIPIO_IBGE')]
		[MVCNameAsAttribute('municipioIbge')]
		property MunicipioIbge: Integer read FMunicipioIbge write FMunicipioIbge;
    [MVCColumnAttribute('UF')]
		[MVCNameAsAttribute('uf')]
		property Uf: string read FUf write FUf;
    [MVCColumnAttribute('FONE1')]
		[MVCNameAsAttribute('fone1')]
		property Fone1: string read FFone1 write FFone1;
    [MVCColumnAttribute('FONE2')]
		[MVCNameAsAttribute('fone2')]
		property Fone2: string read FFone2 write FFone2;
    [MVCColumnAttribute('EMAIL')]
		[MVCNameAsAttribute('email')]
		property Email: string read FEmail write FEmail;
    [MVCColumnAttribute('TIPO_SINDICATO')]
		[MVCNameAsAttribute('tipoSindicato')]
		property TipoSindicato: string read FTipoSindicato write FTipoSindicato;
    [MVCColumnAttribute('DATA_BASE')]
		[MVCNameAsAttribute('dataBase')]
		property DataBase: TDateTime read FDataBase write FDataBase;
    [MVCColumnAttribute('PISO_SALARIAL')]
		[MVCNameAsAttribute('pisoSalarial')]
		property PisoSalarial: Extended read FPisoSalarial write FPisoSalarial;
    [MVCColumnAttribute('CNPJ')]
		[MVCNameAsAttribute('cnpj')]
		property Cnpj: string read FCnpj write FCnpj;
    [MVCColumnAttribute('CLASSIFICACAO_CONTABIL_CONTA')]
		[MVCNameAsAttribute('classificacaoContabilConta')]
		property ClassificacaoContabilConta: string read FClassificacaoContabilConta write FClassificacaoContabilConta;
      
  end;

implementation

{ TSindicato }



end.