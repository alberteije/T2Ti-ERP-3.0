/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_LANCAMENTO_ORCADO] 
                                                                                
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

@Entity({ name: 'CONTABIL_LANCAMENTO_ORCADO' })
export class ContabilLancamentoOrcado { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_CONTABIL_CONTA' })
	idContabilConta: number;

	@Column({ name: 'ANO' })
	ano: string;

	@Column({ name: 'JANEIRO' })
	janeiro: number;

	@Column({ name: 'FEVEREIRO' })
	fevereiro: number;

	@Column({ name: 'MARCO' })
	marco: number;

	@Column({ name: 'ABRIL' })
	abril: number;

	@Column({ name: 'MAIO' })
	maio: number;

	@Column({ name: 'JUNHO' })
	junho: number;

	@Column({ name: 'JULHO' })
	julho: number;

	@Column({ name: 'AGOSTO' })
	agosto: number;

	@Column({ name: 'SETEMBRO' })
	setembro: number;

	@Column({ name: 'OUTUBRO' })
	outubro: number;

	@Column({ name: 'NOVEMBRO' })
	novembro: number;

	@Column({ name: 'DEZEMBRO' })
	dezembro: number;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idContabilConta = objetoJson['idContabilConta'];
			this.ano = objetoJson['ano'];
			this.janeiro = objetoJson['janeiro'];
			this.fevereiro = objetoJson['fevereiro'];
			this.marco = objetoJson['marco'];
			this.abril = objetoJson['abril'];
			this.maio = objetoJson['maio'];
			this.junho = objetoJson['junho'];
			this.julho = objetoJson['julho'];
			this.agosto = objetoJson['agosto'];
			this.setembro = objetoJson['setembro'];
			this.outubro = objetoJson['outubro'];
			this.novembro = objetoJson['novembro'];
			this.dezembro = objetoJson['dezembro'];
			
			
		}
	}
}