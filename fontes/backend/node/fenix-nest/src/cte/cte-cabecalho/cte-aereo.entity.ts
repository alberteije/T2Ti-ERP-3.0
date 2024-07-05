/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_AEREO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'CTE_AEREO' })
export class CteAereo { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_CTE_CABECALHO' })
	idCteCabecalho: number;

	@Column({ name: 'NUMERO_MINUTA' })
	numeroMinuta: number;

	@Column({ name: 'NUMERO_CONHECIMENTO' })
	numeroConhecimento: number;

	@Column({ name: 'DATA_PREVISTA_ENTREGA' })
	dataPrevistaEntrega: Date;

	@Column({ name: 'TARIFA_CLASSE' })
	tarifaClasse: string;

	@Column({ name: 'TARIFA_CODIGO' })
	tarifaCodigo: string;

	@Column({ name: 'TARIFA_VALOR' })
	tarifaValor: number;

	@Column({ name: 'CARGA_DIMENSAO' })
	cargaDimensao: string;

	@Column({ name: 'CARGA_INFORMACAO_MANUSEIO' })
	cargaInformacaoManuseio: string;

	@Column({ name: 'CARGA_ESPECIAL' })
	cargaEspecial: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idCteCabecalho = objetoJson['idCteCabecalho'];
			this.numeroMinuta = objetoJson['numeroMinuta'];
			this.numeroConhecimento = objetoJson['numeroConhecimento'];
			this.dataPrevistaEntrega = objetoJson['dataPrevistaEntrega'];
			this.tarifaClasse = objetoJson['tarifaClasse'];
			this.tarifaCodigo = objetoJson['tarifaCodigo'];
			this.tarifaValor = objetoJson['tarifaValor'];
			this.cargaDimensao = objetoJson['cargaDimensao'];
			this.cargaInformacaoManuseio = objetoJson['cargaInformacaoManuseio'];
			this.cargaEspecial = objetoJson['cargaEspecial'];
			
			
		}
	}
}