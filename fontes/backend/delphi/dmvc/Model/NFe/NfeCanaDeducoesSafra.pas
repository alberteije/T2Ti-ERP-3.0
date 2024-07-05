{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CANA_DEDUCOES_SAFRA] 
                                                                                
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
unit NfeCanaDeducoesSafra;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeCanaDeducoesSafra = class(TModelBase)
  private
    FId: Integer;
    FIdNfeCana: Integer;
    FDecricao: string;
    FValorDeducao: Extended;
    FValorFornecimento: Extended;
    FValorTotalDeducao: Extended;
    FValorLiquidoFornecimento: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_CANA')]
		[MVCNameAsAttribute('idNfeCana')]
		property IdNfeCana: Integer read FIdNfeCana write FIdNfeCana;
    [MVCColumnAttribute('DECRICAO')]
		[MVCNameAsAttribute('decricao')]
		property Decricao: string read FDecricao write FDecricao;
    [MVCColumnAttribute('VALOR_DEDUCAO')]
		[MVCNameAsAttribute('valorDeducao')]
		property ValorDeducao: Extended read FValorDeducao write FValorDeducao;
    [MVCColumnAttribute('VALOR_FORNECIMENTO')]
		[MVCNameAsAttribute('valorFornecimento')]
		property ValorFornecimento: Extended read FValorFornecimento write FValorFornecimento;
    [MVCColumnAttribute('VALOR_TOTAL_DEDUCAO')]
		[MVCNameAsAttribute('valorTotalDeducao')]
		property ValorTotalDeducao: Extended read FValorTotalDeducao write FValorTotalDeducao;
    [MVCColumnAttribute('VALOR_LIQUIDO_FORNECIMENTO')]
		[MVCNameAsAttribute('valorLiquidoFornecimento')]
		property ValorLiquidoFornecimento: Extended read FValorLiquidoFornecimento write FValorLiquidoFornecimento;
      
  end;

implementation

{ TNfeCanaDeducoesSafra }





end.