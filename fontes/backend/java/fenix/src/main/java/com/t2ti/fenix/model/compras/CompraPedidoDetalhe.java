/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_PEDIDO_DETALHE] 
                                                                                
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
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.t2ti.fenix.model.cadastros.Produto;

@Entity
@Table(name="COMPRA_PEDIDO_DETALHE")
@NamedQuery(name="CompraPedidoDetalhe.findAll", query="SELECT t FROM CompraPedidoDetalhe t")
public class CompraPedidoDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="QUANTIDADE")
	private BigDecimal quantidade;

    @Column(name="VALOR_UNITARIO")
	private BigDecimal valorUnitario;

    @Column(name="VALOR_SUBTOTAL")
	private BigDecimal valorSubtotal;

    @Column(name="TAXA_DESCONTO")
	private BigDecimal taxaDesconto;

    @Column(name="VALOR_DESCONTO")
	private BigDecimal valorDesconto;

    @Column(name="VALOR_TOTAL")
	private BigDecimal valorTotal;

    @Column(name="CST")
	private String cst;

    @Column(name="CSOSN")
	private String csosn;

    @Column(name="CFOP")
	private Integer cfop;

    @Column(name="BASE_CALCULO_ICMS")
	private BigDecimal baseCalculoIcms;

    @Column(name="VALOR_ICMS")
	private BigDecimal valorIcms;

    @Column(name="VALOR_IPI")
	private BigDecimal valorIpi;

    @Column(name="ALIQUOTA_ICMS")
	private BigDecimal aliquotaIcms;

    @Column(name="ALIQUOTA_IPI")
	private BigDecimal aliquotaIpi;

    @ManyToOne
	@JoinColumn(name="ID_PRODUTO")
    private Produto produto;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_COMPRA_PEDIDO")
    private CompraPedido compraPedido;

	public CompraPedidoDetalhe() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public BigDecimal getQuantidade() {
		return this.quantidade;
	}

	public void setQuantidade(BigDecimal quantidade) {
		this.quantidade = quantidade;
	}

    public BigDecimal getValorUnitario() {
		return this.valorUnitario;
	}

	public void setValorUnitario(BigDecimal valorUnitario) {
		this.valorUnitario = valorUnitario;
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

    public String getCst() {
		return this.cst;
	}

	public void setCst(String cst) {
		this.cst = cst;
	}

    public String getCsosn() {
		return this.csosn;
	}

	public void setCsosn(String csosn) {
		this.csosn = csosn;
	}

    public Integer getCfop() {
		return this.cfop;
	}

	public void setCfop(Integer cfop) {
		this.cfop = cfop;
	}

    public BigDecimal getBaseCalculoIcms() {
		return this.baseCalculoIcms;
	}

	public void setBaseCalculoIcms(BigDecimal baseCalculoIcms) {
		this.baseCalculoIcms = baseCalculoIcms;
	}

    public BigDecimal getValorIcms() {
		return this.valorIcms;
	}

	public void setValorIcms(BigDecimal valorIcms) {
		this.valorIcms = valorIcms;
	}

    public BigDecimal getValorIpi() {
		return this.valorIpi;
	}

	public void setValorIpi(BigDecimal valorIpi) {
		this.valorIpi = valorIpi;
	}

    public BigDecimal getAliquotaIcms() {
		return this.aliquotaIcms;
	}

	public void setAliquotaIcms(BigDecimal aliquotaIcms) {
		this.aliquotaIcms = aliquotaIcms;
	}

    public BigDecimal getAliquotaIpi() {
		return this.aliquotaIpi;
	}

	public void setAliquotaIpi(BigDecimal aliquotaIpi) {
		this.aliquotaIpi = aliquotaIpi;
	}

    public CompraPedido getCompraPedido() {
		return this.compraPedido;
	}

	public void setCompraPedido(CompraPedido compraPedido) {
		this.compraPedido = compraPedido;
	}

    public Produto getProduto() {
		return this.produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

		
}