{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_PIS] 
                                                                                
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
unit NfeDetalheImpostoPis;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetalheImpostoPis = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FCstPis: string;
    FValorBaseCalculoPis: Extended;
    FAliquotaPisPercentual: Extended;
    FValorPis: Extended;
    FQuantidadeVendida: Extended;
    FAliquotaPisReais: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('CST_PIS')]
		[MVCNameAsAttribute('cstPis')]
		property CstPis: string read FCstPis write FCstPis;
    [MVCColumnAttribute('VALOR_BASE_CALCULO_PIS')]
		[MVCNameAsAttribute('valorBaseCalculoPis')]
		property ValorBaseCalculoPis: Extended read FValorBaseCalculoPis write FValorBaseCalculoPis;
    [MVCColumnAttribute('ALIQUOTA_PIS_PERCENTUAL')]
		[MVCNameAsAttribute('aliquotaPisPercentual')]
		property AliquotaPisPercentual: Extended read FAliquotaPisPercentual write FAliquotaPisPercentual;
    [MVCColumnAttribute('VALOR_PIS')]
		[MVCNameAsAttribute('valorPis')]
		property ValorPis: Extended read FValorPis write FValorPis;
    [MVCColumnAttribute('QUANTIDADE_VENDIDA')]
		[MVCNameAsAttribute('quantidadeVendida')]
		property QuantidadeVendida: Extended read FQuantidadeVendida write FQuantidadeVendida;
    [MVCColumnAttribute('ALIQUOTA_PIS_REAIS')]
		[MVCNameAsAttribute('aliquotaPisReais')]
		property AliquotaPisReais: Extended read FAliquotaPisReais write FAliquotaPisReais;
      
  end;

implementation

{ TNfeDetalheImpostoPis }





end.