/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_TERMO] 
                                                                                
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

@Entity({ name: 'CONTABIL_TERMO' })
export class ContabilTermo { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_CONTABIL_LIVRO' })
	idContabilLivro: number;

	@Column({ name: 'ABERTURA_ENCERRAMENTO' })
	aberturaEncerramento: string;

	@Column({ name: 'NUMERO' })
	numero: number;

	@Column({ name: 'PAGINA_INICIAL' })
	paginaInicial: number;

	@Column({ name: 'PAGINA_FINAL' })
	paginaFinal: number;

	@Column({ name: 'REGISTRADO' })
	registrado: string;

	@Column({ name: 'NUMERO_REGISTRO' })
	numeroRegistro: string;

	@Column({ name: 'DATA_DESPACHO' })
	dataDespacho: Date;

	@Column({ name: 'DATA_ABERTURA' })
	dataAbertura: Date;

	@Column({ name: 'DATA_ENCERRAMENTO' })
	dataEncerramento: Date;

	@Column({ name: 'ESCRITURACAO_INICIO' })
	escrituracaoInicio: Date;

	@Column({ name: 'ESCRITURACAO_FIM' })
	escrituracaoFim: Date;

	@Column({ name: 'TEXTO' })
	texto: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idContabilLivro = objetoJson['idContabilLivro'];
			this.aberturaEncerramento = objetoJson['aberturaEncerramento'];
			this.numero = objetoJson['numero'];
			this.paginaInicial = objetoJson['paginaInicial'];
			this.paginaFinal = objetoJson['paginaFinal'];
			this.registrado = objetoJson['registrado'];
			this.numeroRegistro = objetoJson['numeroRegistro'];
			this.dataDespacho = objetoJson['dataDespacho'];
			this.dataAbertura = objetoJson['dataAbertura'];
			this.dataEncerramento = objetoJson['dataEncerramento'];
			this.escrituracaoInicio = objetoJson['escrituracaoInicio'];
			this.escrituracaoFim = objetoJson['escrituracaoFim'];
			this.texto = objetoJson['texto'];
			
			
		}
	}
}