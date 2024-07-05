/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_FERIAS_COLETIVAS] 
                                                                                
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

@Entity({ name: 'FOLHA_FERIAS_COLETIVAS' })
export class FolhaFeriasColetivas { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'DATA_INICIO' })
	dataInicio: Date;

	@Column({ name: 'DATA_FIM' })
	dataFim: Date;

	@Column({ name: 'DIAS_GOZO' })
	diasGozo: number;

	@Column({ name: 'ABONO_PECUNIARIO_INICIO' })
	abonoPecuniarioInicio: Date;

	@Column({ name: 'ABONO_PECUNIARIO_FIM' })
	abonoPecuniarioFim: Date;

	@Column({ name: 'DIAS_ABONO' })
	diasAbono: number;

	@Column({ name: 'DATA_PAGAMENTO' })
	dataPagamento: Date;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.dataInicio = objetoJson['dataInicio'];
			this.dataFim = objetoJson['dataFim'];
			this.diasGozo = objetoJson['diasGozo'];
			this.abonoPecuniarioInicio = objetoJson['abonoPecuniarioInicio'];
			this.abonoPecuniarioFim = objetoJson['abonoPecuniarioFim'];
			this.diasAbono = objetoJson['diasAbono'];
			this.dataPagamento = objetoJson['dataPagamento'];
			
			
		}
	}
}