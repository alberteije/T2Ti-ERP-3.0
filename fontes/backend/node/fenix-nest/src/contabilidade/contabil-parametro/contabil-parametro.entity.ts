/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_PARAMETRO] 
                                                                                
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

@Entity({ name: 'CONTABIL_PARAMETRO' })
export class ContabilParametro { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'MASCARA' })
	mascara: string;

	@Column({ name: 'NIVEIS' })
	niveis: number;

	@Column({ name: 'INFORMAR_CONTA_POR' })
	informarContaPor: string;

	@Column({ name: 'COMPARTILHA_PLANO_CONTA' })
	compartilhaPlanoConta: string;

	@Column({ name: 'COMPARTILHA_HISTORICOS' })
	compartilhaHistoricos: string;

	@Column({ name: 'ALTERA_LANCAMENTO_OUTRO' })
	alteraLancamentoOutro: string;

	@Column({ name: 'HISTORICO_OBRIGATORIO' })
	historicoObrigatorio: string;

	@Column({ name: 'PERMITE_LANCAMENTO_ZERADO' })
	permiteLancamentoZerado: string;

	@Column({ name: 'GERA_INFORMATIVO_SPED' })
	geraInformativoSped: string;

	@Column({ name: 'SPED_FORMA_ESCRIT_DIARIO' })
	spedFormaEscritDiario: string;

	@Column({ name: 'SPED_NOME_LIVRO_DIARIO' })
	spedNomeLivroDiario: string;

	@Column({ name: 'ASSINATURA_DIREITA' })
	assinaturaDireita: string;

	@Column({ name: 'ASSINATURA_ESQUERDA' })
	assinaturaEsquerda: string;

	@Column({ name: 'CONTA_ATIVO' })
	contaAtivo: string;

	@Column({ name: 'CONTA_PASSIVO' })
	contaPassivo: string;

	@Column({ name: 'CONTA_PATRIMONIO_LIQUIDO' })
	contaPatrimonioLiquido: string;

	@Column({ name: 'CONTA_DEPRECIACAO_ACUMULADA' })
	contaDepreciacaoAcumulada: string;

	@Column({ name: 'CONTA_CAPITAL_SOCIAL' })
	contaCapitalSocial: string;

	@Column({ name: 'CONTA_RESULTADO_EXERCICIO' })
	contaResultadoExercicio: string;

	@Column({ name: 'CONTA_PREJUIZO_ACUMULADO' })
	contaPrejuizoAcumulado: string;

	@Column({ name: 'CONTA_LUCRO_ACUMULADO' })
	contaLucroAcumulado: string;

	@Column({ name: 'CONTA_TITULO_PAGAR' })
	contaTituloPagar: string;

	@Column({ name: 'CONTA_TITULO_RECEBER' })
	contaTituloReceber: string;

	@Column({ name: 'CONTA_JUROS_PASSIVO' })
	contaJurosPassivo: string;

	@Column({ name: 'CONTA_JUROS_ATIVO' })
	contaJurosAtivo: string;

	@Column({ name: 'CONTA_DESCONTO_OBTIDO' })
	contaDescontoObtido: string;

	@Column({ name: 'CONTA_DESCONTO_CONCEDIDO' })
	contaDescontoConcedido: string;

	@Column({ name: 'CONTA_CMV' })
	contaCmv: string;

	@Column({ name: 'CONTA_VENDA' })
	contaVenda: string;

	@Column({ name: 'CONTA_VENDA_SERVICO' })
	contaVendaServico: string;

	@Column({ name: 'CONTA_ESTOQUE' })
	contaEstoque: string;

	@Column({ name: 'CONTA_APURA_RESULTADO' })
	contaApuraResultado: string;

	@Column({ name: 'CONTA_JUROS_APROPRIAR' })
	contaJurosApropriar: string;

	@Column({ name: 'ID_HIST_PADRAO_RESULTADO' })
	idHistPadraoResultado: number;

	@Column({ name: 'ID_HIST_PADRAO_LUCRO' })
	idHistPadraoLucro: number;

	@Column({ name: 'ID_HIST_PADRAO_PREJUIZO' })
	idHistPadraoPrejuizo: number;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.mascara = objetoJson['mascara'];
			this.niveis = objetoJson['niveis'];
			this.informarContaPor = objetoJson['informarContaPor'];
			this.compartilhaPlanoConta = objetoJson['compartilhaPlanoConta'];
			this.compartilhaHistoricos = objetoJson['compartilhaHistoricos'];
			this.alteraLancamentoOutro = objetoJson['alteraLancamentoOutro'];
			this.historicoObrigatorio = objetoJson['historicoObrigatorio'];
			this.permiteLancamentoZerado = objetoJson['permiteLancamentoZerado'];
			this.geraInformativoSped = objetoJson['geraInformativoSped'];
			this.spedFormaEscritDiario = objetoJson['spedFormaEscritDiario'];
			this.spedNomeLivroDiario = objetoJson['spedNomeLivroDiario'];
			this.assinaturaDireita = objetoJson['assinaturaDireita'];
			this.assinaturaEsquerda = objetoJson['assinaturaEsquerda'];
			this.contaAtivo = objetoJson['contaAtivo'];
			this.contaPassivo = objetoJson['contaPassivo'];
			this.contaPatrimonioLiquido = objetoJson['contaPatrimonioLiquido'];
			this.contaDepreciacaoAcumulada = objetoJson['contaDepreciacaoAcumulada'];
			this.contaCapitalSocial = objetoJson['contaCapitalSocial'];
			this.contaResultadoExercicio = objetoJson['contaResultadoExercicio'];
			this.contaPrejuizoAcumulado = objetoJson['contaPrejuizoAcumulado'];
			this.contaLucroAcumulado = objetoJson['contaLucroAcumulado'];
			this.contaTituloPagar = objetoJson['contaTituloPagar'];
			this.contaTituloReceber = objetoJson['contaTituloReceber'];
			this.contaJurosPassivo = objetoJson['contaJurosPassivo'];
			this.contaJurosAtivo = objetoJson['contaJurosAtivo'];
			this.contaDescontoObtido = objetoJson['contaDescontoObtido'];
			this.contaDescontoConcedido = objetoJson['contaDescontoConcedido'];
			this.contaCmv = objetoJson['contaCmv'];
			this.contaVenda = objetoJson['contaVenda'];
			this.contaVendaServico = objetoJson['contaVendaServico'];
			this.contaEstoque = objetoJson['contaEstoque'];
			this.contaApuraResultado = objetoJson['contaApuraResultado'];
			this.contaJurosApropriar = objetoJson['contaJurosApropriar'];
			this.idHistPadraoResultado = objetoJson['idHistPadraoResultado'];
			this.idHistPadraoLucro = objetoJson['idHistPadraoLucro'];
			this.idHistPadraoPrejuizo = objetoJson['idHistPadraoPrejuizo'];
			
			
		}
	}
}