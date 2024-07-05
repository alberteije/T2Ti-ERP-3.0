/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [WMS_RECEBIMENTO_CABECALHO] 
                                                                                
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
@Table(name="WMS_RECEBIMENTO_CABECALHO")
@NamedQuery(name="WmsRecebimentoCabecalho.findAll", query="SELECT t FROM WmsRecebimentoCabecalho t")
public class WmsRecebimentoCabecalho implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_WMS_AGENDAMENTO")
	private Integer idWmsAgendamento;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_RECEBIMENTO")
	private Date dataRecebimento;

    @Column(name="HORA_INICIO")
	private String horaInicio;

    @Column(name="HORA_FIM")
	private String horaFim;

    @Column(name="VOLUME_RECEBIDO")
	private Integer volumeRecebido;

    @Column(name="PESO_RECEBIDO")
	private BigDecimal pesoRecebido;

    @Column(name="INCONSISTENCIA")
	private String inconsistencia;

    @Column(name="OBSERVACAO")
	private String observacao;

	public WmsRecebimentoCabecalho() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdWmsAgendamento() {
		return this.idWmsAgendamento;
	}

	public void setIdWmsAgendamento(Integer idWmsAgendamento) {
		this.idWmsAgendamento = idWmsAgendamento;
	}

    public Date getDataRecebimento() {
		return this.dataRecebimento;
	}

	public void setDataRecebimento(Date dataRecebimento) {
		this.dataRecebimento = dataRecebimento;
	}

    public String getHoraInicio() {
		return this.horaInicio;
	}

	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}

    public String getHoraFim() {
		return this.horaFim;
	}

	public void setHoraFim(String horaFim) {
		this.horaFim = horaFim;
	}

    public Integer getVolumeRecebido() {
		return this.volumeRecebido;
	}

	public void setVolumeRecebido(Integer volumeRecebido) {
		this.volumeRecebido = volumeRecebido;
	}

    public BigDecimal getPesoRecebido() {
		return this.pesoRecebido;
	}

	public void setPesoRecebido(BigDecimal pesoRecebido) {
		this.pesoRecebido = pesoRecebido;
	}

    public String getInconsistencia() {
		return this.inconsistencia;
	}

	public void setInconsistencia(String inconsistencia) {
		this.inconsistencia = inconsistencia;
	}

    public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

		
}