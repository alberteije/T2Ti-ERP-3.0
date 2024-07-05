/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FISCAL_NOTA_FISCAL_ENTRADA] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';
import { NfeCabecalho } from '../../entities-export';

@Entity({ name: 'FISCAL_NOTA_FISCAL_ENTRADA' })
export class FiscalNotaFiscalEntrada { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'COMPETENCIA' })
	competencia: string;

	@Column({ name: 'CFOP_ENTRADA' })
	cfopEntrada: number;

	@Column({ name: 'VALOR_RATEIO_FRETE' })
	valorRateioFrete: number;

	@Column({ name: 'VALOR_CUSTO_MEDIO' })
	valorCustoMedio: number;

	@Column({ name: 'VALOR_ICMS_ANTECIPADO' })
	valorIcmsAntecipado: number;

	@Column({ name: 'VALOR_BC_ICMS_ANTECIPADO' })
	valorBcIcmsAntecipado: number;

	@Column({ name: 'VALOR_BC_ICMS_CREDITADO' })
	valorBcIcmsCreditado: number;

	@Column({ name: 'VALOR_BC_PIS_CREDITADO' })
	valorBcPisCreditado: number;

	@Column({ name: 'VALOR_BC_COFINS_CREDITADO' })
	valorBcCofinsCreditado: number;

	@Column({ name: 'VALOR_BC_IPI_CREDITADO' })
	valorBcIpiCreditado: number;

	@Column({ name: 'CST_CREDITO_ICMS' })
	cstCreditoIcms: string;

	@Column({ name: 'CST_CREDITO_PIS' })
	cstCreditoPis: string;

	@Column({ name: 'CST_CREDITO_COFINS' })
	cstCreditoCofins: string;

	@Column({ name: 'CST_CREDITO_IPI' })
	cstCreditoIpi: string;

	@Column({ name: 'VALOR_ICMS_CREDITADO' })
	valorIcmsCreditado: number;

	@Column({ name: 'VALOR_PIS_CREDITADO' })
	valorPisCreditado: number;

	@Column({ name: 'VALOR_COFINS_CREDITADO' })
	valorCofinsCreditado: number;

	@Column({ name: 'VALOR_IPI_CREDITADO' })
	valorIpiCreditado: number;

	@Column({ name: 'QTDE_PARCELA_CREDITO_PIS' })
	qtdeParcelaCreditoPis: number;

	@Column({ name: 'QTDE_PARCELA_CREDITO_COFINS' })
	qtdeParcelaCreditoCofins: number;

	@Column({ name: 'QTDE_PARCELA_CREDITO_ICMS' })
	qtdeParcelaCreditoIcms: number;

	@Column({ name: 'QTDE_PARCELA_CREDITO_IPI' })
	qtdeParcelaCreditoIpi: number;

	@Column({ name: 'ALIQUOTA_CREDITO_ICMS' })
	aliquotaCreditoIcms: number;

	@Column({ name: 'ALIQUOTA_CREDITO_PIS' })
	aliquotaCreditoPis: number;

	@Column({ name: 'ALIQUOTA_CREDITO_COFINS' })
	aliquotaCreditoCofins: number;

	@Column({ name: 'ALIQUOTA_CREDITO_IPI' })
	aliquotaCreditoIpi: number;


	/**
	* Relations
	*/
    @OneToOne(() => NfeCabecalho)
    @JoinColumn({ name: "ID_NFE_CABECALHO" })
    nfeCabecalho: NfeCabecalho;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.competencia = objetoJson['competencia'];
			this.cfopEntrada = objetoJson['cfopEntrada'];
			this.valorRateioFrete = objetoJson['valorRateioFrete'];
			this.valorCustoMedio = objetoJson['valorCustoMedio'];
			this.valorIcmsAntecipado = objetoJson['valorIcmsAntecipado'];
			this.valorBcIcmsAntecipado = objetoJson['valorBcIcmsAntecipado'];
			this.valorBcIcmsCreditado = objetoJson['valorBcIcmsCreditado'];
			this.valorBcPisCreditado = objetoJson['valorBcPisCreditado'];
			this.valorBcCofinsCreditado = objetoJson['valorBcCofinsCreditado'];
			this.valorBcIpiCreditado = objetoJson['valorBcIpiCreditado'];
			this.cstCreditoIcms = objetoJson['cstCreditoIcms'];
			this.cstCreditoPis = objetoJson['cstCreditoPis'];
			this.cstCreditoCofins = objetoJson['cstCreditoCofins'];
			this.cstCreditoIpi = objetoJson['cstCreditoIpi'];
			this.valorIcmsCreditado = objetoJson['valorIcmsCreditado'];
			this.valorPisCreditado = objetoJson['valorPisCreditado'];
			this.valorCofinsCreditado = objetoJson['valorCofinsCreditado'];
			this.valorIpiCreditado = objetoJson['valorIpiCreditado'];
			this.qtdeParcelaCreditoPis = objetoJson['qtdeParcelaCreditoPis'];
			this.qtdeParcelaCreditoCofins = objetoJson['qtdeParcelaCreditoCofins'];
			this.qtdeParcelaCreditoIcms = objetoJson['qtdeParcelaCreditoIcms'];
			this.qtdeParcelaCreditoIpi = objetoJson['qtdeParcelaCreditoIpi'];
			this.aliquotaCreditoIcms = objetoJson['aliquotaCreditoIcms'];
			this.aliquotaCreditoPis = objetoJson['aliquotaCreditoPis'];
			this.aliquotaCreditoCofins = objetoJson['aliquotaCreditoCofins'];
			this.aliquotaCreditoIpi = objetoJson['aliquotaCreditoIpi'];
			
			if (objetoJson['nfeCabecalho'] != null) {
				this.nfeCabecalho = new NfeCabecalho(objetoJson['nfeCabecalho']);
			}

			
		}
	}
}