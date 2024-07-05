/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_ICMS_UF] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { TributConfiguraOfGt } from '../../entities-export';

@Entity({ name: 'TRIBUT_ICMS_UF' })
export class TributIcmsUf { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'UF_DESTINO' })
	ufDestino: string;

	@Column({ name: 'CFOP' })
	cfop: number;

	@Column({ name: 'CSOSN' })
	csosn: string;

	@Column({ name: 'CST' })
	cst: string;

	@Column({ name: 'MODALIDADE_BC' })
	modalidadeBc: string;

	@Column({ name: 'ALIQUOTA' })
	aliquota: number;

	@Column({ name: 'VALOR_PAUTA' })
	valorPauta: number;

	@Column({ name: 'VALOR_PRECO_MAXIMO' })
	valorPrecoMaximo: number;

	@Column({ name: 'MVA' })
	mva: number;

	@Column({ name: 'PORCENTO_BC' })
	porcentoBc: number;

	@Column({ name: 'MODALIDADE_BC_ST' })
	modalidadeBcSt: string;

	@Column({ name: 'ALIQUOTA_INTERNA_ST' })
	aliquotaInternaSt: number;

	@Column({ name: 'ALIQUOTA_INTERESTADUAL_ST' })
	aliquotaInterestadualSt: number;

	@Column({ name: 'PORCENTO_BC_ST' })
	porcentoBcSt: number;

	@Column({ name: 'ALIQUOTA_ICMS_ST' })
	aliquotaIcmsSt: number;

	@Column({ name: 'VALOR_PAUTA_ST' })
	valorPautaSt: number;

	@Column({ name: 'VALOR_PRECO_MAXIMO_ST' })
	valorPrecoMaximoSt: number;


	/**
	* Relations
	*/
    @ManyToOne(() => TributConfiguraOfGt, tributConfiguraOfGt => tributConfiguraOfGt.listaTributIcmsUf)
    @JoinColumn({ name: "ID_TRIBUT_CONFIGURA_OF_GT" })
    tributConfiguraOfGt: TributConfiguraOfGt;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.ufDestino = objetoJson['ufDestino'];
			this.cfop = objetoJson['cfop'];
			this.csosn = objetoJson['csosn'];
			this.cst = objetoJson['cst'];
			this.modalidadeBc = objetoJson['modalidadeBc'];
			this.aliquota = objetoJson['aliquota'];
			this.valorPauta = objetoJson['valorPauta'];
			this.valorPrecoMaximo = objetoJson['valorPrecoMaximo'];
			this.mva = objetoJson['mva'];
			this.porcentoBc = objetoJson['porcentoBc'];
			this.modalidadeBcSt = objetoJson['modalidadeBcSt'];
			this.aliquotaInternaSt = objetoJson['aliquotaInternaSt'];
			this.aliquotaInterestadualSt = objetoJson['aliquotaInterestadualSt'];
			this.porcentoBcSt = objetoJson['porcentoBcSt'];
			this.aliquotaIcmsSt = objetoJson['aliquotaIcmsSt'];
			this.valorPautaSt = objetoJson['valorPautaSt'];
			this.valorPrecoMaximoSt = objetoJson['valorPrecoMaximoSt'];
			
			
		}
	}
}