/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_IPI] 
                                                                                
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

@Entity({ name: 'NFE_DETALHE_IMPOSTO_IPI' })
export class NfeDetalheImpostoIpi { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CNPJ_PRODUTOR' })
	cnpjProdutor: string;

	@Column({ name: 'CODIGO_SELO_IPI' })
	codigoSeloIpi: string;

	@Column({ name: 'QUANTIDADE_SELO_IPI' })
	quantidadeSeloIpi: number;

	@Column({ name: 'ENQUADRAMENTO_LEGAL_IPI' })
	enquadramentoLegalIpi: string;

	@Column({ name: 'CST_IPI' })
	cstIpi: string;

	@Column({ name: 'VALOR_BASE_CALCULO_IPI' })
	valorBaseCalculoIpi: number;

	@Column({ name: 'QUANTIDADE_UNIDADE_TRIBUTAVEL' })
	quantidadeUnidadeTributavel: number;

	@Column({ name: 'VALOR_UNIDADE_TRIBUTAVEL' })
	valorUnidadeTributavel: number;

	@Column({ name: 'ALIQUOTA_IPI' })
	aliquotaIpi: number;

	@Column({ name: 'VALOR_IPI' })
	valorIpi: number;


	/**
	* Relations
	*/
    @OneToOne(() => NfeDetalhe, nfeDetalhe => nfeDetalhe.nfeDetalheImpostoIpi)
    @JoinColumn({ name: "ID_NFE_DETALHE" })
    nfeDetalhe: NfeDetalhe;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.cnpjProdutor = objetoJson['cnpjProdutor'];
			this.codigoSeloIpi = objetoJson['codigoSeloIpi'];
			this.quantidadeSeloIpi = objetoJson['quantidadeSeloIpi'];
			this.enquadramentoLegalIpi = objetoJson['enquadramentoLegalIpi'];
			this.cstIpi = objetoJson['cstIpi'];
			this.valorBaseCalculoIpi = objetoJson['valorBaseCalculoIpi'];
			this.quantidadeUnidadeTributavel = objetoJson['quantidadeUnidadeTributavel'];
			this.valorUnidadeTributavel = objetoJson['valorUnidadeTributavel'];
			this.aliquotaIpi = objetoJson['aliquotaIpi'];
			this.valorIpi = objetoJson['valorIpi'];
			
			
		}
	}

	zerarNulos() {
		this.valorBaseCalculoIpi = this.valorBaseCalculoIpi == null ? 0 : this.valorBaseCalculoIpi;
		this.quantidadeUnidadeTributavel = this.quantidadeUnidadeTributavel == null ? 0 : this.quantidadeUnidadeTributavel;
		this.valorUnidadeTributavel = this.valorUnidadeTributavel == null ? 0 : this.valorUnidadeTributavel;
		this.aliquotaIpi = this.aliquotaIpi == null ? 0 : this.aliquotaIpi;
		this.valorIpi = this.valorIpi == null ? 0 : this.valorIpi;
	}
}