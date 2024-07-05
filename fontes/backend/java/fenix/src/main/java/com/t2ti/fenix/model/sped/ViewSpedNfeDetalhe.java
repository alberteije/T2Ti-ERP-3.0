/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_NFE_DETALHE] 
                                                                                
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
package com.t2ti.fenix.model.sped;

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
import com.t2ti.fenix.model.cadastros.ProdutoUnidade;
import com.t2ti.fenix.model.nfe.NfeCabecalho;
import com.t2ti.fenix.model.tributacao.TributOperacaoFiscal;

@Entity
@Table(name="VIEW_SPED_NFE_DETALHE")
@NamedQuery(name="ViewSpedNfeDetalhe.findAll", query="SELECT t FROM ViewSpedNfeDetalhe t")
public class ViewSpedNfeDetalhe implements Serializable {
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

    @Column(name="CST_COFINS")
	private String cstCofins;

    @Column(name="QUANTIDADE_VENDIDA_COFINS")
	private BigDecimal quantidadeVendidaCofins;

    @Column(name="BASE_CALCULO_COFINS")
	private BigDecimal baseCalculoCofins;

    @Column(name="ALIQUOTA_COFINS_PERCENTUAL")
	private BigDecimal aliquotaCofinsPercentual;

    @Column(name="ALIQUOTA_COFINS_REAIS")
	private BigDecimal aliquotaCofinsReais;

    @Column(name="VALOR_COFINS")
	private BigDecimal valorCofins;

    @Column(name="ORIGEM_MERCADORIA")
	private String origemMercadoria;

    @Column(name="CST_ICMS")
	private String cstIcms;

    @Column(name="CSOSN")
	private String csosn;

    @Column(name="MODALIDADE_BC_ICMS")
	private String modalidadeBcIcms;

    @Column(name="PERCENTUAL_REDUCAO_BC_ICMS")
	private BigDecimal percentualReducaoBcIcms;

    @Column(name="VALOR_BC_ICMS")
	private BigDecimal valorBcIcms;

    @Column(name="ALIQUOTA_ICMS")
	private BigDecimal aliquotaIcms;

    @Column(name="VALOR_ICMS")
	private BigDecimal valorIcms;

    @Column(name="MOTIVO_DESONERACAO_ICMS")
	private String motivoDesoneracaoIcms;

    @Column(name="MODALIDADE_BC_ICMS_ST")
	private String modalidadeBcIcmsSt;

    @Column(name="PERCENTUAL_MVA_ICMS_ST")
	private BigDecimal percentualMvaIcmsSt;

    @Column(name="PERCENTUAL_REDUCAO_BC_ICMS_ST")
	private BigDecimal percentualReducaoBcIcmsSt;

    @Column(name="VALOR_BASE_CALCULO_ICMS_ST")
	private BigDecimal valorBaseCalculoIcmsSt;

    @Column(name="ALIQUOTA_ICMS_ST")
	private BigDecimal aliquotaIcmsSt;

    @Column(name="VALOR_ICMS_ST")
	private BigDecimal valorIcmsSt;

    @Column(name="VALOR_BC_ICMS_ST_RETIDO")
	private BigDecimal valorBcIcmsStRetido;

    @Column(name="VALOR_ICMS_ST_RETIDO")
	private BigDecimal valorIcmsStRetido;

    @Column(name="VALOR_BC_ICMS_ST_DESTINO")
	private BigDecimal valorBcIcmsStDestino;

    @Column(name="VALOR_ICMS_ST_DESTINO")
	private BigDecimal valorIcmsStDestino;

    @Column(name="ALIQUOTA_CREDITO_ICMS_SN")
	private BigDecimal aliquotaCreditoIcmsSn;

    @Column(name="VALOR_CREDITO_ICMS_SN")
	private BigDecimal valorCreditoIcmsSn;

    @Column(name="PERCENTUAL_BC_OPERACAO_PROPRIA")
	private BigDecimal percentualBcOperacaoPropria;

    @Column(name="UF_ST")
	private String ufSt;

    @Column(name="VALOR_BC_II")
	private BigDecimal valorBcIi;

    @Column(name="VALOR_DESPESAS_ADUANEIRAS")
	private BigDecimal valorDespesasAduaneiras;

    @Column(name="VALOR_IMPOSTO_IMPORTACAO")
	private BigDecimal valorImpostoImportacao;

    @Column(name="VALOR_IOF")
	private BigDecimal valorIof;

    @Column(name="CNPJ_PRODUTOR")
	private String cnpjProdutor;

    @Column(name="CODIGO_SELO_IPI")
	private String codigoSeloIpi;

