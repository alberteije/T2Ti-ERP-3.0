/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_ISS] 
                                                                                
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
import { TributOperacaoFiscal } from '../../entities-export';

@Entity({ name: 'TRIBUT_ISS' })
export class TributIss { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'MODALIDADE_BASE_CALCULO' })
	modalidadeBaseCalculo: string;

	@Column({ name: 'PORCENTO_BASE_CALCULO' })
	porcentoBaseCalculo: number;

	@Column({ name: 'ALIQUOTA_PORCENTO' })
	aliquotaPorcento: number;

	@Column({ name: 'ALIQUOTA_UNIDADE' })
	aliquotaUnidade: number;

	@Column({ name: 'VALOR_PRECO_MAXIMO' })
	valorPrecoMaximo: number;

	@Column({ name: 'VALOR_PAUTA_FISCAL' })
	valorPautaFiscal: number;

	@Column({ name: 'ITEM_LISTA_SERVICO' })
	itemListaServico: number;

	@Column({ name: 'CODIGO_TRIBUTACAO' })
	codigoTributacao: string;


	/**
	* Relations
	*/
    @OneToOne(() => TributOperacaoFiscal)
    @JoinColumn({ name: "ID_TRIBUT_OPERACAO_FISCAL" })
    tributOperacaoFiscal: TributOperacaoFiscal;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.modalidadeBaseCalculo = objetoJson['modalidadeBaseCalculo'];
			this.porcentoBaseCalculo = objetoJson['porcentoBaseCalculo'];
			this.aliquotaPorcento = objetoJson['aliquotaPorcento'];
			this.aliquotaUnidade = objetoJson['aliquotaUnidade'];
			this.valorPrecoMaximo = objetoJson['valorPrecoMaximo'];
			this.valorPautaFiscal = objetoJson['valorPautaFiscal'];
			this.itemListaServico = objetoJson['itemListaServico'];
			this.codigoTributacao = objetoJson['codigoTributacao'];
			
			if (objetoJson['tributOperacaoFiscal'] != null) {
				this.tributOperacaoFiscal = new TributOperacaoFiscal(objetoJson['tributOperacaoFiscal']);
			}

			
		}
	}
}