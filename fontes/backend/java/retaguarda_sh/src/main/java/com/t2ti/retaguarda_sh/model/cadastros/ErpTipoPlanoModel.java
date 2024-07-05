package com.t2ti.retaguarda_sh.model.cadastros;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="erp_tipo_plano")
@NamedQuery(name="ErpTipoPlanoModel.findAll", query="SELECT t FROM ErpTipoPlanoModel t")
public class ErpTipoPlanoModel implements Serializable {
	private static final long serialVersionUID = 1L;

	public ErpTipoPlanoModel() {
		//standard constructor
	}

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer id;

	@Column(name="nome")
	private String nome;

	@Column(name="valor")
	private BigDecimal valor;

	@Column(name="frequencia")
	private String frequencia;

	@Column(name="acesso_total")
	private boolean acessoTotal;

	@Column(name="ativo")
	private boolean ativo;


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

	public BigDecimal getValor() { 
		return this.valor; 
	} 

	public void setValor(BigDecimal valor) { 
		this.valor = valor; 
	} 

	public String getFrequencia() { 
		return this.frequencia; 
	} 

	public void setFrequencia(String frequencia) { 
		this.frequencia = frequencia; 
	} 

	public boolean getAcessoTotal() { 
		return this.acessoTotal; 
	} 

	public void setAcessoTotal(boolean acessoTotal) { 
		this.acessoTotal = acessoTotal; 
	} 

	public boolean getAtivo() { 
		return this.ativo; 
	} 

	public void setAtivo(boolean ativo) { 
		this.ativo = ativo; 
	} 

		
}