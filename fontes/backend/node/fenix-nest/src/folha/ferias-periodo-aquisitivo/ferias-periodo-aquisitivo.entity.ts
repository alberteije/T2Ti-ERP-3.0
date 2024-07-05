/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FERIAS_PERIODO_AQUISITIVO] 
                                                                                
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

@Entity({ name: 'FERIAS_PERIODO_AQUISITIVO' })
export class FeriasPeriodoAquisitivo { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_COLABORADOR' })
	idColaborador: number;

	@Column({ name: 'DATA_INICIO' })
	dataInicio: Date;

	@Column({ name: 'DATA_FIM' })
	dataFim: Date;

	@Column({ name: 'SITUACAO' })
	situacao: string;

	@Column({ name: 'LIMITE_PARA_GOZO' })
	limiteParaGozo: Date;

	@Column({ name: 'DESCONTAR_FALTAS' })
	descontarFaltas: string;

	@Column({ name: 'DESCONSIDERAR_AFASTAMENTO' })
	desconsiderarAfastamento: string;

	@Column({ name: 'AFASTAMENTO_PREVIDENCIA' })
	afastamentoPrevidencia: number;

	@Column({ name: 'AFASTAMENTO_SEM_REMUN' })
	afastamentoSemRemun: number;

	@Column({ name: 'AFASTAMENTO_COM_REMUN' })
	afastamentoComRemun: number;

	@Column({ name: 'DIAS_DIREITO' })
	diasDireito: number;

	@Column({ name: 'DIAS_GOZADOS' })
	diasGozados: number;

	@Column({ name: 'DIAS_FALTAS' })
	diasFaltas: number;

	@Column({ name: 'DIAS_RESTANTES' })
	diasRestantes: number;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idColaborador = objetoJson['idColaborador'];
			this.dataInicio = objetoJson['dataInicio'];
			this.dataFim = objetoJson['dataFim'];
			this.situacao = objetoJson['situacao'];
			this.limiteParaGozo = objetoJson['limiteParaGozo'];
			this.descontarFaltas = objetoJson['descontarFaltas'];
			this.desconsiderarAfastamento = objetoJson['desconsiderarAfastamento'];
			this.afastamentoPrevidencia = objetoJson['afastamentoPrevidencia'];
			this.afastamentoSemRemun = objetoJson['afastamentoSemRemun'];
			this.afastamentoComRemun = objetoJson['afastamentoComRemun'];
			this.diasDireito = objetoJson['diasDireito'];
			this.diasGozados = objetoJson['diasGozados'];
			this.diasFaltas = objetoJson['diasFaltas'];
			this.diasRestantes = objetoJson['diasRestantes'];
			
			
		}
	}
}