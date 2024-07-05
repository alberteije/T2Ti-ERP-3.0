package com.t2ti.retaguarda_sh.model.cadastros;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="adm_modulo")
@NamedQuery(name="AdmModuloModel.findAll", query="SELECT t FROM AdmModuloModel t")
public class AdmModuloModel implements Serializable {
	private static final long serialVersionUID = 1L;

	public AdmModuloModel() {
		//standard constructor
	}

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer id;

	@Column(name="codigo")
	private String codigo;

	@Column(name="bloco")
	private String bloco;

	@Column(name="nome")
	private String nome;

	@Column(name="descricao")
	private String descricao;

	@Column(name="link")
	private String link;

	@ManyToOne 
	@JsonIgnore 
	@JoinColumn(name="id_empresa")
	private EmpresaModel empresaModel; 


	public Integer getId() { 
		return this.id; 
	} 

	public void setId(Integer id) { 
		this.id = id; 
	} 

	public String getCodigo() { 
		return this.codigo; 
	} 

	public void setCodigo(String codigo) { 
		this.codigo = codigo; 
	} 

	public String getBloco() { 
		return this.bloco; 
	} 

	public void setBloco(String bloco) { 
		this.bloco = bloco; 
	} 

	public String getNome() { 
		return this.nome; 
	} 

	public void setNome(String nome) { 
		this.nome = nome; 
	} 

	public String getDescricao() { 
		return this.descricao; 
	} 

	public void setDescricao(String descricao) { 
		this.descricao = descricao; 
	} 

	public String getLink() { 
		return this.link; 
	} 

	public void setLink(String link) { 
		this.link = link; 
	} 

	public EmpresaModel getEmpresaModel() { 
	return this.empresaModel; 
	} 

	public void setEmpresaModel(EmpresaModel empresaModel) { 
	this.empresaModel = empresaModel; 
	} 

		
}