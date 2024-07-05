/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_MARCACAO] 
                                                                                
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
package com.t2ti.fenix.model.ponto;

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
@Table(name="PONTO_MARCACAO")
@NamedQuery(name="PontoMarcacao.findAll", query="SELECT t FROM PontoMarcacao t")
public class PontoMarcacao implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_PONTO_RELOGIO")
	private Integer idPontoRelogio;

    @Column(name="ID_COLABORADOR")
	private Integer idColaborador;

    @Column(name="NSR")
	private Integer nsr;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_MARCACAO")
	private Date dataMarcacao;

    @Column(name="HORA_MARCACAO")
	private String horaMarcacao;

    @Column(name="TIPO_MARCACAO")
	private String tipoMarcacao;

    @Column(name="TIPO_REGISTRO")
	private String tipoRegistro;

    @Column(name="PAR_ENTRADA_SAIDA")
	private String parEntradaSaida;

    @Column(name="JUSTIFICATIVA")
	private String justificativa;

	public PontoMarcacao() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdPontoRelogio() {
		return this.idPontoRelogio;
	}

	public void setIdPontoRelogio(Integer idPontoRelogio) {
		this.idPontoRelogio = idPontoRelogio;
	}

    public Integer getIdColaborador() {
		return this.idColaborador;
	}

	public void setIdColaborador(Integer idColaborador) {
		this.idColaborador = idColaborador;
	}

    public Integer getNsr() {
		return this.nsr;
	}

	public void setNsr(Integer nsr) {
		this.nsr = nsr;
	}

    public Date getDataMarcacao() {
		return this.dataMarcacao;
	}

	public void setDataMarcacao(Date dataMarcacao) {
		this.dataMarcacao = dataMarcacao;
	}

    public String getHoraMarcacao() {
		return this.horaMarcacao;
	}

	public void setHoraMarcacao(String horaMarcacao) {
		this.horaMarcacao = horaMarcacao;
	}

    public String getTipoMarcacao() {
		return this.tipoMarcacao;
	}

	public void setTipoMarcacao(String tipoMarcacao) {
		this.tipoMarcacao = tipoMarcacao;
	}

    public String getTipoRegistro() {
		return this.tipoRegistro;
	}

	public void setTipoRegistro(String tipoRegistro) {
		this.tipoRegistro = tipoRegistro;
	}

    public String getParEntradaSaida() {
		return this.parEntradaSaida;
	}

	public void setParEntradaSaida(String parEntradaSaida) {
		this.parEntradaSaida = parEntradaSaida;
	}

    public String getJustificativa() {
		return this.justificativa;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}

		
}