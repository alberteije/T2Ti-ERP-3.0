/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [ORCAMENTO_DETALHE] 
                                                                                
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
import java.math.BigDecimal;

@Entity
@Table(name="ORCAMENTO_DETALHE")
@NamedQuery(name="OrcamentoDetalhe.findAll", query="SELECT t FROM OrcamentoDetalhe t")
public class OrcamentoDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_ORCAMENTO_EMPRESARIAL")
	private Integer idOrcamentoEmpresarial;

    @Column(name="ID_FIN_NATUREZA_FINANCEIRA")
	private Integer idFinNaturezaFinanceira;

    @Column(name="PERIODO")
	private String periodo;

    @Column(name="VALOR_ORCADO")
	private BigDecimal valorOrcado;

    @Column(name="VALOR_REALIZADO")
	private BigDecimal valorRealizado;

    @Column(name="TAXA_VARIACAO")
	private BigDecimal taxaVariacao;

    @Column(name="VALOR_VARIACAO")
	private BigDecimal valorVariacao;

	public OrcamentoDetalhe() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdOrcamentoEmpresarial() {
		return this.idOrcamentoEmpresarial;
	}

	public void setIdOrcamentoEmpresarial(Integer idOrcamentoEmpresarial) {
		this.idOrcamentoEmpresarial = idOrcamentoEmpresarial;
	}

    public Integer getIdFinNaturezaFinanceira() {
		return this.idFinNaturezaFinanceira;
	}

	public void setIdFinNaturezaFinanceira(Integer idFinNaturezaFinanceira) {
		this.idFinNaturezaFinanceira = idFinNaturezaFinanceira;
	}

    public String getPeriodo() {
		return this.periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

    public BigDecimal getValorOrcado() {
		return this.valorOrcado;
	}

	public void setValorOrcado(BigDecimal valorOrcado) {
		this.valorOrcado = valorOrcado;
	}

    public BigDecimal getValorRealizado() {
		return this.valorRealizado;
	}

	public void setValorRealizado(BigDecimal valorRealizado) {
		this.valorRealizado = valorRealizado;
	}

    public BigDecimal getTaxaVariacao() {
		return this.taxaVariacao;
	}

	public void setTaxaVariacao(BigDecimal taxaVariacao) {
		this.taxaVariacao = taxaVariacao;
	}

    public BigDecimal getValorVariacao() {
		return this.valorVariacao;
	}

	public void setValorVariacao(BigDecimal valorVariacao) {
		this.valorVariacao = valorVariacao;
	}

		
}