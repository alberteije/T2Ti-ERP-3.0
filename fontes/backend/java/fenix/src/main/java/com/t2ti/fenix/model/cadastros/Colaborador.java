/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COLABORADOR] 
                                                                                
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
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.t2ti.fenix.model.viewsDB.ViewPessoaColaborador;

@Entity
@Table(name="COLABORADOR")
@NamedQuery(name="Colaborador.findAll", query="SELECT t FROM Colaborador t")
public class Colaborador implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="MATRICULA")
	private String matricula;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_CADASTRO")
	private Date dataCadastro;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_ADMISSAO")
	private Date dataAdmissao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_DEMISSAO")
	private Date dataDemissao;

    @Column(name="CTPS_NUMERO")
	private String ctpsNumero;

    @Column(name="CTPS_SERIE")
	private String ctpsSerie;

    @Temporal(TemporalType.DATE)
	@Column(name="CTPS_DATA_EXPEDICAO")
	private Date ctpsDataExpedicao;

    @Column(name="CTPS_UF")
	private String ctpsUf;

    @Column(name="OBSERVACAO")
	private String observacao;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_PESSOA")
    private Pessoa pessoa;
    
    @OneToOne
    @NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name="ID_PESSOA", nullable=true, insertable=false, updatable=false)
    private ViewPessoaColaborador viewPessoaColaborador;
    
    @ManyToOne
	@JoinColumn(name="ID_CARGO")
    private Cargo cargo;

    @ManyToOne
	@JoinColumn(name="ID_SETOR")
    private Setor setor;

    @ManyToOne
	@JoinColumn(name="ID_COLABORADOR_SITUACAO")
    private ColaboradorSituacao colaboradorSituacao;

    @ManyToOne	
	@JoinColumn(name="ID_TIPO_ADMISSAO")
    private TipoAdmissao tipoAdmissao;

    @ManyToOne
	@JoinColumn(name="ID_COLABORADOR_TIPO")
    private ColaboradorTipo colaboradorTipo;

    @ManyToOne
	@JoinColumn(name="ID_SINDICATO")
    private Sindicato sindicato;

	public Colaborador() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getMatricula() {
		return this.matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

    public Date getDataCadastro() {
		return this.dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

    public Date getDataAdmissao() {
		return this.dataAdmissao;
	}

	public void setDataAdmissao(Date dataAdmissao) {
		this.dataAdmissao = dataAdmissao;
	}

    public Date getDataDemissao() {
		return this.dataDemissao;
	}

	public void setDataDemissao(Date dataDemissao) {
		this.dataDemissao = dataDemissao;
	}

    public String getCtpsNumero() {
		return this.ctpsNumero;
	}

	public void setCtpsNumero(String ctpsNumero) {
		this.ctpsNumero = ctpsNumero;
	}

    public String getCtpsSerie() {
		return this.ctpsSerie;
	}

	public void setCtpsSerie(String ctpsSerie) {
		this.ctpsSerie = ctpsSerie;
	}

    public Date getCtpsDataExpedicao() {
		return this.ctpsDataExpedicao;
	}

	public void setCtpsDataExpedicao(Date ctpsDataExpedicao) {
		this.ctpsDataExpedicao = ctpsDataExpedicao;
	}

    public String getCtpsUf() {
		return this.ctpsUf;
	}

	public void setCtpsUf(String ctpsUf) {
		this.ctpsUf = ctpsUf;
	}

    public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	   public ViewPessoaColaborador getViewPessoaColaborador() {
			return this.viewPessoaColaborador;
		}

		public void setViewPessoaColaborador(ViewPessoaColaborador viewPessoaColaborador) {
			this.viewPessoaColaborador = viewPessoaColaborador;
		}

	    public Pessoa getPessoa() {
			return this.pessoa;
		}

		public void setPessoa(Pessoa pessoa) {
			this.pessoa = pessoa;
		}

    public Cargo getCargo() {
		return this.cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

    public Setor getSetor() {
		return this.setor;
	}

	public void setSetor(Setor setor) {
		this.setor = setor;
	}

    public ColaboradorSituacao getColaboradorSituacao() {
		return this.colaboradorSituacao;
	}

	public void setColaboradorSituacao(ColaboradorSituacao colaboradorSituacao) {
		this.colaboradorSituacao = colaboradorSituacao;
	}

    public TipoAdmissao getTipoAdmissao() {
		return this.tipoAdmissao;
	}

	public void setTipoAdmissao(TipoAdmissao tipoAdmissao) {
		this.tipoAdmissao = tipoAdmissao;
	}

    public ColaboradorTipo getColaboradorTipo() {
		return this.colaboradorTipo;
	}

	public void setColaboradorTipo(ColaboradorTipo colaboradorTipo) {
		this.colaboradorTipo = colaboradorTipo;
	}

    public Sindicato getSindicato() {
		return this.sindicato;
	}

	public void setSindicato(Sindicato sindicato) {
		this.sindicato = sindicato;
	}

		
}