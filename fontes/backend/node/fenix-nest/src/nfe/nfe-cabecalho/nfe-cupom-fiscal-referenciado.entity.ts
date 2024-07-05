/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CUPOM_FISCAL_REFERENCIADO] 
                                                                                
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
import { NfeCabecalho } from '../../entities-export';

@Entity({ name: 'NFE_CUPOM_FISCAL_REFERENCIADO' })
export class NfeCupomFiscalReferenciado { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'MODELO_DOCUMENTO_FISCAL' })
	modeloDocumentoFiscal: string;

	@Column({ name: 'NUMERO_ORDEM_ECF' })
	numeroOrdemEcf: number;

	@Column({ name: 'COO' })
	coo: number;

	@Column({ name: 'DATA_EMISSAO_CUPOM' })
	dataEmissaoCupom: Date;

	@Column({ name: 'NUMERO_CAIXA' })
	numeroCaixa: number;

	@Column({ name: 'NUMERO_SERIE_ECF' })
	numeroSerieEcf: string;


	/**
	* Relations
	*/
    @ManyToOne(() => NfeCabecalho, nfeCabecalho => nfeCabecalho.listaNfeCupomFiscalReferenciado)
    @JoinColumn({ name: "ID_NFE_CABECALHO" })
    nfeCabecalho: NfeCabecalho;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.modeloDocumentoFiscal = objetoJson['modeloDocumentoFiscal'];
			this.numeroOrdemEcf = objetoJson['numeroOrdemEcf'];
			this.coo = objetoJson['coo'];
			this.dataEmissaoCupom = objetoJson['dataEmissaoCupom'];
			this.numeroCaixa = objetoJson['numeroCaixa'];
			this.numeroSerieEcf = objetoJson['numeroSerieEcf'];
			
			
		}
	}
}