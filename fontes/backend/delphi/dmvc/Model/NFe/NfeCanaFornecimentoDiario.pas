{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CANA_FORNECIMENTO_DIARIO] 
                                                                                
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
unit NfeCanaFornecimentoDiario;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeCanaFornecimentoDiario = class(TModelBase)
  private
    FId: Integer;
    FIdNfeCana: Integer;
    FDia: string;
    FQuantidade: Extended;
    FQuantidadeTotalMes: Extended;
    FQuantidadeTotalAnterior: Extended;
    FQuantidadeTotalGeral: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_CANA')]
		[MVCNameAsAttribute('idNfeCana')]
		property IdNfeCana: Integer read FIdNfeCana write FIdNfeCana;
    [MVCColumnAttribute('DIA')]
		[MVCNameAsAttribute('dia')]
		property Dia: string read FDia write FDia;
    [MVCColumnAttribute('QUANTIDADE')]
		[MVCNameAsAttribute('quantidade')]
		property Quantidade: Extended read FQuantidade write FQuantidade;
    [MVCColumnAttribute('QUANTIDADE_TOTAL_MES')]
		[MVCNameAsAttribute('quantidadeTotalMes')]
		property QuantidadeTotalMes: Extended read FQuantidadeTotalMes write FQuantidadeTotalMes;
    [MVCColumnAttribute('QUANTIDADE_TOTAL_ANTERIOR')]
		[MVCNameAsAttribute('quantidadeTotalAnterior')]
		property QuantidadeTotalAnterior: Extended read FQuantidadeTotalAnterior write FQuantidadeTotalAnterior;
    [MVCColumnAttribute('QUANTIDADE_TOTAL_GERAL')]
		[MVCNameAsAttribute('quantidadeTotalGeral')]
		property QuantidadeTotalGeral: Extended read FQuantidadeTotalGeral write FQuantidadeTotalGeral;
      
  end;

implementation

{ TNfeCanaFornecimentoDiario }





end.