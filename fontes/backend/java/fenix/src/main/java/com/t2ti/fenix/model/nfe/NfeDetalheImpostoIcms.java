/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS] 
                                                                                
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

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.math.BigDecimal;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="NFE_DETALHE_IMPOSTO_ICMS")
@NamedQuery(name="NfeDetalheImpostoIcms.findAll", query="SELECT t FROM NfeDetalheImpostoIcms t")
public class NfeDetalheImpostoIcms implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

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

    @Column(name="VALOR_ICMS_OPERACAO")
	private BigDecimal valorIcmsOperacao;

    @Column(name="PERCENTUAL_DIFERIMENTO")
	private BigDecimal percentualDiferimento;

    @Column(name="VALOR_ICMS_DIFERIDO")
	private BigDecimal valorIcmsDiferido;

    @Column(name="VALOR_ICMS")
	private BigDecimal valorIcms;

    @Column(name="BASE_CALCULO_FCP")
	private BigDecimal baseCalculoFcp;

    @Column(name="PERCENTUAL_FCP")
	private BigDecimal percentualFcp;

    @Column(name="VALOR_FCP")
	private BigDecimal valorFcp;

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

    @Column(name="BASE_CALCULO_FCP_ST")
	private BigDecimal baseCalculoFcpSt;

    @Column(name="PERCENTUAL_FCP_ST")
	private BigDecimal percentualFcpSt;

    @Column(name="VALOR_FCP_ST")
	private BigDecimal valorFcpSt;

    @Column(name="UF_ST")
	private String ufSt;

    @Column(name="PERCENTUAL_BC_OPERACAO_PROPRIA")
	private BigDecimal percentualBcOperacaoPropria;

    @Column(name="VALOR_BC_ICMS_ST_RETIDO")
	private BigDecimal valorBcIcmsStRetido;

    @Column(name="ALIQUOTA_SUPORTADA_CONSUMIDOR")
	private BigDecimal aliquotaSuportadaConsumidor;

    @Column(name="VALOR_ICMS_SUBSTITUTO")
	private BigDecimal valorIcmsSubstituto;

    @Column(name="VALOR_ICMS_ST_RETIDO")
	private BigDecimal valorIcmsStRetido;

    @Column(name="BASE_CALCULO_FCP_ST_RETIDO")
	private BigDecimal baseCalculoFcpStRetido;

    @Column(name="PERCENTUAL_FCP_ST_RETIDO")
	private BigDecimal percentualFcpStRetido;

    @Column(name="VALOR_FCP_ST_RETIDO")
	private BigDecimal valorFcpStRetido;

    @Column(name="MOTIVO_DESONERACAO_ICMS")
	private String motivoDesoneracaoIcms;

    @Column(name="VALOR_ICMS_DESONERADO")
	private BigDecimal valorIcmsDesonerado;

    @Column(name="ALIQUOTA_CREDITO_ICMS_SN")
	private BigDecimal aliquotaCreditoIcmsSn;

    @Column(name="VALOR_CREDITO_ICMS_SN")
	private BigDecimal valorCreditoIcmsSn;

    @Column(name="VALOR_BC_ICMS_ST_DESTINO")
	private BigDecimal valorBcIcmsStDestino;

    @Column(name="VALOR_ICMS_ST_DESTINO")
	private BigDecimal valorIcmsStDestino;

    @Column(name="PERCENTUAL_REDUCAO_BC_EFETIVO")
	private BigDecimal percentualReducaoBcEfetivo;

    @Column(name="VALOR_BC_EFETIVO")
	private BigDecimal valorBcEfetivo;

    @Column(name="ALIQUOTA_ICMS_EFETIVO")
	private BigDecimal aliquotaIcmsEfetivo;

    @Column(name="VALOR_ICMS_EFETIVO")
	private BigDecimal valorIcmsEfetivo;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DETALHE")
    private NfeDetalhe nfeDetalhe;

	public NfeDetalheImpostoIcms() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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
		this.percentualReducaoBcIcms = percentualReducaoBcIcms == null ? new BigDecimal(0) : percentualReducaoBcIcms;
	}

    public BigDecimal getValorBcIcms() {
		return this.valorBcIcms;
	}

	public void setValorBcIcms(BigDecimal valorBcIcms) {
		this.valorBcIcms = valorBcIcms == null ? new BigDecimal(0) : valorBcIcms;
	}

    public BigDecimal getAliquotaIcms() {
		return this.aliquotaIcms;
	}

	public void setAliquotaIcms(BigDecimal aliquotaIcms) {
		this.aliquotaIcms = aliquotaIcms == null ? new BigDecimal(0) : aliquotaIcms;
	}

    public BigDecimal getValorIcmsOperacao() {
		return this.valorIcmsOperacao;
	}

	public void setValorIcmsOperacao(BigDecimal valorIcmsOperacao) {
		this.valorIcmsOperacao = valorIcmsOperacao == null ? new BigDecimal(0) : valorIcmsOperacao;
	}

    public BigDecimal getPercentualDiferimento() {
		return this.percentualDiferimento;
	}

	public void setPercentualDiferimento(BigDecimal percentualDiferimento) {
		this.percentualDiferimento = percentualDiferimento == null ? new BigDecimal(0) : percentualDiferimento;
	}

    public BigDecimal getValorIcmsDiferido() {
		return this.valorIcmsDiferido;
	}

	public void setValorIcmsDiferido(BigDecimal valorIcmsDiferido) {
		this.valorIcmsDiferido = valorIcmsDiferido == null ? new BigDecimal(0) : valorIcmsDiferido;
	}

    public BigDecimal getValorIcms() {
		return this.valorIcms;
	}

	public void setValorIcms(BigDecimal valorIcms) {
		this.valorIcms = valorIcms == null ? new BigDecimal(0) : valorIcms;
	}

    public BigDecimal getBaseCalculoFcp() {
		return this.baseCalculoFcp;
	}

	public void setBaseCalculoFcp(BigDecimal baseCalculoFcp) {
		this.baseCalculoFcp = baseCalculoFcp == null ? new BigDecimal(0) : baseCalculoFcp;
	}

    public BigDecimal getPercentualFcp() {
		return this.percentualFcp;
	}

	public void setPercentualFcp(BigDecimal percentualFcp) {
		this.percentualFcp = percentualFcp == null ? new BigDecimal(0) : percentualFcp;
	}

    public BigDecimal getValorFcp() {
		return this.valorFcp;
	}

	public void setValorFcp(BigDecimal valorFcp) {
		this.valorFcp = valorFcp == null ? new BigDecimal(0) : valorFcp;
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
		this.percentualMvaIcmsSt = percentualMvaIcmsSt == null ? new BigDecimal(0) : percentualMvaIcmsSt;
	}

    public BigDecimal getPercentualReducaoBcIcmsSt() {
		return this.percentualReducaoBcIcmsSt;
	}

	public void setPercentualReducaoBcIcmsSt(BigDecimal percentualReducaoBcIcmsSt) {
		this.percentualReducaoBcIcmsSt = percentualReducaoBcIcmsSt == null ? new BigDecimal(0) : percentualReducaoBcIcmsSt;
	}

    public BigDecimal getValorBaseCalculoIcmsSt() {
		return this.valorBaseCalculoIcmsSt;
	}

	public void setValorBaseCalculoIcmsSt(BigDecimal valorBaseCalculoIcmsSt) {
		this.valorBaseCalculoIcmsSt = valorBaseCalculoIcmsSt == null ? new BigDecimal(0) : valorBaseCalculoIcmsSt;
	}

    public BigDecimal getAliquotaIcmsSt() {
		return this.aliquotaIcmsSt;
	}

	public void setAliquotaIcmsSt(BigDecimal aliquotaIcmsSt) {
		this.aliquotaIcmsSt = aliquotaIcmsSt == null ? new BigDecimal(0) : aliquotaIcmsSt;
	}

    public BigDecimal getValorIcmsSt() {
		return this.valorIcmsSt;
	}

	public void setValorIcmsSt(BigDecimal valorIcmsSt) {
		this.valorIcmsSt = valorIcmsSt == null ? new BigDecimal(0) : valorIcmsSt;
	}

    public BigDecimal getBaseCalculoFcpSt() {
		return this.baseCalculoFcpSt;
	}

	public void setBaseCalculoFcpSt(BigDecimal baseCalculoFcpSt) {
		this.baseCalculoFcpSt = baseCalculoFcpSt == null ? new BigDecimal(0) : baseCalculoFcpSt;
	}

    public BigDecimal getPercentualFcpSt() {
		return this.percentualFcpSt;
	}

	public void setPercentualFcpSt(BigDecimal percentualFcpSt) {
		this.percentualFcpSt = percentualFcpSt == null ? new BigDecimal(0) : percentualFcpSt;
	}

    public BigDecimal getValorFcpSt() {
		return this.valorFcpSt;
	}

	public void setValorFcpSt(BigDecimal valorFcpSt) {
		this.valorFcpSt = valorFcpSt == null ? new BigDecimal(0) : valorFcpSt;
	}

    public String getUfSt() {
		return this.ufSt;
	}

	public void setUfSt(String ufSt) {
		this.ufSt = ufSt;
	}

    public BigDecimal getPercentualBcOperacaoPropria() {
		return this.percentualBcOperacaoPropria;
	}

	public void setPercentualBcOperacaoPropria(BigDecimal percentualBcOperacaoPropria) {
		this.percentualBcOperacaoPropria = percentualBcOperacaoPropria == null ? new BigDecimal(0) : percentualBcOperacaoPropria;
	}

    public BigDecimal getValorBcIcmsStRetido() {
		return this.valorBcIcmsStRetido;
	}

	public void setValorBcIcmsStRetido(BigDecimal valorBcIcmsStRetido) {
		this.valorBcIcmsStRetido = valorBcIcmsStRetido == null ? new BigDecimal(0) : valorBcIcmsStRetido;
	}

    public BigDecimal getAliquotaSuportadaConsumidor() {
		return this.aliquotaSuportadaConsumidor;
	}

	public void setAliquotaSuportadaConsumidor(BigDecimal aliquotaSuportadaConsumidor) {
		this.aliquotaSuportadaConsumidor = aliquotaSuportadaConsumidor == null ? new BigDecimal(0) : aliquotaSuportadaConsumidor;
	}

    public BigDecimal getValorIcmsSubstituto() {
		return this.valorIcmsSubstituto;
	}

	public void setValorIcmsSubstituto(BigDecimal valorIcmsSubstituto) {
		this.valorIcmsSubstituto = valorIcmsSubstituto == null ? new BigDecimal(0) : valorIcmsSubstituto;
	}

    public BigDecimal getValorIcmsStRetido() {
		return this.valorIcmsStRetido;
	}

	public void setValorIcmsStRetido(BigDecimal valorIcmsStRetido) {
		this.valorIcmsStRetido = valorIcmsStRetido == null ? new BigDecimal(0) : valorIcmsStRetido;
	}

    public BigDecimal getBaseCalculoFcpStRetido() {
		return this.baseCalculoFcpStRetido;
	}

	public void setBaseCalculoFcpStRetido(BigDecimal baseCalculoFcpStRetido) {
		this.baseCalculoFcpStRetido = baseCalculoFcpStRetido == null ? new BigDecimal(0) : baseCalculoFcpStRetido;
	}

    public BigDecimal getPercentualFcpStRetido() {
		return this.percentualFcpStRetido;
	}

	public void setPercentualFcpStRetido(BigDecimal percentualFcpStRetido) {
		this.percentualFcpStRetido = percentualFcpStRetido == null ? new BigDecimal(0) : percentualFcpStRetido;
	}

    public BigDecimal getValorFcpStRetido() {
		return this.valorFcpStRetido;
	}

	public void setValorFcpStRetido(BigDecimal valorFcpStRetido) {
		this.valorFcpStRetido = valorFcpStRetido == null ? new BigDecimal(0) : valorFcpStRetido;
	}

    public String getMotivoDesoneracaoIcms() {
		return this.motivoDesoneracaoIcms;
	}

	public void setMotivoDesoneracaoIcms(String motivoDesoneracaoIcms) {
		this.motivoDesoneracaoIcms = motivoDesoneracaoIcms;
	}

    public BigDecimal getValorIcmsDesonerado() {
		return this.valorIcmsDesonerado;
	}

	public void setValorIcmsDesonerado(BigDecimal valorIcmsDesonerado) {
		this.valorIcmsDesonerado = valorIcmsDesonerado == null ? new BigDecimal(0) : valorIcmsDesonerado;
	}

    public BigDecimal getAliquotaCreditoIcmsSn() {
		return this.aliquotaCreditoIcmsSn;
	}

	public void setAliquotaCreditoIcmsSn(BigDecimal aliquotaCreditoIcmsSn) {
		this.aliquotaCreditoIcmsSn = aliquotaCreditoIcmsSn == null ? new BigDecimal(0) : aliquotaCreditoIcmsSn;
	}

    public BigDecimal getValorCreditoIcmsSn() {
		return this.valorCreditoIcmsSn;
	}

	public void setValorCreditoIcmsSn(BigDecimal valorCreditoIcmsSn) {
		this.valorCreditoIcmsSn = valorCreditoIcmsSn == null ? new BigDecimal(0) : valorCreditoIcmsSn;
	}

    public BigDecimal getValorBcIcmsStDestino() {
		return this.valorBcIcmsStDestino;
	}

	public void setValorBcIcmsStDestino(BigDecimal valorBcIcmsStDestino) {
		this.valorBcIcmsStDestino = valorBcIcmsStDestino == null ? new BigDecimal(0) : valorBcIcmsStDestino;
	}

    public BigDecimal getValorIcmsStDestino() {
		return this.valorIcmsStDestino;
	}

	public void setValorIcmsStDestino(BigDecimal valorIcmsStDestino) {
		this.valorIcmsStDestino = valorIcmsStDestino == null ? new BigDecimal(0) : valorIcmsStDestino;
	}

    public BigDecimal getPercentualReducaoBcEfetivo() {
		return this.percentualReducaoBcEfetivo;
	}

	public void setPercentualReducaoBcEfetivo(BigDecimal percentualReducaoBcEfetivo) {
		this.percentualReducaoBcEfetivo = percentualReducaoBcEfetivo == null ? new BigDecimal(0) : percentualReducaoBcEfetivo;
	}

    public BigDecimal getValorBcEfetivo() {
		return this.valorBcEfetivo;
	}

	public void setValorBcEfetivo(BigDecimal valorBcEfetivo) {
		this.valorBcEfetivo = valorBcEfetivo == null ? new BigDecimal(0) : valorBcEfetivo;
	}

    public BigDecimal getAliquotaIcmsEfetivo() {
		return this.aliquotaIcmsEfetivo;
	}

	public void setAliquotaIcmsEfetivo(BigDecimal aliquotaIcmsEfetivo) {
		this.aliquotaIcmsEfetivo = aliquotaIcmsEfetivo == null ? new BigDecimal(0) : aliquotaIcmsEfetivo;
	}

    public BigDecimal getValorIcmsEfetivo() {
		return this.valorIcmsEfetivo;
	}

	public void setValorIcmsEfetivo(BigDecimal valorIcmsEfetivo) {
		this.valorIcmsEfetivo = valorIcmsEfetivo == null ? new BigDecimal(0) : valorIcmsEfetivo;
	}

    public NfeDetalhe getNfeDetalhe() {
		return this.nfeDetalhe;
	}

	public void setNfeDetalhe(NfeDetalhe nfeDetalhe) {
		this.nfeDetalhe = nfeDetalhe;
	}

		
}