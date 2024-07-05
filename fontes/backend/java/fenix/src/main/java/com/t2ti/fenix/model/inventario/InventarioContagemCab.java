/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [INVENTARIO_CONTAGEM_CAB] 
                                                                                
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
package com.t2ti.fenix.model.inventario;

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
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@Table(name="INVENTARIO_CONTAGEM_CAB")
@NamedQuery(name="InventarioContagemCab.findAll", query="SELECT t FROM InventarioContagemCab t")
public class InventarioContagemCab implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_CONTAGEM")
	private Date dataContagem;

    @Column(name="ESTOQUE_ATUALIZADO")
	private String estoqueAtualizado;

    @Column(name="TIPO")
	private String tipo;

    @OneToMany(mappedBy = "inventarioContagemCab", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<InventarioContagemDet> listaInventarioContagemDet;

	public InventarioContagemCab() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getDataContagem() {
		return this.dataContagem;
	}

	public void setDataContagem(Date dataContagem) {
		this.dataContagem = dataContagem;
	}

    public String getEstoqueAtualizado() {
		return this.estoqueAtualizado;
	}

	public void setEstoqueAtualizado(String estoqueAtualizado) {
		this.estoqueAtualizado = estoqueAtualizado;
	}

    public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

    public Set<InventarioContagemDet> getListaInventarioContagemDet() {
		return this.listaInventarioContagemDet;
	}

	public void setListaInventarioContagemDet(Set<InventarioContagemDet> listaInventarioContagemDet) {
		this.listaInventarioContagemDet = listaInventarioContagemDet;
		for (InventarioContagemDet inventarioContagemDet : listaInventarioContagemDet) {
			inventarioContagemDet.setInventarioContagemCab(this);
		}
	}

		
}