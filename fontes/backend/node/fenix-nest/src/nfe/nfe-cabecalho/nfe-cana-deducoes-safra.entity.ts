/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CANA_DEDUCOES_SAFRA] 
                                                                                
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
import { NfeCana } from '../../entities-export';

@Entity({ name: 'NFE_CANA_DEDUCOES_SAFRA' })
export class NfeCanaDeducoesSafra { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'DECRICAO' })
	decricao: string;

	@Column({ name: 'VALOR_DEDUCAO' })
	valorDeducao: number;

	@Column({ name: 'VALOR_FORNECIMENTO' })
	valorFornecimento: number;

	@Column({ name: 'VALOR_TOTAL_DEDUCAO' })
	valorTotalDeducao: number;

	@Column({ name: 'VALOR_LIQUIDO_FORNECIMENTO' })
	valorLiquidoFornecimento: number;


	/**
	* Relations
	*/
    @ManyToOne(() => NfeCana, nfeCana => nfeCana.listaNfeCanaDeducoesSafra)
    @JoinColumn({ name: "ID_NFE_CANA" })
    nfeCana: NfeCana;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.decricao = objetoJson['decricao'];
			this.valorDeducao = objetoJson['valorDeducao'];
			this.valorFornecimento = objetoJson['valorFornecimento'];
			this.valorTotalDeducao = objetoJson['valorTotalDeducao'];
			this.valorLiquidoFornecimento = objetoJson['valorLiquidoFornecimento'];
			
			
		}
	}
}