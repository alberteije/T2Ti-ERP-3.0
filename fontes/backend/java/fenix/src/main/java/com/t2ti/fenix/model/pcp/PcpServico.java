/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PCP_SERVICO] 
                                                                                
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
package com.t2ti.fenix.model.pcp;

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
@Table(name="PCP_SERVICO")
@NamedQuery(name="PcpServico.findAll", query="SELECT t FROM PcpServico t")
public class PcpServico implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_PCP_OP_DETALHE")
	private Integer idPcpOpDetalhe;

    @Temporal(TemporalType.DATE)
	@Column(name="INICIO_REALIZADO")
	private Date inicioRealizado;

    @Temporal(TemporalType.DATE)
	@Column(name="TERMINO_REALIZADO")
	private Date terminoRealizado;

    @Column(name="HORAS_REALIZADO")
	private Integer horasRealizado;

    @Column(name="MINUTOS_REALIZADO")
	private Integer minutosRealizado;

    @Column(name="SEGUNDOS_REALIZADO")
	private Integer segundosRealizado;

    @Column(name="CUSTO_REALIZADO")
	private BigDecimal custoRealizado;

    @Temporal(TemporalType.DATE)
	@Column(name="INICIO_PREVISTO")
	private Date inicioPrevisto;

    @Temporal(TemporalType.DATE)
	@Column(name="TERMINO_PREVISTO")
	private Date terminoPrevisto;

    @Column(name="HORAS_PREVISTO")
	private Integer horasPrevisto;

    @Column(name="MINUTOS_PREVISTO")
	private Integer minutosPrevisto;

    @Column(name="SEGUNDOS_PREVISTO")
	private Integer segundosPrevisto;

    @Column(name="CUSTO_PREVISTO")
	private BigDecimal custoPrevisto;

	public PcpServico() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdPcpOpDetalhe() {
		return this.idPcpOpDetalhe;
	}

	public void setIdPcpOpDetalhe(Integer idPcpOpDetalhe) {
		this.idPcpOpDetalhe = idPcpOpDetalhe;
	}

    public Date getInicioRealizado() {
		return this.inicioRealizado;
	}

	public void setInicioRealizado(Date inicioRealizado) {
		this.inicioRealizado = inicioRealizado;
	}

    public Date getTerminoRealizado() {
		return this.terminoRealizado;
	}

	public void setTerminoRealizado(Date terminoRealizado) {
		this.terminoRealizado = terminoRealizado;
	}

    public Integer getHorasRealizado() {
		return this.horasRealizado;
	}

	public void setHorasRealizado(Integer horasRealizado) {
		this.horasRealizado = horasRealizado;
	}

    public Integer getMinutosRealizado() {
		return this.minutosRealizado;
	}

	public void setMinutosRealizado(Integer minutosRealizado) {
		this.minutosRealizado = minutosRealizado;
	}

    public Integer getSegundosRealizado() {
		return this.segundosRealizado;
	}

	public void setSegundosRealizado(Integer segundosRealizado) {
		this.segundosRealizado = segundosRealizado;
	}

    public BigDecimal getCustoRealizado() {
		return this.custoRealizado;
	}

	public void setCustoRealizado(BigDecimal custoRealizado) {
		this.custoRealizado = custoRealizado;
	}

    public Date getInicioPrevisto() {
		return this.inicioPrevisto;
	}

	public void setInicioPrevisto(Date inicioPrevisto) {
		this.inicioPrevisto = inicioPrevisto;
	}

    public Date getTerminoPrevisto() {
		return this.terminoPrevisto;
	}

	public void setTerminoPrevisto(Date terminoPrevisto) {
		this.terminoPrevisto = terminoPrevisto;
	}

    public Integer getHorasPrevisto() {
		return this.horasPrevisto;
	}

	public void setHorasPrevisto(Integer horasPrevisto) {
		this.horasPrevisto = horasPrevisto;
	}

    public Integer getMinutosPrevisto() {
		return this.minutosPrevisto;
	}

	public void setMinutosPrevisto(Integer minutosPrevisto) {
		this.minutosPrevisto = minutosPrevisto;
	}

    public Integer getSegundosPrevisto() {
		return this.segundosPrevisto;
	}

	public void setSegundosPrevisto(Integer segundosPrevisto) {
		this.segundosPrevisto = segundosPrevisto;
	}

    public BigDecimal getCustoPrevisto() {
		return this.custoPrevisto;
	}

	public void setCustoPrevisto(BigDecimal custoPrevisto) {
		this.custoPrevisto = custoPrevisto;
	}

		
}