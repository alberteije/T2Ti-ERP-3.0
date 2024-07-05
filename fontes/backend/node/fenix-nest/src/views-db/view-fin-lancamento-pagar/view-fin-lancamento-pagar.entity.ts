/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_LANCAMENTO_PAGAR] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'VIEW_FIN_LANCAMENTO_PAGAR' })
export class ViewFinLancamentoPagar { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_FIN_LANCAMENTO_PAGAR' })
	idFinLancamentoPagar: number;

	@Column({ name: 'QUANTIDADE_PARCELA' })
	quantidadeParcela: number;

	@Column({ name: 'VALOR_LANCAMENTO' })
	valorLancamento: number;

	@Column({ name: 'DATA_LANCAMENTO' })
	dataLancamento: Date;

	@Column({ name: 'NUMERO_DOCUMENTO' })
	numeroDocumento: string;

	@Column({ name: 'ID_FIN_PARCELA_PAGAR' })
	idFinParcelaPagar: number;

	@Column({ name: 'NUMERO_PARCELA' })
	numeroParcela: number;

	@Column({ name: 'DATA_VENCIMENTO' })
	dataVencimento: Date;

	@Column({ name: 'DATA_PAGAMENTO' })
	dataPagamento: Date;

	@Column({ name: 'VALOR_PARCELA' })
	valorParcela: number;

	@Column({ name: 'TAXA_JURO' })
	taxaJuro: number;

	@Column({ name: 'VALOR_JURO' })
	valorJuro: number;

	@Column({ name: 'TAXA_MULTA' })
	taxaMulta: number;

	@Column({ name: 'VALOR_MULTA' })
	valorMulta: number;

	@Column({ name: 'TAXA_DESCONTO' })
	taxaDesconto: number;

	@Column({ name: 'VALOR_DESCONTO' })
	valorDesconto: number;

	@Column({ name: 'SIGLA_DOCUMENTO' })
	siglaDocumento: string;

	@Column({ name: 'NOME_FORNECEDOR' })
	nomeFornecedor: string;

	@Column({ name: 'ID_FIN_STATUS_PARCELA' })
	idFinStatusParcela: number;

	@Column({ name: 'SITUACAO_PARCELA' })
	situacaoParcela: string;

	@Column({ name: 'DESCRICAO_SITUACAO_PARCELA' })
	descricaoSituacaoParcela: string;

	@Column({ name: 'ID_BANCO_CONTA_CAIXA' })
	idBancoContaCaixa: number;

	@Column({ name: 'NOME_CONTA_CAIXA' })
	nomeContaCaixa: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idFinLancamentoPagar = objetoJson['idFinLancamentoPagar'];
			this.quantidadeParcela = objetoJson['quantidadeParcela'];
			this.valorLancamento = objetoJson['valorLancamento'];
			this.dataLancamento = objetoJson['dataLancamento'];
			this.numeroDocumento = objetoJson['numeroDocumento'];
			this.idFinParcelaPagar = objetoJson['idFinParcelaPagar'];
			this.numeroParcela = objetoJson['numeroParcela'];
			this.dataVencimento = objetoJson['dataVencimento'];
			this.dataPagamento = objetoJson['dataPagamento'];
			this.valorParcela = objetoJson['valorParcela'];
			this.taxaJuro = objetoJson['taxaJuro'];
			this.valorJuro = objetoJson['valorJuro'];
			this.taxaMulta = objetoJson['taxaMulta'];
			this.valorMulta = objetoJson['valorMulta'];
			this.taxaDesconto = objetoJson['taxaDesconto'];
			this.valorDesconto = objetoJson['valorDesconto'];
			this.siglaDocumento = objetoJson['siglaDocumento'];
			this.nomeFornecedor = objetoJson['nomeFornecedor'];
			this.idFinStatusParcela = objetoJson['idFinStatusParcela'];
			this.situacaoParcela = objetoJson['situacaoParcela'];
			this.descricaoSituacaoParcela = objetoJson['descricaoSituacaoParcela'];
			this.idBancoContaCaixa = objetoJson['idBancoContaCaixa'];
			this.nomeContaCaixa = objetoJson['nomeContaCaixa'];
			
			
		}
	}
}