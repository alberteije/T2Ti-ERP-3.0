/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [WMS_AGENDAMENTO] 
                                                                                
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
package com.t2ti.fenix.model.wms;

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
@Table(name="WMS_AGENDAMENTO")
@NamedQuery(name="WmsAgendamento.findAll", query="SELECT t FROM WmsAgendamento t")
public class WmsAgendamento implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_OPERACAO")
	private Date dataOperacao;

    @Column(name="HORA_OPERACAO")
	private String horaOperacao;

    @Column(name="LOCAL_OPERACAO")
	private String localOperacao;

    @Column(name="QUANTIDADE_VOLUME")
	private Integer quantidadeVolume;

    @Column(name="PESO_TOTAL_VOLUME")
	private BigDecimal pesoTotalVolume;

    @Column(name="QUANTIDADE_PESSOA")
	private Integer quantidadePessoa;

    @Column(name="QUANTIDADE_HORA")
	private Integer quantidadeHora;

	public WmsAgendamento() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getDataOperacao() {
		return this.dataOperacao;
	}

	public void setDataOperacao(Date dataOperacao) {
		this.dataOperacao = dataOperacao;
	}

    public String getHoraOperacao() {
		return this.horaOperacao;
	}

	public void setHoraOperacao(String horaOperacao) {
		this.horaOperacao = horaOperacao;
	}

    public String getLocalOperacao() {
		return this.localOperacao;
	}

	public void setLocalOperacao(String localOperacao) {
		this.localOperacao = localOperacao;
	}

    public Integer getQuantidadeVolume() {
		return this.quantidadeVolume;
	}

	public void setQuantidadeVolume(Integer quantidadeVolume) {
		this.quantidadeVolume = quantidadeVolume;
	}

    public BigDecimal getPesoTotalVolume() {
		return this.pesoTotalVolume;
	}

	public void setPesoTotalVolume(BigDecimal pesoTotalVolume) {
		this.pesoTotalVolume = pesoTotalVolume;
	}

    public Integer getQuantidadePessoa() {
		return this.quantidadePessoa;
	}

	public void setQuantidadePessoa(Integer quantidadePessoa) {
		this.quantidadePessoa = quantidadePessoa;
	}

    public Integer getQuantidadeHora() {
		return this.quantidadeHora;
	}

	public void setQuantidadeHora(Integer quantidadeHora) {
		this.quantidadeHora = quantidadeHora;
	}

		
}