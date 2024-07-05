package com.t2ti.retaguarda_sh.model.cadastros;

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

@Entity
@Table(name="empresa")
@NamedQuery(name="EmpresaModel.findAll", query="SELECT t FROM EmpresaModel t")
public class EmpresaModel implements Serializable {
	private static final long serialVersionUID = 1L;

	public EmpresaModel() {
		//standard constructor
	}

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer id;

	@Column(name="razao_social")
	private String razaoSocial;

	@Column(name="nome_fantasia")
	private String nomeFantasia;

	@Column(name="cnpj")
	private String cnpj;

	@Column(name="inscricao_estadual")
	private String inscricaoEstadual;

	@Column(name="inscricao_municipal")
	private String inscricaoMunicipal;

	@Column(name="tipo_regime")
	private String tipoRegime;

	@Column(name="crt")
	private String crt;

	@Temporal(TemporalType.DATE)
	@Column(name="data_constituicao")
	private Date dataConstituicao;

	@Column(name="tipo")
	private String tipo;

	@Column(name="email")
	private String email;

	@Column(name="logradouro")
	private String logradouro;

	@Column(name="numero")
	private String numero;

	@Column(name="complemento")
	private String complemento;

	@Column(name="cep")
	private String cep;

	@Column(name="bairro")
	private String bairro;

	@Column(name="cidade")
	private String cidade;

	@Column(name="uf")
	private String uf;

	@Column(name="fone")
	private String fone;

	@Column(name="contato")
	private String contato;

	@Column(name="codigo_ibge_cidade")
	private Integer codigoIbgeCidade;

	@Column(name="codigo_ibge_uf")
	private Integer codigoIbgeUf;

	@Column(name="logotipo")
	private String logotipo;

	@Column(name="registrado")
	private String registrado;

	@Column(name="natureza_juridica")
	private String naturezaJuridica;

	@Column(name="simei")
	private String simei;

	@Column(name="email_pagamento")
	private String emailPagamento;

	@Temporal(TemporalType.DATE)
	@Column(name="data_registro")
	private Date dataRegistro;

	@Column(name="hora_registro")
	private String horaRegistro;

	@Column(name="id_plataforma_pagamento")
	private String idPlataformaPagamento;

	@OneToMany(mappedBy = "empresaModel", cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<AdmModuloModel> admModuloModelList; 


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
		this.crt = crt; 
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

	public String getEmail() { 
		return this.email; 
	} 

	public void setEmail(String email) { 
		this.email = email; 
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

	public String getCep() { 
		return this.cep; 
	} 

	public void setCep(String cep) { 
		this.cep = cep; 
	} 

	public String getBairro() { 
		return this.bairro; 
	} 

	public void setBairro(String bairro) { 
		this.bairro = bairro; 
	} 

	public String getCidade() { 
		return this.cidade; 
	} 

	public void setCidade(String cidade) { 
		this.cidade = cidade; 
	} 

	public String getUf() { 
		return this.uf; 
	} 

	public void setUf(String uf) { 
		this.uf = uf; 
	} 

	public String getFone() { 
		return this.fone; 
	} 

	public void setFone(String fone) { 
		this.fone = fone; 
	} 

	public String getContato() { 
		return this.contato; 
	} 

	public void setContato(String contato) { 
		this.contato = contato; 
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

	public String getLogotipo() { 
		return this.logotipo; 
	} 

	public void setLogotipo(String logotipo) { 
		this.logotipo = logotipo; 
	} 

	public String getRegistrado() { 
		return this.registrado; 
	} 

	public void setRegistrado(String registrado) { 
		this.registrado = registrado; 
	} 

	public String getNaturezaJuridica() { 
		return this.naturezaJuridica; 
	} 

	public void setNaturezaJuridica(String naturezaJuridica) { 
		this.naturezaJuridica = naturezaJuridica; 
	} 

	public String getSimei() { 
		return this.simei; 
	} 

	public void setSimei(String simei) { 
		this.simei = simei; 
	} 

	public String getEmailPagamento() { 
		return this.emailPagamento; 
	} 

	public void setEmailPagamento(String emailPagamento) { 
		this.emailPagamento = emailPagamento; 
	} 

	public Date getDataRegistro() { 
		return this.dataRegistro; 
	} 

	public void setDataRegistro(Date dataRegistro) { 
		this.dataRegistro = dataRegistro; 
	} 

	public String getHoraRegistro() { 
		return this.horaRegistro; 
	} 

	public void setHoraRegistro(String horaRegistro) { 
		this.horaRegistro = horaRegistro; 
	} 

	public String getIdPlataformaPagamento() { 
		return this.idPlataformaPagamento; 
	} 

	public void setIdPlataformaPagamento(String idPlataformaPagamento) { 
		this.idPlataformaPagamento = idPlataformaPagamento; 
	} 

	public Set<AdmModuloModel> getAdmModuloModelList() { 
	return this.admModuloModelList; 
	} 

	public void setAdmModuloModelList(Set<AdmModuloModel> admModuloModelList) { 
	this.admModuloModelList = admModuloModelList; 
		for (AdmModuloModel admModuloModel : admModuloModelList) { 
			admModuloModel.setEmpresaModel(this); 
		}
	} 

		
}