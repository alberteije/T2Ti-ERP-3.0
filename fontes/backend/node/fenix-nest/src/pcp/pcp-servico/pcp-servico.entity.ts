/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PCP_SERVICO] 
                                                                                
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

@Entity({ name: 'PCP_SERVICO' })
export class PcpServico { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_PCP_OP_DETALHE' })
	idPcpOpDetalhe: number;

	@Column({ name: 'INICIO_REALIZADO' })
	inicioRealizado: Date;

	@Column({ name: 'TERMINO_REALIZADO' })
	terminoRealizado: Date;

	@Column({ name: 'HORAS_REALIZADO' })
	horasRealizado: number;

	@Column({ name: 'MINUTOS_REALIZADO' })
	minutosRealizado: number;

	@Column({ name: 'SEGUNDOS_REALIZADO' })
	segundosRealizado: number;

	@Column({ name: 'CUSTO_REALIZADO' })
	custoRealizado: number;

	@Column({ name: 'INICIO_PREVISTO' })
	inicioPrevisto: Date;

	@Column({ name: 'TERMINO_PREVISTO' })
	terminoPrevisto: Date;

	@Column({ name: 'HORAS_PREVISTO' })
	horasPrevisto: number;

	@Column({ name: 'MINUTOS_PREVISTO' })
	minutosPrevisto: number;

	@Column({ name: 'SEGUNDOS_PREVISTO' })
	segundosPrevisto: number;

	@Column({ name: 'CUSTO_PREVISTO' })
	custoPrevisto: number;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idPcpOpDetalhe = objetoJson['idPcpOpDetalhe'];
			this.inicioRealizado = objetoJson['inicioRealizado'];
			this.terminoRealizado = objetoJson['terminoRealizado'];
			this.horasRealizado = objetoJson['horasRealizado'];
			this.minutosRealizado = objetoJson['minutosRealizado'];
			this.segundosRealizado = objetoJson['segundosRealizado'];
			this.custoRealizado = objetoJson['custoRealizado'];
			this.inicioPrevisto = objetoJson['inicioPrevisto'];
			this.terminoPrevisto = objetoJson['terminoPrevisto'];
			this.horasPrevisto = objetoJson['horasPrevisto'];
			this.minutosPrevisto = objetoJson['minutosPrevisto'];
			this.segundosPrevisto = objetoJson['segundosPrevisto'];
			this.custoPrevisto = objetoJson['custoPrevisto'];
			
			
		}
	}
}