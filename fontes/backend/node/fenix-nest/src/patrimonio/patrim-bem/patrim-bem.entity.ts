/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PATRIM_BEM] 
                                                                                
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

@Entity({ name: 'PATRIM_BEM' })
export class PatrimBem { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_CENTRO_RESULTADO' })
	idCentroResultado: number;

	@Column({ name: 'ID_PATRIM_TIPO_AQUISICAO_BEM' })
	idPatrimTipoAquisicaoBem: number;

	@Column({ name: 'ID_PATRIM_ESTADO_CONSERVACAO' })
	idPatrimEstadoConservacao: number;

	@Column({ name: 'ID_PATRIM_GRUPO_BEM' })
	idPatrimGrupoBem: number;

	@Column({ name: 'ID_FORNECEDOR' })
	idFornecedor: number;

	@Column({ name: 'ID_COLABORADOR' })
	idColaborador: number;

	@Column({ name: 'ID_SETOR' })
	idSetor: number;

	@Column({ name: 'NUMERO_NB' })
	numeroNb: string;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'DESCRICAO' })
	descricao: string;

	@Column({ name: 'NUMERO_SERIE' })
	numeroSerie: string;

	@Column({ name: 'DATA_AQUISICAO' })
	dataAquisicao: Date;

	@Column({ name: 'DATA_ACEITE' })
	dataAceite: Date;

	@Column({ name: 'DATA_CADASTRO' })
	dataCadastro: Date;

	@Column({ name: 'DATA_CONTABILIZADO' })
	dataContabilizado: Date;

	@Column({ name: 'DATA_VISTORIA' })
	dataVistoria: Date;

	@Column({ name: 'DATA_MARCACAO' })
	dataMarcacao: Date;

	@Column({ name: 'DATA_BAIXA' })
	dataBaixa: Date;

	@Column({ name: 'VENCIMENTO_GARANTIA' })
	vencimentoGarantia: Date;

	@Column({ name: 'NUMERO_NOTA_FISCAL' })
	numeroNotaFiscal: string;

	@Column({ name: 'CHAVE_NFE' })
	chaveNfe: string;

	@Column({ name: 'VALOR_ORIGINAL' })
	valorOriginal: number;

	@Column({ name: 'VALOR_COMPRA' })
	valorCompra: number;

	@Column({ name: 'VALOR_ATUALIZADO' })
	valorAtualizado: number;

	@Column({ name: 'VALOR_BAIXA' })
	valorBaixa: number;

	@Column({ name: 'DEPRECIA' })
	deprecia: string;

	@Column({ name: 'METODO_DEPRECIACAO' })
	metodoDepreciacao: string;

	@Column({ name: 'INICIO_DEPRECIACAO' })
	inicioDepreciacao: Date;

	@Column({ name: 'ULTIMA_DEPRECIACAO' })
	ultimaDepreciacao: Date;

	@Column({ name: 'TIPO_DEPRECIACAO' })
	tipoDepreciacao: string;

	@Column({ name: 'TAXA_ANUAL_DEPRECIACAO' })
	taxaAnualDepreciacao: number;

	@Column({ name: 'TAXA_MENSAL_DEPRECIACAO' })
	taxaMensalDepreciacao: number;

	@Column({ name: 'TAXA_DEPRECIACAO_ACELERADA' })
	taxaDepreciacaoAcelerada: number;

	@Column({ name: 'TAXA_DEPRECIACAO_INCENTIVADA' })
	taxaDepreciacaoIncentivada: number;

	@Column({ name: 'FUNCAO' })
	funcao: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idCentroResultado = objetoJson['idCentroResultado'];
			this.idPatrimTipoAquisicaoBem = objetoJson['idPatrimTipoAquisicaoBem'];
			this.idPatrimEstadoConservacao = objetoJson['idPatrimEstadoConservacao'];
			this.idPatrimGrupoBem = objetoJson['idPatrimGrupoBem'];
			this.idFornecedor = objetoJson['idFornecedor'];
			this.idColaborador = objetoJson['idColaborador'];
			this.idSetor = objetoJson['idSetor'];
			this.numeroNb = objetoJson['numeroNb'];
			this.nome = objetoJson['nome'];
			this.descricao = objetoJson['descricao'];
			this.numeroSerie = objetoJson['numeroSerie'];
			this.dataAquisicao = objetoJson['dataAquisicao'];
			this.dataAceite = objetoJson['dataAceite'];
			this.dataCadastro = objetoJson['dataCadastro'];
			this.dataContabilizado = objetoJson['dataContabilizado'];
			this.dataVistoria = objetoJson['dataVistoria'];
			this.dataMarcacao = objetoJson['dataMarcacao'];
			this.dataBaixa = objetoJson['dataBaixa'];
			this.vencimentoGarantia = objetoJson['vencimentoGarantia'];
			this.numeroNotaFiscal = objetoJson['numeroNotaFiscal'];
			this.chaveNfe = objetoJson['chaveNfe'];
			this.valorOriginal = objetoJson['valorOriginal'];
			this.valorCompra = objetoJson['valorCompra'];
			this.valorAtualizado = objetoJson['valorAtualizado'];
			this.valorBaixa = objetoJson['valorBaixa'];
			this.deprecia = objetoJson['deprecia'];
			this.metodoDepreciacao = objetoJson['metodoDepreciacao'];
			this.inicioDepreciacao = objetoJson['inicioDepreciacao'];
			this.ultimaDepreciacao = objetoJson['ultimaDepreciacao'];
			this.tipoDepreciacao = objetoJson['tipoDepreciacao'];
			this.taxaAnualDepreciacao = objetoJson['taxaAnualDepreciacao'];
			this.taxaMensalDepreciacao = objetoJson['taxaMensalDepreciacao'];
			this.taxaDepreciacaoAcelerada = objetoJson['taxaDepreciacaoAcelerada'];
			this.taxaDepreciacaoIncentivada = objetoJson['taxaDepreciacaoIncentivada'];
			this.funcao = objetoJson['funcao'];
			
			
		}
	}
}