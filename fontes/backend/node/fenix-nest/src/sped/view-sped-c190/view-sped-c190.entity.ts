/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_C190] 
                                                                                
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
*******************************************************************************/
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'VIEW_SPED_C190' })
export class ViewSpedC190 { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CST_ICMS' })
	cstIcms: string;

	@Column({ name: 'CFOP' })
	cfop: number;

	@Column({ name: 'ALIQUOTA_ICMS' })
	aliquotaIcms: number;

	@Column({ name: 'DATA_HORA_EMISSAO' })
	dataHoraEmissao: Date;

	@Column({ name: 'SOMA_VALOR_OPERACAO' })
	somaValorOperacao: number;

	@Column({ name: 'SOMA_BASE_CALCULO_ICMS' })
	somaBaseCalculoIcms: number;

	@Column({ name: 'SOMA_VALOR_ICMS' })
	somaValorIcms: number;

	@Column({ name: 'SOMA_BASE_CALCULO_ICMS_ST' })
	somaBaseCalculoIcmsSt: number;

	@Column({ name: 'SOMA_VALOR_ICMS_ST' })
	somaValorIcmsSt: number;

	@Column({ name: 'SOMA_VL_RED_BC' })
	somaVlRedBc: number;

	@Column({ name: 'SOMA_VALOR_IPI' })
	somaValorIpi: number;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.cstIcms = objetoJson['cstIcms'];
			this.cfop = objetoJson['cfop'];
			this.aliquotaIcms = objetoJson['aliquotaIcms'];
			this.dataHoraEmissao = objetoJson['dataHoraEmissao'];
			this.somaValorOperacao = objetoJson['somaValorOperacao'];
			this.somaBaseCalculoIcms = objetoJson['somaBaseCalculoIcms'];
			this.somaValorIcms = objetoJson['somaValorIcms'];
			this.somaBaseCalculoIcmsSt = objetoJson['somaBaseCalculoIcmsSt'];
			this.somaValorIcmsSt = objetoJson['somaValorIcmsSt'];
			this.somaVlRedBc = objetoJson['somaVlRedBc'];
			this.somaValorIpi = objetoJson['somaValorIpi'];
			
			
		}
	}
}