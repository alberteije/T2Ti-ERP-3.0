/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [ETIQUETA_TEMPLATE] 
                                                                                
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
package com.t2ti.fenix.model.etiquetas;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="ETIQUETA_TEMPLATE")
@NamedQuery(name="EtiquetaTemplate.findAll", query="SELECT t FROM EtiquetaTemplate t")
public class EtiquetaTemplate implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_ETIQUETA_LAYOUT")
	private Integer idEtiquetaLayout;

    @Column(name="TABELA")
	private String tabela;

    @Column(name="CAMPO")
	private String campo;

    @Column(name="FORMATO")
	private Integer formato;

    @Column(name="QUANTIDADE_REPETICOES")
	private Integer quantidadeRepeticoes;

    @Column(name="FILTRO")
	private String filtro;

	public EtiquetaTemplate() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdEtiquetaLayout() {
		return this.idEtiquetaLayout;
	}

	public void setIdEtiquetaLayout(Integer idEtiquetaLayout) {
		this.idEtiquetaLayout = idEtiquetaLayout;
	}

    public String getTabela() {
		return this.tabela;
	}

	public void setTabela(String tabela) {
		this.tabela = tabela;
	}

    public String getCampo() {
		return this.campo;
	}

	public void setCampo(String campo) {
		this.campo = campo;
	}

    public Integer getFormato() {
		return this.formato;
	}

	public void setFormato(Integer formato) {
		this.formato = formato;
	}

    public Integer getQuantidadeRepeticoes() {
		return this.quantidadeRepeticoes;
	}

	public void setQuantidadeRepeticoes(Integer quantidadeRepeticoes) {
		this.quantidadeRepeticoes = quantidadeRepeticoes;
	}

    public String getFiltro() {
		return this.filtro;
	}

	public void setFiltro(String filtro) {
		this.filtro = filtro;
	}

		
}