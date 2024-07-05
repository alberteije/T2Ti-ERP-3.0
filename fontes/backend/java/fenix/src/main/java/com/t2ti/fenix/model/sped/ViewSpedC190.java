/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_C190] 
                                                                                
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
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="VIEW_SPED_C190")
@NamedQuery(name="ViewSpedC190.findAll", query="SELECT t FROM ViewSpedC190 t")
public class ViewSpedC190 implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CST_ICMS")
	private String cstIcms;

    @Column(name="CFOP")
	private Integer cfop;

    @Column(name="ALIQUOTA_ICMS")
	private BigDecimal aliquotaIcms;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_HORA_EMISSAO")
	private Date dataHoraEmissao;

    @Column(name="SOMA_VALOR_OPERACAO")
	private BigDecimal somaValorOperacao;

    @Column(name="SOMA_BASE_CALCULO_ICMS")
	private BigDecimal somaBaseCalculoIcms;

    @Column(name="SOMA_VALOR_ICMS")
	private BigDecimal somaValorIcms;

    @Column(name="SOMA_BASE_CALCULO_ICMS_ST")
	private BigDecimal somaBaseCalculoIcmsSt;

    @Column(name="SOMA_VALOR_ICMS_ST")
	private BigDecimal somaValorIcmsSt;

    @Column(name="SOMA_VL_RED_BC")
	private BigDecimal somaVlRedBc;

    @Column(name="SOMA_VALOR_IPI")
	private BigDecimal somaValorIpi;

	public ViewSpedC190() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCstIcms() {
		return this.cstIcms;
	}

	public void setCstIcms(String cstIcms) {
		this.cstIcms = cstIcms;
	}

    public Integer getCfop() {
		return this.cfop;
	}

	public void setCfop(Integer cfop) {
		this.cfop = cfop;
	}

    public BigDecimal getAliquotaIcms() {
		return this.aliquotaIcms;
	}

	public void setAliquotaIcms(BigDecimal aliquotaIcms) {
		this.aliquotaIcms = aliquotaIcms;
	}

    public Date getDataHoraEmissao() {
		return this.dataHoraEmissao;
	}

	public void setDataHoraEmissao(Date dataHoraEmissao) {
		this.dataHoraEmissao = dataHoraEmissao;
	}

    public BigDecimal getSomaValorOperacao() {
		return this.somaValorOperacao;
	}

	public void setSomaValorOperacao(BigDecimal somaValorOperacao) {
		this.somaValorOperacao = somaValorOperacao;
	}

    public BigDecimal getSomaBaseCalculoIcms() {
		return this.somaBaseCalculoIcms;
	}

	public void setSomaBaseCalculoIcms(BigDecimal somaBaseCalculoIcms) {
		this.somaBaseCalculoIcms = somaBaseCalculoIcms;
	}

    public BigDecimal getSomaValorIcms() {
		return this.somaValorIcms;
	}

	public void setSomaValorIcms(BigDecimal somaValorIcms) {
		this.somaValorIcms = somaValorIcms;
	}

    public BigDecimal getSomaBaseCalculoIcmsSt() {
		return this.somaBaseCalculoIcmsSt;
	}

	public void setSomaBaseCalculoIcmsSt(BigDecimal somaBaseCalculoIcmsSt) {
		this.somaBaseCalculoIcmsSt = somaBaseCalculoIcmsSt;
	}

    public BigDecimal getSomaValorIcmsSt() {
		return this.somaValorIcmsSt;
	}

	public void setSomaValorIcmsSt(BigDecimal somaValorIcmsSt) {
		this.somaValorIcmsSt = somaValorIcmsSt;
	}

    public BigDecimal getSomaVlRedBc() {
		return this.somaVlRedBc;
	}

	public void setSomaVlRedBc(BigDecimal somaVlRedBc) {
		this.somaVlRedBc = somaVlRedBc;
	}

    public BigDecimal getSomaValorIpi() {
		return this.somaValorIpi;
	}

	public void setSomaValorIpi(BigDecimal somaValorIpi) {
		this.somaValorIpi = somaValorIpi;
	}

		
}