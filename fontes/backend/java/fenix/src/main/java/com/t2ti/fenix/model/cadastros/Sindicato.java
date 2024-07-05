/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [SINDICATO] 
                                                                                
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
package com.t2ti.fenix.model.cadastros;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="SINDICATO")
@NamedQuery(name="Sindicato.findAll", query="SELECT t FROM Sindicato t")
public class Sindicato implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NOME")
	private String nome;

    @Column(name="CODIGO_BANCO")
	private Integer codigoBanco;

    @Column(name="CODIGO_AGENCIA")
	private Integer codigoAgencia;

    @Column(name="CONTA_BANCO")
	private String contaBanco;

    @Column(name="CODIGO_CEDENTE")
	private String codigoCedente;

    @Column(name="LOGRADOURO")
	private String logradouro;

    @Column(name="NUMERO")
	private String numero;

    @Column(name="BAIRRO")
	private String bairro;

    @Column(name="MUNICIPIO_IBGE")
	private Integer municipioIbge;

    @Column(name="UF")
	private String uf;

    @Column(name="FONE1")
	private String fone1;

    @Column(name="FONE2")
	private String fone2;

    @Column(name="EMAIL")
	private String email;

    @Column(name="TIPO_SINDICATO")
	private String tipoSindicato;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_BASE")
	private Date dataBase;

    @Column(name="PISO_SALARIAL")
	private BigDecimal pisoSalarial;

    @Column(name="CNPJ")
	private String cnpj;

    @Column(name="CLASSIFICACAO_CONTABIL_CONTA")
	private String classificacaoContabilConta;

	public Sindicato() {
		//construtor padrão
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

    public Integer getCodigoBanco() {
		return this.codigoBanco;
	}

	public void setCodigoBanco(Integer codigoBanco) {
		this.codigoBanco = codigoBanco;
	}

    public Integer getCodigoAgencia() {
		return this.codigoAgencia;
	}

	public void setCodigoAgencia(Integer codigoAgencia) {
		this.codigoAgencia = codigoAgencia;
	}

    public String getContaBanco() {
		return this.contaBanco;
	}

	public void setContaBanco(String contaBanco) {
		this.contaBanco = contaBanco;
	}

    public String getCodigoCedente() {
		return this.codigoCedente;
	}

	public void setCodigoCedente(String codigoCedente) {
		this.codigoCedente = codigoCedente;
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

    public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

    public Integer getMunicipioIbge() {
		return this.municipioIbge;
	}

	public void setMunicipioIbge(Integer municipioIbge) {
		this.municipioIbge = municipioIbge;
	}

    public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

    public String getFone1() {
		return this.fone1;
	}

	public void setFone1(String fone1) {
		this.fone1 = fone1;
	}

    public String getFone2() {
		return this.fone2;
	}

	public void setFone2(String fone2) {
		this.fone2 = fone2;
	}

    public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

    public String getTipoSindicato() {
		return this.tipoSindicato;
	}

	public void setTipoSindicato(String tipoSindicato) {
		this.tipoSindicato = tipoSindicato;
	}

    public Date getDataBase() {
		return this.dataBase;
	}

	public void setDataBase(Date dataBase) {
		this.dataBase = dataBase;
	}

    public BigDecimal getPisoSalarial() {
		return this.pisoSalarial;
	}

	public void setPisoSalarial(BigDecimal pisoSalarial) {
		this.pisoSalarial = pisoSalarial;
	}

    public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

    public String getClassificacaoContabilConta() {
		return this.classificacaoContabilConta;
	}

	public void setClassificacaoContabilConta(String classificacaoContabilConta) {
		this.classificacaoContabilConta = classificacaoContabilConta;
	}

		
}