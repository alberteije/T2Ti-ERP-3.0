/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [SIMPLES_NACIONAL_DETALHE] 
                                                                                
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

@Entity({ name: 'SIMPLES_NACIONAL_DETALHE' })
export class SimplesNacionalDetalhe { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_SIMPLES_NACIONAL_CABECALHO' })
	idSimplesNacionalCabecalho: number;

	@Column({ name: 'FAIXA' })
	faixa: number;

	@Column({ name: 'VALOR_INICIAL' })
	valorInicial: number;

	@Column({ name: 'VALOR_FINAL' })
	valorFinal: number;

	@Column({ name: 'ALIQUOTA' })
	aliquota: number;

	@Column({ name: 'IRPJ' })
	irpj: number;

	@Column({ name: 'CSLL' })
	csll: number;

	@Column({ name: 'COFINS' })
	cofins: number;

	@Column({ name: 'PIS_PASEP' })
	pisPasep: number;

	@Column({ name: 'CPP' })
	cpp: number;

	@Column({ name: 'ICMS' })
	icms: number;

	@Column({ name: 'IPI' })
	ipi: number;

	@Column({ name: 'ISS' })
	iss: number;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idSimplesNacionalCabecalho = objetoJson['idSimplesNacionalCabecalho'];
			this.faixa = objetoJson['faixa'];
			this.valorInicial = objetoJson['valorInicial'];
			this.valorFinal = objetoJson['valorFinal'];
			this.aliquota = objetoJson['aliquota'];
			this.irpj = objetoJson['irpj'];
			this.csll = objetoJson['csll'];
			this.cofins = objetoJson['cofins'];
			this.pisPasep = objetoJson['pisPasep'];
			this.cpp = objetoJson['cpp'];
			this.icms = objetoJson['icms'];
			this.ipi = objetoJson['ipi'];
			this.iss = objetoJson['iss'];
			
			
		}
	}
}