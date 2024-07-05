/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PPP] 
                                                                                
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
package com.t2ti.fenix.model.folha;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.t2ti.fenix.model.cadastros.Colaborador;

@Entity
@Table(name="FOLHA_PPP")
@NamedQuery(name="FolhaPpp.findAll", query="SELECT t FROM FolhaPpp t")
public class FolhaPpp implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="OBSERVACAO")
	private String observacao;

    @ManyToOne
	@JoinColumn(name="ID_COLABORADOR")
    private Colaborador colaborador;

    @OneToMany(mappedBy = "folhaPpp", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<FolhaPppAtividade> listaFolhaPppAtividade;

    @OneToMany(mappedBy = "folhaPpp", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<FolhaPppCat> listaFolhaPppCat;

    @OneToMany(mappedBy = "folhaPpp", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<FolhaPppExameMedico> listaFolhaPppExameMedico;

    @OneToMany(mappedBy = "folhaPpp", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<FolhaPppFatorRisco> listaFolhaPppFatorRisco;

	public FolhaPpp() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

    public Colaborador getColaborador() {
		return this.colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

    public Set<FolhaPppAtividade> getListaFolhaPppAtividade() {
		return this.listaFolhaPppAtividade;
	}

	public void setListaFolhaPppAtividade(Set<FolhaPppAtividade> listaFolhaPppAtividade) {
		this.listaFolhaPppAtividade = listaFolhaPppAtividade;
		for (FolhaPppAtividade folhaPppAtividade : listaFolhaPppAtividade) {
			folhaPppAtividade.setFolhaPpp(this);
		}
	}

    public Set<FolhaPppCat> getListaFolhaPppCat() {
		return this.listaFolhaPppCat;
	}

	public void setListaFolhaPppCat(Set<FolhaPppCat> listaFolhaPppCat) {
		this.listaFolhaPppCat = listaFolhaPppCat;
		for (FolhaPppCat folhaPppCat : listaFolhaPppCat) {
			folhaPppCat.setFolhaPpp(this);
		}
	}

    public Set<FolhaPppExameMedico> getListaFolhaPppExameMedico() {
		return this.listaFolhaPppExameMedico;
	}

	public void setListaFolhaPppExameMedico(Set<FolhaPppExameMedico> listaFolhaPppExameMedico) {
		this.listaFolhaPppExameMedico = listaFolhaPppExameMedico;
		for (FolhaPppExameMedico folhaPppExameMedico : listaFolhaPppExameMedico) {
			folhaPppExameMedico.setFolhaPpp(this);
		}
	}

    public Set<FolhaPppFatorRisco> getListaFolhaPppFatorRisco() {
		return this.listaFolhaPppFatorRisco;
	}

	public void setListaFolhaPppFatorRisco(Set<FolhaPppFatorRisco> listaFolhaPppFatorRisco) {
		this.listaFolhaPppFatorRisco = listaFolhaPppFatorRisco;
		for (FolhaPppFatorRisco folhaPppFatorRisco : listaFolhaPppFatorRisco) {
			folhaPppFatorRisco.setFolhaPpp(this);
		}
	}

		
}