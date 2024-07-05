/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ISSQN] 
                                                                                
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

@Entity({ name: 'NFE_DETALHE_IMPOSTO_ISSQN' })
export class NfeDetalheImpostoIssqn { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'BASE_CALCULO_ISSQN' })
	baseCalculoIssqn: number;

	@Column({ name: 'ALIQUOTA_ISSQN' })
	aliquotaIssqn: number;

	@Column({ name: 'VALOR_ISSQN' })
	valorIssqn: number;

	@Column({ name: 'MUNICIPIO_ISSQN' })
	municipioIssqn: number;

	@Column({ name: 'ITEM_LISTA_SERVICOS' })
	itemListaServicos: number;

	@Column({ name: 'VALOR_DEDUCAO' })
	valorDeducao: number;

	@Column({ name: 'VALOR_OUTRAS_RETENCOES' })
	valorOutrasRetencoes: number;

	@Column({ name: 'VALOR_DESCONTO_INCONDICIONADO' })
	valorDescontoIncondicionado: number;

	@Column({ name: 'VALOR_DESCONTO_CONDICIONADO' })
	valorDescontoCondicionado: number;

	@Column({ name: 'VALOR_RETENCAO_ISS' })
	valorRetencaoIss: number;

	@Column({ name: 'INDICADOR_EXIGIBILIDADE_ISS' })
	indicadorExigibilidadeIss: string;

	@Column({ name: 'CODIGO_SERVICO' })
	codigoServico: string;

	@Column({ name: 'MUNICIPIO_INCIDENCIA' })
	municipioIncidencia: number;

	@Column({ name: 'PAIS_SEVICO_PRESTADO' })
	paisSevicoPrestado: number;

	@Column({ name: 'NUMERO_PROCESSO' })
	numeroProcesso: string;

	@Column({ name: 'INDICADOR_INCENTIVO_FISCAL' })
	indicadorIncentivoFiscal: string;


	/**
	* Relations
	*/
    @OneToOne(() => NfeDetalhe, nfeDetalhe => nfeDetalhe.nfeDetalheImpostoIssqn)
    @JoinColumn({ name: "ID_NFE_DETALHE" })
    nfeDetalhe: NfeDetalhe;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.baseCalculoIssqn = objetoJson['baseCalculoIssqn'];
			this.aliquotaIssqn = objetoJson['aliquotaIssqn'];
			this.valorIssqn = objetoJson['valorIssqn'];
			this.municipioIssqn = objetoJson['municipioIssqn'];
			this.itemListaServicos = objetoJson['itemListaServicos'];
			this.valorDeducao = objetoJson['valorDeducao'];
			this.valorOutrasRetencoes = objetoJson['valorOutrasRetencoes'];
			this.valorDescontoIncondicionado = objetoJson['valorDescontoIncondicionado'];
			this.valorDescontoCondicionado = objetoJson['valorDescontoCondicionado'];
			this.valorRetencaoIss = objetoJson['valorRetencaoIss'];
			this.indicadorExigibilidadeIss = objetoJson['indicadorExigibilidadeIss'];
			this.codigoServico = objetoJson['codigoServico'];
			this.municipioIncidencia = objetoJson['municipioIncidencia'];
			this.paisSevicoPrestado = objetoJson['paisSevicoPrestado'];
			this.numeroProcesso = objetoJson['numeroProcesso'];
			this.indicadorIncentivoFiscal = objetoJson['indicadorIncentivoFiscal'];
			
			
		}
	}
}