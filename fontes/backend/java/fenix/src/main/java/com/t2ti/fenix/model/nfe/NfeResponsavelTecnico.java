/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_RESPONSAVEL_TECNICO] 
                                                                                
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
package com.t2ti.fenix.model.nfe;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="NFE_RESPONSAVEL_TECNICO")
@NamedQuery(name="NfeResponsavelTecnico.findAll", query="SELECT t FROM NfeResponsavelTecnico t")
public class NfeResponsavelTecnico implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CNPJ")
	private String cnpj;

    @Column(name="CONTATO")
	private String contato;

    @Column(name="EMAIL")
	private String email;

    @Column(name="TELEFONE")
	private String telefone;

    @Column(name="IDENTIFICADOR_CSRT")
	private String identificadorCsrt;

    @Column(name="HASH_CSRT")
	private String hashCsrt;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

	public NfeResponsavelTecnico() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

    public String getContato() {
		return this.contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
	}

    public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

    public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

    public String getIdentificadorCsrt() {
		return this.identificadorCsrt;
	}

	public void setIdentificadorCsrt(String identificadorCsrt) {
		this.identificadorCsrt = identificadorCsrt;
	}

    public String getHashCsrt() {
		return this.hashCsrt;
	}

	public void setHashCsrt(String hashCsrt) {
		this.hashCsrt = hashCsrt;
	}

    public NfeCabecalho getNfeCabecalho() {
		return this.nfeCabecalho;
	}

	public void setNfeCabecalho(NfeCabecalho nfeCabecalho) {
		this.nfeCabecalho = nfeCabecalho;
	}

		
}