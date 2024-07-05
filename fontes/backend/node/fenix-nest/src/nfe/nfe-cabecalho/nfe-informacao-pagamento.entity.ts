/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_INFORMACAO_PAGAMENTO] 
                                                                                
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
import { NfeCabecalho } from '../../entities-export';

@Entity({ name: 'NFE_INFORMACAO_PAGAMENTO' })
export class NfeInformacaoPagamento { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'INDICADOR_PAGAMENTO' })
	indicadorPagamento: string;

	@Column({ name: 'MEIO_PAGAMENTO' })
	meioPagamento: string;

	@Column({ name: 'VALOR' })
	valor: number;

	@Column({ name: 'TIPO_INTEGRACAO' })
	tipoIntegracao: string;

	@Column({ name: 'CNPJ_OPERADORA_CARTAO' })
	cnpjOperadoraCartao: string;

	@Column({ name: 'BANDEIRA' })
	bandeira: string;

	@Column({ name: 'NUMERO_AUTORIZACAO' })
	numeroAutorizacao: string;

	@Column({ name: 'TROCO' })
	troco: number;


	/**
	* Relations
	*/
    @OneToOne(() => NfeCabecalho, nfeCabecalho => nfeCabecalho.nfeInformacaoPagamento)
    @JoinColumn({ name: "ID_NFE_CABECALHO" })
    nfeCabecalho: NfeCabecalho;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.indicadorPagamento = objetoJson['indicadorPagamento'];
			this.meioPagamento = objetoJson['meioPagamento'];
			this.valor = objetoJson['valor'];
			this.tipoIntegracao = objetoJson['tipoIntegracao'];
			this.cnpjOperadoraCartao = objetoJson['cnpjOperadoraCartao'];
			this.bandeira = objetoJson['bandeira'];
			this.numeroAutorizacao = objetoJson['numeroAutorizacao'];
			this.troco = objetoJson['troco'];
			
			
		}
	}
}