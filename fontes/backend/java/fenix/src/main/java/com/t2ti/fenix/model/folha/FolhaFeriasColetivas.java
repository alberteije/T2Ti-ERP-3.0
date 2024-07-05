/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_FERIAS_COLETIVAS] 
                                                                                
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
package com.t2ti.fenix.model.folha;

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

@Entity
@Table(name="FOLHA_FERIAS_COLETIVAS")
@NamedQuery(name="FolhaFeriasColetivas.findAll", query="SELECT t FROM FolhaFeriasColetivas t")
public class FolhaFeriasColetivas implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_INICIO")
	private Date dataInicio;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_FIM")
	private Date dataFim;

    @Column(name="DIAS_GOZO")
	private Integer diasGozo;

    @Temporal(TemporalType.DATE)
	@Column(name="ABONO_PECUNIARIO_INICIO")
	private Date abonoPecuniarioInicio;

    @Temporal(TemporalType.DATE)
	@Column(name="ABONO_PECUNIARIO_FIM")
	private Date abonoPecuniarioFim;

    @Column(name="DIAS_ABONO")
	private Integer diasAbono;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PAGAMENTO")
	private Date dataPagamento;

	public FolhaFeriasColetivas() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getDataInicio() {
		return this.dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

    public Date getDataFim() {
		return this.dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

    public Integer getDiasGozo() {
		return this.diasGozo;
	}

	public void setDiasGozo(Integer diasGozo) {
		this.diasGozo = diasGozo;
	}

    public Date getAbonoPecuniarioInicio() {
		return this.abonoPecuniarioInicio;
	}

	public void setAbonoPecuniarioInicio(Date abonoPecuniarioInicio) {
		this.abonoPecuniarioInicio = abonoPecuniarioInicio;
	}

    public Date getAbonoPecuniarioFim() {
		return this.abonoPecuniarioFim;
	}

	public void setAbonoPecuniarioFim(Date abonoPecuniarioFim) {
		this.abonoPecuniarioFim = abonoPecuniarioFim;
	}

    public Integer getDiasAbono() {
		return this.diasAbono;
	}

	public void setDiasAbono(Integer diasAbono) {
		this.diasAbono = diasAbono;
	}

    public Date getDataPagamento() {
		return this.dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

		
}