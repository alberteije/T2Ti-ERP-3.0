/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_DRE_DETALHE] 
                                                                                
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
@Table(name="CONTABIL_DRE_DETALHE")
@NamedQuery(name="ContabilDreDetalhe.findAll", query="SELECT t FROM ContabilDreDetalhe t")
public class ContabilDreDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CONTABIL_DRE_CABECALHO")
	private Integer idContabilDreCabecalho;

    @Column(name="CLASSIFICACAO")
	private String classificacao;

    @Column(name="DESCRICAO")
	private String descricao;

    @Column(name="FORMA_CALCULO")
	private String formaCalculo;

    @Column(name="SINAL")
	private String sinal;

    @Column(name="NATUREZA")
	private String natureza;

    @Column(name="VALOR")
	private BigDecimal valor;

	public ContabilDreDetalhe() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdContabilDreCabecalho() {
		return this.idContabilDreCabecalho;
	}

	public void setIdContabilDreCabecalho(Integer idContabilDreCabecalho) {
		this.idContabilDreCabecalho = idContabilDreCabecalho;
	}

    public String getClassificacao() {
		return this.classificacao;
	}

	public void setClassificacao(String classificacao) {
		this.classificacao = classificacao;
	}

    public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

    public String getFormaCalculo() {
		return this.formaCalculo;
	}

	public void setFormaCalculo(String formaCalculo) {
		this.formaCalculo = formaCalculo;
	}

    public String getSinal() {
		return this.sinal;
	}

	public void setSinal(String sinal) {
		this.sinal = sinal;
	}

    public String getNatureza() {
		return this.natureza;
	}

	public void setNatureza(String natureza) {
		this.natureza = natureza;
	}

    public BigDecimal getValor() {
		return this.valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

		
}