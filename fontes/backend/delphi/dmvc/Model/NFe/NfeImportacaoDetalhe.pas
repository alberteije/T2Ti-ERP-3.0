{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_IMPORTACAO_DETALHE] 
                                                                                
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
unit NfeImportacaoDetalhe;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeImportacaoDetalhe = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDeclaracaoImportacao: Integer;
    FNumeroAdicao: Integer;
    FNumeroSequencial: Integer;
    FCodigoFabricanteEstrangeiro: string;
    FValorDesconto: Extended;
    FDrawback: Integer;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DECLARACAO_IMPORTACAO')]
		[MVCNameAsAttribute('idNfeDeclaracaoImportacao')]
		property IdNfeDeclaracaoImportacao: Integer read FIdNfeDeclaracaoImportacao write FIdNfeDeclaracaoImportacao;
    [MVCColumnAttribute('NUMERO_ADICAO')]
		[MVCNameAsAttribute('numeroAdicao')]
		property NumeroAdicao: Integer read FNumeroAdicao write FNumeroAdicao;
    [MVCColumnAttribute('NUMERO_SEQUENCIAL')]
		[MVCNameAsAttribute('numeroSequencial')]
		property NumeroSequencial: Integer read FNumeroSequencial write FNumeroSequencial;
    [MVCColumnAttribute('CODIGO_FABRICANTE_ESTRANGEIRO')]
		[MVCNameAsAttribute('codigoFabricanteEstrangeiro')]
		property CodigoFabricanteEstrangeiro: string read FCodigoFabricanteEstrangeiro write FCodigoFabricanteEstrangeiro;
    [MVCColumnAttribute('VALOR_DESCONTO')]
		[MVCNameAsAttribute('valorDesconto')]
		property ValorDesconto: Extended read FValorDesconto write FValorDesconto;
    [MVCColumnAttribute('DRAWBACK')]
		[MVCNameAsAttribute('drawback')]
		property Drawback: Integer read FDrawback write FDrawback;
      
  end;

implementation

{ TNfeImportacaoDetalhe }





end.