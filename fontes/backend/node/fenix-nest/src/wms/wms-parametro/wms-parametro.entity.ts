/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [WMS_PARAMETRO] 
                                                                                
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

@Entity({ name: 'WMS_PARAMETRO' })
export class WmsParametro { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'HORA_POR_VOLUME' })
	horaPorVolume: number;

	@Column({ name: 'PESSOA_POR_VOLUME' })
	pessoaPorVolume: number;

	@Column({ name: 'HORA_POR_PESO' })
	horaPorPeso: number;

	@Column({ name: 'PESSOA_POR_PESO' })
	pessoaPorPeso: number;

	@Column({ name: 'ITEM_DIFERENTE_CAIXA' })
	itemDiferenteCaixa: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.horaPorVolume = objetoJson['horaPorVolume'];
			this.pessoaPorVolume = objetoJson['pessoaPorVolume'];
			this.horaPorPeso = objetoJson['horaPorPeso'];
			this.pessoaPorPeso = objetoJson['pessoaPorPeso'];
			this.itemDiferenteCaixa = objetoJson['itemDiferenteCaixa'];
			
			
		}
	}
}