/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_FORNECEDOR_COTACAO] 
                                                                                
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
package com.t2ti.fenix.model.compras;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.math.BigDecimal;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.t2ti.fenix.model.cadastros.Fornecedor;

import javax.persistence.CascadeType;

@Entity
@Table(name="COMPRA_FORNECEDOR_COTACAO")
@NamedQuery(name="CompraFornecedorCotacao.findAll", query="SELECT t FROM CompraFornecedorCotacao t")
public class CompraFornecedorCotacao implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CODIGO")
	private String codigo;

    @Column(name="PRAZO_ENTREGA")
	private String prazoEntrega;

    @Column(name="VENDA_CONDICOES_PAGAMENTO")
	private String vendaCondicoesPagamento;

    @Column(name="VALOR_SUBTOTAL")
	private BigDecimal valorSubtotal;

    @Column(name="TAXA_DESCONTO")
	private BigDecimal taxaDesconto;

    @Column(name="VALOR_DESCONTO")
	private BigDecimal valorDesconto;

    @Column(name="VALOR_TOTAL")
	private BigDecimal valorTotal;

    @ManyToOne
	@JoinColumn(name="ID_FORNECEDOR")
    private Fornecedor fornecedor;

    @OneToMany(mappedBy = "compraFornecedorCotacao", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CompraCotacaoDetalhe> listaCompraCotacaoDetalhe;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_COMPRA_COTACAO")
    private CompraCotacao compraCotacao;

	public CompraFornecedorCotacao() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCodigo() {
		return this.codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

    public String getPrazoEntrega() {
		return this.prazoEntrega;
	}

	public void setPrazoEntrega(String prazoEntrega) {
		this.prazoEntrega = prazoEntrega;
	}

    public String getVendaCondicoesPagamento() {
		return this.vendaCondicoesPagamento;
	}

	public void setVendaCondicoesPagamento(String vendaCondicoesPagamento) {
		this.vendaCondicoesPagamento = vendaCondicoesPagamento;
	}

    public BigDecimal getValorSubtotal() {
		return this.valorSubtotal;
	}

	public void setValorSubtotal(BigDecimal valorSubtotal) {
		this.valorSubtotal = valorSubtotal;
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

    public BigDecimal getValorTotal() {
		return this.valorTotal;
	}

	public void setValorTotal(BigDecimal valorTotal) {
		this.valorTotal = valorTotal;
	}

    public CompraCotacao getCompraCotacao() {
		return this.compraCotacao;
	}

	public void setCompraCotacao(CompraCotacao compraCotacao) {
		this.compraCotacao = compraCotacao;
	}

    public Fornecedor getFornecedor() {
		return this.fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

    public Set<CompraCotacaoDetalhe> getListaCompraCotacaoDetalhe() {
		return this.listaCompraCotacaoDetalhe;
	}

	public void setListaCompraCotacaoDetalhe(Set<CompraCotacaoDetalhe> listaCompraCotacaoDetalhe) {
		this.listaCompraCotacaoDetalhe = listaCompraCotacaoDetalhe;
		for (CompraCotacaoDetalhe compraCotacaoDetalhe : listaCompraCotacaoDetalhe) {
			compraCotacaoDetalhe.setCompraFornecedorCotacao(this);
		}
	}

		
}