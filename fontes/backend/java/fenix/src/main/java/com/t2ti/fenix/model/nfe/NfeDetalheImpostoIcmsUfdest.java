/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS_UFDEST] 
                                                                                
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
@Table(name="NFE_DETALHE_IMPOSTO_ICMS_UFDEST")
@NamedQuery(name="NfeDetalheImpostoIcmsUfdest.findAll", query="SELECT t FROM NfeDetalheImpostoIcmsUfdest t")
public class NfeDetalheImpostoIcmsUfdest implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="VALOR_BC_ICMS_UF_DESTINO")
	private BigDecimal valorBcIcmsUfDestino;

    @Column(name="VALOR_BC_FCP_UF_DESTINO")
	private BigDecimal valorBcFcpUfDestino;

    @Column(name="PERCENTUAL_FCP_UF_DESTINO")
	private BigDecimal percentualFcpUfDestino;

    @Column(name="ALIQUOTA_INTERNA_UF_DESTINO")
	private BigDecimal aliquotaInternaUfDestino;

    @Column(name="ALIQUOTA_INTERESDATUAL_UF_ENVOLVIDAS")
	private BigDecimal aliquotaInteresdatualUfEnvolvidas;

    @Column(name="PERCENTUAL_PROVISORIO_PARTILHA_ICMS")
	private BigDecimal percentualProvisorioPartilhaIcms;

    @Column(name="VALOR_ICMS_FCP_UF_DESTINO")
	private BigDecimal valorIcmsFcpUfDestino;

    @Column(name="VALOR_INTERESTADUAL_UF_DESTINO")
	private BigDecimal valorInterestadualUfDestino;

    @Column(name="VALOR_INTERESTADUAL_UF_REMETENTE")
	private BigDecimal valorInterestadualUfRemetente;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DETALHE")
    private NfeDetalhe nfeDetalhe;

	public NfeDetalheImpostoIcmsUfdest() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public BigDecimal getValorBcIcmsUfDestino() {
		return this.valorBcIcmsUfDestino;
	}

	public void setValorBcIcmsUfDestino(BigDecimal valorBcIcmsUfDestino) {
		this.valorBcIcmsUfDestino = valorBcIcmsUfDestino;
	}

    public BigDecimal getValorBcFcpUfDestino() {
		return this.valorBcFcpUfDestino;
	}

	public void setValorBcFcpUfDestino(BigDecimal valorBcFcpUfDestino) {
		this.valorBcFcpUfDestino = valorBcFcpUfDestino;
	}

    public BigDecimal getPercentualFcpUfDestino() {
		return this.percentualFcpUfDestino;
	}

	public void setPercentualFcpUfDestino(BigDecimal percentualFcpUfDestino) {
		this.percentualFcpUfDestino = percentualFcpUfDestino;
	}

    public BigDecimal getAliquotaInternaUfDestino() {
		return this.aliquotaInternaUfDestino;
	}

	public void setAliquotaInternaUfDestino(BigDecimal aliquotaInternaUfDestino) {
		this.aliquotaInternaUfDestino = aliquotaInternaUfDestino;
	}

    public BigDecimal getAliquotaInteresdatualUfEnvolvidas() {
		return this.aliquotaInteresdatualUfEnvolvidas;
	}

	public void setAliquotaInteresdatualUfEnvolvidas(BigDecimal aliquotaInteresdatualUfEnvolvidas) {
		this.aliquotaInteresdatualUfEnvolvidas = aliquotaInteresdatualUfEnvolvidas;
	}

    public BigDecimal getPercentualProvisorioPartilhaIcms() {
		return this.percentualProvisorioPartilhaIcms;
	}

	public void setPercentualProvisorioPartilhaIcms(BigDecimal percentualProvisorioPartilhaIcms) {
		this.percentualProvisorioPartilhaIcms = percentualProvisorioPartilhaIcms;
	}

    public BigDecimal getValorIcmsFcpUfDestino() {
		return this.valorIcmsFcpUfDestino;
	}

	public void setValorIcmsFcpUfDestino(BigDecimal valorIcmsFcpUfDestino) {
		this.valorIcmsFcpUfDestino = valorIcmsFcpUfDestino;
	}

    public BigDecimal getValorInterestadualUfDestino() {
		return this.valorInterestadualUfDestino;
	}

	public void setValorInterestadualUfDestino(BigDecimal valorInterestadualUfDestino) {
		this.valorInterestadualUfDestino = valorInterestadualUfDestino;
	}

    public BigDecimal getValorInterestadualUfRemetente() {
		return this.valorInterestadualUfRemetente;
	}

	public void setValorInterestadualUfRemetente(BigDecimal valorInterestadualUfRemetente) {
		this.valorInterestadualUfRemetente = valorInterestadualUfRemetente;
	}

    public NfeDetalhe getNfeDetalhe() {
		return this.nfeDetalhe;
	}

	public void setNfeDetalhe(NfeDetalhe nfeDetalhe) {
		this.nfeDetalhe = nfeDetalhe;
	}

		
}