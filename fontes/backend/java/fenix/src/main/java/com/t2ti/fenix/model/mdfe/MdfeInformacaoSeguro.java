/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_INFORMACAO_SEGURO] 
                                                                                
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
package com.t2ti.fenix.model.mdfe;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="MDFE_INFORMACAO_SEGURO")
@NamedQuery(name="MdfeInformacaoSeguro.findAll", query="SELECT t FROM MdfeInformacaoSeguro t")
public class MdfeInformacaoSeguro implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_MDFE_CABECALHO")
	private Integer idMdfeCabecalho;

    @Column(name="RESPONSAVEL")
	private Integer responsavel;

    @Column(name="CNPJ_CPF")
	private String cnpjCpf;

    @Column(name="SEGURADORA")
	private String seguradora;

    @Column(name="CNPJ_SEGURADORA")
	private String cnpjSeguradora;

    @Column(name="APOLICE")
	private String apolice;

    @Column(name="AVERBACAO")
	private String averbacao;

	public MdfeInformacaoSeguro() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdMdfeCabecalho() {
		return this.idMdfeCabecalho;
	}

	public void setIdMdfeCabecalho(Integer idMdfeCabecalho) {
		this.idMdfeCabecalho = idMdfeCabecalho;
	}

    public Integer getResponsavel() {
		return this.responsavel;
	}

	public void setResponsavel(Integer responsavel) {
		this.responsavel = responsavel;
	}

    public String getCnpjCpf() {
		return this.cnpjCpf;
	}

	public void setCnpjCpf(String cnpjCpf) {
		this.cnpjCpf = cnpjCpf;
	}

    public String getSeguradora() {
		return this.seguradora;
	}

	public void setSeguradora(String seguradora) {
		this.seguradora = seguradora;
	}

    public String getCnpjSeguradora() {
		return this.cnpjSeguradora;
	}

	public void setCnpjSeguradora(String cnpjSeguradora) {
		this.cnpjSeguradora = cnpjSeguradora;
	}

    public String getApolice() {
		return this.apolice;
	}

	public void setApolice(String apolice) {
		this.apolice = apolice;
	}

    public String getAverbacao() {
		return this.averbacao;
	}

	public void setAverbacao(String averbacao) {
		this.averbacao = averbacao;
	}

		
}