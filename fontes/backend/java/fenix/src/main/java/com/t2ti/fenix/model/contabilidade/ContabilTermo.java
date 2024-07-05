/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_TERMO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
package com.t2ti.fenix.model.contabilidade;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="CONTABIL_TERMO")
@NamedQuery(name="ContabilTermo.findAll", query="SELECT t FROM ContabilTermo t")
public class ContabilTermo implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CONTABIL_LIVRO")
	private Integer idContabilLivro;

    @Column(name="ABERTURA_ENCERRAMENTO")
	private String aberturaEncerramento;

    @Column(name="NUMERO")
	private Integer numero;

    @Column(name="PAGINA_INICIAL")
	private Integer paginaInicial;

    @Column(name="PAGINA_FINAL")
	private Integer paginaFinal;

    @Column(name="REGISTRADO")
	private String registrado;

    @Column(name="NUMERO_REGISTRO")
	private String numeroRegistro;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_DESPACHO")
	private Date dataDespacho;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_ABERTURA")
	private Date dataAbertura;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_ENCERRAMENTO")
	private Date dataEncerramento;

    @Temporal(TemporalType.DATE)
	@Column(name="ESCRITURACAO_INICIO")
	private Date escrituracaoInicio;

    @Temporal(TemporalType.DATE)
	@Column(name="ESCRITURACAO_FIM")
	private Date escrituracaoFim;

    @Column(name="TEXTO")
	private String texto;

	public ContabilTermo() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdContabilLivro() {
		return this.idContabilLivro;
	}

	public void setIdContabilLivro(Integer idContabilLivro) {
		this.idContabilLivro = idContabilLivro;
	}

    public String getAberturaEncerramento() {
		return this.aberturaEncerramento;
	}

	public void setAberturaEncerramento(String aberturaEncerramento) {
		this.aberturaEncerramento = aberturaEncerramento;
	}

    public Integer getNumero() {
		return this.numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

    public Integer getPaginaInicial() {
		return this.paginaInicial;
	}

	public void setPaginaInicial(Integer paginaInicial) {
		this.paginaInicial = paginaInicial;
	}

    public Integer getPaginaFinal() {
		return this.paginaFinal;
	}

	public void setPaginaFinal(Integer paginaFinal) {
		this.paginaFinal = paginaFinal;
	}

    public String getRegistrado() {
		return this.registrado;
	}

	public void setRegistrado(String registrado) {
		this.registrado = registrado;
	}

    public String getNumeroRegistro() {
		return this.numeroRegistro;
	}

	public void setNumeroRegistro(String numeroRegistro) {
		this.numeroRegistro = numeroRegistro;
	}

    public Date getDataDespacho() {
		return this.dataDespacho;
	}

	public void setDataDespacho(Date dataDespacho) {
		this.dataDespacho = dataDespacho;
	}

    public Date getDataAbertura() {
		return this.dataAbertura;
	}

	public void setDataAbertura(Date dataAbertura) {
		this.dataAbertura = dataAbertura;
	}

    public Date getDataEncerramento() {
		return this.dataEncerramento;
	}

	public void setDataEncerramento(Date dataEncerramento) {
		this.dataEncerramento = dataEncerramento;
	}

    public Date getEscrituracaoInicio() {
		return this.escrituracaoInicio;
	}

	public void setEscrituracaoInicio(Date escrituracaoInicio) {
		this.escrituracaoInicio = escrituracaoInicio;
	}

    public Date getEscrituracaoFim() {
		return this.escrituracaoFim;
	}

	public void setEscrituracaoFim(Date escrituracaoFim) {
		this.escrituracaoFim = escrituracaoFim;
	}

    public String getTexto() {
		return this.texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

		
}