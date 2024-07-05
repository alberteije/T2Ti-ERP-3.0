/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
package com.t2ti.fenix.model.vendas;

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

import com.t2ti.fenix.model.cadastros.Cliente;
import com.t2ti.fenix.model.cadastros.Transportadora;
import com.t2ti.fenix.model.cadastros.Vendedor;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@Table(name="VENDA_ORCAMENTO_CABECALHO")
@NamedQuery(name="VendaOrcamentoCabecalho.findAll", query="SELECT t FROM VendaOrcamentoCabecalho t")
public class VendaOrcamentoCabecalho implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CODIGO")
	private String codigo;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_CADASTRO")
	private Date dataCadastro;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_ENTREGA")
	private Date dataEntrega;

    @Temporal(TemporalType.DATE)
	@Column(name="VALIDADE")
	private Date validade;

    @Column(name="TIPO_FRETE")
	private String tipoFrete;

    @Column(name="VALOR_SUBTOTAL")
	private BigDecimal valorSubtotal;

    @Column(name="VALOR_FRETE")
	private BigDecimal valorFrete;

    @Column(name="TAXA_COMISSAO")
	private BigDecimal taxaComissao;

    @Column(name="VALOR_COMISSAO")
	private BigDecimal valorComissao;

    @Column(name="TAXA_DESCONTO")
	private BigDecimal taxaDesconto;

    @Column(name="VALOR_DESCONTO")
	private BigDecimal valorDesconto;

    @Column(name="VALOR_TOTAL")
	private BigDecimal valorTotal;

    @Column(name="OBSERVACAO")
	private String observacao;

    @ManyToOne
	@JoinColumn(name="ID_VENDA_CONDICOES_PAGAMENTO")
    private VendaCondicoesPagamento vendaCondicoesPagamento;

    @ManyToOne
	@JoinColumn(name="ID_VENDEDOR")
    private Vendedor vendedor;

    @ManyToOne
	@JoinColumn(name="ID_CLIENTE")
    private Cliente cliente;

    @ManyToOne
	@JoinColumn(name="ID_TRANSPORTADORA")
    private Transportadora transportadora;

    @OneToMany(mappedBy = "vendaOrcamentoCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<VendaOrcamentoDetalhe> listaVendaOrcamentoDetalhe;

	public VendaOrcamentoCabecalho() {
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

    public Date getDataCadastro() {
		return this.dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

    public Date getDataEntrega() {
		return this.dataEntrega;
	}

	public void setDataEntrega(Date dataEntrega) {
		this.dataEntrega = dataEntrega;
	}

    public Date getValidade() {
		return this.validade;
	}

	public void setValidade(Date validade) {
		this.validade = validade;
	}

    public String getTipoFrete() {
		return this.tipoFrete;
	}

	public void setTipoFrete(String tipoFrete) {
		this.tipoFrete = tipoFrete;
	}

    public BigDecimal getValorSubtotal() {
		return this.valorSubtotal;
	}

	public void setValorSubtotal(BigDecimal valorSubtotal) {
		this.valorSubtotal = valorSubtotal;
	}

    public BigDecimal getValorFrete() {
		return this.valorFrete;
	}

	public void setValorFrete(BigDecimal valorFrete) {
		this.valorFrete = valorFrete;
	}

    public BigDecimal getTaxaComissao() {
		return this.taxaComissao;
	}

	public void setTaxaComissao(BigDecimal taxaComissao) {
		this.taxaComissao = taxaComissao;
	}

    public BigDecimal getValorComissao() {
		return this.valorComissao;
	}

	public void setValorComissao(BigDecimal valorComissao) {
		this.valorComissao = valorComissao;
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

    public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

    public VendaCondicoesPagamento getVendaCondicoesPagamento() {
		return this.vendaCondicoesPagamento;
	}

	public void setVendaCondicoesPagamento(VendaCondicoesPagamento vendaCondicoesPagamento) {
		this.vendaCondicoesPagamento = vendaCondicoesPagamento;
	}

    public Vendedor getVendedor() {
		return this.vendedor;
	}

	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}

    public Cliente getCliente() {
		return this.cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

    public Transportadora getTransportadora() {
		return this.transportadora;
	}

	public void setTransportadora(Transportadora transportadora) {
		this.transportadora = transportadora;
	}

    public Set<VendaOrcamentoDetalhe> getListaVendaOrcamentoDetalhe() {
		return this.listaVendaOrcamentoDetalhe;
	}

	public void setListaVendaOrcamentoDetalhe(Set<VendaOrcamentoDetalhe> listaVendaOrcamentoDetalhe) {
		this.listaVendaOrcamentoDetalhe = listaVendaOrcamentoDetalhe;
		for (VendaOrcamentoDetalhe vendaOrcamentoDetalhe : listaVendaOrcamentoDetalhe) {
			vendaOrcamentoDetalhe.setVendaOrcamentoCabecalho(this);
		}
	}

		
}