/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.t2ti.fenix.model.cadastros.Cliente;
import com.t2ti.fenix.model.cadastros.Transportadora;
import com.t2ti.fenix.model.cadastros.Vendedor;

@Entity
@Table(name="VENDA_CABECALHO")
@NamedQuery(name="VendaCabecalho.findAll", query="SELECT t FROM VendaCabecalho t")
public class VendaCabecalho implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_VENDA")
	private Date dataVenda;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_SAIDA")
	private Date dataSaida;

    @Column(name="HORA_SAIDA")
	private String horaSaida;

    @Column(name="NUMERO_FATURA")
	private Integer numeroFatura;

    @Column(name="LOCAL_ENTREGA")
	private String localEntrega;

    @Column(name="LOCAL_COBRANCA")
	private String localCobranca;

    @Column(name="VALOR_SUBTOTAL")
	private BigDecimal valorSubtotal;

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

    @Column(name="TIPO_FRETE")
	private String tipoFrete;

    @Column(name="FORMA_PAGAMENTO")
	private String formaPagamento;

    @Column(name="VALOR_FRETE")
	private BigDecimal valorFrete;

    @Column(name="VALOR_SEGURO")
	private BigDecimal valorSeguro;

    @Column(name="OBSERVACAO")
	private String observacao;

    @Column(name="SITUACAO")
	private String situacao;

    @Column(name="DIA_FIXO_PARCELA")
	private String diaFixoParcela;

    @OneToOne(mappedBy = "vendaCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private VendaFrete vendaFrete;
    
    @ManyToOne
	@JoinColumn(name="ID_VENDA_ORCAMENTO_CABECALHO")
    private VendaOrcamentoCabecalho vendaOrcamentoCabecalho;

    @ManyToOne
	@JoinColumn(name="ID_VENDA_CONDICOES_PAGAMENTO")
    private VendaCondicoesPagamento vendaCondicoesPagamento;

    @ManyToOne
	@JoinColumn(name="ID_NOTA_FISCAL_TIPO")
    private NotaFiscalTipo notaFiscalTipo;

    @ManyToOne
	@JoinColumn(name="ID_CLIENTE")
    private Cliente cliente;

    @ManyToOne
	@JoinColumn(name="ID_TRANSPORTADORA")
    private Transportadora transportadora;

    @ManyToOne
	@JoinColumn(name="ID_VENDEDOR")
    private Vendedor vendedor;

    @OneToMany(mappedBy = "vendaCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<VendaComissao> listaVendaComissao;

    @OneToMany(mappedBy = "vendaCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<VendaDetalhe> listaVendaDetalhe;

	public VendaCabecalho() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getDataVenda() {
		return this.dataVenda;
	}

	public void setDataVenda(Date dataVenda) {
		this.dataVenda = dataVenda;
	}

    public Date getDataSaida() {
		return this.dataSaida;
	}

	public void setDataSaida(Date dataSaida) {
		this.dataSaida = dataSaida;
	}

    public String getHoraSaida() {
		return this.horaSaida;
	}

	public void setHoraSaida(String horaSaida) {
		this.horaSaida = horaSaida;
	}

    public Integer getNumeroFatura() {
		return this.numeroFatura;
	}

	public void setNumeroFatura(Integer numeroFatura) {
		this.numeroFatura = numeroFatura;
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

    public BigDecimal getValorSubtotal() {
		return this.valorSubtotal;
	}

	public void setValorSubtotal(BigDecimal valorSubtotal) {
		this.valorSubtotal = valorSubtotal;
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

    public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

    public String getSituacao() {
		return this.situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

    public String getDiaFixoParcela() {
		return this.diaFixoParcela;
	}

	public void setDiaFixoParcela(String diaFixoParcela) {
		this.diaFixoParcela = diaFixoParcela;
	}

    public VendaOrcamentoCabecalho getVendaOrcamentoCabecalho() {
		return this.vendaOrcamentoCabecalho;
	}

	public void setVendaOrcamentoCabecalho(VendaOrcamentoCabecalho vendaOrcamentoCabecalho) {
		this.vendaOrcamentoCabecalho = vendaOrcamentoCabecalho;
	}

    public VendaCondicoesPagamento getVendaCondicoesPagamento() {
		return this.vendaCondicoesPagamento;
	}

	public void setVendaCondicoesPagamento(VendaCondicoesPagamento vendaCondicoesPagamento) {
		this.vendaCondicoesPagamento = vendaCondicoesPagamento;
	}

    public NotaFiscalTipo getNotaFiscalTipo() {
		return this.notaFiscalTipo;
	}

	public void setNotaFiscalTipo(NotaFiscalTipo notaFiscalTipo) {
		this.notaFiscalTipo = notaFiscalTipo;
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

    public Vendedor getVendedor() {
		return this.vendedor;
	}

	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}

    public Set<VendaComissao> getListaVendaComissao() {
		return this.listaVendaComissao;
	}

	public void setListaVendaComissao(Set<VendaComissao> listaVendaComissao) {
		this.listaVendaComissao = listaVendaComissao;
		for (VendaComissao vendaComissao : listaVendaComissao) {
			vendaComissao.setVendaCabecalho(this);
		}
	}

    public Set<VendaDetalhe> getListaVendaDetalhe() {
		return this.listaVendaDetalhe;
	}

	public void setListaVendaDetalhe(Set<VendaDetalhe> listaVendaDetalhe) {
		this.listaVendaDetalhe = listaVendaDetalhe;
		for (VendaDetalhe vendaDetalhe : listaVendaDetalhe) {
			vendaDetalhe.setVendaCabecalho(this);
		}
	}

	public VendaFrete getVendaFrete() {
		return vendaFrete;
	}

	public void setVendaFrete(VendaFrete vendaFrete) {
		this.vendaFrete = vendaFrete;
		if (vendaFrete != null) {
			vendaFrete.setVendaCabecalho(this);
		}		
	}

		
}