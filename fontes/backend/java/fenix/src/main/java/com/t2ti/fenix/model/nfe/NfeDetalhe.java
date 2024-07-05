/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE] 
                                                                                
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
package com.t2ti.fenix.model.nfe;

import java.io.Serializable;
import java.math.BigDecimal;
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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.t2ti.fenix.model.cadastros.Produto;

@Entity
@Table(name="NFE_DETALHE")
@NamedQuery(name="NfeDetalhe.findAll", query="SELECT t FROM NfeDetalhe t")
public class NfeDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NUMERO_ITEM")
	private Integer numeroItem;

    @Column(name="CODIGO_PRODUTO")
	private String codigoProduto;

    @Column(name="GTIN")
	private String gtin;

    @Column(name="NOME_PRODUTO")
	private String nomeProduto;

    @Column(name="NCM")
	private String ncm;

    @Column(name="NVE")
	private String nve;

    @Column(name="CEST")
	private String cest;

    @Column(name="INDICADOR_ESCALA_RELEVANTE")
	private String indicadorEscalaRelevante;

    @Column(name="CNPJ_FABRICANTE")
	private String cnpjFabricante;

    @Column(name="CODIGO_BENEFICIO_FISCAL")
	private String codigoBeneficioFiscal;

    @Column(name="EX_TIPI")
	private Integer exTipi;

    @Column(name="CFOP")
	private Integer cfop;

    @Column(name="UNIDADE_COMERCIAL")
	private String unidadeComercial;

    @Column(name="QUANTIDADE_COMERCIAL")
	private BigDecimal quantidadeComercial;

    @Column(name="NUMERO_PEDIDO_COMPRA")
	private String numeroPedidoCompra;

    @Column(name="ITEM_PEDIDO_COMPRA")
	private Integer itemPedidoCompra;

    @Column(name="NUMERO_FCI")
	private String numeroFci;

    @Column(name="NUMERO_RECOPI")
	private String numeroRecopi;

    @Column(name="VALOR_UNITARIO_COMERCIAL")
	private BigDecimal valorUnitarioComercial;

    @Column(name="VALOR_BRUTO_PRODUTO")
	private BigDecimal valorBrutoProduto;

    @Column(name="GTIN_UNIDADE_TRIBUTAVEL")
	private String gtinUnidadeTributavel;

    @Column(name="UNIDADE_TRIBUTAVEL")
	private String unidadeTributavel;

    @Column(name="QUANTIDADE_TRIBUTAVEL")
	private BigDecimal quantidadeTributavel;

    @Column(name="VALOR_UNITARIO_TRIBUTAVEL")
	private BigDecimal valorUnitarioTributavel;

    @Column(name="VALOR_FRETE")
	private BigDecimal valorFrete;

    @Column(name="VALOR_SEGURO")
	private BigDecimal valorSeguro;

    @Column(name="VALOR_DESCONTO")
	private BigDecimal valorDesconto;

    @Column(name="VALOR_OUTRAS_DESPESAS")
	private BigDecimal valorOutrasDespesas;

    @Column(name="ENTRA_TOTAL")
	private String entraTotal;

    @Column(name="VALOR_TOTAL_TRIBUTOS")
	private BigDecimal valorTotalTributos;

    @Column(name="PERCENTUAL_DEVOLVIDO")
	private BigDecimal percentualDevolvido;

    @Column(name="VALOR_IPI_DEVOLVIDO")
	private BigDecimal valorIpiDevolvido;

    @Column(name="INFORMACOES_ADICIONAIS")
	private String informacoesAdicionais;

    @Column(name="VALOR_SUBTOTAL")
	private BigDecimal valorSubtotal;

    @Column(name="VALOR_TOTAL")
	private BigDecimal valorTotal;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetEspecificoCombustivel nfeDetEspecificoCombustivel;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetEspecificoMedicamento nfeDetEspecificoMedicamento;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetEspecificoVeiculo nfeDetEspecificoVeiculo;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetalheImpostoCofins nfeDetalheImpostoCofins;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetalheImpostoCofinsSt nfeDetalheImpostoCofinsSt;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetalheImpostoIcms nfeDetalheImpostoIcms;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetalheImpostoIcmsUfdest nfeDetalheImpostoIcmsUfdest;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetalheImpostoIi nfeDetalheImpostoIi;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetalheImpostoIpi nfeDetalheImpostoIpi;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetalheImpostoIssqn nfeDetalheImpostoIssqn;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetalheImpostoPis nfeDetalheImpostoPis;

    @OneToOne(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDetalheImpostoPisSt nfeDetalheImpostoPisSt;

    @ManyToOne
	@JoinColumn(name="ID_PRODUTO")
    private Produto produto;

    @OneToMany(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeDeclaracaoImportacao> listaNfeDeclaracaoImportacao;

    @OneToMany(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeDetEspecificoArmamento> listaNfeDetEspecificoArmamento;

    @OneToMany(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeExportacao> listaNfeExportacao;

    @OneToMany(mappedBy = "nfeDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeItemRastreado> listaNfeItemRastreado;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

	public NfeDetalhe() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getNumeroItem() {
		return this.numeroItem;
	}

	public void setNumeroItem(Integer numeroItem) {
		this.numeroItem = numeroItem;
	}

    public String getCodigoProduto() {
		return this.codigoProduto;
	}

	public void setCodigoProduto(String codigoProduto) {
		this.codigoProduto = codigoProduto;
	}

    public String getGtin() {
		return this.gtin;
	}

	public void setGtin(String gtin) {
		this.gtin = gtin;
	}

    public String getNomeProduto() {
		return this.nomeProduto;
	}

	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}

    public String getNcm() {
		return this.ncm;
	}

	public void setNcm(String ncm) {
		this.ncm = ncm;
	}

    public String getNve() {
		return this.nve;
	}

	public void setNve(String nve) {
		this.nve = nve;
	}

    public String getCest() {
		return this.cest;
	}

	public void setCest(String cest) {
		this.cest = cest;
	}

    public String getIndicadorEscalaRelevante() {
		return this.indicadorEscalaRelevante;
	}

	public void setIndicadorEscalaRelevante(String indicadorEscalaRelevante) {
		this.indicadorEscalaRelevante = indicadorEscalaRelevante;
	}

    public String getCnpjFabricante() {
		return this.cnpjFabricante;
	}

	public void setCnpjFabricante(String cnpjFabricante) {
		this.cnpjFabricante = cnpjFabricante;
	}

    public String getCodigoBeneficioFiscal() {
		return this.codigoBeneficioFiscal;
	}

	public void setCodigoBeneficioFiscal(String codigoBeneficioFiscal) {
		this.codigoBeneficioFiscal = codigoBeneficioFiscal;
	}

    public Integer getExTipi() {
		return this.exTipi;
	}

	public void setExTipi(Integer exTipi) {
		this.exTipi = exTipi;
	}

    public Integer getCfop() {
		return this.cfop;
	}

	public void setCfop(Integer cfop) {
		this.cfop = cfop;
	}

    public String getUnidadeComercial() {
		return this.unidadeComercial;
	}

	public void setUnidadeComercial(String unidadeComercial) {
		this.unidadeComercial = unidadeComercial;
	}

    public BigDecimal getQuantidadeComercial() {
		return this.quantidadeComercial;
	}

	public void setQuantidadeComercial(BigDecimal quantidadeComercial) {
		this.quantidadeComercial = quantidadeComercial == null ? new BigDecimal(0) : quantidadeComercial;
	}

    public String getNumeroPedidoCompra() {
		return this.numeroPedidoCompra;
	}

	public void setNumeroPedidoCompra(String numeroPedidoCompra) {
		this.numeroPedidoCompra = numeroPedidoCompra;
	}

    public Integer getItemPedidoCompra() {
		return this.itemPedidoCompra;
	}

	public void setItemPedidoCompra(Integer itemPedidoCompra) {
		this.itemPedidoCompra = itemPedidoCompra;
	}

    public String getNumeroFci() {
		return this.numeroFci;
	}

	public void setNumeroFci(String numeroFci) {
		this.numeroFci = numeroFci;
	}

    public String getNumeroRecopi() {
		return this.numeroRecopi;
	}

	public void setNumeroRecopi(String numeroRecopi) {
		this.numeroRecopi = numeroRecopi;
	}

    public BigDecimal getValorUnitarioComercial() {
		return this.valorUnitarioComercial;
	}

	public void setValorUnitarioComercial(BigDecimal valorUnitarioComercial) {
		this.valorUnitarioComercial = valorUnitarioComercial == null ? new BigDecimal(0) : valorUnitarioComercial;
	}

    public BigDecimal getValorBrutoProduto() {
		return this.valorBrutoProduto;
	}

	public void setValorBrutoProduto(BigDecimal valorBrutoProduto) {
		this.valorBrutoProduto = valorBrutoProduto == null ? new BigDecimal(0) : valorBrutoProduto;
	}

    public String getGtinUnidadeTributavel() {
		return this.gtinUnidadeTributavel;
	}

	public void setGtinUnidadeTributavel(String gtinUnidadeTributavel) {
		this.gtinUnidadeTributavel = gtinUnidadeTributavel;
	}

    public String getUnidadeTributavel() {
		return this.unidadeTributavel;
	}

	public void setUnidadeTributavel(String unidadeTributavel) {
		this.unidadeTributavel = unidadeTributavel;
	}

    public BigDecimal getQuantidadeTributavel() {
		return this.quantidadeTributavel;
	}

	public void setQuantidadeTributavel(BigDecimal quantidadeTributavel) {
		this.quantidadeTributavel = quantidadeTributavel == null ? new BigDecimal(0) : quantidadeTributavel;
	}

    public BigDecimal getValorUnitarioTributavel() {
		return this.valorUnitarioTributavel;
	}

	public void setValorUnitarioTributavel(BigDecimal valorUnitarioTributavel) {
		this.valorUnitarioTributavel = valorUnitarioTributavel == null ? new BigDecimal(0) : valorUnitarioTributavel;
	}

    public BigDecimal getValorFrete() {
		return this.valorFrete;
	}

	public void setValorFrete(BigDecimal valorFrete) {
		this.valorFrete = valorFrete == null ? new BigDecimal(0) : valorFrete;
	}

    public BigDecimal getValorSeguro() {
		return this.valorSeguro;
	}

	public void setValorSeguro(BigDecimal valorSeguro) {
		this.valorSeguro = valorSeguro == null ? new BigDecimal(0) : valorSeguro;
	}

    public BigDecimal getValorDesconto() {
		return this.valorDesconto;
	}

	public void setValorDesconto(BigDecimal valorDesconto) {
		this.valorDesconto = valorDesconto == null ? new BigDecimal(0) : valorDesconto;
	}

    public BigDecimal getValorOutrasDespesas() {
		return this.valorOutrasDespesas;
	}

	public void setValorOutrasDespesas(BigDecimal valorOutrasDespesas) {
		this.valorOutrasDespesas = valorOutrasDespesas == null ? new BigDecimal(0) : valorOutrasDespesas;
	}

    public String getEntraTotal() {
		return this.entraTotal;
	}

	public void setEntraTotal(String entraTotal) {
		this.entraTotal = entraTotal;
	}

    public BigDecimal getValorTotalTributos() {
		return this.valorTotalTributos;
	}

	public void setValorTotalTributos(BigDecimal valorTotalTributos) {
		this.valorTotalTributos = valorTotalTributos == null ? new BigDecimal(0) : valorTotalTributos;
	}

    public BigDecimal getPercentualDevolvido() {
		return this.percentualDevolvido;
	}

	public void setPercentualDevolvido(BigDecimal percentualDevolvido) {
		this.percentualDevolvido = percentualDevolvido == null ? new BigDecimal(0) : percentualDevolvido;
	}

    public BigDecimal getValorIpiDevolvido() {
		return this.valorIpiDevolvido;
	}

	public void setValorIpiDevolvido(BigDecimal valorIpiDevolvido) {
		this.valorIpiDevolvido = valorIpiDevolvido == null ? new BigDecimal(0) : valorIpiDevolvido;
	}

    public String getInformacoesAdicionais() {
		return this.informacoesAdicionais;
	}

	public void setInformacoesAdicionais(String informacoesAdicionais) {
		this.informacoesAdicionais = informacoesAdicionais;
	}

    public BigDecimal getValorSubtotal() {
		return this.valorSubtotal;
	}

	public void setValorSubtotal(BigDecimal valorSubtotal) {
		this.valorSubtotal = valorSubtotal == null ? new BigDecimal(0) : valorSubtotal;
	}

    public BigDecimal getValorTotal() {
		return this.valorTotal;
	}

	public void setValorTotal(BigDecimal valorTotal) {
		this.valorTotal = valorTotal == null ? new BigDecimal(0) : valorTotal;
	}

    public NfeDetEspecificoCombustivel getNfeDetEspecificoCombustivel() {
		return this.nfeDetEspecificoCombustivel;
	}

	public void setNfeDetEspecificoCombustivel(NfeDetEspecificoCombustivel nfeDetEspecificoCombustivel) {
		this.nfeDetEspecificoCombustivel = nfeDetEspecificoCombustivel;
		if (nfeDetEspecificoCombustivel != null) {
			nfeDetEspecificoCombustivel.setNfeDetalhe(this);
		}
	}

    public NfeDetEspecificoMedicamento getNfeDetEspecificoMedicamento() {
		return this.nfeDetEspecificoMedicamento;
	}

	public void setNfeDetEspecificoMedicamento(NfeDetEspecificoMedicamento nfeDetEspecificoMedicamento) {
		this.nfeDetEspecificoMedicamento = nfeDetEspecificoMedicamento;
		if (nfeDetEspecificoMedicamento != null) {
			nfeDetEspecificoMedicamento.setNfeDetalhe(this);
		}
	}

    public NfeDetEspecificoVeiculo getNfeDetEspecificoVeiculo() {
		return this.nfeDetEspecificoVeiculo;
	}

	public void setNfeDetEspecificoVeiculo(NfeDetEspecificoVeiculo nfeDetEspecificoVeiculo) {
		this.nfeDetEspecificoVeiculo = nfeDetEspecificoVeiculo;
		if (nfeDetEspecificoVeiculo != null) {
			nfeDetEspecificoVeiculo.setNfeDetalhe(this);
		}
	}

    public NfeDetalheImpostoCofins getNfeDetalheImpostoCofins() {
		return this.nfeDetalheImpostoCofins;
	}

	public void setNfeDetalheImpostoCofins(NfeDetalheImpostoCofins nfeDetalheImpostoCofins) {
		this.nfeDetalheImpostoCofins = nfeDetalheImpostoCofins;
		if (nfeDetalheImpostoCofins != null) {
			nfeDetalheImpostoCofins.setNfeDetalhe(this);
		}
	}

    public NfeDetalheImpostoCofinsSt getNfeDetalheImpostoCofinsSt() {
		return this.nfeDetalheImpostoCofinsSt;
	}

	public void setNfeDetalheImpostoCofinsSt(NfeDetalheImpostoCofinsSt nfeDetalheImpostoCofinsSt) {
		this.nfeDetalheImpostoCofinsSt = nfeDetalheImpostoCofinsSt;
		if (nfeDetalheImpostoCofinsSt != null) {
			nfeDetalheImpostoCofinsSt.setNfeDetalhe(this);
		}
	}

    public NfeDetalheImpostoIcms getNfeDetalheImpostoIcms() {
		return this.nfeDetalheImpostoIcms;
	}

	public void setNfeDetalheImpostoIcms(NfeDetalheImpostoIcms nfeDetalheImpostoIcms) {
		this.nfeDetalheImpostoIcms = nfeDetalheImpostoIcms;
		if (nfeDetalheImpostoIcms != null) {
			nfeDetalheImpostoIcms.setNfeDetalhe(this);
		}
	}

    public NfeDetalheImpostoIcmsUfdest getNfeDetalheImpostoIcmsUfdest() {
		return this.nfeDetalheImpostoIcmsUfdest;
	}

	public void setNfeDetalheImpostoIcmsUfdest(NfeDetalheImpostoIcmsUfdest nfeDetalheImpostoIcmsUfdest) {
		this.nfeDetalheImpostoIcmsUfdest = nfeDetalheImpostoIcmsUfdest;
		if (nfeDetalheImpostoIcmsUfdest != null) {
			nfeDetalheImpostoIcmsUfdest.setNfeDetalhe(this);
		}
	}

    public NfeDetalheImpostoIi getNfeDetalheImpostoIi() {
		return this.nfeDetalheImpostoIi;
	}

	public void setNfeDetalheImpostoIi(NfeDetalheImpostoIi nfeDetalheImpostoIi) {
		this.nfeDetalheImpostoIi = nfeDetalheImpostoIi;
		if (nfeDetalheImpostoIi != null) {
			nfeDetalheImpostoIi.setNfeDetalhe(this);
		}
	}

    public NfeDetalheImpostoIpi getNfeDetalheImpostoIpi() {
		return this.nfeDetalheImpostoIpi;
	}

	public void setNfeDetalheImpostoIpi(NfeDetalheImpostoIpi nfeDetalheImpostoIpi) {
		this.nfeDetalheImpostoIpi = nfeDetalheImpostoIpi;
		if (nfeDetalheImpostoIpi != null) {
			nfeDetalheImpostoIpi.setNfeDetalhe(this);
		}
	}

    public NfeDetalheImpostoIssqn getNfeDetalheImpostoIssqn() {
		return this.nfeDetalheImpostoIssqn;
	}

	public void setNfeDetalheImpostoIssqn(NfeDetalheImpostoIssqn nfeDetalheImpostoIssqn) {
		this.nfeDetalheImpostoIssqn = nfeDetalheImpostoIssqn;
		if (nfeDetalheImpostoIssqn != null) {
			nfeDetalheImpostoIssqn.setNfeDetalhe(this);
		}
	}

    public NfeDetalheImpostoPis getNfeDetalheImpostoPis() {
		return this.nfeDetalheImpostoPis;
	}

	public void setNfeDetalheImpostoPis(NfeDetalheImpostoPis nfeDetalheImpostoPis) {
		this.nfeDetalheImpostoPis = nfeDetalheImpostoPis;
		if (nfeDetalheImpostoPis != null) {
			nfeDetalheImpostoPis.setNfeDetalhe(this);
		}
	}

    public NfeDetalheImpostoPisSt getNfeDetalheImpostoPisSt() {
		return this.nfeDetalheImpostoPisSt;
	}

	public void setNfeDetalheImpostoPisSt(NfeDetalheImpostoPisSt nfeDetalheImpostoPisSt) {
		this.nfeDetalheImpostoPisSt = nfeDetalheImpostoPisSt;
		if (nfeDetalheImpostoPisSt != null) {
			nfeDetalheImpostoPisSt.setNfeDetalhe(this);
		}
	}

    public NfeCabecalho getNfeCabecalho() {
		return this.nfeCabecalho;
	}

	public void setNfeCabecalho(NfeCabecalho nfeCabecalho) {
		this.nfeCabecalho = nfeCabecalho;
	}

    public Produto getProduto() {
		return this.produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

    public Set<NfeDeclaracaoImportacao> getListaNfeDeclaracaoImportacao() {
		return this.listaNfeDeclaracaoImportacao;
	}

	public void setListaNfeDeclaracaoImportacao(Set<NfeDeclaracaoImportacao> listaNfeDeclaracaoImportacao) {
		this.listaNfeDeclaracaoImportacao = listaNfeDeclaracaoImportacao;
		for (NfeDeclaracaoImportacao nfeDeclaracaoImportacao : listaNfeDeclaracaoImportacao) {
			nfeDeclaracaoImportacao.setNfeDetalhe(this);
		}
	}

    public Set<NfeDetEspecificoArmamento> getListaNfeDetEspecificoArmamento() {
		return this.listaNfeDetEspecificoArmamento;
	}

	public void setListaNfeDetEspecificoArmamento(Set<NfeDetEspecificoArmamento> listaNfeDetEspecificoArmamento) {
		this.listaNfeDetEspecificoArmamento = listaNfeDetEspecificoArmamento;
		for (NfeDetEspecificoArmamento nfeDetEspecificoArmamento : listaNfeDetEspecificoArmamento) {
			nfeDetEspecificoArmamento.setNfeDetalhe(this);
		}
	}

    public Set<NfeExportacao> getListaNfeExportacao() {
		return this.listaNfeExportacao;
	}

	public void setListaNfeExportacao(Set<NfeExportacao> listaNfeExportacao) {
		this.listaNfeExportacao = listaNfeExportacao;
		for (NfeExportacao nfeExportacao : listaNfeExportacao) {
			nfeExportacao.setNfeDetalhe(this);
		}
	}

    public Set<NfeItemRastreado> getListaNfeItemRastreado() {
		return this.listaNfeItemRastreado;
	}

	public void setListaNfeItemRastreado(Set<NfeItemRastreado> listaNfeItemRastreado) {
		this.listaNfeItemRastreado = listaNfeItemRastreado;
		for (NfeItemRastreado nfeItemRastreado : listaNfeItemRastreado) {
			nfeItemRastreado.setNfeDetalhe(this);
		}
	}

		
}