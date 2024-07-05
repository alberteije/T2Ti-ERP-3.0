/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_DRE_DETALHE] 
                                                                                
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

@Entity({ name: 'CONTABIL_DRE_DETALHE' })
export class ContabilDreDetalhe { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_CONTABIL_DRE_CABECALHO' })
	idContabilDreCabecalho: number;

	@Column({ name: 'CLASSIFICACAO' })
	classificacao: string;

	@Column({ name: 'DESCRICAO' })
	descricao: string;

	@Column({ name: 'FORMA_CALCULO' })
	formaCalculo: string;

	@Column({ name: 'SINAL' })
	sinal: string;

	@Column({ name: 'NATUREZA' })
	natureza: string;

	@Column({ name: 'VALOR' })
	valor: number;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idContabilDreCabecalho = objetoJson['idContabilDreCabecalho'];
			this.classificacao = objetoJson['classificacao'];
			this.descricao = objetoJson['descricao'];
			this.formaCalculo = objetoJson['formaCalculo'];
			this.sinal = objetoJson['sinal'];
			this.natureza = objetoJson['natureza'];
			this.valor = objetoJson['valor'];
			
			
		}
	}
}