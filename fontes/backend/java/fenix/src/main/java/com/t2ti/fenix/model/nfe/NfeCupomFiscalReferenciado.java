/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CUPOM_FISCAL_REFERENCIADO] 
                                                                                
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
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="NFE_CUPOM_FISCAL_REFERENCIADO")
@NamedQuery(name="NfeCupomFiscalReferenciado.findAll", query="SELECT t FROM NfeCupomFiscalReferenciado t")
public class NfeCupomFiscalReferenciado implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="MODELO_DOCUMENTO_FISCAL")
	private String modeloDocumentoFiscal;

    @Column(name="NUMERO_ORDEM_ECF")
	private Integer numeroOrdemEcf;

    @Column(name="COO")
	private Integer coo;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_EMISSAO_CUPOM")
	private Date dataEmissaoCupom;

    @Column(name="NUMERO_CAIXA")
	private Integer numeroCaixa;

    @Column(name="NUMERO_SERIE_ECF")
	private String numeroSerieEcf;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

	public NfeCupomFiscalReferenciado() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getModeloDocumentoFiscal() {
		return this.modeloDocumentoFiscal;
	}

	public void setModeloDocumentoFiscal(String modeloDocumentoFiscal) {
		this.modeloDocumentoFiscal = modeloDocumentoFiscal;
	}

    public Integer getNumeroOrdemEcf() {
		return this.numeroOrdemEcf;
	}

	public void setNumeroOrdemEcf(Integer numeroOrdemEcf) {
		this.numeroOrdemEcf = numeroOrdemEcf;
	}

    public Integer getCoo() {
		return this.coo;
	}

	public void setCoo(Integer coo) {
		this.coo = coo;
	}

    public Date getDataEmissaoCupom() {
		return this.dataEmissaoCupom;
	}

	public void setDataEmissaoCupom(Date dataEmissaoCupom) {
		this.dataEmissaoCupom = dataEmissaoCupom;
	}

    public Integer getNumeroCaixa() {
		return this.numeroCaixa;
	}

	public void setNumeroCaixa(Integer numeroCaixa) {
		this.numeroCaixa = numeroCaixa;
	}

    public String getNumeroSerieEcf() {
		return this.numeroSerieEcf;
	}

	public void setNumeroSerieEcf(String numeroSerieEcf) {
		this.numeroSerieEcf = numeroSerieEcf;
	}

    public NfeCabecalho getNfeCabecalho() {
		return this.nfeCabecalho;
	}

	public void setNfeCabecalho(NfeCabecalho nfeCabecalho) {
		this.nfeCabecalho = nfeCabecalho;
	}

		
}