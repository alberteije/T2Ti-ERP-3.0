/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_LANCAMENTO_ORCADO] 
                                                                                
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
package com.t2ti.fenix.model.contabilidade;

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
@Table(name="CONTABIL_LANCAMENTO_ORCADO")
@NamedQuery(name="ContabilLancamentoOrcado.findAll", query="SELECT t FROM ContabilLancamentoOrcado t")
public class ContabilLancamentoOrcado implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CONTABIL_CONTA")
	private Integer idContabilConta;

    @Column(name="ANO")
	private String ano;

    @Column(name="JANEIRO")
	private BigDecimal janeiro;

    @Column(name="FEVEREIRO")
	private BigDecimal fevereiro;

    @Column(name="MARCO")
	private BigDecimal marco;

    @Column(name="ABRIL")
	private BigDecimal abril;

    @Column(name="MAIO")
	private BigDecimal maio;

    @Column(name="JUNHO")
	private BigDecimal junho;

    @Column(name="JULHO")
	private BigDecimal julho;

    @Column(name="AGOSTO")
	private BigDecimal agosto;

    @Column(name="SETEMBRO")
	private BigDecimal setembro;

    @Column(name="OUTUBRO")
	private BigDecimal outubro;

    @Column(name="NOVEMBRO")
	private BigDecimal novembro;

    @Column(name="DEZEMBRO")
	private BigDecimal dezembro;

	public ContabilLancamentoOrcado() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdContabilConta() {
		return this.idContabilConta;
	}

	public void setIdContabilConta(Integer idContabilConta) {
		this.idContabilConta = idContabilConta;
	}

    public String getAno() {
		return this.ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

    public BigDecimal getJaneiro() {
		return this.janeiro;
	}

	public void setJaneiro(BigDecimal janeiro) {
		this.janeiro = janeiro;
	}

    public BigDecimal getFevereiro() {
		return this.fevereiro;
	}

	public void setFevereiro(BigDecimal fevereiro) {
		this.fevereiro = fevereiro;
	}

    public BigDecimal getMarco() {
		return this.marco;
	}

	public void setMarco(BigDecimal marco) {
		this.marco = marco;
	}

    public BigDecimal getAbril() {
		return this.abril;
	}

	public void setAbril(BigDecimal abril) {
		this.abril = abril;
	}

    public BigDecimal getMaio() {
		return this.maio;
	}

	public void setMaio(BigDecimal maio) {
		this.maio = maio;
	}

    public BigDecimal getJunho() {
		return this.junho;
	}

	public void setJunho(BigDecimal junho) {
		this.junho = junho;
	}

    public BigDecimal getJulho() {
		return this.julho;
	}

	public void setJulho(BigDecimal julho) {
		this.julho = julho;
	}

    public BigDecimal getAgosto() {
		return this.agosto;
	}

	public void setAgosto(BigDecimal agosto) {
		this.agosto = agosto;
	}

    public BigDecimal getSetembro() {
		return this.setembro;
	}

	public void setSetembro(BigDecimal setembro) {
		this.setembro = setembro;
	}

    public BigDecimal getOutubro() {
		return this.outubro;
	}

	public void setOutubro(BigDecimal outubro) {
		this.outubro = outubro;
	}

    public BigDecimal getNovembro() {
		return this.novembro;
	}

	public void setNovembro(BigDecimal novembro) {
		this.novembro = novembro;
	}

    public BigDecimal getDezembro() {
		return this.dezembro;
	}

	public void setDezembro(BigDecimal dezembro) {
		this.dezembro = dezembro;
	}

		
}