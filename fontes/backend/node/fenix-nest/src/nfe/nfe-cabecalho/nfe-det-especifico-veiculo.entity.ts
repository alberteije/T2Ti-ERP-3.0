/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_VEICULO] 
                                                                                
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

@Entity({ name: 'NFE_DET_ESPECIFICO_VEICULO' })
export class NfeDetEspecificoVeiculo { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'TIPO_OPERACAO' })
	tipoOperacao: string;

	@Column({ name: 'CHASSI' })
	chassi: string;

	@Column({ name: 'COR' })
	cor: string;

	@Column({ name: 'DESCRICAO_COR' })
	descricaoCor: string;

	@Column({ name: 'POTENCIA_MOTOR' })
	potenciaMotor: string;

	@Column({ name: 'CILINDRADAS' })
	cilindradas: string;

	@Column({ name: 'PESO_LIQUIDO' })
	pesoLiquido: string;

	@Column({ name: 'PESO_BRUTO' })
	pesoBruto: string;

	@Column({ name: 'NUMERO_SERIE' })
	numeroSerie: string;

	@Column({ name: 'TIPO_COMBUSTIVEL' })
	tipoCombustivel: string;

	@Column({ name: 'NUMERO_MOTOR' })
	numeroMotor: string;

	@Column({ name: 'CAPACIDADE_MAXIMA_TRACAO' })
	capacidadeMaximaTracao: string;

	@Column({ name: 'DISTANCIA_EIXOS' })
	distanciaEixos: string;

	@Column({ name: 'ANO_MODELO' })
	anoModelo: string;

	@Column({ name: 'ANO_FABRICACAO' })
	anoFabricacao: string;

	@Column({ name: 'TIPO_PINTURA' })
	tipoPintura: string;

	@Column({ name: 'TIPO_VEICULO' })
	tipoVeiculo: string;

	@Column({ name: 'ESPECIE_VEICULO' })
	especieVeiculo: string;

	@Column({ name: 'CONDICAO_VIN' })
	condicaoVin: string;

	@Column({ name: 'CONDICAO_VEICULO' })
	condicaoVeiculo: string;

	@Column({ name: 'CODIGO_MARCA_MODELO' })
	codigoMarcaModelo: string;

	@Column({ name: 'CODIGO_COR_DENATRAN' })
	codigoCorDenatran: string;

	@Column({ name: 'LOTACAO_MAXIMA' })
	lotacaoMaxima: number;

	@Column({ name: 'RESTRICAO' })
	restricao: string;


	/**
	* Relations
	*/
    @OneToOne(() => NfeDetalhe, nfeDetalhe => nfeDetalhe.nfeDetEspecificoVeiculo)
    @JoinColumn({ name: "ID_NFE_DETALHE" })
    nfeDetalhe: NfeDetalhe;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.tipoOperacao = objetoJson['tipoOperacao'];
			this.chassi = objetoJson['chassi'];
			this.cor = objetoJson['cor'];
			this.descricaoCor = objetoJson['descricaoCor'];
			this.potenciaMotor = objetoJson['potenciaMotor'];
			this.cilindradas = objetoJson['cilindradas'];
			this.pesoLiquido = objetoJson['pesoLiquido'];
			this.pesoBruto = objetoJson['pesoBruto'];
			this.numeroSerie = objetoJson['numeroSerie'];
			this.tipoCombustivel = objetoJson['tipoCombustivel'];
			this.numeroMotor = objetoJson['numeroMotor'];
			this.capacidadeMaximaTracao = objetoJson['capacidadeMaximaTracao'];
			this.distanciaEixos = objetoJson['distanciaEixos'];
			this.anoModelo = objetoJson['anoModelo'];
			this.anoFabricacao = objetoJson['anoFabricacao'];
			this.tipoPintura = objetoJson['tipoPintura'];
			this.tipoVeiculo = objetoJson['tipoVeiculo'];
			this.especieVeiculo = objetoJson['especieVeiculo'];
			this.condicaoVin = objetoJson['condicaoVin'];
			this.condicaoVeiculo = objetoJson['condicaoVeiculo'];
			this.codigoMarcaModelo = objetoJson['codigoMarcaModelo'];
			this.codigoCorDenatran = objetoJson['codigoCorDenatran'];
			this.lotacaoMaxima = objetoJson['lotacaoMaxima'];
			this.restricao = objetoJson['restricao'];
			
			
		}
	}
}