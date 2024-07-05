/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS_UFDEST] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';
import { NfeDetalhe } from '../../entities-export';

@Entity({ name: 'NFE_DETALHE_IMPOSTO_ICMS_UFDEST' })
export class NfeDetalheImpostoIcmsUfdest { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'VALOR_BC_ICMS_UF_DESTINO' })
	valorBcIcmsUfDestino: number;

	@Column({ name: 'VALOR_BC_FCP_UF_DESTINO' })
	valorBcFcpUfDestino: number;

	@Column({ name: 'PERCENTUAL_FCP_UF_DESTINO' })
	percentualFcpUfDestino: number;

	@Column({ name: 'ALIQUOTA_INTERNA_UF_DESTINO' })
	aliquotaInternaUfDestino: number;

	@Column({ name: 'ALIQUOTA_INTERESDATUAL_UF_ENVOLVIDAS' })
	aliquotaInteresdatualUfEnvolvidas: number;

	@Column({ name: 'PERCENTUAL_PROVISORIO_PARTILHA_ICMS' })
	percentualProvisorioPartilhaIcms: number;

	@Column({ name: 'VALOR_ICMS_FCP_UF_DESTINO' })
	valorIcmsFcpUfDestino: number;

	@Column({ name: 'VALOR_INTERESTADUAL_UF_DESTINO' })
	valorInterestadualUfDestino: number;

	@Column({ name: 'VALOR_INTERESTADUAL_UF_REMETENTE' })
	valorInterestadualUfRemetente: number;


	/**
	* Relations
	*/
    @OneToOne(() => NfeDetalhe, nfeDetalhe => nfeDetalhe.nfeDetalheImpostoIcmsUfdest)
    @JoinColumn({ name: "ID_NFE_DETALHE" })
    nfeDetalhe: NfeDetalhe;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.valorBcIcmsUfDestino = objetoJson['valorBcIcmsUfDestino'];
			this.valorBcFcpUfDestino = objetoJson['valorBcFcpUfDestino'];
			this.percentualFcpUfDestino = objetoJson['percentualFcpUfDestino'];
			this.aliquotaInternaUfDestino = objetoJson['aliquotaInternaUfDestino'];
			this.aliquotaInteresdatualUfEnvolvidas = objetoJson['aliquotaInteresdatualUfEnvolvidas'];
			this.percentualProvisorioPartilhaIcms = objetoJson['percentualProvisorioPartilhaIcms'];
			this.valorIcmsFcpUfDestino = objetoJson['valorIcmsFcpUfDestino'];
			this.valorInterestadualUfDestino = objetoJson['valorInterestadualUfDestino'];
			this.valorInterestadualUfRemetente = objetoJson['valorInterestadualUfRemetente'];
			
			
		}
	}
}