/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [INVENTARIO_CONTAGEM_DET] 
                                                                                
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
import { InventarioContagemCab } from '../../entities-export';
import { Produto } from '../../entities-export';

@Entity({ name: 'INVENTARIO_CONTAGEM_DET' })
export class InventarioContagemDet { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CONTAGEM01' })
	contagem01: number;

	@Column({ name: 'CONTAGEM02' })
	contagem02: number;

	@Column({ name: 'CONTAGEM03' })
	contagem03: number;

	@Column({ name: 'FECHADO_CONTAGEM' })
	fechadoContagem: string;

	@Column({ name: 'QUANTIDADE_SISTEMA' })
	quantidadeSistema: number;

	@Column({ name: 'ACURACIDADE' })
	acuracidade: number;

	@Column({ name: 'DIVERGENCIA' })
	divergencia: number;


	/**
	* Relations
	*/
    @OneToOne(() => Produto)
    @JoinColumn({ name: "ID_PRODUTO" })
    produto: Produto;

    @ManyToOne(() => InventarioContagemCab, inventarioContagemCab => inventarioContagemCab.listaInventarioContagemDet)
    @JoinColumn({ name: "ID_INVENTARIO_CONTAGEM_CAB" })
    inventarioContagemCab: InventarioContagemCab;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.contagem01 = objetoJson['contagem01'];
			this.contagem02 = objetoJson['contagem02'];
			this.contagem03 = objetoJson['contagem03'];
			this.fechadoContagem = objetoJson['fechadoContagem'];
			this.quantidadeSistema = objetoJson['quantidadeSistema'];
			this.acuracidade = objetoJson['acuracidade'];
			this.divergencia = objetoJson['divergencia'];
			
			if (objetoJson['produto'] != null) {
				this.produto = new Produto(objetoJson['produto']);
			}

			
		}
	}
}