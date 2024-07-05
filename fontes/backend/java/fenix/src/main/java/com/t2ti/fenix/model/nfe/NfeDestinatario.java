/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DESTINATARIO] 
                                                                                
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
@Table(name="NFE_DESTINATARIO")
@NamedQuery(name="NfeDestinatario.findAll", query="SELECT t FROM NfeDestinatario t")
public class NfeDestinatario implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CNPJ")
	private String cnpj;

    @Column(name="CPF")
	private String cpf;

    @Column(name="ESTRANGEIRO_IDENTIFICACAO")
	private String estrangeiroIdentificacao;

    @Column(name="NOME")
	private String nome;

    @Column(name="LOGRADOURO")
	private String logradouro;

    @Column(name="NUMERO")
	private String numero;

    @Column(name="COMPLEMENTO")
	private String complemento;

    @Column(name="BAIRRO")
	private String bairro;

    @Column(name="CODIGO_MUNICIPIO")
	private Integer codigoMunicipio;

    @Column(name="NOME_MUNICIPIO")
	private String nomeMunicipio;

    @Column(name="UF")
	private String uf;

    @Column(name="CEP")
	private String cep;

    @Column(name="CODIGO_PAIS")
	private Integer codigoPais;

    @Column(name="NOME_PAIS")
	private String nomePais;

    @Column(name="TELEFONE")
	private String telefone;

    @Column(name="INDICADOR_IE")
	private String indicadorIe;

    @Column(name="INSCRICAO_ESTADUAL")
	private String inscricaoEstadual;

    @Column(name="SUFRAMA")
	private Integer suframa;

    @Column(name="INSCRICAO_MUNICIPAL")
	private String inscricaoMunicipal;

    @Column(name="EMAIL")
	private String email;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

	public NfeDestinatario() {
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

    public String getCpf() {
		return this.cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

    public String getEstrangeiroIdentificacao() {
		return this.estrangeiroIdentificacao;
	}

	public void setEstrangeiroIdentificacao(String estrangeiroIdentificacao) {
		this.estrangeiroIdentificacao = estrangeiroIdentificacao;
	}

    public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

    public String getLogradouro() {
		return this.logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

    public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

    public String getComplemento() {
		return this.complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

    public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

    public Integer getCodigoMunicipio() {
		return this.codigoMunicipio;
	}

	public void setCodigoMunicipio(Integer codigoMunicipio) {
		this.codigoMunicipio = codigoMunicipio;
	}

    public String getNomeMunicipio() {
		return this.nomeMunicipio;
	}

	public void setNomeMunicipio(String nomeMunicipio) {
		this.nomeMunicipio = nomeMunicipio;
	}

    public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

    public String getCep() {
		return this.cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

    public Integer getCodigoPais() {
		return this.codigoPais;
	}

	public void setCodigoPais(Integer codigoPais) {
		this.codigoPais = codigoPais;
	}

    public String getNomePais() {
		return this.nomePais;
	}

	public void setNomePais(String nomePais) {
		this.nomePais = nomePais;
	}

    public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

    public String getIndicadorIe() {
		return this.indicadorIe;
	}

	public void setIndicadorIe(String indicadorIe) {
		this.indicadorIe = indicadorIe;
	}

    public String getInscricaoEstadual() {
		return this.inscricaoEstadual;
	}

	public void setInscricaoEstadual(String inscricaoEstadual) {
		this.inscricaoEstadual = inscricaoEstadual;
	}

    public Integer getSuframa() {
		return this.suframa;
	}

	public void setSuframa(Integer suframa) {
		this.suframa = suframa;
	}

    public String getInscricaoMunicipal() {
		return this.inscricaoMunicipal;
	}

	public void setInscricaoMunicipal(String inscricaoMunicipal) {
		this.inscricaoMunicipal = inscricaoMunicipal;
	}

    public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

    public NfeCabecalho getNfeCabecalho() {
		return this.nfeCabecalho;
	}

	public void setNfeCabecalho(NfeCabecalho nfeCabecalho) {
		this.nfeCabecalho = nfeCabecalho;
	}

		
}