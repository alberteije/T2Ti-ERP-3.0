/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [ETIQUETA_LAYOUT] 
                                                                                
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
@Table(name="ETIQUETA_LAYOUT")
@NamedQuery(name="EtiquetaLayout.findAll", query="SELECT t FROM EtiquetaLayout t")
public class EtiquetaLayout implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_FORMATO_PAPEL")
	private Integer idFormatoPapel;

    @Column(name="CODIGO_FABRICANTE")
	private String codigoFabricante;

    @Column(name="QUANTIDADE")
	private Integer quantidade;

    @Column(name="QUANTIDADE_HORIZONTAL")
	private Integer quantidadeHorizontal;

    @Column(name="QUANTIDADE_VERTICAL")
	private Integer quantidadeVertical;

    @Column(name="MARGEM_SUPERIOR")
	private Integer margemSuperior;

    @Column(name="MARGEM_INFERIOR")
	private Integer margemInferior;

    @Column(name="MARGEM_ESQUERDA")
	private Integer margemEsquerda;

    @Column(name="MARGEM_DIREITA")
	private Integer margemDireita;

    @Column(name="ESPACAMENTO_HORIZONTAL")
	private Integer espacamentoHorizontal;

    @Column(name="ESPACAMENTO_VERTICAL")
	private Integer espacamentoVertical;

	public EtiquetaLayout() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdFormatoPapel() {
		return this.idFormatoPapel;
	}

	public void setIdFormatoPapel(Integer idFormatoPapel) {
		this.idFormatoPapel = idFormatoPapel;
	}

    public String getCodigoFabricante() {
		return this.codigoFabricante;
	}

	public void setCodigoFabricante(String codigoFabricante) {
		this.codigoFabricante = codigoFabricante;
	}

    public Integer getQuantidade() {
		return this.quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

    public Integer getQuantidadeHorizontal() {
		return this.quantidadeHorizontal;
	}

	public void setQuantidadeHorizontal(Integer quantidadeHorizontal) {
		this.quantidadeHorizontal = quantidadeHorizontal;
	}

    public Integer getQuantidadeVertical() {
		return this.quantidadeVertical;
	}

	public void setQuantidadeVertical(Integer quantidadeVertical) {
		this.quantidadeVertical = quantidadeVertical;
	}

    public Integer getMargemSuperior() {
		return this.margemSuperior;
	}

	public void setMargemSuperior(Integer margemSuperior) {
		this.margemSuperior = margemSuperior;
	}

    public Integer getMargemInferior() {
		return this.margemInferior;
	}

	public void setMargemInferior(Integer margemInferior) {
		this.margemInferior = margemInferior;
	}

    public Integer getMargemEsquerda() {
		return this.margemEsquerda;
	}

	public void setMargemEsquerda(Integer margemEsquerda) {
		this.margemEsquerda = margemEsquerda;
	}

    public Integer getMargemDireita() {
		return this.margemDireita;
	}

	public void setMargemDireita(Integer margemDireita) {
		this.margemDireita = margemDireita;
	}

    public Integer getEspacamentoHorizontal() {
		return this.espacamentoHorizontal;
	}

	public void setEspacamentoHorizontal(Integer espacamentoHorizontal) {
		this.espacamentoHorizontal = espacamentoHorizontal;
	}

    public Integer getEspacamentoVertical() {
		return this.espacamentoVertical;
	}

	public void setEspacamentoVertical(Integer espacamentoVertical) {
		this.espacamentoVertical = espacamentoVertical;
	}

		
}