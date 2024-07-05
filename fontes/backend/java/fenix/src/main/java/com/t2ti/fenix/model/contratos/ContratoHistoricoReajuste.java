/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTRATO_HISTORICO_REAJUSTE] 
                                                                                
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
package com.t2ti.fenix.model.contratos;

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
@Table(name="CONTRATO_HISTORICO_REAJUSTE")
@NamedQuery(name="ContratoHistoricoReajuste.findAll", query="SELECT t FROM ContratoHistoricoReajuste t")
public class ContratoHistoricoReajuste implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CONTRATO")
	private Integer idContrato;

    @Column(name="INDICE")
	private BigDecimal indice;

    @Column(name="VALOR_ANTERIOR")
	private BigDecimal valorAnterior;

    @Column(name="VALOR_ATUAL")
	private BigDecimal valorAtual;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_REAJUSTE")
	private Date dataReajuste;

    @Column(name="OBSERVACAO")
	private String observacao;

	public ContratoHistoricoReajuste() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdContrato() {
		return this.idContrato;
	}

	public void setIdContrato(Integer idContrato) {
		this.idContrato = idContrato;
	}

    public BigDecimal getIndice() {
		return this.indice;
	}

	public void setIndice(BigDecimal indice) {
		this.indice = indice;
	}

    public BigDecimal getValorAnterior() {
		return this.valorAnterior;
	}

	public void setValorAnterior(BigDecimal valorAnterior) {
		this.valorAnterior = valorAnterior;
	}

    public BigDecimal getValorAtual() {
		return this.valorAtual;
	}

	public void setValorAtual(BigDecimal valorAtual) {
		this.valorAtual = valorAtual;
	}

    public Date getDataReajuste() {
		return this.dataReajuste;
	}

	public void setDataReajuste(Date dataReajuste) {
		this.dataReajuste = dataReajuste;
	}

    public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

		
}