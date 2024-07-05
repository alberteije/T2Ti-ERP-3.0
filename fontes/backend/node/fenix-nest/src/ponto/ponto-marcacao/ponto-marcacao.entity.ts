/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_MARCACAO] 
                                                                                
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

@Entity({ name: 'PONTO_MARCACAO' })
export class PontoMarcacao { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_PONTO_RELOGIO' })
	idPontoRelogio: number;

	@Column({ name: 'ID_COLABORADOR' })
	idColaborador: number;

	@Column({ name: 'NSR' })
	nsr: number;

	@Column({ name: 'DATA_MARCACAO' })
	dataMarcacao: Date;

	@Column({ name: 'HORA_MARCACAO' })
	horaMarcacao: string;

	@Column({ name: 'TIPO_MARCACAO' })
	tipoMarcacao: string;

	@Column({ name: 'TIPO_REGISTRO' })
	tipoRegistro: string;

	@Column({ name: 'PAR_ENTRADA_SAIDA' })
	parEntradaSaida: string;

	@Column({ name: 'JUSTIFICATIVA' })
	justificativa: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idPontoRelogio = objetoJson['idPontoRelogio'];
			this.idColaborador = objetoJson['idColaborador'];
			this.nsr = objetoJson['nsr'];
			this.dataMarcacao = objetoJson['dataMarcacao'];
			this.horaMarcacao = objetoJson['horaMarcacao'];
			this.tipoMarcacao = objetoJson['tipoMarcacao'];
			this.tipoRegistro = objetoJson['tipoRegistro'];
			this.parEntradaSaida = objetoJson['parEntradaSaida'];
			this.justificativa = objetoJson['justificativa'];
			
			
		}
	}
}