/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VENDA_COMISSAO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, ManyToOne, JoinColumn } from 'typeorm';
import { VendaCabecalho } from '../../entities-export';
import { Vendedor } from '../../entities-export';

@Entity({ name: 'VENDA_COMISSAO' })
export class VendaComissao { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'VALOR_VENDA' })
	valorVenda: number;

	@Column({ name: 'TIPO_CONTABIL' })
	tipoContabil: string;

	@Column({ name: 'VALOR_COMISSAO' })
	valorComissao: number;

	@Column({ name: 'SITUACAO' })
	situacao: string;

	@Column({ name: 'DATA_LANCAMENTO' })
	dataLancamento: Date;


	/**
	* Relations
	*/
    @OneToOne(() => Vendedor)
    @JoinColumn({ name: "ID_VENDEDOR" })
    vendedor: Vendedor;

    @ManyToOne(() => VendaCabecalho, vendaCabecalho => vendaCabecalho.listaVendaComissao)
    @JoinColumn({ name: "ID_VENDA_CABECALHO" })
    vendaCabecalho: VendaCabecalho;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.valorVenda = objetoJson['valorVenda'];
			this.tipoContabil = objetoJson['tipoContabil'];
			this.valorComissao = objetoJson['valorComissao'];
			this.situacao = objetoJson['situacao'];
			this.dataLancamento = objetoJson['dataLancamento'];
			
			if (objetoJson['vendedor'] != null) {
				this.vendedor = new Vendedor(objetoJson['vendedor']);
			}

			
		}
	}
}