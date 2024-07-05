/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_IPI] 
                                                                                
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
@Table(name="NFE_DETALHE_IMPOSTO_IPI")
@NamedQuery(name="NfeDetalheImpostoIpi.findAll", query="SELECT t FROM NfeDetalheImpostoIpi t")
public class NfeDetalheImpostoIpi implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

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

    @Column(name="QUANTIDADE_UNIDADE_TRIBUTAVEL")
	private BigDecimal quantidadeUnidadeTributavel;

    @Column(name="VALOR_UNIDADE_TRIBUTAVEL")
	private BigDecimal valorUnidadeTributavel;

    @Column(name="ALIQUOTA_IPI")
	private BigDecimal aliquotaIpi;

    @Column(name="VALOR_IPI")
	private BigDecimal valorIpi;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DETALHE")
    private NfeDetalhe nfeDetalhe;

	public NfeDetalheImpostoIpi() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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
		this.valorBaseCalculoIpi = valorBaseCalculoIpi == null ? new BigDecimal(0) : valorBaseCalculoIpi;
	}

    public BigDecimal getQuantidadeUnidadeTributavel() {
		return this.quantidadeUnidadeTributavel;
	}

	public void setQuantidadeUnidadeTributavel(BigDecimal quantidadeUnidadeTributavel) {
		this.quantidadeUnidadeTributavel = quantidadeUnidadeTributavel == null ? new BigDecimal(0) : quantidadeUnidadeTributavel;
	}

    public BigDecimal getValorUnidadeTributavel() {
		return this.valorUnidadeTributavel;
	}

	public void setValorUnidadeTributavel(BigDecimal valorUnidadeTributavel) {
		this.valorUnidadeTributavel = valorUnidadeTributavel == null ? new BigDecimal(0) : valorUnidadeTributavel;
	}

    public BigDecimal getAliquotaIpi() {
		return this.aliquotaIpi;
	}

	public void setAliquotaIpi(BigDecimal aliquotaIpi) {
		this.aliquotaIpi = aliquotaIpi == null ? new BigDecimal(0) : aliquotaIpi;
	}

    public BigDecimal getValorIpi() {
		return this.valorIpi;
	}

	public void setValorIpi(BigDecimal valorIpi) {
		this.valorIpi = valorIpi == null ? new BigDecimal(0) : valorIpi;
	}

    public NfeDetalhe getNfeDetalhe() {
		return this.nfeDetalhe;
	}

	public void setNfeDetalhe(NfeDetalhe nfeDetalhe) {
		this.nfeDetalhe = nfeDetalhe;
	}

		
}