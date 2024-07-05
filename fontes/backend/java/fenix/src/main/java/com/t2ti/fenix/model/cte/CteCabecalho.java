/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_CABECALHO] 
                                                                                
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
package com.t2ti.fenix.model.cte;

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
import javax.persistence.OneToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@Table(name="CTE_CABECALHO")
@NamedQuery(name="CteCabecalho.findAll", query="SELECT t FROM CteCabecalho t")
public class CteCabecalho implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="UF_EMITENTE")
	private Integer ufEmitente;

    @Column(name="CODIGO_NUMERICO")
	private String codigoNumerico;

    @Column(name="CFOP")
	private Integer cfop;

    @Column(name="NATUREZA_OPERACAO")
	private String naturezaOperacao;

    @Column(name="FORMA_PAGAMENTO")
	private String formaPagamento;

    @Column(name="MODELO")
	private String modelo;

    @Column(name="SERIE")
	private String serie;

    @Column(name="NUMERO")
	private String numero;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_HORA_EMISSAO")
	private Date dataHoraEmissao;

    @Column(name="FORMATO_IMPRESSAO_DACTE")
	private String formatoImpressaoDacte;

    @Column(name="TIPO_EMISSAO")
	private String tipoEmissao;

    @Column(name="CHAVE_ACESSO")
	private String chaveAcesso;

    @Column(name="DIGITO_CHAVE_ACESSO")
	private String digitoChaveAcesso;

    @Column(name="AMBIENTE")
	private String ambiente;

    @Column(name="TIPO_CTE")
	private String tipoCte;

    @Column(name="PROCESSO_EMISSAO")
	private String processoEmissao;

    @Column(name="VERSAO_PROCESSO_EMISSAO")
	private String versaoProcessoEmissao;

    @Column(name="CHAVE_REFERENCIADO")
	private String chaveReferenciado;

    @Column(name="CODIGO_MUNICIPIO_ENVIO")
	private Integer codigoMunicipioEnvio;

    @Column(name="NOME_MUNICIPIO_ENVIO")
	private String nomeMunicipioEnvio;

    @Column(name="UF_ENVIO")
	private String ufEnvio;

    @Column(name="MODAL")
	private String modal;

    @Column(name="TIPO_SERVICO")
	private String tipoServico;

    @Column(name="CODIGO_MUNICIPIO_INI_PRESTACAO")
	private Integer codigoMunicipioIniPrestacao;

    @Column(name="NOME_MUNICIPIO_INI_PRESTACAO")
	private String nomeMunicipioIniPrestacao;

    @Column(name="UF_INI_PRESTACAO")
	private String ufIniPrestacao;

    @Column(name="CODIGO_MUNICIPIO_FIM_PRESTACAO")
	private Integer codigoMunicipioFimPrestacao;

    @Column(name="NOME_MUNICIPIO_FIM_PRESTACAO")
	private String nomeMunicipioFimPrestacao;

    @Column(name="UF_FIM_PRESTACAO")
	private String ufFimPrestacao;

    @Column(name="RETIRA")
	private String retira;

    @Column(name="RETIRA_DETALHE")
	private String retiraDetalhe;

    @Column(name="TOMADOR")
	private String tomador;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_ENTRADA_CONTINGENCIA")
	private Date dataEntradaContingencia;

    @Column(name="JUSTIFICATIVA_CONTINGENCIA")
	private String justificativaContingencia;

    @Column(name="CARAC_ADICIONAL_TRANSPORTE")
	private String caracAdicionalTransporte;

    @Column(name="CARAC_ADICIONAL_SERVICO")
	private String caracAdicionalServico;

    @Column(name="FUNCIONARIO_EMISSOR")
	private String funcionarioEmissor;

    @Column(name="FLUXO_ORIGEM")
	private String fluxoOrigem;

    @Column(name="ENTREGA_TIPO_PERIODO")
	private String entregaTipoPeriodo;

    @Temporal(TemporalType.DATE)
	@Column(name="ENTREGA_DATA_PROGRAMADA")
	private Date entregaDataProgramada;

    @Temporal(TemporalType.DATE)
	@Column(name="ENTREGA_DATA_INICIAL")
	private Date entregaDataInicial;

    @Temporal(TemporalType.DATE)
	@Column(name="ENTREGA_DATA_FINAL")
	private Date entregaDataFinal;

    @Column(name="ENTREGA_TIPO_HORA")
	private String entregaTipoHora;

    @Column(name="ENTREGA_HORA_PROGRAMADA")
	private String entregaHoraProgramada;

    @Column(name="ENTREGA_HORA_INICIAL")
	private String entregaHoraInicial;

    @Column(name="ENTREGA_HORA_FINAL")
	private String entregaHoraFinal;

    @Column(name="MUNICIPIO_ORIGEM_CALCULO")
	private String municipioOrigemCalculo;

    @Column(name="MUNICIPIO_DESTINO_CALCULO")
	private String municipioDestinoCalculo;

    @Column(name="OBSERVACOES_GERAIS")
	private String observacoesGerais;

    @Column(name="VALOR_TOTAL_SERVICO")
	private BigDecimal valorTotalServico;

    @Column(name="VALOR_RECEBER")
	private BigDecimal valorReceber;

    @Column(name="CST")
	private String cst;

    @Column(name="BASE_CALCULO_ICMS")
	private BigDecimal baseCalculoIcms;

    @Column(name="ALIQUOTA_ICMS")
	private BigDecimal aliquotaIcms;

    @Column(name="VALOR_ICMS")
	private BigDecimal valorIcms;

    @Column(name="PERCENTUAL_REDUCAO_BC_ICMS")
	private BigDecimal percentualReducaoBcIcms;

    @Column(name="VALOR_BC_ICMS_ST_RETIDO")
	private BigDecimal valorBcIcmsStRetido;

    @Column(name="VALOR_ICMS_ST_RETIDO")
	private BigDecimal valorIcmsStRetido;

    @Column(name="ALIQUOTA_ICMS_ST_RETIDO")
	private BigDecimal aliquotaIcmsStRetido;

    @Column(name="VALOR_CREDITO_PRESUMIDO_ICMS")
	private BigDecimal valorCreditoPresumidoIcms;

    @Column(name="PERCENTUAL_BC_ICMS_OUTRA_UF")
	private BigDecimal percentualBcIcmsOutraUf;

    @Column(name="VALOR_BC_ICMS_OUTRA_UF")
	private BigDecimal valorBcIcmsOutraUf;

    @Column(name="ALIQUOTA_ICMS_OUTRA_UF")
	private BigDecimal aliquotaIcmsOutraUf;

    @Column(name="VALOR_ICMS_OUTRA_UF")
	private BigDecimal valorIcmsOutraUf;

    @Column(name="SIMPLES_NACIONAL_INDICADOR")
	private String simplesNacionalIndicador;

    @Column(name="SIMPLES_NACIONAL_TOTAL")
	private BigDecimal simplesNacionalTotal;

    @Column(name="INFORMACOES_ADD_FISCO")
	private String informacoesAddFisco;

    @Column(name="VALOR_TOTAL_CARGA")
	private BigDecimal valorTotalCarga;

    @Column(name="PRODUTO_PREDOMINANTE")
	private String produtoPredominante;

    @Column(name="CARGA_OUTRAS_CARACTERISTICAS")
	private String cargaOutrasCaracteristicas;

    @Column(name="MODAL_VERSAO_LAYOUT")
	private Integer modalVersaoLayout;

    @Column(name="CHAVE_CTE_SUBSTITUIDO")
	private String chaveCteSubstituido;

    @OneToOne(mappedBy = "cteCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private CteDestinatario cteDestinatario;

    @OneToOne(mappedBy = "cteCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private CteLocalEntrega cteLocalEntrega;

    @OneToOne(mappedBy = "cteCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private CteRemetente cteRemetente;

    @OneToOne(mappedBy = "cteCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private CteRodoviario cteRodoviario;

    @OneToOne(mappedBy = "cteCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private CteTomador cteTomador;

    @OneToMany(mappedBy = "cteCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CteCarga> listaCteCarga;

	public CteCabecalho() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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

    public Integer getCfop() {
		return this.cfop;
	}

	public void setCfop(Integer cfop) {
		this.cfop = cfop;
	}

    public String getNaturezaOperacao() {
		return this.naturezaOperacao;
	}

	public void setNaturezaOperacao(String naturezaOperacao) {
		this.naturezaOperacao = naturezaOperacao;
	}

    public String getFormaPagamento() {
		return this.formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

    public String getModelo() {
		return this.modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
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

    public String getFormatoImpressaoDacte() {
		return this.formatoImpressaoDacte;
	}

	public void setFormatoImpressaoDacte(String formatoImpressaoDacte) {
		this.formatoImpressaoDacte = formatoImpressaoDacte;
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

    public String getTipoCte() {
		return this.tipoCte;
	}

	public void setTipoCte(String tipoCte) {
		this.tipoCte = tipoCte;
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

    public String getChaveReferenciado() {
		return this.chaveReferenciado;
	}

	public void setChaveReferenciado(String chaveReferenciado) {
		this.chaveReferenciado = chaveReferenciado;
	}

    public Integer getCodigoMunicipioEnvio() {
		return this.codigoMunicipioEnvio;
	}

	public void setCodigoMunicipioEnvio(Integer codigoMunicipioEnvio) {
		this.codigoMunicipioEnvio = codigoMunicipioEnvio;
	}

    public String getNomeMunicipioEnvio() {
		return this.nomeMunicipioEnvio;
	}

	public void setNomeMunicipioEnvio(String nomeMunicipioEnvio) {
		this.nomeMunicipioEnvio = nomeMunicipioEnvio;
	}

    public String getUfEnvio() {
		return this.ufEnvio;
	}

	public void setUfEnvio(String ufEnvio) {
		this.ufEnvio = ufEnvio;
	}

    public String getModal() {
		return this.modal;
	}

	public void setModal(String modal) {
		this.modal = modal;
	}

    public String getTipoServico() {
		return this.tipoServico;
	}

	public void setTipoServico(String tipoServico) {
		this.tipoServico = tipoServico;
	}

    public Integer getCodigoMunicipioIniPrestacao() {
		return this.codigoMunicipioIniPrestacao;
	}

	public void setCodigoMunicipioIniPrestacao(Integer codigoMunicipioIniPrestacao) {
		this.codigoMunicipioIniPrestacao = codigoMunicipioIniPrestacao;
	}

    public String getNomeMunicipioIniPrestacao() {
		return this.nomeMunicipioIniPrestacao;
	}

	public void setNomeMunicipioIniPrestacao(String nomeMunicipioIniPrestacao) {
		this.nomeMunicipioIniPrestacao = nomeMunicipioIniPrestacao;
	}

    public String getUfIniPrestacao() {
		return this.ufIniPrestacao;
	}

	public void setUfIniPrestacao(String ufIniPrestacao) {
		this.ufIniPrestacao = ufIniPrestacao;
	}

    public Integer getCodigoMunicipioFimPrestacao() {
		return this.codigoMunicipioFimPrestacao;
	}

	public void setCodigoMunicipioFimPrestacao(Integer codigoMunicipioFimPrestacao) {
		this.codigoMunicipioFimPrestacao = codigoMunicipioFimPrestacao;
	}

    public String getNomeMunicipioFimPrestacao() {
		return this.nomeMunicipioFimPrestacao;
	}

	public void setNomeMunicipioFimPrestacao(String nomeMunicipioFimPrestacao) {
		this.nomeMunicipioFimPrestacao = nomeMunicipioFimPrestacao;
	}

    public String getUfFimPrestacao() {
		return this.ufFimPrestacao;
	}

	public void setUfFimPrestacao(String ufFimPrestacao) {
		this.ufFimPrestacao = ufFimPrestacao;
	}

    public String getRetira() {
		return this.retira;
	}

	public void setRetira(String retira) {
		this.retira = retira;
	}

    public String getRetiraDetalhe() {
		return this.retiraDetalhe;
	}

	public void setRetiraDetalhe(String retiraDetalhe) {
		this.retiraDetalhe = retiraDetalhe;
	}

    public String getTomador() {
		return this.tomador;
	}

	public void setTomador(String tomador) {
		this.tomador = tomador;
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

    public String getCaracAdicionalTransporte() {
		return this.caracAdicionalTransporte;
	}

	public void setCaracAdicionalTransporte(String caracAdicionalTransporte) {
		this.caracAdicionalTransporte = caracAdicionalTransporte;
	}

    public String getCaracAdicionalServico() {
		return this.caracAdicionalServico;
	}

	public void setCaracAdicionalServico(String caracAdicionalServico) {
		this.caracAdicionalServico = caracAdicionalServico;
	}

    public String getFuncionarioEmissor() {
		return this.funcionarioEmissor;
	}

	public void setFuncionarioEmissor(String funcionarioEmissor) {
		this.funcionarioEmissor = funcionarioEmissor;
	}

    public String getFluxoOrigem() {
		return this.fluxoOrigem;
	}

	public void setFluxoOrigem(String fluxoOrigem) {
		this.fluxoOrigem = fluxoOrigem;
	}

    public String getEntregaTipoPeriodo() {
		return this.entregaTipoPeriodo;
	}

	public void setEntregaTipoPeriodo(String entregaTipoPeriodo) {
		this.entregaTipoPeriodo = entregaTipoPeriodo;
	}

    public Date getEntregaDataProgramada() {
		return this.entregaDataProgramada;
	}

	public void setEntregaDataProgramada(Date entregaDataProgramada) {
		this.entregaDataProgramada = entregaDataProgramada;
	}

    public Date getEntregaDataInicial() {
		return this.entregaDataInicial;
	}

	public void setEntregaDataInicial(Date entregaDataInicial) {
		this.entregaDataInicial = entregaDataInicial;
	}

    public Date getEntregaDataFinal() {
		return this.entregaDataFinal;
	}

	public void setEntregaDataFinal(Date entregaDataFinal) {
		this.entregaDataFinal = entregaDataFinal;
	}

    public String getEntregaTipoHora() {
		return this.entregaTipoHora;
	}

	public void setEntregaTipoHora(String entregaTipoHora) {
		this.entregaTipoHora = entregaTipoHora;
	}

    public String getEntregaHoraProgramada() {
		return this.entregaHoraProgramada;
	}

	public void setEntregaHoraProgramada(String entregaHoraProgramada) {
		this.entregaHoraProgramada = entregaHoraProgramada;
	}

    public String getEntregaHoraInicial() {
		return this.entregaHoraInicial;
	}

	public void setEntregaHoraInicial(String entregaHoraInicial) {
		this.entregaHoraInicial = entregaHoraInicial;
	}

    public String getEntregaHoraFinal() {
		return this.entregaHoraFinal;
	}

	public void setEntregaHoraFinal(String entregaHoraFinal) {
		this.entregaHoraFinal = entregaHoraFinal;
	}

    public String getMunicipioOrigemCalculo() {
		return this.municipioOrigemCalculo;
	}

	public void setMunicipioOrigemCalculo(String municipioOrigemCalculo) {
		this.municipioOrigemCalculo = municipioOrigemCalculo;
	}

    public String getMunicipioDestinoCalculo() {
		return this.municipioDestinoCalculo;
	}

	public void setMunicipioDestinoCalculo(String municipioDestinoCalculo) {
		this.municipioDestinoCalculo = municipioDestinoCalculo;
	}

    public String getObservacoesGerais() {
		return this.observacoesGerais;
	}

	public void setObservacoesGerais(String observacoesGerais) {
		this.observacoesGerais = observacoesGerais;
	}

    public BigDecimal getValorTotalServico() {
		return this.valorTotalServico;
	}

	public void setValorTotalServico(BigDecimal valorTotalServico) {
		this.valorTotalServico = valorTotalServico;
	}

    public BigDecimal getValorReceber() {
		return this.valorReceber;
	}

	public void setValorReceber(BigDecimal valorReceber) {
		this.valorReceber = valorReceber;
	}

    public String getCst() {
		return this.cst;
	}

	public void setCst(String cst) {
		this.cst = cst;
	}

    public BigDecimal getBaseCalculoIcms() {
		return this.baseCalculoIcms;
	}

	public void setBaseCalculoIcms(BigDecimal baseCalculoIcms) {
		this.baseCalculoIcms = baseCalculoIcms;
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

    public BigDecimal getPercentualReducaoBcIcms() {
		return this.percentualReducaoBcIcms;
	}

	public void setPercentualReducaoBcIcms(BigDecimal percentualReducaoBcIcms) {
		this.percentualReducaoBcIcms = percentualReducaoBcIcms;
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

    public BigDecimal getAliquotaIcmsStRetido() {
		return this.aliquotaIcmsStRetido;
	}

	public void setAliquotaIcmsStRetido(BigDecimal aliquotaIcmsStRetido) {
		this.aliquotaIcmsStRetido = aliquotaIcmsStRetido;
	}

    public BigDecimal getValorCreditoPresumidoIcms() {
		return this.valorCreditoPresumidoIcms;
	}

	public void setValorCreditoPresumidoIcms(BigDecimal valorCreditoPresumidoIcms) {
		this.valorCreditoPresumidoIcms = valorCreditoPresumidoIcms;
	}

    public BigDecimal getPercentualBcIcmsOutraUf() {
		return this.percentualBcIcmsOutraUf;
	}

	public void setPercentualBcIcmsOutraUf(BigDecimal percentualBcIcmsOutraUf) {
		this.percentualBcIcmsOutraUf = percentualBcIcmsOutraUf;
	}

    public BigDecimal getValorBcIcmsOutraUf() {
		return this.valorBcIcmsOutraUf;
	}

	public void setValorBcIcmsOutraUf(BigDecimal valorBcIcmsOutraUf) {
		this.valorBcIcmsOutraUf = valorBcIcmsOutraUf;
	}

    public BigDecimal getAliquotaIcmsOutraUf() {
		return this.aliquotaIcmsOutraUf;
	}

	public void setAliquotaIcmsOutraUf(BigDecimal aliquotaIcmsOutraUf) {
		this.aliquotaIcmsOutraUf = aliquotaIcmsOutraUf;
	}

    public BigDecimal getValorIcmsOutraUf() {
		return this.valorIcmsOutraUf;
	}

	public void setValorIcmsOutraUf(BigDecimal valorIcmsOutraUf) {
		this.valorIcmsOutraUf = valorIcmsOutraUf;
	}

    public String getSimplesNacionalIndicador() {
		return this.simplesNacionalIndicador;
	}

	public void setSimplesNacionalIndicador(String simplesNacionalIndicador) {
		this.simplesNacionalIndicador = simplesNacionalIndicador;
	}

    public BigDecimal getSimplesNacionalTotal() {
		return this.simplesNacionalTotal;
	}

	public void setSimplesNacionalTotal(BigDecimal simplesNacionalTotal) {
		this.simplesNacionalTotal = simplesNacionalTotal;
	}

    public String getInformacoesAddFisco() {
		return this.informacoesAddFisco;
	}

	public void setInformacoesAddFisco(String informacoesAddFisco) {
		this.informacoesAddFisco = informacoesAddFisco;
	}

    public BigDecimal getValorTotalCarga() {
		return this.valorTotalCarga;
	}

	public void setValorTotalCarga(BigDecimal valorTotalCarga) {
		this.valorTotalCarga = valorTotalCarga;
	}

    public String getProdutoPredominante() {
		return this.produtoPredominante;
	}

	public void setProdutoPredominante(String produtoPredominante) {
		this.produtoPredominante = produtoPredominante;
	}

    public String getCargaOutrasCaracteristicas() {
		return this.cargaOutrasCaracteristicas;
	}

	public void setCargaOutrasCaracteristicas(String cargaOutrasCaracteristicas) {
		this.cargaOutrasCaracteristicas = cargaOutrasCaracteristicas;
	}

    public Integer getModalVersaoLayout() {
		return this.modalVersaoLayout;
	}

	public void setModalVersaoLayout(Integer modalVersaoLayout) {
		this.modalVersaoLayout = modalVersaoLayout;
	}

    public String getChaveCteSubstituido() {
		return this.chaveCteSubstituido;
	}

	public void setChaveCteSubstituido(String chaveCteSubstituido) {
		this.chaveCteSubstituido = chaveCteSubstituido;
	}

    public CteDestinatario getCteDestinatario() {
		return this.cteDestinatario;
	}

	public void setCteDestinatario(CteDestinatario cteDestinatario) {
		this.cteDestinatario = cteDestinatario;
		if (cteDestinatario != null) {
			cteDestinatario.setCteCabecalho(this);
		}
	}

    public CteLocalEntrega getCteLocalEntrega() {
		return this.cteLocalEntrega;
	}

	public void setCteLocalEntrega(CteLocalEntrega cteLocalEntrega) {
		this.cteLocalEntrega = cteLocalEntrega;
		if (cteLocalEntrega != null) {
			cteLocalEntrega.setCteCabecalho(this);
		}
	}

    public CteRemetente getCteRemetente() {
		return this.cteRemetente;
	}

	public void setCteRemetente(CteRemetente cteRemetente) {
		this.cteRemetente = cteRemetente;
		if (cteRemetente != null) {
			cteRemetente.setCteCabecalho(this);
		}
	}

    public CteRodoviario getCteRodoviario() {
		return this.cteRodoviario;
	}

	public void setCteRodoviario(CteRodoviario cteRodoviario) {
		this.cteRodoviario = cteRodoviario;
		if (cteRodoviario != null) {
			cteRodoviario.setCteCabecalho(this);
		}
	}

    public CteTomador getCteTomador() {
		return this.cteTomador;
	}

	public void setCteTomador(CteTomador cteTomador) {
		this.cteTomador = cteTomador;
		if (cteTomador != null) {
			cteTomador.setCteCabecalho(this);
		}
	}

    public Set<CteCarga> getListaCteCarga() {
		return this.listaCteCarga;
	}

	public void setListaCteCarga(Set<CteCarga> listaCteCarga) {
		this.listaCteCarga = listaCteCarga;
		for (CteCarga cteCarga : listaCteCarga) {
			cteCarga.setCteCabecalho(this);
		}
	}

		
}