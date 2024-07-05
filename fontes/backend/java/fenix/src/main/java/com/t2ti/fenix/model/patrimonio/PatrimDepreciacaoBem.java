/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PATRIM_DEPRECIACAO_BEM] 
                                                                                
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
package com.t2ti.fenix.model.patrimonio;

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
@Table(name="PATRIM_DEPRECIACAO_BEM")
@NamedQuery(name="PatrimDepreciacaoBem.findAll", query="SELECT t FROM PatrimDepreciacaoBem t")
public class PatrimDepreciacaoBem implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_PATRIM_BEM")
	private Integer idPatrimBem;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_DEPRECIACAO")
	private Date dataDepreciacao;

    @Column(name="DIAS")
	private Integer dias;

    @Column(name="TAXA")
	private BigDecimal taxa;

    @Column(name="INDICE")
	private BigDecimal indice;

    @Column(name="VALOR")
	private BigDecimal valor;

    @Column(name="DEPRECIACAO_ACUMULADA")
	private BigDecimal depreciacaoAcumulada;

	public PatrimDepreciacaoBem() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdPatrimBem() {
		return this.idPatrimBem;
	}

	public void setIdPatrimBem(Integer idPatrimBem) {
		this.idPatrimBem = idPatrimBem;
	}

    public Date getDataDepreciacao() {
		return this.dataDepreciacao;
	}

	public void setDataDepreciacao(Date dataDepreciacao) {
		this.dataDepreciacao = dataDepreciacao;
	}

    public Integer getDias() {
		return this.dias;
	}

	public void setDias(Integer dias) {
		this.dias = dias;
	}

    public BigDecimal getTaxa() {
		return this.taxa;
	}

	public void setTaxa(BigDecimal taxa) {
		this.taxa = taxa;
	}

    public BigDecimal getIndice() {
		return this.indice;
	}

	public void setIndice(BigDecimal indice) {
		this.indice = indice;
	}

    public BigDecimal getValor() {
		return this.valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

    public BigDecimal getDepreciacaoAcumulada() {
		return this.depreciacaoAcumulada;
	}

	public void setDepreciacaoAcumulada(BigDecimal depreciacaoAcumulada) {
		this.depreciacaoAcumulada = depreciacaoAcumulada;
	}

		
}