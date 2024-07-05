/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_COMBUSTIVEL] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';
import { NfeDetalhe } from '../../entities-export';

@Entity({ name: 'NFE_DET_ESPECIFICO_COMBUSTIVEL' })
export class NfeDetEspecificoCombustivel { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CODIGO_ANP' })
	codigoAnp: number;

	@Column({ name: 'DESCRICAO_ANP' })
	descricaoAnp: string;

	@Column({ name: 'PERCENTUAL_GLP' })
	percentualGlp: number;

	@Column({ name: 'PERCENTUAL_GAS_NACIONAL' })
	percentualGasNacional: number;

	@Column({ name: 'PERCENTUAL_GAS_IMPORTADO' })
	percentualGasImportado: number;

	@Column({ name: 'VALOR_PARTIDA' })
	valorPartida: number;

	@Column({ name: 'CODIF' })
	codif: string;

	@Column({ name: 'QUANTIDADE_TEMP_AMBIENTE' })
	quantidadeTempAmbiente: number;

	@Column({ name: 'UF_CONSUMO' })
	ufConsumo: string;

	@Column({ name: 'CIDE_BASE_CALCULO' })
	cideBaseCalculo: number;

	@Column({ name: 'CIDE_ALIQUOTA' })
	cideAliquota: number;

	@Column({ name: 'CIDE_VALOR' })
	cideValor: number;

	@Column({ name: 'ENCERRANTE_BICO' })
	encerranteBico: number;

	@Column({ name: 'ENCERRANTE_BOMBA' })
	encerranteBomba: number;

	@Column({ name: 'ENCERRANTE_TANQUE' })
	encerranteTanque: number;

	@Column({ name: 'ENCERRANTE_VALOR_INICIO' })
	encerranteValorInicio: number;

	@Column({ name: 'ENCERRANTE_VALOR_FIM' })
	encerranteValorFim: number;


	/**
	* Relations
	*/
    @OneToOne(() => NfeDetalhe, nfeDetalhe => nfeDetalhe.nfeDetEspecificoCombustivel)
    @JoinColumn({ name: "ID_NFE_DETALHE" })
    nfeDetalhe: NfeDetalhe;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.codigoAnp = objetoJson['codigoAnp'];
			this.descricaoAnp = objetoJson['descricaoAnp'];
			this.percentualGlp = objetoJson['percentualGlp'];
			this.percentualGasNacional = objetoJson['percentualGasNacional'];
			this.percentualGasImportado = objetoJson['percentualGasImportado'];
			this.valorPartida = objetoJson['valorPartida'];
			this.codif = objetoJson['codif'];
			this.quantidadeTempAmbiente = objetoJson['quantidadeTempAmbiente'];
			this.ufConsumo = objetoJson['ufConsumo'];
			this.cideBaseCalculo = objetoJson['cideBaseCalculo'];
			this.cideAliquota = objetoJson['cideAliquota'];
			this.cideValor = objetoJson['cideValor'];
			this.encerranteBico = objetoJson['encerranteBico'];
			this.encerranteBomba = objetoJson['encerranteBomba'];
			this.encerranteTanque = objetoJson['encerranteTanque'];
			this.encerranteValorInicio = objetoJson['encerranteValorInicio'];
			this.encerranteValorFim = objetoJson['encerranteValorFim'];
			
			
		}
	}
}