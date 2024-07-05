/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_CHEQUE_NAO_COMPENSADO] 
                                                                                
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
package com.t2ti.fenix.model.viewsDB;

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
@Table(name="VIEW_FIN_CHEQUE_NAO_COMPENSADO")
@NamedQuery(name="ViewFinChequeNaoCompensado.findAll", query="SELECT t FROM ViewFinChequeNaoCompensado t")
public class ViewFinChequeNaoCompensado implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CONTA_CAIXA")
	private Integer idContaCaixa;

    @Column(name="NOME_CONTA_CAIXA")
	private String nomeContaCaixa;

    @Column(name="TALAO")
	private String talao;

    @Column(name="NUMERO_TALAO")
	private Integer numeroTalao;

    @Column(name="NUMERO_CHEQUE")
	private Integer numeroCheque;

    @Column(name="STATUS_CHEQUE")
	private String statusCheque;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_STATUS")
	private Date dataStatus;

    @Column(name="VALOR")
	private BigDecimal valor;

	public ViewFinChequeNaoCompensado() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdContaCaixa() {
		return this.idContaCaixa;
	}

	public void setIdContaCaixa(Integer idContaCaixa) {
		this.idContaCaixa = idContaCaixa;
	}

    public String getNomeContaCaixa() {
		return this.nomeContaCaixa;
	}

	public void setNomeContaCaixa(String nomeContaCaixa) {
		this.nomeContaCaixa = nomeContaCaixa;
	}

    public String getTalao() {
		return this.talao;
	}

	public void setTalao(String talao) {
		this.talao = talao;
	}

    public Integer getNumeroTalao() {
		return this.numeroTalao;
	}

	public void setNumeroTalao(Integer numeroTalao) {
		this.numeroTalao = numeroTalao;
	}

    public Integer getNumeroCheque() {
		return this.numeroCheque;
	}

	public void setNumeroCheque(Integer numeroCheque) {
		this.numeroCheque = numeroCheque;
	}

    public String getStatusCheque() {
		return this.statusCheque;
	}

	public void setStatusCheque(String statusCheque) {
		this.statusCheque = statusCheque;
	}

    public Date getDataStatus() {
		return this.dataStatus;
	}

	public void setDataStatus(Date dataStatus) {
		this.dataStatus = dataStatus;
	}

    public BigDecimal getValor() {
		return this.valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

		
}