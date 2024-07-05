/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_II] 
                                                                                
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
import { NfeDetalhe } from '../../entities-export';

@Entity({ name: 'NFE_DETALHE_IMPOSTO_II' })
export class NfeDetalheImpostoIi { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'VALOR_BC_II' })
	valorBcIi: number;

	@Column({ name: 'VALOR_DESPESAS_ADUANEIRAS' })
	valorDespesasAduaneiras: number;

	@Column({ name: 'VALOR_IMPOSTO_IMPORTACAO' })
	valorImpostoImportacao: number;

	@Column({ name: 'VALOR_IOF' })
	valorIof: number;


	/**
	* Relations
	*/
    @OneToOne(() => NfeDetalhe, nfeDetalhe => nfeDetalhe.nfeDetalheImpostoIi)
    @JoinColumn({ name: "ID_NFE_DETALHE" })
    nfeDetalhe: NfeDetalhe;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.valorBcIi = objetoJson['valorBcIi'];
			this.valorDespesasAduaneiras = objetoJson['valorDespesasAduaneiras'];
			this.valorImpostoImportacao = objetoJson['valorImpostoImportacao'];
			this.valorIof = objetoJson['valorIof'];
			
			
		}
	}
}