/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_IMPORTACAO_DETALHE] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { NfeDeclaracaoImportacao } from '../../entities-export';

@Entity({ name: 'NFE_IMPORTACAO_DETALHE' })
export class NfeImportacaoDetalhe { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'NUMERO_ADICAO' })
	numeroAdicao: number;

	@Column({ name: 'NUMERO_SEQUENCIAL' })
	numeroSequencial: number;

	@Column({ name: 'CODIGO_FABRICANTE_ESTRANGEIRO' })
	codigoFabricanteEstrangeiro: string;

	@Column({ name: 'VALOR_DESCONTO' })
	valorDesconto: number;

	@Column({ name: 'DRAWBACK' })
	drawback: number;


	/**
	* Relations
	*/
    @ManyToOne(() => NfeDeclaracaoImportacao, nfeDeclaracaoImportacao => nfeDeclaracaoImportacao.listaNfeImportacaoDetalhe)
    @JoinColumn({ name: "ID_NFE_DECLARACAO_IMPORTACAO" })
    nfeDeclaracaoImportacao: NfeDeclaracaoImportacao;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.numeroAdicao = objetoJson['numeroAdicao'];
			this.numeroSequencial = objetoJson['numeroSequencial'];
			this.codigoFabricanteEstrangeiro = objetoJson['codigoFabricanteEstrangeiro'];
			this.valorDesconto = objetoJson['valorDesconto'];
			this.drawback = objetoJson['drawback'];
			
			
		}
	}
}