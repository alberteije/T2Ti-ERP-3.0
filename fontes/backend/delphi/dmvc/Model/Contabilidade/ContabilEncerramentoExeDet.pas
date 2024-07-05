{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_ENCERRAMENTO_EXE_DET] 
                                                                                
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
unit ContabilEncerramentoExeDet;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TContabilEncerramentoExeDet = class(TModelBase)
  private
    FId: Integer;
    FIdContabilConta: Integer;
    FIdContabilEncerramentoExe: Integer;
    FSaldoAnterior: Extended;
    FValorDebito: Extended;
    FValorCredito: Extended;
    FSaldo: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CONTABIL_CONTA')]
		[MVCNameAsAttribute('idContabilConta')]
		property IdContabilConta: Integer read FIdContabilConta write FIdContabilConta;
    [MVCColumnAttribute('ID_CONTABIL_ENCERRAMENTO_EXE')]
		[MVCNameAsAttribute('idContabilEncerramentoExe')]
		property IdContabilEncerramentoExe: Integer read FIdContabilEncerramentoExe write FIdContabilEncerramentoExe;
    [MVCColumnAttribute('SALDO_ANTERIOR')]
		[MVCNameAsAttribute('saldoAnterior')]
		property SaldoAnterior: Extended read FSaldoAnterior write FSaldoAnterior;
    [MVCColumnAttribute('VALOR_DEBITO')]
		[MVCNameAsAttribute('valorDebito')]
		property ValorDebito: Extended read FValorDebito write FValorDebito;
    [MVCColumnAttribute('VALOR_CREDITO')]
		[MVCNameAsAttribute('valorCredito')]
		property ValorCredito: Extended read FValorCredito write FValorCredito;
    [MVCColumnAttribute('SALDO')]
		[MVCNameAsAttribute('saldo')]
		property Saldo: Extended read FSaldo write FSaldo;
      
  end;

implementation

{ TContabilEncerramentoExeDet }



end.