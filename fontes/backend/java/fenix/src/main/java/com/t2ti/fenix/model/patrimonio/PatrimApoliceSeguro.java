/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PATRIM_APOLICE_SEGURO] 
                                                                                
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
@Table(name="PATRIM_APOLICE_SEGURO")
@NamedQuery(name="PatrimApoliceSeguro.findAll", query="SELECT t FROM PatrimApoliceSeguro t")
public class PatrimApoliceSeguro implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_PATRIM_BEM")
	private Integer idPatrimBem;

    @Column(name="ID_SEGURADORA")
	private Integer idSeguradora;

    @Column(name="NUMERO")
	private String numero;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_CONTRATACAO")
	private Date dataContratacao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_VENCIMENTO")
	private Date dataVencimento;

    @Column(name="VALOR_PREMIO")
	private BigDecimal valorPremio;

    @Column(name="VALOR_SEGURADO")
	private BigDecimal valorSegurado;

    @Column(name="OBSERVACAO")
	private String observacao;

    @Column(name="IMAGEM")
	private String imagem;

	public PatrimApoliceSeguro() {
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

    public Integer getIdSeguradora() {
		return this.idSeguradora;
	}

	public void setIdSeguradora(Integer idSeguradora) {
		this.idSeguradora = idSeguradora;
	}

    public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

    public Date getDataContratacao() {
		return this.dataContratacao;
	}

	public void setDataContratacao(Date dataContratacao) {
		this.dataContratacao = dataContratacao;
	}

    public Date getDataVencimento() {
		return this.dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

    public BigDecimal getValorPremio() {
		return this.valorPremio;
	}

	public void setValorPremio(BigDecimal valorPremio) {
		this.valorPremio = valorPremio;
	}

    public BigDecimal getValorSegurado() {
		return this.valorSegurado;
	}

	public void setValorSegurado(BigDecimal valorSegurado) {
		this.valorSegurado = valorSegurado;
	}

    public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

    public String getImagem() {
		return this.imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

		
}