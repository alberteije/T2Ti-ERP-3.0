/*******************************************************************************
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
*******************************************************************************/
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'FISCAL_APURACAO_ICMS' })
export class FiscalApuracaoIcms { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'COMPETENCIA' })
	competencia: string;

	@Column({ name: 'VALOR_TOTAL_DEBITO' })
	valorTotalDebito: number;

	@Column({ name: 'VALOR_AJUSTE_DEBITO' })
	valorAjusteDebito: number;

	@Column({ name: 'VALOR_TOTAL_AJUSTE_DEBITO' })
	valorTotalAjusteDebito: number;

	@Column({ name: 'VALOR_ESTORNO_CREDITO' })
	valorEstornoCredito: number;

	@Column({ name: 'VALOR_TOTAL_CREDITO' })
	valorTotalCredito: number;

	@Column({ name: 'VALOR_AJUSTE_CREDITO' })
	valorAjusteCredito: number;

	@Column({ name: 'VALOR_TOTAL_AJUSTE_CREDITO' })
	valorTotalAjusteCredito: number;

	@Column({ name: 'VALOR_ESTORNO_DEBITO' })
	valorEstornoDebito: number;

	@Column({ name: 'VALOR_SALDO_CREDOR_ANTERIOR' })
	valorSaldoCredorAnterior: number;

	@Column({ name: 'VALOR_SALDO_APURADO' })
	valorSaldoApurado: number;

	@Column({ name: 'VALOR_TOTAL_DEDUCAO' })
	valorTotalDeducao: number;

	@Column({ name: 'VALOR_ICMS_RECOLHER' })
	valorIcmsRecolher: number;

	@Column({ name: 'VALOR_SALDO_CREDOR_TRANSP' })
	valorSaldoCredorTransp: number;

	@Column({ name: 'VALOR_DEBITO_ESPECIAL' })
	valorDebitoEspecial: number;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.competencia = objetoJson['competencia'];
			this.valorTotalDebito = objetoJson['valorTotalDebito'];
			this.valorAjusteDebito = objetoJson['valorAjusteDebito'];
			this.valorTotalAjusteDebito = objetoJson['valorTotalAjusteDebito'];
			this.valorEstornoCredito = objetoJson['valorEstornoCredito'];
			this.valorTotalCredito = objetoJson['valorTotalCredito'];
			this.valorAjusteCredito = objetoJson['valorAjusteCredito'];
			this.valorTotalAjusteCredito = objetoJson['valorTotalAjusteCredito'];
			this.valorEstornoDebito = objetoJson['valorEstornoDebito'];
			this.valorSaldoCredorAnterior = objetoJson['valorSaldoCredorAnterior'];
			this.valorSaldoApurado = objetoJson['valorSaldoApurado'];
			this.valorTotalDeducao = objetoJson['valorTotalDeducao'];
			this.valorIcmsRecolher = objetoJson['valorIcmsRecolher'];
			this.valorSaldoCredorTransp = objetoJson['valorSaldoCredorTransp'];
			this.valorDebitoEspecial = objetoJson['valorDebitoEspecial'];
			
			
		}
	}
}