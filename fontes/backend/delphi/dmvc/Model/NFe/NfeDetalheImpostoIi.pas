{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_II] 
                                                                                
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
unit NfeDetalheImpostoIi;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetalheImpostoIi = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FValorBcIi: Extended;
    FValorDespesasAduaneiras: Extended;
    FValorImpostoImportacao: Extended;
    FValorIof: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('VALOR_BC_II')]
		[MVCNameAsAttribute('valorBcIi')]
		property ValorBcIi: Extended read FValorBcIi write FValorBcIi;
    [MVCColumnAttribute('VALOR_DESPESAS_ADUANEIRAS')]
		[MVCNameAsAttribute('valorDespesasAduaneiras')]
		property ValorDespesasAduaneiras: Extended read FValorDespesasAduaneiras write FValorDespesasAduaneiras;
    [MVCColumnAttribute('VALOR_IMPOSTO_IMPORTACAO')]
		[MVCNameAsAttribute('valorImpostoImportacao')]
		property ValorImpostoImportacao: Extended read FValorImpostoImportacao write FValorImpostoImportacao;
    [MVCColumnAttribute('VALOR_IOF')]
		[MVCNameAsAttribute('valorIof')]
		property ValorIof: Extended read FValorIof write FValorIof;
      
  end;

implementation

{ TNfeDetalheImpostoIi }





end.