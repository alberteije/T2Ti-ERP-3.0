/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FISCAL_NOTA_FISCAL_ENTRADA] 
                                                                                
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
package com.t2ti.fenix.model.fiscal;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.t2ti.fenix.model.nfe.NfeCabecalho;

@Entity
@Table(name="FISCAL_NOTA_FISCAL_ENTRADA")
@NamedQuery(name="FiscalNotaFiscalEntrada.findAll", query="SELECT t FROM FiscalNotaFiscalEntrada t")
public class FiscalNotaFiscalEntrada implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="COMPETENCIA")
	private String competencia;

    @Column(name="CFOP_ENTRADA")
	private Integer cfopEntrada;

    @Column(name="VALOR_RATEIO_FRETE")
	private BigDecimal valorRateioFrete;

    @Column(name="VALOR_CUSTO_MEDIO")
	private BigDecimal valorCustoMedio;

    @Column(name="VALOR_ICMS_ANTECIPADO")
	private BigDecimal valorIcmsAntecipado;

    @Column(name="VALOR_BC_ICMS_ANTECIPADO")
	private BigDecimal valorBcIcmsAntecipado;

    @Column(name="VALOR_BC_ICMS_CREDITADO")
	private BigDecimal valorBcIcmsCreditado;

    @Column(name="VALOR_BC_PIS_CREDITADO")
	private BigDecimal valorBcPisCreditado;

    @Column(name="VALOR_BC_COFINS_CREDITADO")
	private BigDecimal valorBcCofinsCreditado;

    @Column(name="VALOR_BC_IPI_CREDITADO")
	private BigDecimal valorBcIpiCreditado;

    @Column(name="CST_CREDITO_ICMS")
	private String cstCreditoIcms;

    @Column(name="CST_CREDITO_PIS")
	private String cstCreditoPis;

    @Column(name="CST_CREDITO_COFINS")
	private String cstCreditoCofins;

    @Column(name="CST_CREDITO_IPI")
	private String cstCreditoIpi;

    @Column(name="VALOR_ICMS_CREDITADO")
	private BigDecimal valorIcmsCreditado;

    @Column(name="VALOR_PIS_CREDITADO")
	private BigDecimal valorPisCreditado;

    @Column(name="VALOR_COFINS_CREDITADO")
	private BigDecimal valorCofinsCreditado;

    @Column(name="VALOR_IPI_CREDITADO")
	private BigDecimal valorIpiCreditado;

    @Column(name="QTDE_PARCELA_CREDITO_PIS")
	private Integer qtdeParcelaCreditoPis;

    @Column(name="QTDE_PARCELA_CREDITO_COFINS")
	private Integer qtdeParcelaCreditoCofins;

    @Column(name="QTDE_PARCELA_CREDITO_ICMS")
	private Integer qtdeParcelaCreditoIcms;

    @Column(name="QTDE_PARCELA_CREDITO_IPI")
	private Integer qtdeParcelaCreditoIpi;

    @Column(name="ALIQUOTA_CREDITO_ICMS")
	private BigDecimal aliquotaCreditoIcms;

    @Column(name="ALIQUOTA_CREDITO_PIS")
	private BigDecimal aliquotaCreditoPis;

    @Column(name="ALIQUOTA_CREDITO_COFINS")
	private BigDecimal aliquotaCreditoCofins;

    @Column(name="ALIQUOTA_CREDITO_IPI")
	private BigDecimal aliquotaCreditoIpi;

    @ManyToOne
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

	public FiscalNotaFiscalEntrada() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCompetencia() {
		return this.competencia;
	}

	public void setCompetencia(String competencia) {
		this.competencia = competencia;
	}

    public Integer getCfopEntrada() {
		return this.cfopEntrada;
	}

	public void setCfopEntrada(Integer cfopEntrada) {
		this.cfopEntrada = cfopEntrada;
	}

    public BigDecimal getValorRateioFrete() {
		return this.valorRateioFrete;
	}

	public void setValorRateioFrete(BigDecimal valorRateioFrete) {
		this.valorRateioFrete = valorRateioFrete;
	}

    public BigDecimal getValorCustoMedio() {
		return this.valorCustoMedio;
	}

	public void setValorCustoMedio(BigDecimal valorCustoMedio) {
		this.valorCustoMedio = valorCustoMedio;
	}

    public BigDecimal getValorIcmsAntecipado() {
		return this.valorIcmsAntecipado;
	}

	public void setValorIcmsAntecipado(BigDecimal valorIcmsAntecipado) {
		this.valorIcmsAntecipado = valorIcmsAntecipado;
	}

    public BigDecimal getValorBcIcmsAntecipado() {
		return this.valorBcIcmsAntecipado;
	}

	public void setValorBcIcmsAntecipado(BigDecimal valorBcIcmsAntecipado) {
		this.valorBcIcmsAntecipado = valorBcIcmsAntecipado;
	}

    public BigDecimal getValorBcIcmsCreditado() {
		return this.valorBcIcmsCreditado;
	}

	public void setValorBcIcmsCreditado(BigDecimal valorBcIcmsCreditado) {
		this.valorBcIcmsCreditado = valorBcIcmsCreditado;
	}

    public BigDecimal getValorBcPisCreditado() {
		return this.valorBcPisCreditado;
	}

	public void setValorBcPisCreditado(BigDecimal valorBcPisCreditado) {
		this.valorBcPisCreditado = valorBcPisCreditado;
	}

    public BigDecimal getValorBcCofinsCreditado() {
		return this.valorBcCofinsCreditado;
	}

	public void setValorBcCofinsCreditado(BigDecimal valorBcCofinsCreditado) {
		this.valorBcCofinsCreditado = valorBcCofinsCreditado;
	}

    public BigDecimal getValorBcIpiCreditado() {
		return this.valorBcIpiCreditado;
	}

	public void setValorBcIpiCreditado(BigDecimal valorBcIpiCreditado) {
		this.valorBcIpiCreditado = valorBcIpiCreditado;
	}

    public String getCstCreditoIcms() {
		return this.cstCreditoIcms;
	}

	public void setCstCreditoIcms(String cstCreditoIcms) {
		this.cstCreditoIcms = cstCreditoIcms;
	}

    public String getCstCreditoPis() {
		return this.cstCreditoPis;
	}

	public void setCstCreditoPis(String cstCreditoPis) {
		this.cstCreditoPis = cstCreditoPis;
	}

    public String getCstCreditoCofins() {
		return this.cstCreditoCofins;
	}

	public void setCstCreditoCofins(String cstCreditoCofins) {
		this.cstCreditoCofins = cstCreditoCofins;
	}

    public String getCstCreditoIpi() {
		return this.cstCreditoIpi;
	}

	public void setCstCreditoIpi(String cstCreditoIpi) {
		this.cstCreditoIpi = cstCreditoIpi;
	}

    public BigDecimal getValorIcmsCreditado() {
		return this.valorIcmsCreditado;
	}

	public void setValorIcmsCreditado(BigDecimal valorIcmsCreditado) {
		this.valorIcmsCreditado = valorIcmsCreditado;
	}

    public BigDecimal getValorPisCreditado() {
		return this.valorPisCreditado;
	}

	public void setValorPisCreditado(BigDecimal valorPisCreditado) {
		this.valorPisCreditado = valorPisCreditado;
	}

    public BigDecimal getValorCofinsCreditado() {
		return this.valorCofinsCreditado;
	}

	public void setValorCofinsCreditado(BigDecimal valorCofinsCreditado) {
		this.valorCofinsCreditado = valorCofinsCreditado;
	}

    public BigDecimal getValorIpiCreditado() {
		return this.valorIpiCreditado;
	}

	public void setValorIpiCreditado(BigDecimal valorIpiCreditado) {
		this.valorIpiCreditado = valorIpiCreditado;
	}

    public Integer getQtdeParcelaCreditoPis() {
		return this.qtdeParcelaCreditoPis;
	}

	public void setQtdeParcelaCreditoPis(Integer qtdeParcelaCreditoPis) {
		this.qtdeParcelaCreditoPis = qtdeParcelaCreditoPis;
	}

    public Integer getQtdeParcelaCreditoCofins() {
		return this.qtdeParcelaCreditoCofins;
	}

	public void setQtdeParcelaCreditoCofins(Integer qtdeParcelaCreditoCofins) {
		this.qtdeParcelaCreditoCofins = qtdeParcelaCreditoCofins;
	}

    public Integer getQtdeParcelaCreditoIcms() {
		return this.qtdeParcelaCreditoIcms;
	}

	public void setQtdeParcelaCreditoIcms(Integer qtdeParcelaCreditoIcms) {
		this.qtdeParcelaCreditoIcms = qtdeParcelaCreditoIcms;
	}

    public Integer getQtdeParcelaCreditoIpi() {
		return this.qtdeParcelaCreditoIpi;
	}

	public void setQtdeParcelaCreditoIpi(Integer qtdeParcelaCreditoIpi) {
		this.qtdeParcelaCreditoIpi = qtdeParcelaCreditoIpi;
	}

    public BigDecimal getAliquotaCreditoIcms() {
		return this.aliquotaCreditoIcms;
	}

	public void setAliquotaCreditoIcms(BigDecimal aliquotaCreditoIcms) {
		this.aliquotaCreditoIcms = aliquotaCreditoIcms;
	}

    public BigDecimal getAliquotaCreditoPis() {
		return this.aliquotaCreditoPis;
	}

	public void setAliquotaCreditoPis(BigDecimal aliquotaCreditoPis) {
		this.aliquotaCreditoPis = aliquotaCreditoPis;
	}

    public BigDecimal getAliquotaCreditoCofins() {
		return this.aliquotaCreditoCofins;
	}

	public void setAliquotaCreditoCofins(BigDecimal aliquotaCreditoCofins) {
		this.aliquotaCreditoCofins = aliquotaCreditoCofins;
	}

    public BigDecimal getAliquotaCreditoIpi() {
		return this.aliquotaCreditoIpi;
	}

	public void setAliquotaCreditoIpi(BigDecimal aliquotaCreditoIpi) {
		this.aliquotaCreditoIpi = aliquotaCreditoIpi;
	}

    public NfeCabecalho getNfeCabecalho() {
		return this.nfeCabecalho;
	}

	public void setNfeCabecalho(NfeCabecalho nfeCabecalho) {
		this.nfeCabecalho = nfeCabecalho;
	}

		
}