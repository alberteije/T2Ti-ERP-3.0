{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_INFORMACAO_SEGURO] 
                                                                                
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
unit MdfeInformacaoSeguro;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TMdfeInformacaoSeguro = class(TModelBase)
  private
    FId: Integer;
    FIdMdfeCabecalho: Integer;
    FResponsavel: Integer;
    FCnpjCpf: string;
    FSeguradora: string;
    FCnpjSeguradora: string;
    FApolice: string;
    FAverbacao: string;
      
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
    [MVCColumnAttribute('RESPONSAVEL')]
		[MVCNameAsAttribute('responsavel')]
		property Responsavel: Integer read FResponsavel write FResponsavel;
    [MVCColumnAttribute('CNPJ_CPF')]
		[MVCNameAsAttribute('cnpjCpf')]
		property CnpjCpf: string read FCnpjCpf write FCnpjCpf;
    [MVCColumnAttribute('SEGURADORA')]
		[MVCNameAsAttribute('seguradora')]
		property Seguradora: string read FSeguradora write FSeguradora;
    [MVCColumnAttribute('CNPJ_SEGURADORA')]
		[MVCNameAsAttribute('cnpjSeguradora')]
		property CnpjSeguradora: string read FCnpjSeguradora write FCnpjSeguradora;
    [MVCColumnAttribute('APOLICE')]
		[MVCNameAsAttribute('apolice')]
		property Apolice: string read FApolice write FApolice;
    [MVCColumnAttribute('AVERBACAO')]
		[MVCNameAsAttribute('averbacao')]
		property Averbacao: string read FAverbacao write FAverbacao;
      
  end;

implementation

{ TMdfeInformacaoSeguro }



end.