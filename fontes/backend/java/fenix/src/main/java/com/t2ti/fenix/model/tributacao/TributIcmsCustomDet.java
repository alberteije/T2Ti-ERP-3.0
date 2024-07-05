/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_ICMS_CUSTOM_DET] 
                                                                                
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
package com.t2ti.fenix.model.tributacao;

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

@Entity
@Table(name="TRIBUT_ICMS_CUSTOM_DET")
@NamedQuery(name="TributIcmsCustomDet.findAll", query="SELECT t FROM TributIcmsCustomDet t")
public class TributIcmsCustomDet implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="UF_DESTINO")
	private String ufDestino;

    @Column(name="CFOP")
	private Integer cfop;

    @Column(name="CSOSN")
	private String csosn;

    @Column(name="CST")
	private String cst;

    @Column(name="MODALIDADE_BC")
	private String modalidadeBc;

    @Column(name="ALIQUOTA")
	private BigDecimal aliquota;

    @Column(name="VALOR_PAUTA")
	private BigDecimal valorPauta;

    @Column(name="VALOR_PRECO_MAXIMO")
	private BigDecimal valorPrecoMaximo;

    @Column(name="MVA")
	private BigDecimal mva;

    @Column(name="PORCENTO_BC")
	private BigDecimal porcentoBc;

    @Column(name="MODALIDADE_BC_ST")
	private String modalidadeBcSt;

    @Column(name="ALIQUOTA_INTERNA_ST")
	private BigDecimal aliquotaInternaSt;

    @Column(name="ALIQUOTA_INTERESTADUAL_ST")
	private BigDecimal aliquotaInterestadualSt;

    @Column(name="PORCENTO_BC_ST")
	private BigDecimal porcentoBcSt;

    @Column(name="ALIQUOTA_ICMS_ST")
	private BigDecimal aliquotaIcmsSt;

    @Column(name="VALOR_PAUTA_ST")
	private BigDecimal valorPautaSt;

    @Column(name="VALOR_PRECO_MAXIMO_ST")
	private BigDecimal valorPrecoMaximoSt;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_TRIBUT_ICMS_CUSTOM_CAB")
    private TributIcmsCustomCab tributIcmsCustomCab;

	public TributIcmsCustomDet() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getUfDestino() {
		return this.ufDestino;
	}

	public void setUfDestino(String ufDestino) {
		this.ufDestino = ufDestino;
	}

    public Integer getCfop() {
		return this.cfop;
	}

	public void setCfop(Integer cfop) {
		this.cfop = cfop;
	}

    public String getCsosn() {
		return this.csosn;
	}

	public void setCsosn(String csosn) {
		this.csosn = csosn;
	}

    public String getCst() {
		return this.cst;
	}

	public void setCst(String cst) {
		this.cst = cst;
	}

    public String getModalidadeBc() {
		return this.modalidadeBc;
	}

	public void setModalidadeBc(String modalidadeBc) {
		this.modalidadeBc = modalidadeBc;
	}

    public BigDecimal getAliquota() {
		return this.aliquota;
	}

	public void setAliquota(BigDecimal aliquota) {
		this.aliquota = aliquota;
	}

    public BigDecimal getValorPauta() {
		return this.valorPauta;
	}

	public void setValorPauta(BigDecimal valorPauta) {
		this.valorPauta = valorPauta;
	}

    public BigDecimal getValorPrecoMaximo() {
		return this.valorPrecoMaximo;
	}

	public void setValorPrecoMaximo(BigDecimal valorPrecoMaximo) {
		this.valorPrecoMaximo = valorPrecoMaximo;
	}

    public BigDecimal getMva() {
		return this.mva;
	}

	public void setMva(BigDecimal mva) {
		this.mva = mva;
	}

    public BigDecimal getPorcentoBc() {
		return this.porcentoBc;
	}

	public void setPorcentoBc(BigDecimal porcentoBc) {
		this.porcentoBc = porcentoBc;
	}

    public String getModalidadeBcSt() {
		return this.modalidadeBcSt;
	}

	public void setModalidadeBcSt(String modalidadeBcSt) {
		this.modalidadeBcSt = modalidadeBcSt;
	}

    public BigDecimal getAliquotaInternaSt() {
		return this.aliquotaInternaSt;
	}

	public void setAliquotaInternaSt(BigDecimal aliquotaInternaSt) {
		this.aliquotaInternaSt = aliquotaInternaSt;
	}

    public BigDecimal getAliquotaInterestadualSt() {
		return this.aliquotaInterestadualSt;
	}

	public void setAliquotaInterestadualSt(BigDecimal aliquotaInterestadualSt) {
		this.aliquotaInterestadualSt = aliquotaInterestadualSt;
	}

    public BigDecimal getPorcentoBcSt() {
		return this.porcentoBcSt;
	}

	public void setPorcentoBcSt(BigDecimal porcentoBcSt) {
		this.porcentoBcSt = porcentoBcSt;
	}

    public BigDecimal getAliquotaIcmsSt() {
		return this.aliquotaIcmsSt;
	}

	public void setAliquotaIcmsSt(BigDecimal aliquotaIcmsSt) {
		this.aliquotaIcmsSt = aliquotaIcmsSt;
	}

    public BigDecimal getValorPautaSt() {
		return this.valorPautaSt;
	}

	public void setValorPautaSt(BigDecimal valorPautaSt) {
		this.valorPautaSt = valorPautaSt;
	}

    public BigDecimal getValorPrecoMaximoSt() {
		return this.valorPrecoMaximoSt;
	}

	public void setValorPrecoMaximoSt(BigDecimal valorPrecoMaximoSt) {
		this.valorPrecoMaximoSt = valorPrecoMaximoSt;
	}

    public TributIcmsCustomCab getTributIcmsCustomCab() {
		return this.tributIcmsCustomCab;
	}

	public void setTributIcmsCustomCab(TributIcmsCustomCab tributIcmsCustomCab) {
		this.tributIcmsCustomCab = tributIcmsCustomCab;
	}

		
}