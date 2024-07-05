/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDEDOR_META] 
                                                                                
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
import { Vendedor } from '../../entities-export';
import { Cliente } from '../../entities-export';

@Entity({ name: 'VENDEDOR_META' })
export class VendedorMeta { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'PERIODO_META' })
	periodoMeta: string;

	@Column({ name: 'META_ORCADA' })
	metaOrcada: number;

	@Column({ name: 'META_REALIZADA' })
	metaRealizada: number;

	@Column({ name: 'DATA_INICIO' })
	dataInicio: Date;

	@Column({ name: 'DATA_FIM' })
	dataFim: Date;


	/**
	* Relations
	*/
    @OneToOne(() => Vendedor)
    @JoinColumn({ name: "ID_VENDEDOR" })
    vendedor: Vendedor;

    @OneToOne(() => Cliente)
    @JoinColumn({ name: "ID_CLIENTE" })
    cliente: Cliente;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.periodoMeta = objetoJson['periodoMeta'];
			this.metaOrcada = objetoJson['metaOrcada'];
			this.metaRealizada = objetoJson['metaRealizada'];
			this.dataInicio = objetoJson['dataInicio'];
			this.dataFim = objetoJson['dataFim'];
			
			if (objetoJson['vendedor'] != null) {
				this.vendedor = new Vendedor(objetoJson['vendedor']);
			}

			if (objetoJson['cliente'] != null) {
				this.cliente = new Cliente(objetoJson['cliente']);
			}

			
		}
	}
}