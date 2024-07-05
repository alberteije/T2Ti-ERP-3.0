/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
package com.t2ti.fenix.model.estoque;

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

import com.t2ti.fenix.model.cadastros.Colaborador;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@Table(name="ESTOQUE_REAJUSTE_CABECALHO")
@NamedQuery(name="EstoqueReajusteCabecalho.findAll", query="SELECT t FROM EstoqueReajusteCabecalho t")
public class EstoqueReajusteCabecalho implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_REAJUSTE")
	private Date dataReajuste;

    @Column(name="TAXA")
	private BigDecimal taxa;

    @Column(name="TIPO_REAJUSTE")
	private String tipoReajuste;

    @Column(name="JUSTIFICATIVA")
	private String justificativa;

    @ManyToOne
	@JoinColumn(name="ID_COLABORADOR")
    private Colaborador colaborador;

    @OneToMany(mappedBy = "estoqueReajusteCabecalho", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<EstoqueReajusteDetalhe> listaEstoqueReajusteDetalhe;

	public EstoqueReajusteCabecalho() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getDataReajuste() {
		return this.dataReajuste;
	}

	public void setDataReajuste(Date dataReajuste) {
		this.dataReajuste = dataReajuste;
	}

    public BigDecimal getTaxa() {
		return this.taxa;
	}

	public void setTaxa(BigDecimal taxa) {
		this.taxa = taxa;
	}

    public String getTipoReajuste() {
		return this.tipoReajuste;
	}

	public void setTipoReajuste(String tipoReajuste) {
		this.tipoReajuste = tipoReajuste;
	}

    public String getJustificativa() {
		return this.justificativa;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}

    public Colaborador getColaborador() {
		return this.colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

    public Set<EstoqueReajusteDetalhe> getListaEstoqueReajusteDetalhe() {
		return this.listaEstoqueReajusteDetalhe;
	}

	public void setListaEstoqueReajusteDetalhe(Set<EstoqueReajusteDetalhe> listaEstoqueReajusteDetalhe) {
		this.listaEstoqueReajusteDetalhe = listaEstoqueReajusteDetalhe;
		for (EstoqueReajusteDetalhe estoqueReajusteDetalhe : listaEstoqueReajusteDetalhe) {
			estoqueReajusteDetalhe.setEstoqueReajusteCabecalho(this);
		}
	}

		
}