/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_HORARIO_AUTORIZADO] 
                                                                                
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

@Entity({ name: 'PONTO_HORARIO_AUTORIZADO' })
export class PontoHorarioAutorizado { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_COLABORADOR' })
	idColaborador: number;

	@Column({ name: 'DATA_HORARIO' })
	dataHorario: Date;

	@Column({ name: 'TIPO' })
	tipo: string;

	@Column({ name: 'CARGA_HORARIA' })
	cargaHoraria: string;

	@Column({ name: 'ENTRADA01' })
	entrada01: string;

	@Column({ name: 'SAIDA01' })
	saida01: string;

	@Column({ name: 'ENTRADA02' })
	entrada02: string;

	@Column({ name: 'SAIDA02' })
	saida02: string;

	@Column({ name: 'ENTRADA03' })
	entrada03: string;

	@Column({ name: 'SAIDA03' })
	saida03: string;

	@Column({ name: 'ENTRADA04' })
	entrada04: string;

	@Column({ name: 'SAIDA04' })
	saida04: string;

	@Column({ name: 'ENTRADA05' })
	entrada05: string;

	@Column({ name: 'SAIDA05' })
	saida05: string;

	@Column({ name: 'HORA_FECHAMENTO_DIA' })
	horaFechamentoDia: string;


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
			this.dataHorario = objetoJson['dataHorario'];
			this.tipo = objetoJson['tipo'];
			this.cargaHoraria = objetoJson['cargaHoraria'];
			this.entrada01 = objetoJson['entrada01'];
			this.saida01 = objetoJson['saida01'];
			this.entrada02 = objetoJson['entrada02'];
			this.saida02 = objetoJson['saida02'];
			this.entrada03 = objetoJson['entrada03'];
			this.saida03 = objetoJson['saida03'];
			this.entrada04 = objetoJson['entrada04'];
			this.saida04 = objetoJson['saida04'];
			this.entrada05 = objetoJson['entrada05'];
			this.saida05 = objetoJson['saida05'];
			this.horaFechamentoDia = objetoJson['horaFechamentoDia'];
			
			
		}
	}
}