    @Column(name="QUANTIDADE_SELO_IPI")
	private Integer quantidadeSeloIpi;

    @Column(name="ENQUADRAMENTO_LEGAL_IPI")
	private String enquadramentoLegalIpi;

    @Column(name="CST_IPI")
	private String cstIpi;

    @Column(name="VALOR_BASE_CALCULO_IPI")
	private BigDecimal valorBaseCalculoIpi;

    @Column(name="ALIQUOTA_IPI")
	private BigDecimal aliquotaIpi;

    @Column(name="QUANTIDADE_UNIDADE_TRIBUTAVEL")
	private BigDecimal quantidadeUnidadeTributavel;

    @Column(name="VALOR_UNIDADE_TRIBUTAVEL")
	private BigDecimal valorUnidadeTributavel;

    @Column(name="VALOR_IPI")
	private BigDecimal valorIpi;

    @Column(name="BASE_CALCULO_ISSQN")
	private BigDecimal baseCalculoIssqn;

    @Column(name="ALIQUOTA_ISSQN")
	private BigDecimal aliquotaIssqn;

    @Column(name="VALOR_ISSQN")
	private BigDecimal valorIssqn;

    @Column(name="MUNICIPIO_ISSQN")
	private Integer municipioIssqn;

    @Column(name="ITEM_LISTA_SERVICOS")
	private Integer itemListaServicos;

    @Column(name="CST_PIS")
	private String cstPis;

    @Column(name="QUANTIDADE_VENDIDA_PIS")
	private BigDecimal quantidadeVendidaPis;

    @Column(name="VALOR_BASE_CALCULO_PIS")
	private BigDecimal valorBaseCalculoPis;

    @Column(name="ALIQUOTA_PIS_PERCENTUAL")
	private BigDecimal aliquotaPisPercentual;

    @Column(name="ALIQUOTA_PIS_REAIS")
	private BigDecimal aliquotaPisReais;

    @Column(name="VALOR_PIS")
	private BigDecimal valorPis;

    @ManyToOne
	@JoinColumn(name="ID_PRODUTO")
    private Produto produto;

    @ManyToOne
	@JoinColumn(name="ID_TRIBUT_OPERACAO_FISCAL")
    private TributOperacaoFiscal tributOperacaoFiscal;

    @ManyToOne
	@JoinColumn(name="ID_PRODUTO_UNIDADE")
    private ProdutoUnidade produtoUnidade;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

	public ViewSpedNfeDetalhe() {
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
		this.quantidadeComercial = quantidadeComercial;
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
		this.valorUnitarioComercial = valorUnitarioComercial;
	}

    public BigDecimal getValorBrutoProduto() {
		return this.valorBrutoProduto;
	}

	public void setValorBrutoProduto(BigDecimal valorBrutoProduto) {
		this.valorBrutoProduto = valorBrutoProduto;
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
		this.quantidadeTributavel = quantidadeTributavel;
	}

    public BigDecimal getValorUnitarioTributavel() {
		return this.valorUnitarioTributavel;
	}

