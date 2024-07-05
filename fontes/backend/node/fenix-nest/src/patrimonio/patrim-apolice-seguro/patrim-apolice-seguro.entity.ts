/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PATRIM_APOLICE_SEGURO] 
                                                                                
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

@Entity({ name: 'PATRIM_APOLICE_SEGURO' })
export class PatrimApoliceSeguro { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_PATRIM_BEM' })
	idPatrimBem: number;

	@Column({ name: 'ID_SEGURADORA' })
	idSeguradora: number;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'DATA_CONTRATACAO' })
	dataContratacao: Date;

	@Column({ name: 'DATA_VENCIMENTO' })
	dataVencimento: Date;

	@Column({ name: 'VALOR_PREMIO' })
	valorPremio: number;

	@Column({ name: 'VALOR_SEGURADO' })
	valorSegurado: number;

	@Column({ name: 'OBSERVACAO' })
	observacao: string;

	@Column({ name: 'IMAGEM' })
	imagem: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idPatrimBem = objetoJson['idPatrimBem'];
			this.idSeguradora = objetoJson['idSeguradora'];
			this.numero = objetoJson['numero'];
			this.dataContratacao = objetoJson['dataContratacao'];
			this.dataVencimento = objetoJson['dataVencimento'];
			this.valorPremio = objetoJson['valorPremio'];
			this.valorSegurado = objetoJson['valorSegurado'];
			this.observacao = objetoJson['observacao'];
			this.imagem = objetoJson['imagem'];
			
			
		}
	}
}