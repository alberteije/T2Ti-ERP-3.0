/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [EMPRESA] 
                                                                                
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
package com.t2ti.fenix.model.administrativo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="EMPRESA")
@NamedQuery(name="Empresa.findAll", query="SELECT t FROM Empresa t")
public class Empresa implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="RAZAO_SOCIAL")
	private String razaoSocial;

    @Column(name="NOME_FANTASIA")
	private String nomeFantasia;

    @Column(name="CNPJ")
	private String cnpj;

    @Column(name="INSCRICAO_ESTADUAL")
	private String inscricaoEstadual;

    @Column(name="INSCRICAO_MUNICIPAL")
	private String inscricaoMunicipal;

    @Column(name="TIPO_REGIME")
	private String tipoRegime;

    @Column(name="CRT")
	private String crt;

    @Column(name="EMAIL")
	private String email;

    @Column(name="SITE")
	private String site;

    @Column(name="CONTATO")
	private String contato;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_CONSTITUICAO")
	private Date dataConstituicao;

    @Column(name="TIPO")
	private String tipo;

    @Column(name="INSCRICAO_JUNTA_COMERCIAL")
	private String inscricaoJuntaComercial;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_INSC_JUNTA_COMERCIAL")
	private Date dataInscJuntaComercial;

    @Column(name="CODIGO_IBGE_CIDADE")
	private Integer codigoIbgeCidade;

    @Column(name="CODIGO_IBGE_UF")
	private Integer codigoIbgeUf;

    @Column(name="CEI")
	private String cei;

    @Column(name="CODIGO_CNAE_PRINCIPAL")
	private String codigoCnaePrincipal;

    @Transient
    private EmpresaEndereco enderecoPrincipal;
    
    @OneToMany(mappedBy = "empresa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<EmpresaContato> listaEmpresaContato;

    @OneToMany(mappedBy = "empresa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<EmpresaEndereco> listaEmpresaEndereco;

    @OneToMany(mappedBy = "empresa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<EmpresaTelefone> listaEmpresaTelefone;

	public Empresa() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getRazaoSocial() {
		return this.razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

    public String getNomeFantasia() {
		return this.nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

    public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

    public String getInscricaoEstadual() {
		return this.inscricaoEstadual;
	}

	public void setInscricaoEstadual(String inscricaoEstadual) {
		this.inscricaoEstadual = inscricaoEstadual;
	}

    public String getInscricaoMunicipal() {
		return this.inscricaoMunicipal;
	}

	public void setInscricaoMunicipal(String inscricaoMunicipal) {
		this.inscricaoMunicipal = inscricaoMunicipal;
	}

    public String getTipoRegime() {
		return this.tipoRegime;
	}

	public void setTipoRegime(String tipoRegime) {
		this.tipoRegime = tipoRegime;
	}

    public String getCrt() {
		return this.crt;
	}

	public void setCrt(String crt) {
		this.crt = crt == null ? "" : crt;
	}

    public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

    public String getSite() {
		return this.site;
	}

	public void setSite(String site) {
		this.site = site;
	}

    public String getContato() {
		return this.contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
	}

    public Date getDataConstituicao() {
		return this.dataConstituicao;
	}

	public void setDataConstituicao(Date dataConstituicao) {
		this.dataConstituicao = dataConstituicao;
	}

    public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

    public String getInscricaoJuntaComercial() {
		return this.inscricaoJuntaComercial;
	}

	public void setInscricaoJuntaComercial(String inscricaoJuntaComercial) {
		this.inscricaoJuntaComercial = inscricaoJuntaComercial;
	}

    public Date getDataInscJuntaComercial() {
		return this.dataInscJuntaComercial;
	}

	public void setDataInscJuntaComercial(Date dataInscJuntaComercial) {
		this.dataInscJuntaComercial = dataInscJuntaComercial;
	}

    public Integer getCodigoIbgeCidade() {
		return this.codigoIbgeCidade;
	}

	public void setCodigoIbgeCidade(Integer codigoIbgeCidade) {
		this.codigoIbgeCidade = codigoIbgeCidade;
	}

    public Integer getCodigoIbgeUf() {
		return this.codigoIbgeUf;
	}

	public void setCodigoIbgeUf(Integer codigoIbgeUf) {
		this.codigoIbgeUf = codigoIbgeUf;
	}

    public String getCei() {
		return this.cei;
	}

	public void setCei(String cei) {
		this.cei = cei;
	}

    public String getCodigoCnaePrincipal() {
		return this.codigoCnaePrincipal;
	}

	public void setCodigoCnaePrincipal(String codigoCnaePrincipal) {
		this.codigoCnaePrincipal = codigoCnaePrincipal;
	}

    public Set<EmpresaContato> getListaEmpresaContato() {
		return this.listaEmpresaContato;
	}

	public void setListaEmpresaContato(Set<EmpresaContato> listaEmpresaContato) {
		this.listaEmpresaContato = listaEmpresaContato;
		for (EmpresaContato empresaContato : listaEmpresaContato) {
			empresaContato.setEmpresa(this);
		}
	}

    public Set<EmpresaEndereco> getListaEmpresaEndereco() {
		return this.listaEmpresaEndereco;
	}

	public void setListaEmpresaEndereco(Set<EmpresaEndereco> listaEmpresaEndereco) {
		this.listaEmpresaEndereco = listaEmpresaEndereco;
		for (EmpresaEndereco empresaEndereco : listaEmpresaEndereco) {
			empresaEndereco.setEmpresa(this);
			if (empresaEndereco.getPrincipal().equals("S")) {
				enderecoPrincipal = empresaEndereco; 
			}
		}
	}

    public Set<EmpresaTelefone> getListaEmpresaTelefone() {
		return this.listaEmpresaTelefone;
	}

	public void setListaEmpresaTelefone(Set<EmpresaTelefone> listaEmpresaTelefone) {
		this.listaEmpresaTelefone = listaEmpresaTelefone;
		for (EmpresaTelefone empresaTelefone : listaEmpresaTelefone) {
			empresaTelefone.setEmpresa(this);
		}
	}

	public EmpresaEndereco getEnderecoPrincipal() {
		for (EmpresaEndereco empresaEndereco : listaEmpresaEndereco) {
			if (empresaEndereco.getPrincipal().equals("S")) {
				enderecoPrincipal = empresaEndereco; 
			}
		}
		return enderecoPrincipal;
	}

	public void setEnderecoPrincipal(EmpresaEndereco enderecoPrincipal) {
		this.enderecoPrincipal = enderecoPrincipal;
	}
		
}