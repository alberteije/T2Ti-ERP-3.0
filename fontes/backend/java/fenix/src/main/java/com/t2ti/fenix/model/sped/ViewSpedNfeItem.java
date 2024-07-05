/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_NFE_ITEM] 
                                                                                
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
package com.t2ti.fenix.model.sped;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.t2ti.fenix.model.cadastros.ProdutoUnidade;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Table(name="VIEW_SPED_NFE_ITEM")
@NamedQuery(name="ViewSpedNfeItem.findAll", query="SELECT t FROM ViewSpedNfeItem t")
public class ViewSpedNfeItem implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NOME")
	private String nome;

    @Column(name="GTIN")
	private String gtin;

    @Column(name="SIGLA")
	private String sigla;

    @Column(name="CODIGO_NCM")
	private String codigoNcm;

    @ManyToOne
	@JoinColumn(name="ID_PRODUTO_UNIDADE")
    private ProdutoUnidade produtoUnidade;

	public ViewSpedNfeItem() {
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

    public String getGtin() {
		return this.gtin;
	}

	public void setGtin(String gtin) {
		this.gtin = gtin;
	}

    public String getSigla() {
		return this.sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

    public String getCodigoNcm() {
		return this.codigoNcm;
	}

	public void setCodigoNcm(String codigoNcm) {
		this.codigoNcm = codigoNcm;
	}

    public ProdutoUnidade getProdutoUnidade() {
		return this.produtoUnidade;
	}

	public void setProdutoUnidade(ProdutoUnidade produtoUnidade) {
		this.produtoUnidade = produtoUnidade;
	}

		
}