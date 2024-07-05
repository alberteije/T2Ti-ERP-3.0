/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PLANO_CONTA_REF_SPED] 
                                                                                
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

@Entity({ name: 'PLANO_CONTA_REF_SPED' })
export class PlanoContaRefSped { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'COD_CTA_REF' })
	codCtaRef: string;

	@Column({ name: 'DESCRICAO' })
	descricao: string;

	@Column({ name: 'ORIENTACOES' })
	orientacoes: string;

	@Column({ name: 'INICIO_VALIDADE' })
	inicioValidade: Date;

	@Column({ name: 'FIM_VALIDADE' })
	fimValidade: Date;

	@Column({ name: 'TIPO' })
	tipo: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.codCtaRef = objetoJson['codCtaRef'];
			this.descricao = objetoJson['descricao'];
			this.orientacoes = objetoJson['orientacoes'];
			this.inicioValidade = objetoJson['inicioValidade'];
			this.fimValidade = objetoJson['fimValidade'];
			this.tipo = objetoJson['tipo'];
			
			
		}
	}
}