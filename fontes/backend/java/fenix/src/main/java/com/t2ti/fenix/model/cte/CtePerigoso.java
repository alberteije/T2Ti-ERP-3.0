/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_PERIGOSO] 
                                                                                
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
package com.t2ti.fenix.model.cte;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="CTE_PERIGOSO")
@NamedQuery(name="CtePerigoso.findAll", query="SELECT t FROM CtePerigoso t")
public class CtePerigoso implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CTE_CABECALHO")
	private Integer idCteCabecalho;

    @Column(name="NUMERO_ONU")
	private String numeroOnu;

    @Column(name="NOME_APROPRIADO")
	private String nomeApropriado;

    @Column(name="CLASSE_RISCO")
	private String classeRisco;

    @Column(name="GRUPO_EMBALAGEM")
	private String grupoEmbalagem;

    @Column(name="QUANTIDADE_TOTAL_PRODUTO")
	private String quantidadeTotalProduto;

    @Column(name="QUANTIDADE_TIPO_VOLUME")
	private String quantidadeTipoVolume;

    @Column(name="PONTO_FULGOR")
	private String pontoFulgor;

	public CtePerigoso() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdCteCabecalho() {
		return this.idCteCabecalho;
	}

	public void setIdCteCabecalho(Integer idCteCabecalho) {
		this.idCteCabecalho = idCteCabecalho;
	}

    public String getNumeroOnu() {
		return this.numeroOnu;
	}

	public void setNumeroOnu(String numeroOnu) {
		this.numeroOnu = numeroOnu;
	}

    public String getNomeApropriado() {
		return this.nomeApropriado;
	}

	public void setNomeApropriado(String nomeApropriado) {
		this.nomeApropriado = nomeApropriado;
	}

    public String getClasseRisco() {
		return this.classeRisco;
	}

	public void setClasseRisco(String classeRisco) {
		this.classeRisco = classeRisco;
	}

    public String getGrupoEmbalagem() {
		return this.grupoEmbalagem;
	}

	public void setGrupoEmbalagem(String grupoEmbalagem) {
		this.grupoEmbalagem = grupoEmbalagem;
	}

    public String getQuantidadeTotalProduto() {
		return this.quantidadeTotalProduto;
	}

	public void setQuantidadeTotalProduto(String quantidadeTotalProduto) {
		this.quantidadeTotalProduto = quantidadeTotalProduto;
	}

    public String getQuantidadeTipoVolume() {
		return this.quantidadeTipoVolume;
	}

	public void setQuantidadeTipoVolume(String quantidadeTipoVolume) {
		this.quantidadeTipoVolume = quantidadeTipoVolume;
	}

    public String getPontoFulgor() {
		return this.pontoFulgor;
	}

	public void setPontoFulgor(String pontoFulgor) {
		this.pontoFulgor = pontoFulgor;
	}

		
}