/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [PESSOA] 
                                                                                
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
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="PESSOA")
@NamedQuery(name="Pessoa.findAll", query="SELECT t FROM Pessoa t")
public class Pessoa implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NOME")
	private String nome;

    @Column(name="TIPO")
	private String tipo;

    @Column(name="SITE")
	private String site;

    @Column(name="EMAIL")
	private String email;

    @Column(name="EH_CLIENTE")
	private String ehCliente;

    @Column(name="EH_FORNECEDOR")
	private String ehFornecedor;

    @Column(name="EH_TRANSPORTADORA")
	private String ehTransportadora;

    @Column(name="EH_COLABORADOR")
	private String ehColaborador;

    @Column(name="EH_CONTADOR")
	private String ehContador;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Cliente cliente;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Colaborador colaborador;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Contador contador;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Fornecedor fornecedor;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private PessoaFisica pessoaFisica;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private PessoaJuridica pessoaJuridica;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Transportadora transportadora;

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<PessoaContato> listaPessoaContato;

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<PessoaEndereco> listaPessoaEndereco;

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<PessoaTelefone> listaPessoaTelefone;

	public Pessoa() {
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

    public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

    public String getSite() {
		return this.site;
	}

	public void setSite(String site) {
		this.site = site;
	}

    public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

    public String getEhCliente() {
		return this.ehCliente;
	}

	public void setEhCliente(String ehCliente) {
		this.ehCliente = ehCliente;
	}

    public String getEhFornecedor() {
		return this.ehFornecedor;
	}

	public void setEhFornecedor(String ehFornecedor) {
		this.ehFornecedor = ehFornecedor;
	}

    public String getEhTransportadora() {
		return this.ehTransportadora;
	}

	public void setEhTransportadora(String ehTransportadora) {
		this.ehTransportadora = ehTransportadora;
	}

    public String getEhColaborador() {
		return this.ehColaborador;
	}

	public void setEhColaborador(String ehColaborador) {
		this.ehColaborador = ehColaborador;
	}

    public String getEhContador() {
		return this.ehContador;
	}

	public void setEhContador(String ehContador) {
		this.ehContador = ehContador;
	}

    public Cliente getCliente() {
		return this.cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
		if (cliente != null) {
			cliente.setPessoa(this);
		}
	}

    public Colaborador getColaborador() {
		return this.colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
		if (colaborador != null) {
			colaborador.setPessoa(this);
		}
	}

    public Contador getContador() {
		return this.contador;
	}

	public void setContador(Contador contador) {
		this.contador = contador;
		if (contador != null) {
			contador.setPessoa(this);
		}
	}

    public Fornecedor getFornecedor() {
		return this.fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
		if (fornecedor != null) {
			fornecedor.setPessoa(this);
		}
	}

    public PessoaFisica getPessoaFisica() {
		return this.pessoaFisica;
	}

	public void setPessoaFisica(PessoaFisica pessoaFisica) {
		this.pessoaFisica = pessoaFisica;
		if (pessoaFisica != null) {
			pessoaFisica.setPessoa(this);
		}
	}

    public PessoaJuridica getPessoaJuridica() {
		return this.pessoaJuridica;
	}

	public void setPessoaJuridica(PessoaJuridica pessoaJuridica) {
		this.pessoaJuridica = pessoaJuridica;
		if (pessoaJuridica != null) {
			pessoaJuridica.setPessoa(this);
		}
	}

    public Transportadora getTransportadora() {
		return this.transportadora;
	}

	public void setTransportadora(Transportadora transportadora) {
		this.transportadora = transportadora;
		if (transportadora != null) {
			transportadora.setPessoa(this);
		}
	}

    public Set<PessoaContato> getListaPessoaContato() {
		return this.listaPessoaContato;
	}

	public void setListaPessoaContato(Set<PessoaContato> listaPessoaContato) {
		this.listaPessoaContato = listaPessoaContato;
		for (PessoaContato pessoaContato : listaPessoaContato) {
			pessoaContato.setPessoa(this);
		}
	}

    public Set<PessoaEndereco> getListaPessoaEndereco() {
		return this.listaPessoaEndereco;
	}

	public void setListaPessoaEndereco(Set<PessoaEndereco> listaPessoaEndereco) {
		this.listaPessoaEndereco = listaPessoaEndereco;
		for (PessoaEndereco pessoaEndereco : listaPessoaEndereco) {
			pessoaEndereco.setPessoa(this);
		}
	}

    public Set<PessoaTelefone> getListaPessoaTelefone() {
		return this.listaPessoaTelefone;
	}

	public void setListaPessoaTelefone(Set<PessoaTelefone> listaPessoaTelefone) {
		this.listaPessoaTelefone = listaPessoaTelefone;
		for (PessoaTelefone pessoaTelefone : listaPessoaTelefone) {
			pessoaTelefone.setPessoa(this);
		}
	}

		
}