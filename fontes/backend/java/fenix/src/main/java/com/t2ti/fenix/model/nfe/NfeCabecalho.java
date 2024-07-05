/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
import com.t2ti.fenix.model.cadastros.Fornecedor;
import com.t2ti.fenix.model.cadastros.Vendedor;
import com.t2ti.fenix.model.sped.ViewSpedNfeDetalhe;
import com.t2ti.fenix.model.tributacao.TributOperacaoFiscal;
import com.t2ti.fenix.model.vendas.VendaCabecalho;

@Entity
@Table(name="NFE_CABECALHO")
@NamedQuery(name="NfeCabecalho.findAll", query="SELECT t FROM NfeCabecalho t")
public class NfeCabecalho implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_NFCE_MOVIMENTO")
	private Integer idNfceMovimento;

    @Column(name="UF_EMITENTE")
	private Integer ufEmitente;

    @Column(name="CODIGO_NUMERICO")
	private String codigoNumerico;

    @Column(name="NATUREZA_OPERACAO")
	private String naturezaOperacao;

    @Column(name="CODIGO_MODELO")
	private String codigoModelo;

    @Column(name="SERIE")
	private String serie;

    @Column(name="NUMERO")
	private String numero;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_HORA_EMISSAO")
	private Date dataHoraEmissao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_HORA_ENTRADA_SAIDA")
	private Date dataHoraEntradaSaida;

    @Column(name="TIPO_OPERACAO")
	private String tipoOperacao;

    @Column(name="LOCAL_DESTINO")
	private String localDestino;

    @Column(name="CODIGO_MUNICIPIO")
	private Integer codigoMunicipio;

    @Column(name="FORMATO_IMPRESSAO_DANFE")
	private String formatoImpressaoDanfe;

    @Column(name="TIPO_EMISSAO")
	private String tipoEmissao;

    @Column(name="CHAVE_ACESSO")
	private String chaveAcesso;

    @Column(name="DIGITO_CHAVE_ACESSO")
	private String digitoChaveAcesso;

    @Column(name="AMBIENTE")
	private String ambiente;

    @Column(name="FINALIDADE_EMISSAO")
	private String finalidadeEmissao;

    @Column(name="CONSUMIDOR_OPERACAO")
	private String consumidorOperacao;

    @Column(name="CONSUMIDOR_PRESENCA")
	private String consumidorPresenca;

    @Column(name="PROCESSO_EMISSAO")
	private String processoEmissao;

    @Column(name="VERSAO_PROCESSO_EMISSAO")
	private String versaoProcessoEmissao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_ENTRADA_CONTINGENCIA")
	private Date dataEntradaContingencia;

    @Column(name="JUSTIFICATIVA_CONTINGENCIA")
	private String justificativaContingencia;

    @Column(name="BASE_CALCULO_ICMS")
	private BigDecimal baseCalculoIcms;

    @Column(name="VALOR_ICMS")
	private BigDecimal valorIcms;

    @Column(name="VALOR_ICMS_DESONERADO")
	private BigDecimal valorIcmsDesonerado;

    @Column(name="TOTAL_ICMS_FCP_UF_DESTINO")
	private BigDecimal totalIcmsFcpUfDestino;

    @Column(name="TOTAL_ICMS_INTERESTADUAL_UF_DESTINO")
	private BigDecimal totalIcmsInterestadualUfDestino;

    @Column(name="TOTAL_ICMS_INTERESTADUAL_UF_REMETENTE")
	private BigDecimal totalIcmsInterestadualUfRemetente;

    @Column(name="VALOR_TOTAL_FCP")
	private BigDecimal valorTotalFcp;

    @Column(name="BASE_CALCULO_ICMS_ST")
	private BigDecimal baseCalculoIcmsSt;

    @Column(name="VALOR_ICMS_ST")
	private BigDecimal valorIcmsSt;

    @Column(name="VALOR_TOTAL_FCP_ST")
	private BigDecimal valorTotalFcpSt;

    @Column(name="VALOR_TOTAL_FCP_ST_RETIDO")
	private BigDecimal valorTotalFcpStRetido;

    @Column(name="VALOR_TOTAL_PRODUTOS")
	private BigDecimal valorTotalProdutos;

    @Column(name="VALOR_FRETE")
	private BigDecimal valorFrete;

    @Column(name="VALOR_SEGURO")
	private BigDecimal valorSeguro;

    @Column(name="VALOR_DESCONTO")
	private BigDecimal valorDesconto;

    @Column(name="VALOR_IMPOSTO_IMPORTACAO")
	private BigDecimal valorImpostoImportacao;

    @Column(name="VALOR_IPI")
	private BigDecimal valorIpi;

    @Column(name="VALOR_IPI_DEVOLVIDO")
	private BigDecimal valorIpiDevolvido;

    @Column(name="VALOR_PIS")
	private BigDecimal valorPis;

    @Column(name="VALOR_COFINS")
	private BigDecimal valorCofins;

    @Column(name="VALOR_DESPESAS_ACESSORIAS")
	private BigDecimal valorDespesasAcessorias;

    @Column(name="VALOR_TOTAL")
	private BigDecimal valorTotal;

    @Column(name="VALOR_TOTAL_TRIBUTOS")
	private BigDecimal valorTotalTributos;

    @Column(name="VALOR_SERVICOS")
	private BigDecimal valorServicos;

    @Column(name="BASE_CALCULO_ISSQN")
	private BigDecimal baseCalculoIssqn;

    @Column(name="VALOR_ISSQN")
	private BigDecimal valorIssqn;

    @Column(name="VALOR_PIS_ISSQN")
	private BigDecimal valorPisIssqn;

    @Column(name="VALOR_COFINS_ISSQN")
	private BigDecimal valorCofinsIssqn;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PRESTACAO_SERVICO")
	private Date dataPrestacaoServico;

    @Column(name="VALOR_DEDUCAO_ISSQN")
	private BigDecimal valorDeducaoIssqn;

    @Column(name="OUTRAS_RETENCOES_ISSQN")
	private BigDecimal outrasRetencoesIssqn;

    @Column(name="DESCONTO_INCONDICIONADO_ISSQN")
	private BigDecimal descontoIncondicionadoIssqn;

    @Column(name="DESCONTO_CONDICIONADO_ISSQN")
	private BigDecimal descontoCondicionadoIssqn;

    @Column(name="TOTAL_RETENCAO_ISSQN")
	private BigDecimal totalRetencaoIssqn;

    @Column(name="REGIME_ESPECIAL_TRIBUTACAO")
	private String regimeEspecialTributacao;

    @Column(name="VALOR_RETIDO_PIS")
	private BigDecimal valorRetidoPis;

    @Column(name="VALOR_RETIDO_COFINS")
	private BigDecimal valorRetidoCofins;

    @Column(name="VALOR_RETIDO_CSLL")
	private BigDecimal valorRetidoCsll;

    @Column(name="BASE_CALCULO_IRRF")
	private BigDecimal baseCalculoIrrf;

    @Column(name="VALOR_RETIDO_IRRF")
	private BigDecimal valorRetidoIrrf;

    @Column(name="BASE_CALCULO_PREVIDENCIA")
	private BigDecimal baseCalculoPrevidencia;

    @Column(name="VALOR_RETIDO_PREVIDENCIA")
	private BigDecimal valorRetidoPrevidencia;

    @Column(name="INFORMACOES_ADD_FISCO")
	private String informacoesAddFisco;

    @Column(name="INFORMACOES_ADD_CONTRIBUINTE")
	private String informacoesAddContribuinte;

    @Column(name="COMEX_UF_EMBARQUE")
	private String comexUfEmbarque;

    @Column(name="COMEX_LOCAL_EMBARQUE")
	private String comexLocalEmbarque;

    @Column(name="COMEX_LOCAL_DESPACHO")
	private String comexLocalDespacho;

    @Column(name="COMPRA_NOTA_EMPENHO")
	private String compraNotaEmpenho;

    @Column(name="COMPRA_PEDIDO")
	private String compraPedido;

    @Column(name="COMPRA_CONTRATO")
	private String compraContrato;

    @Column(name="QRCODE")
	private String qrcode;

    @Column(name="URL_CHAVE")
	private String urlChave;

    @Column(name="STATUS_NOTA")
	private String statusNota;

    @OneToOne(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeCana nfeCana;

    @OneToOne(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeDestinatario nfeDestinatario;

    @OneToOne(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeEmitente nfeEmitente;

    @OneToOne(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeFatura nfeFatura;

    @OneToOne(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeInformacaoPagamento nfeInformacaoPagamento;

    @OneToOne(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeLocalEntrega nfeLocalEntrega;

    @OneToOne(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeLocalRetirada nfeLocalRetirada;

    @OneToOne(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeResponsavelTecnico nfeResponsavelTecnico;

    @OneToOne(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private NfeTransporte nfeTransporte;

    @ManyToOne
	@JoinColumn(name="ID_VENDEDOR")
    private Vendedor vendedor;

    @ManyToOne
	@JoinColumn(name="ID_FORNECEDOR")
    private Fornecedor fornecedor;

    @ManyToOne
	@JoinColumn(name="ID_CLIENTE")
    private Cliente cliente;

    @ManyToOne
	@JoinColumn(name="ID_TRIBUT_OPERACAO_FISCAL")
    private TributOperacaoFiscal tributOperacaoFiscal;

    @ManyToOne
	@JoinColumn(name="ID_VENDA_CABECALHO")
    private VendaCabecalho vendaCabecalho;

    @OneToMany(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeAcessoXml> listaNfeAcessoXml;

    @OneToMany(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeCteReferenciado> listaNfeCteReferenciado;

    @OneToMany(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeCupomFiscalReferenciado> listaNfeCupomFiscalReferenciado;

    @OneToMany(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeDetalhe> listaNfeDetalhe;

    @OneToMany(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeNfReferenciada> listaNfeNfReferenciada;

    @OneToMany(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeProcessoReferenciado> listaNfeProcessoReferenciado;

    @OneToMany(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeProdRuralReferenciada> listaNfeProdRuralReferenciada;

    @OneToMany(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeReferenciada> listaNfeReferenciada;

    @OneToMany(mappedBy = "nfeCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<ViewSpedNfeDetalhe> listaViewSpedNfeDetalhe;

	public NfeCabecalho() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdNfceMovimento() {
		return this.idNfceMovimento;
	}

	public void setIdNfceMovimento(Integer idNfceMovimento) {
		this.idNfceMovimento = idNfceMovimento == 0 ? null : idNfceMovimento;
	}

    public Integer getUfEmitente() {
		return this.ufEmitente;
	}

	public void setUfEmitente(Integer ufEmitente) {
		this.ufEmitente = ufEmitente;
	}

    public String getCodigoNumerico() {
		return this.codigoNumerico;
	}

	public void setCodigoNumerico(String codigoNumerico) {
		this.codigoNumerico = codigoNumerico;
	}

    public String getNaturezaOperacao() {
		return this.naturezaOperacao;
	}

	public void setNaturezaOperacao(String naturezaOperacao) {
		this.naturezaOperacao = naturezaOperacao;
	}

    public String getCodigoModelo() {
		return this.codigoModelo;
	}

	public void setCodigoModelo(String codigoModelo) {
		this.codigoModelo = codigoModelo;
	}

    public String getSerie() {
		return this.serie;
	}

	public void setSerie(String serie) {
		this.serie = serie;
	}

    public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

    public Date getDataHoraEmissao() {
		return this.dataHoraEmissao;
	}

	public void setDataHoraEmissao(Date dataHoraEmissao) {
		this.dataHoraEmissao = dataHoraEmissao;
	}

    public Date getDataHoraEntradaSaida() {
		return this.dataHoraEntradaSaida;
	}

	public void setDataHoraEntradaSaida(Date dataHoraEntradaSaida) {
		this.dataHoraEntradaSaida = dataHoraEntradaSaida;
	}

    public String getTipoOperacao() {
		return this.tipoOperacao;
	}

	public void setTipoOperacao(String tipoOperacao) {
		this.tipoOperacao = tipoOperacao;
	}

    public String getLocalDestino() {
		return this.localDestino;
	}

	public void setLocalDestino(String localDestino) {
		this.localDestino = localDestino;
	}

    public Integer getCodigoMunicipio() {
		return this.codigoMunicipio;
	}

	public void setCodigoMunicipio(Integer codigoMunicipio) {
		this.codigoMunicipio = codigoMunicipio;
	}

    public String getFormatoImpressaoDanfe() {
		return this.formatoImpressaoDanfe;
	}

	public void setFormatoImpressaoDanfe(String formatoImpressaoDanfe) {
		this.formatoImpressaoDanfe = formatoImpressaoDanfe;
	}

    public String getTipoEmissao() {
		return this.tipoEmissao;
	}

	public void setTipoEmissao(String tipoEmissao) {
		this.tipoEmissao = tipoEmissao;
	}

    public String getChaveAcesso() {
		return this.chaveAcesso;
	}

	public void setChaveAcesso(String chaveAcesso) {
		this.chaveAcesso = chaveAcesso;
	}

    public String getDigitoChaveAcesso() {
		return this.digitoChaveAcesso;
	}

	public void setDigitoChaveAcesso(String digitoChaveAcesso) {
		this.digitoChaveAcesso = digitoChaveAcesso;
	}

    public String getAmbiente() {
		return this.ambiente;
	}

	public void setAmbiente(String ambiente) {
		this.ambiente = ambiente;
	}

    public String getFinalidadeEmissao() {
		return this.finalidadeEmissao;
	}

	public void setFinalidadeEmissao(String finalidadeEmissao) {
		this.finalidadeEmissao = finalidadeEmissao;
	}

    public String getConsumidorOperacao() {
		return this.consumidorOperacao;
	}

	public void setConsumidorOperacao(String consumidorOperacao) {
		this.consumidorOperacao = consumidorOperacao;
	}

    public String getConsumidorPresenca() {
		return this.consumidorPresenca;
	}

	public void setConsumidorPresenca(String consumidorPresenca) {
		this.consumidorPresenca = consumidorPresenca;
	}

    public String getProcessoEmissao() {
		return this.processoEmissao;
	}

	public void setProcessoEmissao(String processoEmissao) {
		this.processoEmissao = processoEmissao;
	}

    public String getVersaoProcessoEmissao() {
		return this.versaoProcessoEmissao;
	}

	public void setVersaoProcessoEmissao(String versaoProcessoEmissao) {
		this.versaoProcessoEmissao = versaoProcessoEmissao;
	}

    public Date getDataEntradaContingencia() {
		return this.dataEntradaContingencia;
	}

	public void setDataEntradaContingencia(Date dataEntradaContingencia) {
		this.dataEntradaContingencia = dataEntradaContingencia;
	}

    public String getJustificativaContingencia() {
		return this.justificativaContingencia;
	}

	public void setJustificativaContingencia(String justificativaContingencia) {
		this.justificativaContingencia = justificativaContingencia;
	}

    public BigDecimal getBaseCalculoIcms() {
		return this.baseCalculoIcms;
	}

	public void setBaseCalculoIcms(BigDecimal baseCalculoIcms) {
		this.baseCalculoIcms = baseCalculoIcms == null ? new BigDecimal(0) : baseCalculoIcms;
	}

    public BigDecimal getValorIcms() {
		return this.valorIcms;
	}

	public void setValorIcms(BigDecimal valorIcms) {
		this.valorIcms = valorIcms == null ? new BigDecimal(0) : valorIcms;
	}

    public BigDecimal getValorIcmsDesonerado() {
		return this.valorIcmsDesonerado;
	}

	public void setValorIcmsDesonerado(BigDecimal valorIcmsDesonerado) {
		this.valorIcmsDesonerado = valorIcmsDesonerado == null ? new BigDecimal(0) : valorIcmsDesonerado;
	}

    public BigDecimal getTotalIcmsFcpUfDestino() {
		return this.totalIcmsFcpUfDestino;
	}

	public void setTotalIcmsFcpUfDestino(BigDecimal totalIcmsFcpUfDestino) {
		this.totalIcmsFcpUfDestino = totalIcmsFcpUfDestino == null ? new BigDecimal(0) : totalIcmsFcpUfDestino;
	}

    public BigDecimal getTotalIcmsInterestadualUfDestino() {
		return this.totalIcmsInterestadualUfDestino;
	}

	public void setTotalIcmsInterestadualUfDestino(BigDecimal totalIcmsInterestadualUfDestino) {
		this.totalIcmsInterestadualUfDestino = totalIcmsInterestadualUfDestino == null ? new BigDecimal(0) : totalIcmsInterestadualUfDestino;
	}

    public BigDecimal getTotalIcmsInterestadualUfRemetente() {
		return this.totalIcmsInterestadualUfRemetente;
	}

	public void setTotalIcmsInterestadualUfRemetente(BigDecimal totalIcmsInterestadualUfRemetente) {
		this.totalIcmsInterestadualUfRemetente = totalIcmsInterestadualUfRemetente == null ? new BigDecimal(0) : totalIcmsInterestadualUfRemetente;
	}

    public BigDecimal getValorTotalFcp() {
		return this.valorTotalFcp;
	}

	public void setValorTotalFcp(BigDecimal valorTotalFcp) {
		this.valorTotalFcp = valorTotalFcp == null ? new BigDecimal(0) : valorTotalFcp;
	}

    public BigDecimal getBaseCalculoIcmsSt() {
		return this.baseCalculoIcmsSt;
	}

	public void setBaseCalculoIcmsSt(BigDecimal baseCalculoIcmsSt) {
		this.baseCalculoIcmsSt = baseCalculoIcmsSt == null ? new BigDecimal(0) : baseCalculoIcmsSt;
	}

    public BigDecimal getValorIcmsSt() {
		return this.valorIcmsSt;
	}

	public void setValorIcmsSt(BigDecimal valorIcmsSt) {
		this.valorIcmsSt = valorIcmsSt == null ? new BigDecimal(0) : valorIcmsSt;
	}

    public BigDecimal getValorTotalFcpSt() {
		return this.valorTotalFcpSt;
	}

	public void setValorTotalFcpSt(BigDecimal valorTotalFcpSt) {
		this.valorTotalFcpSt = valorTotalFcpSt == null ? new BigDecimal(0) : valorTotalFcpSt;
	}

    public BigDecimal getValorTotalFcpStRetido() {
		return this.valorTotalFcpStRetido;
	}

	public void setValorTotalFcpStRetido(BigDecimal valorTotalFcpStRetido) {
		this.valorTotalFcpStRetido = valorTotalFcpStRetido == null ? new BigDecimal(0) : valorTotalFcpStRetido;
	}

    public BigDecimal getValorTotalProdutos() {
		return this.valorTotalProdutos;
	}

	public void setValorTotalProdutos(BigDecimal valorTotalProdutos) {
		this.valorTotalProdutos = valorTotalProdutos == null ? new BigDecimal(0) : valorTotalProdutos;
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

    public BigDecimal getValorImpostoImportacao() {
		return this.valorImpostoImportacao;
	}

	public void setValorImpostoImportacao(BigDecimal valorImpostoImportacao) {
		this.valorImpostoImportacao = valorImpostoImportacao == null ? new BigDecimal(0) : valorImpostoImportacao;
	}

    public BigDecimal getValorIpi() {
		return this.valorIpi;
	}

	public void setValorIpi(BigDecimal valorIpi) {
		this.valorIpi = valorIpi == null ? new BigDecimal(0) : valorIpi;
	}

    public BigDecimal getValorIpiDevolvido() {
		return this.valorIpiDevolvido;
	}

	public void setValorIpiDevolvido(BigDecimal valorIpiDevolvido) {
		this.valorIpiDevolvido = valorIpiDevolvido == null ? new BigDecimal(0) : valorIpiDevolvido;
	}

    public BigDecimal getValorPis() {
		return this.valorPis;
	}

	public void setValorPis(BigDecimal valorPis) {
		this.valorPis = valorPis == null ? new BigDecimal(0) : valorPis;
	}

    public BigDecimal getValorCofins() {
		return this.valorCofins;
	}

	public void setValorCofins(BigDecimal valorCofins) {
		this.valorCofins = valorCofins == null ? new BigDecimal(0) : valorCofins;
	}

    public BigDecimal getValorDespesasAcessorias() {
		return this.valorDespesasAcessorias;
	}

	public void setValorDespesasAcessorias(BigDecimal valorDespesasAcessorias) {
		this.valorDespesasAcessorias = valorDespesasAcessorias == null ? new BigDecimal(0) : valorDespesasAcessorias;
	}

    public BigDecimal getValorTotal() {
		return this.valorTotal;
	}

	public void setValorTotal(BigDecimal valorTotal) {
		this.valorTotal = valorTotal == null ? new BigDecimal(0) : valorTotal;
	}

    public BigDecimal getValorTotalTributos() {
		return this.valorTotalTributos;
	}

	public void setValorTotalTributos(BigDecimal valorTotalTributos) {
		this.valorTotalTributos = valorTotalTributos == null ? new BigDecimal(0) : valorTotalTributos;
	}

    public BigDecimal getValorServicos() {
		return this.valorServicos;
	}

	public void setValorServicos(BigDecimal valorServicos) {
		this.valorServicos = valorServicos == null ? new BigDecimal(0) : valorServicos;
	}

    public BigDecimal getBaseCalculoIssqn() {
		return this.baseCalculoIssqn;
	}

	public void setBaseCalculoIssqn(BigDecimal baseCalculoIssqn) {
		this.baseCalculoIssqn = baseCalculoIssqn == null ? new BigDecimal(0) : baseCalculoIssqn;
	}

    public BigDecimal getValorIssqn() {
		return this.valorIssqn;
	}

	public void setValorIssqn(BigDecimal valorIssqn) {
		this.valorIssqn = valorIssqn == null ? new BigDecimal(0) : valorIssqn;
	}

    public BigDecimal getValorPisIssqn() {
		return this.valorPisIssqn;
	}

	public void setValorPisIssqn(BigDecimal valorPisIssqn) {
		this.valorPisIssqn = valorPisIssqn == null ? new BigDecimal(0) : valorPisIssqn;
	}

    public BigDecimal getValorCofinsIssqn() {
		return this.valorCofinsIssqn;
	}

	public void setValorCofinsIssqn(BigDecimal valorCofinsIssqn) {
		this.valorCofinsIssqn = valorCofinsIssqn == null ? new BigDecimal(0) : valorCofinsIssqn;
	}

    public Date getDataPrestacaoServico() {
		return this.dataPrestacaoServico;
	}

	public void setDataPrestacaoServico(Date dataPrestacaoServico) {
		this.dataPrestacaoServico = dataPrestacaoServico;
	}

    public BigDecimal getValorDeducaoIssqn() {
		return this.valorDeducaoIssqn;
	}

	public void setValorDeducaoIssqn(BigDecimal valorDeducaoIssqn) {
		this.valorDeducaoIssqn = valorDeducaoIssqn == null ? new BigDecimal(0) : valorDeducaoIssqn;
	}

    public BigDecimal getOutrasRetencoesIssqn() {
		return this.outrasRetencoesIssqn;
	}

	public void setOutrasRetencoesIssqn(BigDecimal outrasRetencoesIssqn) {
		this.outrasRetencoesIssqn = outrasRetencoesIssqn == null ? new BigDecimal(0) : outrasRetencoesIssqn;
	}

    public BigDecimal getDescontoIncondicionadoIssqn() {
		return this.descontoIncondicionadoIssqn;
	}

	public void setDescontoIncondicionadoIssqn(BigDecimal descontoIncondicionadoIssqn) {
		this.descontoIncondicionadoIssqn = descontoIncondicionadoIssqn == null ? new BigDecimal(0) : descontoIncondicionadoIssqn;
	}

    public BigDecimal getDescontoCondicionadoIssqn() {
		return this.descontoCondicionadoIssqn;
	}

	public void setDescontoCondicionadoIssqn(BigDecimal descontoCondicionadoIssqn) {
		this.descontoCondicionadoIssqn = descontoCondicionadoIssqn == null ? new BigDecimal(0) : descontoCondicionadoIssqn;
	}

    public BigDecimal getTotalRetencaoIssqn() {
		return this.totalRetencaoIssqn;
	}

	public void setTotalRetencaoIssqn(BigDecimal totalRetencaoIssqn) {
		this.totalRetencaoIssqn = totalRetencaoIssqn == null ? new BigDecimal(0) : totalRetencaoIssqn;
	}

    public String getRegimeEspecialTributacao() {
		return this.regimeEspecialTributacao;
	}

	public void setRegimeEspecialTributacao(String regimeEspecialTributacao) {
		this.regimeEspecialTributacao = regimeEspecialTributacao;
	}

    public BigDecimal getValorRetidoPis() {
		return this.valorRetidoPis;
	}

	public void setValorRetidoPis(BigDecimal valorRetidoPis) {
		this.valorRetidoPis = valorRetidoPis == null ? new BigDecimal(0) : valorRetidoPis;
	}

    public BigDecimal getValorRetidoCofins() {
		return this.valorRetidoCofins;
	}

	public void setValorRetidoCofins(BigDecimal valorRetidoCofins) {
		this.valorRetidoCofins = valorRetidoCofins == null ? new BigDecimal(0) : valorRetidoCofins;
	}

    public BigDecimal getValorRetidoCsll() {
		return this.valorRetidoCsll;
	}

	public void setValorRetidoCsll(BigDecimal valorRetidoCsll) {
		this.valorRetidoCsll = valorRetidoCsll == null ? new BigDecimal(0) : valorRetidoCsll;
	}

    public BigDecimal getBaseCalculoIrrf() {
		return this.baseCalculoIrrf;
	}

	public void setBaseCalculoIrrf(BigDecimal baseCalculoIrrf) {
		this.baseCalculoIrrf = baseCalculoIrrf == null ? new BigDecimal(0) : baseCalculoIrrf;
	}

    public BigDecimal getValorRetidoIrrf() {
		return this.valorRetidoIrrf;
	}

	public void setValorRetidoIrrf(BigDecimal valorRetidoIrrf) {
		this.valorRetidoIrrf = valorRetidoIrrf == null ? new BigDecimal(0) : valorRetidoIrrf;
	}

    public BigDecimal getBaseCalculoPrevidencia() {
		return this.baseCalculoPrevidencia;
	}

	public void setBaseCalculoPrevidencia(BigDecimal baseCalculoPrevidencia) {
		this.baseCalculoPrevidencia = baseCalculoPrevidencia == null ? new BigDecimal(0) : baseCalculoPrevidencia;
	}

    public BigDecimal getValorRetidoPrevidencia() {
		return this.valorRetidoPrevidencia;
	}

	public void setValorRetidoPrevidencia(BigDecimal valorRetidoPrevidencia) {
		this.valorRetidoPrevidencia = valorRetidoPrevidencia == null ? new BigDecimal(0) : valorRetidoPrevidencia;
	}

    public String getInformacoesAddFisco() {
		return this.informacoesAddFisco;
	}

	public void setInformacoesAddFisco(String informacoesAddFisco) {
		this.informacoesAddFisco = informacoesAddFisco;
	}

    public String getInformacoesAddContribuinte() {
		return this.informacoesAddContribuinte;
	}

	public void setInformacoesAddContribuinte(String informacoesAddContribuinte) {
		this.informacoesAddContribuinte = informacoesAddContribuinte;
	}

    public String getComexUfEmbarque() {
		return this.comexUfEmbarque;
	}

	public void setComexUfEmbarque(String comexUfEmbarque) {
		this.comexUfEmbarque = comexUfEmbarque;
	}

    public String getComexLocalEmbarque() {
		return this.comexLocalEmbarque;
	}

	public void setComexLocalEmbarque(String comexLocalEmbarque) {
		this.comexLocalEmbarque = comexLocalEmbarque;
	}

    public String getComexLocalDespacho() {
		return this.comexLocalDespacho;
	}

	public void setComexLocalDespacho(String comexLocalDespacho) {
		this.comexLocalDespacho = comexLocalDespacho;
	}

    public String getCompraNotaEmpenho() {
		return this.compraNotaEmpenho;
	}

	public void setCompraNotaEmpenho(String compraNotaEmpenho) {
		this.compraNotaEmpenho = compraNotaEmpenho;
	}

    public String getCompraPedido() {
		return this.compraPedido;
	}

	public void setCompraPedido(String compraPedido) {
		this.compraPedido = compraPedido;
	}

    public String getCompraContrato() {
		return this.compraContrato;
	}

	public void setCompraContrato(String compraContrato) {
		this.compraContrato = compraContrato;
	}

    public String getQrcode() {
		return this.qrcode;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}

    public String getUrlChave() {
		return this.urlChave;
	}

	public void setUrlChave(String urlChave) {
		this.urlChave = urlChave;
	}

    public String getStatusNota() {
		return this.statusNota;
	}

	public void setStatusNota(String statusNota) {
		this.statusNota = statusNota;
	}

    public NfeCana getNfeCana() {
		return this.nfeCana;
	}

	public void setNfeCana(NfeCana nfeCana) {
		this.nfeCana = nfeCana;
		if (nfeCana != null) {
			nfeCana.setNfeCabecalho(this);
		}
	}

    public NfeDestinatario getNfeDestinatario() {
		return this.nfeDestinatario;
	}

	public void setNfeDestinatario(NfeDestinatario nfeDestinatario) {
		this.nfeDestinatario = nfeDestinatario;
		if (nfeDestinatario != null) {
			nfeDestinatario.setNfeCabecalho(this);
		}
	}

    public NfeEmitente getNfeEmitente() {
		return this.nfeEmitente;
	}

	public void setNfeEmitente(NfeEmitente nfeEmitente) {
		this.nfeEmitente = nfeEmitente;
		if (nfeEmitente != null) {
			nfeEmitente.setNfeCabecalho(this);
		}
	}

    public NfeFatura getNfeFatura() {
		return this.nfeFatura;
	}

	public void setNfeFatura(NfeFatura nfeFatura) {
		this.nfeFatura = nfeFatura;
		if (nfeFatura != null) {
			nfeFatura.setNfeCabecalho(this);
		}
	}

    public NfeInformacaoPagamento getNfeInformacaoPagamento() {
		return this.nfeInformacaoPagamento;
	}

	public void setNfeInformacaoPagamento(NfeInformacaoPagamento nfeInformacaoPagamento) {
		this.nfeInformacaoPagamento = nfeInformacaoPagamento;
		if (nfeInformacaoPagamento != null) {
			nfeInformacaoPagamento.setNfeCabecalho(this);
		}
	}

    public NfeLocalEntrega getNfeLocalEntrega() {
		return this.nfeLocalEntrega;
	}

	public void setNfeLocalEntrega(NfeLocalEntrega nfeLocalEntrega) {
		this.nfeLocalEntrega = nfeLocalEntrega;
		if (nfeLocalEntrega != null) {
			nfeLocalEntrega.setNfeCabecalho(this);
		}
	}

    public NfeLocalRetirada getNfeLocalRetirada() {
		return this.nfeLocalRetirada;
	}

	public void setNfeLocalRetirada(NfeLocalRetirada nfeLocalRetirada) {
		this.nfeLocalRetirada = nfeLocalRetirada;
		if (nfeLocalRetirada != null) {
			nfeLocalRetirada.setNfeCabecalho(this);
		}
	}

    public NfeResponsavelTecnico getNfeResponsavelTecnico() {
		return this.nfeResponsavelTecnico;
	}

	public void setNfeResponsavelTecnico(NfeResponsavelTecnico nfeResponsavelTecnico) {
		this.nfeResponsavelTecnico = nfeResponsavelTecnico;
		if (nfeResponsavelTecnico != null) {
			nfeResponsavelTecnico.setNfeCabecalho(this);
		}
	}

    public NfeTransporte getNfeTransporte() {
		return this.nfeTransporte;
	}

	public void setNfeTransporte(NfeTransporte nfeTransporte) {
		this.nfeTransporte = nfeTransporte;
		if (nfeTransporte != null) {
			nfeTransporte.setNfeCabecalho(this);
		}
	}

    public Vendedor getVendedor() {
		return this.vendedor;
	}

	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}

    public Fornecedor getFornecedor() {
		return this.fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

    public Cliente getCliente() {
		return this.cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

    public TributOperacaoFiscal getTributOperacaoFiscal() {
		return this.tributOperacaoFiscal;
	}

	public void setTributOperacaoFiscal(TributOperacaoFiscal tributOperacaoFiscal) {
		this.tributOperacaoFiscal = tributOperacaoFiscal;
	}

    public VendaCabecalho getVendaCabecalho() {
		return this.vendaCabecalho;
	}

	public void setVendaCabecalho(VendaCabecalho vendaCabecalho) {
		this.vendaCabecalho = vendaCabecalho;
	}

    public Set<NfeAcessoXml> getListaNfeAcessoXml() {
		return this.listaNfeAcessoXml;
	}

	public void setListaNfeAcessoXml(Set<NfeAcessoXml> listaNfeAcessoXml) {
		this.listaNfeAcessoXml = listaNfeAcessoXml;
		for (NfeAcessoXml nfeAcessoXml : listaNfeAcessoXml) {
			nfeAcessoXml.setNfeCabecalho(this);
		}
	}

    public Set<NfeCteReferenciado> getListaNfeCteReferenciado() {
		return this.listaNfeCteReferenciado;
	}

	public void setListaNfeCteReferenciado(Set<NfeCteReferenciado> listaNfeCteReferenciado) {
		this.listaNfeCteReferenciado = listaNfeCteReferenciado;
		for (NfeCteReferenciado nfeCteReferenciado : listaNfeCteReferenciado) {
			nfeCteReferenciado.setNfeCabecalho(this);
		}
	}

    public Set<NfeCupomFiscalReferenciado> getListaNfeCupomFiscalReferenciado() {
		return this.listaNfeCupomFiscalReferenciado;
	}

	public void setListaNfeCupomFiscalReferenciado(Set<NfeCupomFiscalReferenciado> listaNfeCupomFiscalReferenciado) {
		this.listaNfeCupomFiscalReferenciado = listaNfeCupomFiscalReferenciado;
		for (NfeCupomFiscalReferenciado nfeCupomFiscalReferenciado : listaNfeCupomFiscalReferenciado) {
			nfeCupomFiscalReferenciado.setNfeCabecalho(this);
		}
	}

    public Set<NfeDetalhe> getListaNfeDetalhe() {
		return this.listaNfeDetalhe;
	}

	public void setListaNfeDetalhe(Set<NfeDetalhe> listaNfeDetalhe) {
		this.listaNfeDetalhe = listaNfeDetalhe;
		for (NfeDetalhe nfeDetalhe : listaNfeDetalhe) {
			nfeDetalhe.setNfeCabecalho(this);
		}
	}

    public Set<NfeNfReferenciada> getListaNfeNfReferenciada() {
		return this.listaNfeNfReferenciada;
	}

	public void setListaNfeNfReferenciada(Set<NfeNfReferenciada> listaNfeNfReferenciada) {
		this.listaNfeNfReferenciada = listaNfeNfReferenciada;
		for (NfeNfReferenciada nfeNfReferenciada : listaNfeNfReferenciada) {
			nfeNfReferenciada.setNfeCabecalho(this);
		}
	}

    public Set<NfeProcessoReferenciado> getListaNfeProcessoReferenciado() {
		return this.listaNfeProcessoReferenciado;
	}

	public void setListaNfeProcessoReferenciado(Set<NfeProcessoReferenciado> listaNfeProcessoReferenciado) {
		this.listaNfeProcessoReferenciado = listaNfeProcessoReferenciado;
		for (NfeProcessoReferenciado nfeProcessoReferenciado : listaNfeProcessoReferenciado) {
			nfeProcessoReferenciado.setNfeCabecalho(this);
		}
	}

    public Set<NfeProdRuralReferenciada> getListaNfeProdRuralReferenciada() {
		return this.listaNfeProdRuralReferenciada;
	}

	public void setListaNfeProdRuralReferenciada(Set<NfeProdRuralReferenciada> listaNfeProdRuralReferenciada) {
		this.listaNfeProdRuralReferenciada = listaNfeProdRuralReferenciada;
		for (NfeProdRuralReferenciada nfeProdRuralReferenciada : listaNfeProdRuralReferenciada) {
			nfeProdRuralReferenciada.setNfeCabecalho(this);
		}
	}

    public Set<NfeReferenciada> getListaNfeReferenciada() {
		return this.listaNfeReferenciada;
	}

	public void setListaNfeReferenciada(Set<NfeReferenciada> listaNfeReferenciada) {
		this.listaNfeReferenciada = listaNfeReferenciada;
		for (NfeReferenciada nfeReferenciada : listaNfeReferenciada) {
			nfeReferenciada.setNfeCabecalho(this);
		}
	}

    public Set<ViewSpedNfeDetalhe> getListaViewSpedNfeDetalhe() {
		return this.listaViewSpedNfeDetalhe;
	}

	public void setListaViewSpedNfeDetalhe(Set<ViewSpedNfeDetalhe> listaViewSpedNfeDetalhe) {
		this.listaViewSpedNfeDetalhe = listaViewSpedNfeDetalhe;
		for (ViewSpedNfeDetalhe viewSpedNfeDetalhe : listaViewSpedNfeDetalhe) {
			viewSpedNfeDetalhe.setNfeCabecalho(this);
		}
	}

		
}