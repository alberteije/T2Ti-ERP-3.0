/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_PROD_RURAL_REFERENCIADA] 
                                                                                
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
import javax.persistence.ManyToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="NFE_PROD_RURAL_REFERENCIADA")
@NamedQuery(name="NfeProdRuralReferenciada.findAll", query="SELECT t FROM NfeProdRuralReferenciada t")
public class NfeProdRuralReferenciada implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CODIGO_UF")
	private Integer codigoUf;

    @Column(name="ANO_MES")
	private String anoMes;

    @Column(name="CNPJ")
	private String cnpj;

    @Column(name="CPF")
	private String cpf;

    @Column(name="INSCRICAO_ESTADUAL")
	private String inscricaoEstadual;

    @Column(name="MODELO")
	private String modelo;

    @Column(name="SERIE")
	private String serie;

    @Column(name="NUMERO_NF")
	private Integer numeroNf;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

	public NfeProdRuralReferenciada() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getCodigoUf() {
		return this.codigoUf;
	}

	public void setCodigoUf(Integer codigoUf) {
		this.codigoUf = codigoUf;
	}

    public String getAnoMes() {
		return this.anoMes;
	}

	public void setAnoMes(String anoMes) {
		this.anoMes = anoMes;
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

    public String getInscricaoEstadual() {
		return this.inscricaoEstadual;
	}

	public void setInscricaoEstadual(String inscricaoEstadual) {
		this.inscricaoEstadual = inscricaoEstadual;
	}

    public String getModelo() {
		return this.modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

    public String getSerie() {
		return this.serie;
	}

	public void setSerie(String serie) {
		this.serie = serie;
	}

    public Integer getNumeroNf() {
		return this.numeroNf;
	}

	public void setNumeroNf(Integer numeroNf) {
		this.numeroNf = numeroNf;
	}

    public NfeCabecalho getNfeCabecalho() {
		return this.nfeCabecalho;
	}

	public void setNfeCabecalho(NfeCabecalho nfeCabecalho) {
		this.nfeCabecalho = nfeCabecalho;
	}

		
}