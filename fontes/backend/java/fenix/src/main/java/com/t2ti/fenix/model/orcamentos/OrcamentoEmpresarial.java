/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [ORCAMENTO_EMPRESARIAL] 
                                                                                
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
package com.t2ti.fenix.model.orcamentos;

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
@Table(name="ORCAMENTO_EMPRESARIAL")
@NamedQuery(name="OrcamentoEmpresarial.findAll", query="SELECT t FROM OrcamentoEmpresarial t")
public class OrcamentoEmpresarial implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_ORCAMENTO_PERIODO")
	private Integer idOrcamentoPeriodo;

    @Column(name="NOME")
	private String nome;

    @Column(name="DESCRICAO")
	private String descricao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_INICIAL")
	private Date dataInicial;

    @Column(name="NUMERO_PERIODOS")
	private Integer numeroPeriodos;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_BASE")
	private Date dataBase;

	public OrcamentoEmpresarial() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdOrcamentoPeriodo() {
		return this.idOrcamentoPeriodo;
	}

	public void setIdOrcamentoPeriodo(Integer idOrcamentoPeriodo) {
		this.idOrcamentoPeriodo = idOrcamentoPeriodo;
	}

    public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

    public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

    public Date getDataInicial() {
		return this.dataInicial;
	}

	public void setDataInicial(Date dataInicial) {
		this.dataInicial = dataInicial;
	}

    public Integer getNumeroPeriodos() {
		return this.numeroPeriodos;
	}

	public void setNumeroPeriodos(Integer numeroPeriodos) {
		this.numeroPeriodos = numeroPeriodos;
	}

    public Date getDataBase() {
		return this.dataBase;
	}

	public void setDataBase(Date dataBase) {
		this.dataBase = dataBase;
	}

		
}