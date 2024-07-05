/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_PARAMETRO] 
                                                                                
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
import java.math.BigDecimal;

@Entity
@Table(name="PONTO_PARAMETRO")
@NamedQuery(name="PontoParametro.findAll", query="SELECT t FROM PontoParametro t")
public class PontoParametro implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="MES_ANO")
	private String mesAno;

    @Column(name="DIA_INICIAL_APURACAO")
	private Integer diaInicialApuracao;

    @Column(name="HORA_NOTURNA_INICIO")
	private String horaNoturnaInicio;

    @Column(name="HORA_NOTURNA_FIM")
	private String horaNoturnaFim;

    @Column(name="PERIODO_MINIMO_INTERJORNADA")
	private String periodoMinimoInterjornada;

    @Column(name="PERCENTUAL_HE_DIURNA")
	private BigDecimal percentualHeDiurna;

    @Column(name="PERCENTUAL_HE_NOTURNA")
	private BigDecimal percentualHeNoturna;

    @Column(name="DURACAO_HORA_NOTURNA")
	private String duracaoHoraNoturna;

    @Column(name="TRATAMENTO_HORA_MAIS")
	private String tratamentoHoraMais;

    @Column(name="TRATAMENTO_HORA_MENOS")
	private String tratamentoHoraMenos;

	public PontoParametro() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getMesAno() {
		return this.mesAno;
	}

	public void setMesAno(String mesAno) {
		this.mesAno = mesAno;
	}

    public Integer getDiaInicialApuracao() {
		return this.diaInicialApuracao;
	}

	public void setDiaInicialApuracao(Integer diaInicialApuracao) {
		this.diaInicialApuracao = diaInicialApuracao;
	}

    public String getHoraNoturnaInicio() {
		return this.horaNoturnaInicio;
	}

	public void setHoraNoturnaInicio(String horaNoturnaInicio) {
		this.horaNoturnaInicio = horaNoturnaInicio;
	}

    public String getHoraNoturnaFim() {
		return this.horaNoturnaFim;
	}

	public void setHoraNoturnaFim(String horaNoturnaFim) {
		this.horaNoturnaFim = horaNoturnaFim;
	}

    public String getPeriodoMinimoInterjornada() {
		return this.periodoMinimoInterjornada;
	}

	public void setPeriodoMinimoInterjornada(String periodoMinimoInterjornada) {
		this.periodoMinimoInterjornada = periodoMinimoInterjornada;
	}

    public BigDecimal getPercentualHeDiurna() {
		return this.percentualHeDiurna;
	}

	public void setPercentualHeDiurna(BigDecimal percentualHeDiurna) {
		this.percentualHeDiurna = percentualHeDiurna;
	}

    public BigDecimal getPercentualHeNoturna() {
		return this.percentualHeNoturna;
	}

	public void setPercentualHeNoturna(BigDecimal percentualHeNoturna) {
		this.percentualHeNoturna = percentualHeNoturna;
	}

    public String getDuracaoHoraNoturna() {
		return this.duracaoHoraNoturna;
	}

	public void setDuracaoHoraNoturna(String duracaoHoraNoturna) {
		this.duracaoHoraNoturna = duracaoHoraNoturna;
	}

    public String getTratamentoHoraMais() {
		return this.tratamentoHoraMais;
	}

	public void setTratamentoHoraMais(String tratamentoHoraMais) {
		this.tratamentoHoraMais = tratamentoHoraMais;
	}

    public String getTratamentoHoraMenos() {
		return this.tratamentoHoraMenos;
	}

	public void setTratamentoHoraMenos(String tratamentoHoraMenos) {
		this.tratamentoHoraMenos = tratamentoHoraMenos;
	}

		
}