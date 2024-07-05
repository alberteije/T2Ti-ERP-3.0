/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_COTACAO] 
                                                                                
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
package com.t2ti.fenix.model.compras;

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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@Table(name="COMPRA_COTACAO")
@NamedQuery(name="CompraCotacao.findAll", query="SELECT t FROM CompraCotacao t")
public class CompraCotacao implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_COTACAO")
	private Date dataCotacao;

    @Column(name="DESCRICAO")
	private String descricao;

    @ManyToOne
	@JoinColumn(name="ID_COMPRA_REQUISICAO")
    private CompraRequisicao compraRequisicao;

    @OneToMany(mappedBy = "compraCotacao", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CompraFornecedorCotacao> listaCompraFornecedorCotacao;

	public CompraCotacao() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getDataCotacao() {
		return this.dataCotacao;
	}

	public void setDataCotacao(Date dataCotacao) {
		this.dataCotacao = dataCotacao;
	}

    public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

    public CompraRequisicao getCompraRequisicao() {
		return this.compraRequisicao;
	}

	public void setCompraRequisicao(CompraRequisicao compraRequisicao) {
		this.compraRequisicao = compraRequisicao;
	}

    public Set<CompraFornecedorCotacao> getListaCompraFornecedorCotacao() {
		return this.listaCompraFornecedorCotacao;
	}

	public void setListaCompraFornecedorCotacao(Set<CompraFornecedorCotacao> listaCompraFornecedorCotacao) {
		this.listaCompraFornecedorCotacao = listaCompraFornecedorCotacao;
		for (CompraFornecedorCotacao compraFornecedorCotacao : listaCompraFornecedorCotacao) {
			compraFornecedorCotacao.setCompraCotacao(this);
		}
	}

		
}