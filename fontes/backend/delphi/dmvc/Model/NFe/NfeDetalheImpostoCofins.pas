{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_COFINS] 
                                                                                
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
unit NfeDetalheImpostoCofins;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetalheImpostoCofins = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FCstCofins: string;
    FBaseCalculoCofins: Extended;
    FAliquotaCofinsPercentual: Extended;
    FQuantidadeVendida: Extended;
    FAliquotaCofinsReais: Extended;
    FValorCofins: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('CST_COFINS')]
		[MVCNameAsAttribute('cstCofins')]
		property CstCofins: string read FCstCofins write FCstCofins;
    [MVCColumnAttribute('BASE_CALCULO_COFINS')]
		[MVCNameAsAttribute('baseCalculoCofins')]
		property BaseCalculoCofins: Extended read FBaseCalculoCofins write FBaseCalculoCofins;
    [MVCColumnAttribute('ALIQUOTA_COFINS_PERCENTUAL')]
		[MVCNameAsAttribute('aliquotaCofinsPercentual')]
		property AliquotaCofinsPercentual: Extended read FAliquotaCofinsPercentual write FAliquotaCofinsPercentual;
    [MVCColumnAttribute('QUANTIDADE_VENDIDA')]
		[MVCNameAsAttribute('quantidadeVendida')]
		property QuantidadeVendida: Extended read FQuantidadeVendida write FQuantidadeVendida;
    [MVCColumnAttribute('ALIQUOTA_COFINS_REAIS')]
		[MVCNameAsAttribute('aliquotaCofinsReais')]
		property AliquotaCofinsReais: Extended read FAliquotaCofinsReais write FAliquotaCofinsReais;
    [MVCColumnAttribute('VALOR_COFINS')]
		[MVCNameAsAttribute('valorCofins')]
		property ValorCofins: Extended read FValorCofins write FValorCofins;
      
  end;

implementation

{ TNfeDetalheImpostoCofins }





end.