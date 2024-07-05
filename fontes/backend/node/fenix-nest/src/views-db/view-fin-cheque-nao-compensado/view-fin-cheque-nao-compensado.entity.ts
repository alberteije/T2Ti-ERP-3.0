/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_CHEQUE_NAO_COMPENSADO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'VIEW_FIN_CHEQUE_NAO_COMPENSADO' })
export class ViewFinChequeNaoCompensado { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_CONTA_CAIXA' })
	idContaCaixa: number;

	@Column({ name: 'NOME_CONTA_CAIXA' })
	nomeContaCaixa: string;

	@Column({ name: 'TALAO' })
	talao: string;

	@Column({ name: 'NUMERO_TALAO' })
	numeroTalao: number;

	@Column({ name: 'NUMERO_CHEQUE' })
	numeroCheque: number;

	@Column({ name: 'STATUS_CHEQUE' })
	statusCheque: string;

	@Column({ name: 'DATA_STATUS' })
	dataStatus: Date;

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
			this.idContaCaixa = objetoJson['idContaCaixa'];
			this.nomeContaCaixa = objetoJson['nomeContaCaixa'];
			this.talao = objetoJson['talao'];
			this.numeroTalao = objetoJson['numeroTalao'];
			this.numeroCheque = objetoJson['numeroCheque'];
			this.statusCheque = objetoJson['statusCheque'];
			this.dataStatus = objetoJson['dataStatus'];
			this.valor = objetoJson['valor'];
			
			
		}
	}
}