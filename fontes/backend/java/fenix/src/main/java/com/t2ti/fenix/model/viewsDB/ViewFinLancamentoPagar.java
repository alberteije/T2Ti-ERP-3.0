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
package com.t2ti.fenix.model.viewsDB;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="VIEW_FIN_LANCAMENTO_PAGAR")
@NamedQuery(name="ViewFinLancamentoPagar.findAll", query="SELECT t FROM ViewFinLancamentoPagar t")
public class ViewFinLancamentoPagar implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_FIN_LANCAMENTO_PAGAR")
	private Integer idFinLancamentoPagar;

    @Column(name="QUANTIDADE_PARCELA")
	private Integer quantidadeParcela;

    @Column(name="VALOR_LANCAMENTO")
	private BigDecimal valorLancamento;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_LANCAMENTO")
	private Date dataLancamento;

    @Column(name="NUMERO_DOCUMENTO")
	private String numeroDocumento;

    @Column(name="ID_FIN_PARCELA_PAGAR")
	private Integer idFinParcelaPagar;

    @Column(name="NUMERO_PARCELA")
	private Integer numeroParcela;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_VENCIMENTO")
	private Date dataVencimento;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PAGAMENTO")
	private Date dataPagamento;

    @Column(name="VALOR_PARCELA")
	private BigDecimal valorParcela;

    @Column(name="TAXA_JURO")
	private BigDecimal taxaJuro;

    @Column(name="VALOR_JURO")
	private BigDecimal valorJuro;

    @Column(name="TAXA_MULTA")
	private BigDecimal taxaMulta;

    @Column(name="VALOR_MULTA")
	private BigDecimal valorMulta;

    @Column(name="TAXA_DESCONTO")
	private BigDecimal taxaDesconto;

    @Column(name="VALOR_DESCONTO")
	private BigDecimal valorDesconto;

    @Column(name="SIGLA_DOCUMENTO")
	private String siglaDocumento;

    @Column(name="NOME_FORNECEDOR")
	private String nomeFornecedor;

    @Column(name="ID_FIN_STATUS_PARCELA")
	private Integer idFinStatusParcela;

    @Column(name="SITUACAO_PARCELA")
	private String situacaoParcela;

    @Column(name="DESCRICAO_SITUACAO_PARCELA")
	private String descricaoSituacaoParcela;

    @Column(name="ID_BANCO_CONTA_CAIXA")
	private Integer idBancoContaCaixa;

    @Column(name="NOME_CONTA_CAIXA")
	private String nomeContaCaixa;

	public ViewFinLancamentoPagar() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdFinLancamentoPagar() {
		return this.idFinLancamentoPagar;
	}

	public void setIdFinLancamentoPagar(Integer idFinLancamentoPagar) {
		this.idFinLancamentoPagar = idFinLancamentoPagar;
	}

    public Integer getQuantidadeParcela() {
		return this.quantidadeParcela;
	}

	public void setQuantidadeParcela(Integer quantidadeParcela) {
		this.quantidadeParcela = quantidadeParcela;
	}

    public BigDecimal getValorLancamento() {
		return this.valorLancamento;
	}

	public void setValorLancamento(BigDecimal valorLancamento) {
		this.valorLancamento = valorLancamento;
	}

    public Date getDataLancamento() {
		return this.dataLancamento;
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

    public String getNumeroDocumento() {
		return this.numeroDocumento;
	}

	public void setNumeroDocumento(String numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
	}

    public Integer getIdFinParcelaPagar() {
		return this.idFinParcelaPagar;
	}

	public void setIdFinParcelaPagar(Integer idFinParcelaPagar) {
		this.idFinParcelaPagar = idFinParcelaPagar;
	}

    public Integer getNumeroParcela() {
		return this.numeroParcela;
	}

	public void setNumeroParcela(Integer numeroParcela) {
		this.numeroParcela = numeroParcela;
	}

    public Date getDataVencimento() {
		return this.dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

    public Date getDataPagamento() {
		return this.dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}
	
    public BigDecimal getValorParcela() {
		return this.valorParcela;
	}

	public void setValorParcela(BigDecimal valorParcela) {
		this.valorParcela = valorParcela;
	}

    public BigDecimal getTaxaJuro() {
		return this.taxaJuro;
	}

	public void setTaxaJuro(BigDecimal taxaJuro) {
		this.taxaJuro = taxaJuro;
	}

    public BigDecimal getValorJuro() {
		return this.valorJuro;
	}

	public void setValorJuro(BigDecimal valorJuro) {
		this.valorJuro = valorJuro;
	}

    public BigDecimal getTaxaMulta() {
		return this.taxaMulta;
	}

	public void setTaxaMulta(BigDecimal taxaMulta) {
		this.taxaMulta = taxaMulta;
	}

    public BigDecimal getValorMulta() {
		return this.valorMulta;
	}

	public void setValorMulta(BigDecimal valorMulta) {
		this.valorMulta = valorMulta;
	}

    public BigDecimal getTaxaDesconto() {
		return this.taxaDesconto;
	}

	public void setTaxaDesconto(BigDecimal taxaDesconto) {
		this.taxaDesconto = taxaDesconto;
	}

    public BigDecimal getValorDesconto() {
		return this.valorDesconto;
	}

	public void setValorDesconto(BigDecimal valorDesconto) {
		this.valorDesconto = valorDesconto;
	}

    public String getSiglaDocumento() {
		return this.siglaDocumento;
	}

	public void setSiglaDocumento(String siglaDocumento) {
		this.siglaDocumento = siglaDocumento;
	}

    public String getNomeFornecedor() {
		return this.nomeFornecedor;
	}

	public void setNomeFornecedor(String nomeFornecedor) {
		this.nomeFornecedor = nomeFornecedor;
	}

    public Integer getIdFinStatusParcela() {
		return this.idFinStatusParcela;
	}

	public void setIdFinStatusParcela(Integer idFinStatusParcela) {
		this.idFinStatusParcela = idFinStatusParcela;
	}

    public String getSituacaoParcela() {
		return this.situacaoParcela;
	}

	public void setSituacaoParcela(String situacaoParcela) {
		this.situacaoParcela = situacaoParcela;
	}

    public String getDescricaoSituacaoParcela() {
		return this.descricaoSituacaoParcela;
	}

	public void setDescricaoSituacaoParcela(String descricaoSituacaoParcela) {
		this.descricaoSituacaoParcela = descricaoSituacaoParcela;
	}

    public Integer getIdBancoContaCaixa() {
		return this.idBancoContaCaixa;
	}

	public void setIdBancoContaCaixa(Integer idBancoContaCaixa) {
		this.idBancoContaCaixa = idBancoContaCaixa;
	}

    public String getNomeContaCaixa() {
		return this.nomeContaCaixa;
	}

	public void setNomeContaCaixa(String nomeContaCaixa) {
		this.nomeContaCaixa = nomeContaCaixa;
	}

		
}