/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_EVENTO] 
                                                                                
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

@Entity({ name: 'FOLHA_EVENTO' })
export class FolhaEvento { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CODIGO' })
	codigo: string;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'DESCRICAO' })
	descricao: string;

	@Column({ name: 'TIPO' })
	tipo: string;

	@Column({ name: 'UNIDADE' })
	unidade: string;

	@Column({ name: 'BASE_CALCULO' })
	baseCalculo: string;

	@Column({ name: 'TAXA' })
	taxa: number;

	@Column({ name: 'RUBRICA_ESOCIAL' })
	rubricaEsocial: string;

	@Column({ name: 'COD_INCIDENCIA_PREVIDENCIA' })
	codIncidenciaPrevidencia: string;

	@Column({ name: 'COD_INCIDENCIA_IRRF' })
	codIncidenciaIrrf: string;

	@Column({ name: 'COD_INCIDENCIA_FGTS' })
	codIncidenciaFgts: string;

	@Column({ name: 'COD_INCIDENCIA_SINDICATO' })
	codIncidenciaSindicato: string;

	@Column({ name: 'REPERCUTE_DSR' })
	repercuteDsr: string;

	@Column({ name: 'REPERCUTE_13' })
	repercute13: string;

	@Column({ name: 'REPERCUTE_FERIAS' })
	repercuteFerias: string;

	@Column({ name: 'REPERCUTE_AVISO' })
	repercuteAviso: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.codigo = objetoJson['codigo'];
			this.nome = objetoJson['nome'];
			this.descricao = objetoJson['descricao'];
			this.tipo = objetoJson['tipo'];
			this.unidade = objetoJson['unidade'];
			this.baseCalculo = objetoJson['baseCalculo'];
			this.taxa = objetoJson['taxa'];
			this.rubricaEsocial = objetoJson['rubricaEsocial'];
			this.codIncidenciaPrevidencia = objetoJson['codIncidenciaPrevidencia'];
			this.codIncidenciaIrrf = objetoJson['codIncidenciaIrrf'];
			this.codIncidenciaFgts = objetoJson['codIncidenciaFgts'];
			this.codIncidenciaSindicato = objetoJson['codIncidenciaSindicato'];
			this.repercuteDsr = objetoJson['repercuteDsr'];
			this.repercute13 = objetoJson['repercute13'];
			this.repercuteFerias = objetoJson['repercuteFerias'];
			this.repercuteAviso = objetoJson['repercuteAviso'];
			
			
		}
	}
}