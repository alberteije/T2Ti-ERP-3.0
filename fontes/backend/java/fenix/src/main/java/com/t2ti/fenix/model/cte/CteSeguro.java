/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_SEGURO] 
                                                                                
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

@Entity
@Table(name="CTE_SEGURO")
@NamedQuery(name="CteSeguro.findAll", query="SELECT t FROM CteSeguro t")
public class CteSeguro implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CTE_CABECALHO")
	private Integer idCteCabecalho;

    @Column(name="RESPONSAVEL")
	private String responsavel;

    @Column(name="SEGURADORA")
	private String seguradora;

    @Column(name="APOLICE")
	private String apolice;

    @Column(name="AVERBACAO")
	private String averbacao;

    @Column(name="VALOR_CARGA")
	private BigDecimal valorCarga;

	public CteSeguro() {
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

    public String getResponsavel() {
		return this.responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

    public String getSeguradora() {
		return this.seguradora;
	}

	public void setSeguradora(String seguradora) {
		this.seguradora = seguradora;
	}

    public String getApolice() {
		return this.apolice;
	}

	public void setApolice(String apolice) {
		this.apolice = apolice;
	}

    public String getAverbacao() {
		return this.averbacao;
	}

	public void setAverbacao(String averbacao) {
		this.averbacao = averbacao;
	}

    public BigDecimal getValorCarga() {
		return this.valorCarga;
	}

	public void setValorCarga(BigDecimal valorCarga) {
		this.valorCarga = valorCarga;
	}

		
}