{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_COFINS_ST] 
                                                                                
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
unit NfeDetalheImpostoCofinsSt;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetalheImpostoCofinsSt = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FBaseCalculoCofinsSt: Extended;
    FAliquotaCofinsStPercentual: Extended;
    FQuantidadeVendidaCofinsSt: Extended;
    FAliquotaCofinsStReais: Extended;
    FValorCofinsSt: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('BASE_CALCULO_COFINS_ST')]
		[MVCNameAsAttribute('baseCalculoCofinsSt')]
		property BaseCalculoCofinsSt: Extended read FBaseCalculoCofinsSt write FBaseCalculoCofinsSt;
    [MVCColumnAttribute('ALIQUOTA_COFINS_ST_PERCENTUAL')]
		[MVCNameAsAttribute('aliquotaCofinsStPercentual')]
		property AliquotaCofinsStPercentual: Extended read FAliquotaCofinsStPercentual write FAliquotaCofinsStPercentual;
    [MVCColumnAttribute('QUANTIDADE_VENDIDA_COFINS_ST')]
		[MVCNameAsAttribute('quantidadeVendidaCofinsSt')]
		property QuantidadeVendidaCofinsSt: Extended read FQuantidadeVendidaCofinsSt write FQuantidadeVendidaCofinsSt;
    [MVCColumnAttribute('ALIQUOTA_COFINS_ST_REAIS')]
		[MVCNameAsAttribute('aliquotaCofinsStReais')]
		property AliquotaCofinsStReais: Extended read FAliquotaCofinsStReais write FAliquotaCofinsStReais;
    [MVCColumnAttribute('VALOR_COFINS_ST')]
		[MVCNameAsAttribute('valorCofinsSt')]
		property ValorCofinsSt: Extended read FValorCofinsSt write FValorCofinsSt;
      
  end;

implementation

{ TNfeDetalheImpostoCofinsSt }





end.