	public void setValorUnitarioTributavel(BigDecimal valorUnitarioTributavel) {
		this.valorUnitarioTributavel = valorUnitarioTributavel;
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

    public BigDecimal getValorDesconto() {
		return this.valorDesconto;
	}

	public void setValorDesconto(BigDecimal valorDesconto) {
		this.valorDesconto = valorDesconto;
	}

    public BigDecimal getValorOutrasDespesas() {
		return this.valorOutrasDespesas;
	}

	public void setValorOutrasDespesas(BigDecimal valorOutrasDespesas) {
		this.valorOutrasDespesas = valorOutrasDespesas;
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
		this.valorTotalTributos = valorTotalTributos;
	}

    public BigDecimal getPercentualDevolvido() {
		return this.percentualDevolvido;
	}

	public void setPercentualDevolvido(BigDecimal percentualDevolvido) {
		this.percentualDevolvido = percentualDevolvido;
	}

    public BigDecimal getValorIpiDevolvido() {
		return this.valorIpiDevolvido;
	}

	public void setValorIpiDevolvido(BigDecimal valorIpiDevolvido) {
		this.valorIpiDevolvido = valorIpiDevolvido;
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
		this.valorSubtotal = valorSubtotal;
	}

    public BigDecimal getValorTotal() {
		return this.valorTotal;
	}

	public void setValorTotal(BigDecimal valorTotal) {
		this.valorTotal = valorTotal;
	}

    public String getCstCofins() {
		return this.cstCofins;
	}

	public void setCstCofins(String cstCofins) {
		this.cstCofins = cstCofins;
	}

    public BigDecimal getQuantidadeVendidaCofins() {
		return this.quantidadeVendidaCofins;
	}

	public void setQuantidadeVendidaCofins(BigDecimal quantidadeVendidaCofins) {
		this.quantidadeVendidaCofins = quantidadeVendidaCofins;
	}

    public BigDecimal getBaseCalculoCofins() {
		return this.baseCalculoCofins;
	}

	public void setBaseCalculoCofins(BigDecimal baseCalculoCofins) {
		this.baseCalculoCofins = baseCalculoCofins;
	}

    public BigDecimal getAliquotaCofinsPercentual() {
		return this.aliquotaCofinsPercentual;
	}

	public void setAliquotaCofinsPercentual(BigDecimal aliquotaCofinsPercentual) {
		this.aliquotaCofinsPercentual = aliquotaCofinsPercentual;
	}

    public BigDecimal getAliquotaCofinsReais() {
		return this.aliquotaCofinsReais;
	}

	public void setAliquotaCofinsReais(BigDecimal aliquotaCofinsReais) {
		this.aliquotaCofinsReais = aliquotaCofinsReais;
	}

    public BigDecimal getValorCofins() {
		return this.valorCofins;
	}

	public void setValorCofins(BigDecimal valorCofins) {
		this.valorCofins = valorCofins;
	}

    public String getOrigemMercadoria() {
		return this.origemMercadoria;
	}

	public void setOrigemMercadoria(String origemMercadoria) {
		this.origemMercadoria = origemMercadoria;
	}

    public String getCstIcms() {
		return this.cstIcms;
	}

	public void setCstIcms(String cstIcms) {
		this.cstIcms = cstIcms;
	}

    public String getCsosn() {
		return this.csosn;
	}

	public void setCsosn(String csosn) {
		this.csosn = csosn;
	}

    public String getModalidadeBcIcms() {
		return this.modalidadeBcIcms;
	}

	public void setModalidadeBcIcms(String modalidadeBcIcms) {
		this.modalidadeBcIcms = modalidadeBcIcms;
	}

    public BigDecimal getPercentualReducaoBcIcms() {
		return this.percentualReducaoBcIcms;
	}

	public void setPercentualReducaoBcIcms(BigDecimal percentualReducaoBcIcms) {
		this.percentualReducaoBcIcms = percentualReducaoBcIcms;
	}

    public BigDecimal getValorBcIcms() {
		return this.valorBcIcms;
	}

	public void setValorBcIcms(BigDecimal valorBcIcms) {
		this.valorBcIcms = valorBcIcms;
	}

    public BigDecimal getAliquotaIcms() {
		return this.aliquotaIcms;
	}

	public void setAliquotaIcms(BigDecimal aliquotaIcms) {
		this.aliquotaIcms = aliquotaIcms;
	}

    public BigDecimal getValorIcms() {
		return this.valorIcms;
	}

	public void setValorIcms(BigDecimal valorIcms) {
		this.valorIcms = valorIcms;
	}

    public String getMotivoDesoneracaoIcms() {
		return this.motivoDesoneracaoIcms;
	}

	public void setMotivoDesoneracaoIcms(String motivoDesoneracaoIcms) {
		this.motivoDesoneracaoIcms = motivoDesoneracaoIcms;
	}

    public String getModalidadeBcIcmsSt() {
		return this.modalidadeBcIcmsSt;
	}

	public void setModalidadeBcIcmsSt(String modalidadeBcIcmsSt) {
		this.modalidadeBcIcmsSt = modalidadeBcIcmsSt;
	}

    public BigDecimal getPercentualMvaIcmsSt() {
		return this.percentualMvaIcmsSt;
	}

	public void setPercentualMvaIcmsSt(BigDecimal percentualMvaIcmsSt) {
		this.percentualMvaIcmsSt = percentualMvaIcmsSt;
	}

    public BigDecimal getPercentualReducaoBcIcmsSt() {
		return this.percentualReducaoBcIcmsSt;
	}

	public void setPercentualReducaoBcIcmsSt(BigDecimal percentualReducaoBcIcmsSt) {
		this.percentualReducaoBcIcmsSt = percentualReducaoBcIcmsSt;
	}

    public BigDecimal getValorBaseCalculoIcmsSt() {
		return this.valorBaseCalculoIcmsSt;
	}

	public void setValorBaseCalculoIcmsSt(BigDecimal valorBaseCalculoIcmsSt) {
		this.valorBaseCalculoIcmsSt = valorBaseCalculoIcmsSt;
	}

    public BigDecimal getAliquotaIcmsSt() {
		return this.aliquotaIcmsSt;
	}

	public void setAliquotaIcmsSt(BigDecimal aliquotaIcmsSt) {
		this.aliquotaIcmsSt = aliquotaIcmsSt;
	}

    public BigDecimal getValorIcmsSt() {
		return this.valorIcmsSt;
	}

	public void setValorIcmsSt(BigDecimal valorIcmsSt) {
		this.valorIcmsSt = valorIcmsSt;
	}

    public BigDecimal getValorBcIcmsStRetido() {
		return this.valorBcIcmsStRetido;
	}

	public void setValorBcIcmsStRetido(BigDecimal valorBcIcmsStRetido) {
		this.valorBcIcmsStRetido = valorBcIcmsStRetido;
	}

    public BigDecimal getValorIcmsStRetido() {
		return this.valorIcmsStRetido;
	}

	public void setValorIcmsStRetido(BigDecimal valorIcmsStRetido) {
		this.valorIcmsStRetido = valorIcmsStRetido;
	}

    public BigDecimal getValorBcIcmsStDestino() {
		return this.valorBcIcmsStDestino;
	}

	public void setValorBcIcmsStDestino(BigDecimal valorBcIcmsStDestino) {
		this.valorBcIcmsStDestino = valorBcIcmsStDestino;
	}

    public BigDecimal getValorIcmsStDestino() {
		return this.valorIcmsStDestino;
	}

	public void setValorIcmsStDestino(BigDecimal valorIcmsStDestino) {
		this.valorIcmsStDestino = valorIcmsStDestino;
	}

    public BigDecimal getAliquotaCreditoIcmsSn() {
		return this.aliquotaCreditoIcmsSn;
	}

	public void setAliquotaCreditoIcmsSn(BigDecimal aliquotaCreditoIcmsSn) {
		this.aliquotaCreditoIcmsSn = aliquotaCreditoIcmsSn;
	}

    public BigDecimal getValorCreditoIcmsSn() {
		return this.valorCreditoIcmsSn;
	}

	public void setValorCreditoIcmsSn(BigDecimal valorCreditoIcmsSn) {
		this.valorCreditoIcmsSn = valorCreditoIcmsSn;
	}

    public BigDecimal getPercentualBcOperacaoPropria() {
		return this.percentualBcOperacaoPropria;
	}

	public void setPercentualBcOperacaoPropria(BigDecimal percentualBcOperacaoPropria) {
		this.percentualBcOperacaoPropria = percentualBcOperacaoPropria;
	}

    public String getUfSt() {
		return this.ufSt;
	}

	public void setUfSt(String ufSt) {
		this.ufSt = ufSt;
	}

    public BigDecimal getValorBcIi() {
		return this.valorBcIi;
	}

	public void setValorBcIi(BigDecimal valorBcIi) {
		this.valorBcIi = valorBcIi;
	}

    public BigDecimal getValorDespesasAduaneiras() {
		return this.valorDespesasAduaneiras;
	}

	public void setValorDespesasAduaneiras(BigDecimal valorDespesasAduaneiras) {
		this.valorDespesasAduaneiras = valorDespesasAduaneiras;
	}

    public BigDecimal getValorImpostoImportacao() {
		return this.valorImpostoImportacao;
	}

	public void setValorImpostoImportacao(BigDecimal valorImpostoImportacao) {
		this.valorImpostoImportacao = valorImpostoImportacao;
	}

    public BigDecimal getValorIof() {
		return this.valorIof;
	}

	public void setValorIof(BigDecimal valorIof) {
		this.valorIof = valorIof;
	}

    public String getCnpjProdutor() {
		return this.cnpjProdutor;
	}

	public void setCnpjProdutor(String cnpjProdutor) {
		this.cnpjProdutor = cnpjProdutor;
	}

    public String getCodigoSeloIpi() {
		return this.codigoSeloIpi;
	}

	public void setCodigoSeloIpi(String codigoSeloIpi) {
		this.codigoSeloIpi = codigoSeloIpi;
	}

    public Integer getQuantidadeSeloIpi() {
		return this.quantidadeSeloIpi;
	}

	public void setQuantidadeSeloIpi(Integer quantidadeSeloIpi) {
		this.quantidadeSeloIpi = quantidadeSeloIpi;
	}

    public String getEnquadramentoLegalIpi() {
		return this.enquadramentoLegalIpi;
	}

	public void setEnquadramentoLegalIpi(String enquadramentoLegalIpi) {
		this.enquadramentoLegalIpi = enquadramentoLegalIpi;
	}

    public String getCstIpi() {
		return this.cstIpi;
	}

	public void setCstIpi(String cstIpi) {
		this.cstIpi = cstIpi;
	}

    public BigDecimal getValorBaseCalculoIpi() {
		return this.valorBaseCalculoIpi;
	}

	public void setValorBaseCalculoIpi(BigDecimal valorBaseCalculoIpi) {
		this.valorBaseCalculoIpi = valorBaseCalculoIpi;
	}

    public BigDecimal getAliquotaIpi() {
		return this.aliquotaIpi;
	}

	public void setAliquotaIpi(BigDecimal aliquotaIpi) {
		this.aliquotaIpi = aliquotaIpi;
	}

    public BigDecimal getQuantidadeUnidadeTributavel() {
		return this.quantidadeUnidadeTributavel;
	}

	public void setQuantidadeUnidadeTributavel(BigDecimal quantidadeUnidadeTributavel) {
		this.quantidadeUnidadeTributavel = quantidadeUnidadeTributavel;
	}

    public BigDecimal getValorUnidadeTributavel() {
		return this.valorUnidadeTributavel;
	}

	public void setValorUnidadeTributavel(BigDecimal valorUnidadeTributavel) {
		this.valorUnidadeTributavel = valorUnidadeTributavel;
	}

    public BigDecimal getValorIpi() {
		return this.valorIpi;
	}

	public void setValorIpi(BigDecimal valorIpi) {
		this.valorIpi = valorIpi;
	}

    public BigDecimal getBaseCalculoIssqn() {
		return this.baseCalculoIssqn;
	}

	public void setBaseCalculoIssqn(BigDecimal baseCalculoIssqn) {
		this.baseCalculoIssqn = baseCalculoIssqn;
	}

    public BigDecimal getAliquotaIssqn() {
		return this.aliquotaIssqn;
	}

	public void setAliquotaIssqn(BigDecimal aliquotaIssqn) {
		this.aliquotaIssqn = aliquotaIssqn;
	}

    public BigDecimal getValorIssqn() {
		return this.valorIssqn;
	}

	public void setValorIssqn(BigDecimal valorIssqn) {
		this.valorIssqn = valorIssqn;
	}

    public Integer getMunicipioIssqn() {
		return this.municipioIssqn;
	}

	public void setMunicipioIssqn(Integer municipioIssqn) {
		this.municipioIssqn = municipioIssqn;
	}

    public Integer getItemListaServicos() {
		return this.itemListaServicos;
	}

	public void setItemListaServicos(Integer itemListaServicos) {
		this.itemListaServicos = itemListaServicos;
	}

    public String getCstPis() {
		return this.cstPis;
	}

	public void setCstPis(String cstPis) {
		this.cstPis = cstPis;
	}

    public BigDecimal getQuantidadeVendidaPis() {
		return this.quantidadeVendidaPis;
	}

	public void setQuantidadeVendidaPis(BigDecimal quantidadeVendidaPis) {
		this.quantidadeVendidaPis = quantidadeVendidaPis;
	}

    public BigDecimal getValorBaseCalculoPis() {
		return this.valorBaseCalculoPis;
	}

	public void setValorBaseCalculoPis(BigDecimal valorBaseCalculoPis) {
		this.valorBaseCalculoPis = valorBaseCalculoPis;
	}

    public BigDecimal getAliquotaPisPercentual() {
		return this.aliquotaPisPercentual;
	}

	public void setAliquotaPisPercentual(BigDecimal aliquotaPisPercentual) {
		this.aliquotaPisPercentual = aliquotaPisPercentual;
	}

    public BigDecimal getAliquotaPisReais() {
		return this.aliquotaPisReais;
	}

	public void setAliquotaPisReais(BigDecimal aliquotaPisReais) {
		this.aliquotaPisReais = aliquotaPisReais;
	}

    public BigDecimal getValorPis() {
		return this.valorPis;
	}

	public void setValorPis(BigDecimal valorPis) {
		this.valorPis = valorPis;
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

    public TributOperacaoFiscal getTributOperacaoFiscal() {
		return this.tributOperacaoFiscal;
	}

	public void setTributOperacaoFiscal(TributOperacaoFiscal tributOperacaoFiscal) {
		this.tributOperacaoFiscal = tributOperacaoFiscal;
	}

    public ProdutoUnidade getProdutoUnidade() {
		return this.produtoUnidade;
	}

	public void setProdutoUnidade(ProdutoUnidade produtoUnidade) {
		this.produtoUnidade = produtoUnidade;
	}

		
}