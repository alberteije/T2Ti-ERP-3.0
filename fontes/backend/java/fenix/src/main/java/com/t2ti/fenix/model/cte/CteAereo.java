/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_AEREO] 
                                                                                
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
package com.t2ti.fenix.model.cte;

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
@Table(name="CTE_AEREO")
@NamedQuery(name="CteAereo.findAll", query="SELECT t FROM CteAereo t")
public class CteAereo implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CTE_CABECALHO")
	private Integer idCteCabecalho;

    @Column(name="NUMERO_MINUTA")
	private Integer numeroMinuta;

    @Column(name="NUMERO_CONHECIMENTO")
	private Integer numeroConhecimento;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PREVISTA_ENTREGA")
	private Date dataPrevistaEntrega;

    @Column(name="TARIFA_CLASSE")
	private String tarifaClasse;

    @Column(name="TARIFA_CODIGO")
	private String tarifaCodigo;

    @Column(name="TARIFA_VALOR")
	private BigDecimal tarifaValor;

    @Column(name="CARGA_DIMENSAO")
	private String cargaDimensao;

    @Column(name="CARGA_INFORMACAO_MANUSEIO")
	private String cargaInformacaoManuseio;

    @Column(name="CARGA_ESPECIAL")
	private String cargaEspecial;

	public CteAereo() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdCteCabecalho() {
		return this.idCteCabecalho;
	}

	public void setIdCteCabecalho(Integer idCteCabecalho) {
		this.idCteCabecalho = idCteCabecalho;
	}

    public Integer getNumeroMinuta() {
		return this.numeroMinuta;
	}

	public void setNumeroMinuta(Integer numeroMinuta) {
		this.numeroMinuta = numeroMinuta;
	}

    public Integer getNumeroConhecimento() {
		return this.numeroConhecimento;
	}

	public void setNumeroConhecimento(Integer numeroConhecimento) {
		this.numeroConhecimento = numeroConhecimento;
	}

    public Date getDataPrevistaEntrega() {
		return this.dataPrevistaEntrega;
	}

	public void setDataPrevistaEntrega(Date dataPrevistaEntrega) {
		this.dataPrevistaEntrega = dataPrevistaEntrega;
	}

    public String getTarifaClasse() {
		return this.tarifaClasse;
	}

	public void setTarifaClasse(String tarifaClasse) {
		this.tarifaClasse = tarifaClasse;
	}

    public String getTarifaCodigo() {
		return this.tarifaCodigo;
	}

	public void setTarifaCodigo(String tarifaCodigo) {
		this.tarifaCodigo = tarifaCodigo;
	}

    public BigDecimal getTarifaValor() {
		return this.tarifaValor;
	}

	public void setTarifaValor(BigDecimal tarifaValor) {
		this.tarifaValor = tarifaValor;
	}

    public String getCargaDimensao() {
		return this.cargaDimensao;
	}

	public void setCargaDimensao(String cargaDimensao) {
		this.cargaDimensao = cargaDimensao;
	}

    public String getCargaInformacaoManuseio() {
		return this.cargaInformacaoManuseio;
	}

	public void setCargaInformacaoManuseio(String cargaInformacaoManuseio) {
		this.cargaInformacaoManuseio = cargaInformacaoManuseio;
	}

    public String getCargaEspecial() {
		return this.cargaEspecial;
	}

	public void setCargaEspecial(String cargaEspecial) {
		this.cargaEspecial = cargaEspecial;
	}

		
}