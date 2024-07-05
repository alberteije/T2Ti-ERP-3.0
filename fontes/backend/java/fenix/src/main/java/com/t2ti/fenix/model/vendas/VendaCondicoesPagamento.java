/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
package com.t2ti.fenix.model.vendas;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@Table(name="VENDA_CONDICOES_PAGAMENTO")
@NamedQuery(name="VendaCondicoesPagamento.findAll", query="SELECT t FROM VendaCondicoesPagamento t")
public class VendaCondicoesPagamento implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NOME")
	private String nome;

    @Column(name="DESCRICAO")
	private String descricao;

    @Column(name="FATURAMENTO_MINIMO")
	private BigDecimal faturamentoMinimo;

    @Column(name="FATURAMENTO_MAXIMO")
	private BigDecimal faturamentoMaximo;

    @Column(name="INDICE_CORRECAO")
	private BigDecimal indiceCorrecao;

    @Column(name="DIAS_TOLERANCIA")
	private Integer diasTolerancia;

    @Column(name="VALOR_TOLERANCIA")
	private BigDecimal valorTolerancia;

    @Column(name="PRAZO_MEDIO")
	private Integer prazoMedio;

    @Column(name="VISTA_PRAZO")
	private String vistaPrazo;

    @OneToMany(mappedBy = "vendaCondicoesPagamento", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<VendaCondicoesParcelas> listaVendaCondicoesParcelas;

	public VendaCondicoesPagamento() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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

    public BigDecimal getFaturamentoMinimo() {
		return this.faturamentoMinimo;
	}

	public void setFaturamentoMinimo(BigDecimal faturamentoMinimo) {
		this.faturamentoMinimo = faturamentoMinimo;
	}

    public BigDecimal getFaturamentoMaximo() {
		return this.faturamentoMaximo;
	}

	public void setFaturamentoMaximo(BigDecimal faturamentoMaximo) {
		this.faturamentoMaximo = faturamentoMaximo;
	}

    public BigDecimal getIndiceCorrecao() {
		return this.indiceCorrecao;
	}

	public void setIndiceCorrecao(BigDecimal indiceCorrecao) {
		this.indiceCorrecao = indiceCorrecao;
	}

    public Integer getDiasTolerancia() {
		return this.diasTolerancia;
	}

	public void setDiasTolerancia(Integer diasTolerancia) {
		this.diasTolerancia = diasTolerancia;
	}

    public BigDecimal getValorTolerancia() {
		return this.valorTolerancia;
	}

	public void setValorTolerancia(BigDecimal valorTolerancia) {
		this.valorTolerancia = valorTolerancia;
	}

    public Integer getPrazoMedio() {
		return this.prazoMedio;
	}

	public void setPrazoMedio(Integer prazoMedio) {
		this.prazoMedio = prazoMedio;
	}

    public String getVistaPrazo() {
		return this.vistaPrazo;
	}

	public void setVistaPrazo(String vistaPrazo) {
		this.vistaPrazo = vistaPrazo;
	}

    public Set<VendaCondicoesParcelas> getListaVendaCondicoesParcelas() {
		return this.listaVendaCondicoesParcelas;
	}

	public void setListaVendaCondicoesParcelas(Set<VendaCondicoesParcelas> listaVendaCondicoesParcelas) {
		this.listaVendaCondicoesParcelas = listaVendaCondicoesParcelas;
		for (VendaCondicoesParcelas vendaCondicoesParcelas : listaVendaCondicoesParcelas) {
			vendaCondicoesParcelas.setVendaCondicoesPagamento(this);
		}
	}

		
}