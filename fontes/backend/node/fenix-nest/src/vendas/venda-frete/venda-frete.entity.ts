/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_FRETE] 
                                                                                
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
import { VendaCabecalho } from '../../entities-export';
import { Transportadora } from '../../entities-export';

@Entity({ name: 'VENDA_FRETE' })
export class VendaFrete { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CONHECIMENTO' })
	conhecimento: number;

	@Column({ name: 'RESPONSAVEL' })
	responsavel: string;

	@Column({ name: 'PLACA' })
	placa: string;

	@Column({ name: 'UF_PLACA' })
	ufPlaca: string;

	@Column({ name: 'SELO_FISCAL' })
	seloFiscal: number;

	@Column({ name: 'QUANTIDADE_VOLUME' })
	quantidadeVolume: number;

	@Column({ name: 'MARCA_VOLUME' })
	marcaVolume: string;

	@Column({ name: 'ESPECIE_VOLUME' })
	especieVolume: string;

	@Column({ name: 'PESO_BRUTO' })
	pesoBruto: number;

	@Column({ name: 'PESO_LIQUIDO' })
	pesoLiquido: number;


	/**
	* Relations
	*/
    @OneToOne(() => VendaCabecalho)
    @JoinColumn({ name: "ID_VENDA_CABECALHO" })
    vendaCabecalho: VendaCabecalho;

    @OneToOne(() => Transportadora)
    @JoinColumn({ name: "ID_TRANSPORTADORA" })
    transportadora: Transportadora;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.conhecimento = objetoJson['conhecimento'];
			this.responsavel = objetoJson['responsavel'];
			this.placa = objetoJson['placa'];
			this.ufPlaca = objetoJson['ufPlaca'];
			this.seloFiscal = objetoJson['seloFiscal'];
			this.quantidadeVolume = objetoJson['quantidadeVolume'];
			this.marcaVolume = objetoJson['marcaVolume'];
			this.especieVolume = objetoJson['especieVolume'];
			this.pesoBruto = objetoJson['pesoBruto'];
			this.pesoLiquido = objetoJson['pesoLiquido'];
			
			if (objetoJson['vendaCabecalho'] != null) {
				this.vendaCabecalho = new VendaCabecalho(objetoJson['vendaCabecalho']);
			}

			if (objetoJson['transportadora'] != null) {
				this.transportadora = new Transportadora(objetoJson['transportadora']);
			}

			
		}
	}
}