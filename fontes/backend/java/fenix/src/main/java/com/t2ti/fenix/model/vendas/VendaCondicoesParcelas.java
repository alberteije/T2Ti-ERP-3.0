/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_CONDICOES_PARCELAS] 
                                                                                
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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="VENDA_CONDICOES_PARCELAS")
@NamedQuery(name="VendaCondicoesParcelas.findAll", query="SELECT t FROM VendaCondicoesParcelas t")
public class VendaCondicoesParcelas implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="PARCELA")
	private Integer parcela;

    @Column(name="DIAS")
	private Integer dias;

    @Column(name="TAXA")
	private BigDecimal taxa;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_VENDA_CONDICOES_PAGAMENTO")
    private VendaCondicoesPagamento vendaCondicoesPagamento;

	public VendaCondicoesParcelas() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getParcela() {
		return this.parcela;
	}

	public void setParcela(Integer parcela) {
		this.parcela = parcela;
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

    public VendaCondicoesPagamento getVendaCondicoesPagamento() {
		return this.vendaCondicoesPagamento;
	}

	public void setVendaCondicoesPagamento(VendaCondicoesPagamento vendaCondicoesPagamento) {
		this.vendaCondicoesPagamento = vendaCondicoesPagamento;
	}

		
}