/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_PEDIDO] 
                                                                                
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
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.t2ti.fenix.model.cadastros.Colaborador;
import com.t2ti.fenix.model.cadastros.Fornecedor;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@Table(name="COMPRA_PEDIDO")
@NamedQuery(name="CompraPedido.findAll", query="SELECT t FROM CompraPedido t")
public class CompraPedido implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PEDIDO")
	private Date dataPedido;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PREVISTA_ENTREGA")
	private Date dataPrevistaEntrega;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PREVISAO_PAGAMENTO")
	private Date dataPrevisaoPagamento;

    @Column(name="LOCAL_ENTREGA")
	private String localEntrega;

    @Column(name="LOCAL_COBRANCA")
	private String localCobranca;

    @Column(name="CONTATO")
	private String contato;

    @Column(name="VALOR_SUBTOTAL")
	private BigDecimal valorSubtotal;

    @Column(name="TAXA_DESCONTO")
	private BigDecimal taxaDesconto;

    @Column(name="VALOR_DESCONTO")
	private BigDecimal valorDesconto;

    @Column(name="VALOR_TOTAL")
	private BigDecimal valorTotal;

    @Column(name="TIPO_FRETE")
	private String tipoFrete;

    @Column(name="FORMA_PAGAMENTO")
	private String formaPagamento;

    @Column(name="BASE_CALCULO_ICMS")
	private BigDecimal baseCalculoIcms;

    @Column(name="VALOR_ICMS")
	private BigDecimal valorIcms;

    @Column(name="BASE_CALCULO_ICMS_ST")
	private BigDecimal baseCalculoIcmsSt;

    @Column(name="VALOR_ICMS_ST")
	private BigDecimal valorIcmsSt;

    @Column(name="VALOR_TOTAL_PRODUTOS")
	private BigDecimal valorTotalProdutos;

    @Column(name="VALOR_FRETE")
	private BigDecimal valorFrete;

    @Column(name="VALOR_SEGURO")
	private BigDecimal valorSeguro;

    @Column(name="VALOR_OUTRAS_DESPESAS")
	private BigDecimal valorOutrasDespesas;

    @Column(name="VALOR_IPI")
	private BigDecimal valorIpi;

    @Column(name="VALOR_TOTAL_NF")
	private BigDecimal valorTotalNf;

    @Column(name="QUANTIDADE_PARCELAS")
	private Integer quantidadeParcelas;

    @Column(name="DIA_PRIMEIRO_VENCIMENTO")
	private String diaPrimeiroVencimento;

    @Column(name="INTERVALO_ENTRE_PARCELAS")
	private Integer intervaloEntreParcelas;

    @Column(name="DIA_FIXO_PARCELA")
	private String diaFixoParcela;

    @Column(name="CODIGO_COTACAO")
	private String codigoCotacao;

    @ManyToOne
	@JoinColumn(name="ID_COMPRA_TIPO_PEDIDO")
    private CompraTipoPedido compraTipoPedido;

    @ManyToOne
	@JoinColumn(name="ID_FORNECEDOR")
    private Fornecedor fornecedor;

    @ManyToOne
	@JoinColumn(name="ID_COLABORADOR")
    private Colaborador colaborador;

    @OneToMany(mappedBy = "compraPedido", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CompraPedidoDetalhe> listaCompraPedidoDetalhe;

	public CompraPedido() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getDataPedido() {
		return this.dataPedido;
	}

	public void setDataPedido(Date dataPedido) {
		this.dataPedido = dataPedido;
	}

    public Date getDataPrevistaEntrega() {
		return this.dataPrevistaEntrega;
	}

	public void setDataPrevistaEntrega(Date dataPrevistaEntrega) {
		this.dataPrevistaEntrega = dataPrevistaEntrega;
	}

    public Date getDataPrevisaoPagamento() {
		return this.dataPrevisaoPagamento;
	}

	public void setDataPrevisaoPagamento(Date dataPrevisaoPagamento) {
		this.dataPrevisaoPagamento = dataPrevisaoPagamento;
	}

    public String getLocalEntrega() {
		return this.localEntrega;
	}

	public void setLocalEntrega(String localEntrega) {
		this.localEntrega = localEntrega;
	}

    public String getLocalCobranca() {
		return this.localCobranca;
	}

	public void setLocalCobranca(String localCobranca) {
		this.localCobranca = localCobranca;
	}

    public String getContato() {
		return this.contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
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

    public String getTipoFrete() {
		return this.tipoFrete;
	}

	public void setTipoFrete(String tipoFrete) {
		this.tipoFrete = tipoFrete;
	}

    public String getFormaPagamento() {
		return this.formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
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

    public BigDecimal getBaseCalculoIcmsSt() {
		return this.baseCalculoIcmsSt;
	}

	public void setBaseCalculoIcmsSt(BigDecimal baseCalculoIcmsSt) {
		this.baseCalculoIcmsSt = baseCalculoIcmsSt;
	}

    public BigDecimal getValorIcmsSt() {
		return this.valorIcmsSt;
	}

	public void setValorIcmsSt(BigDecimal valorIcmsSt) {
		this.valorIcmsSt = valorIcmsSt;
	}

    public BigDecimal getValorTotalProdutos() {
		return this.valorTotalProdutos;
	}

	public void setValorTotalProdutos(BigDecimal valorTotalProdutos) {
		this.valorTotalProdutos = valorTotalProdutos;
	}

    public BigDecimal getValorFrete() {
		return this.valorFrete;
	}

	public void setValorFrete(BigDecimal valorFrete) {
		this.valorFrete = valorFrete;
	}

    public BigDecimal getValorSeguro() {
		return this.valorSeguro;
	}

	public void setValorSeguro(BigDecimal valorSeguro) {
		this.valorSeguro = valorSeguro;
	}

    public BigDecimal getValorOutrasDespesas() {
		return this.valorOutrasDespesas;
	}

	public void setValorOutrasDespesas(BigDecimal valorOutrasDespesas) {
		this.valorOutrasDespesas = valorOutrasDespesas;
	}

    public BigDecimal getValorIpi() {
		return this.valorIpi;
	}

	public void setValorIpi(BigDecimal valorIpi) {
		this.valorIpi = valorIpi;
	}

    public BigDecimal getValorTotalNf() {
		return this.valorTotalNf;
	}

	public void setValorTotalNf(BigDecimal valorTotalNf) {
		this.valorTotalNf = valorTotalNf;
	}

    public Integer getQuantidadeParcelas() {
		return this.quantidadeParcelas;
	}

	public void setQuantidadeParcelas(Integer quantidadeParcelas) {
		this.quantidadeParcelas = quantidadeParcelas;
	}

    public String getDiaPrimeiroVencimento() {
		return this.diaPrimeiroVencimento;
	}

	public void setDiaPrimeiroVencimento(String diaPrimeiroVencimento) {
		this.diaPrimeiroVencimento = diaPrimeiroVencimento;
	}

    public Integer getIntervaloEntreParcelas() {
		return this.intervaloEntreParcelas;
	}

	public void setIntervaloEntreParcelas(Integer intervaloEntreParcelas) {
		this.intervaloEntreParcelas = intervaloEntreParcelas;
	}

    public String getDiaFixoParcela() {
		return this.diaFixoParcela;
	}

	public void setDiaFixoParcela(String diaFixoParcela) {
		this.diaFixoParcela = diaFixoParcela;
	}

    public String getCodigoCotacao() {
		return this.codigoCotacao;
	}

	public void setCodigoCotacao(String codigoCotacao) {
		this.codigoCotacao = codigoCotacao;
	}

    public CompraTipoPedido getCompraTipoPedido() {
		return this.compraTipoPedido;
	}

	public void setCompraTipoPedido(CompraTipoPedido compraTipoPedido) {
		this.compraTipoPedido = compraTipoPedido;
	}

    public Fornecedor getFornecedor() {
		return this.fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

    public Colaborador getColaborador() {
		return this.colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

    public Set<CompraPedidoDetalhe> getListaCompraPedidoDetalhe() {
		return this.listaCompraPedidoDetalhe;
	}

	public void setListaCompraPedidoDetalhe(Set<CompraPedidoDetalhe> listaCompraPedidoDetalhe) {
		this.listaCompraPedidoDetalhe = listaCompraPedidoDetalhe;
		for (CompraPedidoDetalhe compraPedidoDetalhe : listaCompraPedidoDetalhe) {
			compraPedidoDetalhe.setCompraPedido(this);
		}
	}

		
}