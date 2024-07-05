{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FISCAL_APURACAO_ICMS] 
                                                                                
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
unit FiscalApuracaoIcms;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFiscalApuracaoIcms = class(TModelBase)
  private
    FId: Integer;
    FCompetencia: string;
    FValorTotalDebito: Extended;
    FValorAjusteDebito: Extended;
    FValorTotalAjusteDebito: Extended;
    FValorEstornoCredito: Extended;
    FValorTotalCredito: Extended;
    FValorAjusteCredito: Extended;
    FValorTotalAjusteCredito: Extended;
    FValorEstornoDebito: Extended;
    FValorSaldoCredorAnterior: Extended;
    FValorSaldoApurado: Extended;
    FValorTotalDeducao: Extended;
    FValorIcmsRecolher: Extended;
    FValorSaldoCredorTransp: Extended;
    FValorDebitoEspecial: Extended;
      
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('COMPETENCIA')]
		[MVCNameAsAttribute('competencia')]
		property Competencia: string read FCompetencia write FCompetencia;
    [MVCColumnAttribute('VALOR_TOTAL_DEBITO')]
		[MVCNameAsAttribute('valorTotalDebito')]
		property ValorTotalDebito: Extended read FValorTotalDebito write FValorTotalDebito;
    [MVCColumnAttribute('VALOR_AJUSTE_DEBITO')]
		[MVCNameAsAttribute('valorAjusteDebito')]
		property ValorAjusteDebito: Extended read FValorAjusteDebito write FValorAjusteDebito;
    [MVCColumnAttribute('VALOR_TOTAL_AJUSTE_DEBITO')]
		[MVCNameAsAttribute('valorTotalAjusteDebito')]
		property ValorTotalAjusteDebito: Extended read FValorTotalAjusteDebito write FValorTotalAjusteDebito;
    [MVCColumnAttribute('VALOR_ESTORNO_CREDITO')]
		[MVCNameAsAttribute('valorEstornoCredito')]
		property ValorEstornoCredito: Extended read FValorEstornoCredito write FValorEstornoCredito;
    [MVCColumnAttribute('VALOR_TOTAL_CREDITO')]
		[MVCNameAsAttribute('valorTotalCredito')]
		property ValorTotalCredito: Extended read FValorTotalCredito write FValorTotalCredito;
    [MVCColumnAttribute('VALOR_AJUSTE_CREDITO')]
		[MVCNameAsAttribute('valorAjusteCredito')]
		property ValorAjusteCredito: Extended read FValorAjusteCredito write FValorAjusteCredito;
    [MVCColumnAttribute('VALOR_TOTAL_AJUSTE_CREDITO')]
		[MVCNameAsAttribute('valorTotalAjusteCredito')]
		property ValorTotalAjusteCredito: Extended read FValorTotalAjusteCredito write FValorTotalAjusteCredito;
    [MVCColumnAttribute('VALOR_ESTORNO_DEBITO')]
		[MVCNameAsAttribute('valorEstornoDebito')]
		property ValorEstornoDebito: Extended read FValorEstornoDebito write FValorEstornoDebito;
    [MVCColumnAttribute('VALOR_SALDO_CREDOR_ANTERIOR')]
		[MVCNameAsAttribute('valorSaldoCredorAnterior')]
		property ValorSaldoCredorAnterior: Extended read FValorSaldoCredorAnterior write FValorSaldoCredorAnterior;
    [MVCColumnAttribute('VALOR_SALDO_APURADO')]
		[MVCNameAsAttribute('valorSaldoApurado')]
		property ValorSaldoApurado: Extended read FValorSaldoApurado write FValorSaldoApurado;
    [MVCColumnAttribute('VALOR_TOTAL_DEDUCAO')]
		[MVCNameAsAttribute('valorTotalDeducao')]
		property ValorTotalDeducao: Extended read FValorTotalDeducao write FValorTotalDeducao;
    [MVCColumnAttribute('VALOR_ICMS_RECOLHER')]
		[MVCNameAsAttribute('valorIcmsRecolher')]
		property ValorIcmsRecolher: Extended read FValorIcmsRecolher write FValorIcmsRecolher;
    [MVCColumnAttribute('VALOR_SALDO_CREDOR_TRANSP')]
		[MVCNameAsAttribute('valorSaldoCredorTransp')]
		property ValorSaldoCredorTransp: Extended read FValorSaldoCredorTransp write FValorSaldoCredorTransp;
    [MVCColumnAttribute('VALOR_DEBITO_ESPECIAL')]
		[MVCNameAsAttribute('valorDebitoEspecial')]
		property ValorDebitoEspecial: Extended read FValorDebitoEspecial write FValorDebitoEspecial;
      
  end;

implementation

{ TFiscalApuracaoIcms }



end.