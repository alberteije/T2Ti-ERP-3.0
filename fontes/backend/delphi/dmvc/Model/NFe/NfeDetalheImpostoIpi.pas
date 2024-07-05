{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_IPI] 
                                                                                
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
unit NfeDetalheImpostoIpi;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetalheImpostoIpi = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FCnpjProdutor: string;
    FCodigoSeloIpi: string;
    FQuantidadeSeloIpi: Integer;
    FEnquadramentoLegalIpi: string;
    FCstIpi: string;
    FValorBaseCalculoIpi: Extended;
    FQuantidadeUnidadeTributavel: Extended;
    FValorUnidadeTributavel: Extended;
    FAliquotaIpi: Extended;
    FValorIpi: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('CNPJ_PRODUTOR')]
		[MVCNameAsAttribute('cnpjProdutor')]
		property CnpjProdutor: string read FCnpjProdutor write FCnpjProdutor;
    [MVCColumnAttribute('CODIGO_SELO_IPI')]
		[MVCNameAsAttribute('codigoSeloIpi')]
		property CodigoSeloIpi: string read FCodigoSeloIpi write FCodigoSeloIpi;
    [MVCColumnAttribute('QUANTIDADE_SELO_IPI')]
		[MVCNameAsAttribute('quantidadeSeloIpi')]
		property QuantidadeSeloIpi: Integer read FQuantidadeSeloIpi write FQuantidadeSeloIpi;
    [MVCColumnAttribute('ENQUADRAMENTO_LEGAL_IPI')]
		[MVCNameAsAttribute('enquadramentoLegalIpi')]
		property EnquadramentoLegalIpi: string read FEnquadramentoLegalIpi write FEnquadramentoLegalIpi;
    [MVCColumnAttribute('CST_IPI')]
		[MVCNameAsAttribute('cstIpi')]
		property CstIpi: string read FCstIpi write FCstIpi;
    [MVCColumnAttribute('VALOR_BASE_CALCULO_IPI')]
		[MVCNameAsAttribute('valorBaseCalculoIpi')]
		property ValorBaseCalculoIpi: Extended read FValorBaseCalculoIpi write FValorBaseCalculoIpi;
    [MVCColumnAttribute('QUANTIDADE_UNIDADE_TRIBUTAVEL')]
		[MVCNameAsAttribute('quantidadeUnidadeTributavel')]
		property QuantidadeUnidadeTributavel: Extended read FQuantidadeUnidadeTributavel write FQuantidadeUnidadeTributavel;
    [MVCColumnAttribute('VALOR_UNIDADE_TRIBUTAVEL')]
		[MVCNameAsAttribute('valorUnidadeTributavel')]
		property ValorUnidadeTributavel: Extended read FValorUnidadeTributavel write FValorUnidadeTributavel;
    [MVCColumnAttribute('ALIQUOTA_IPI')]
		[MVCNameAsAttribute('aliquotaIpi')]
		property AliquotaIpi: Extended read FAliquotaIpi write FAliquotaIpi;
    [MVCColumnAttribute('VALOR_IPI')]
		[MVCNameAsAttribute('valorIpi')]
		property ValorIpi: Extended read FValorIpi write FValorIpi;
      
  end;

implementation

{ TNfeDetalheImpostoIpi }





end.