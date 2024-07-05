/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [AGENDA_COMPROMISSO] 
                                                                                
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
package com.t2ti.fenix.model.agenda;

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
@Table(name="AGENDA_COMPROMISSO")
@NamedQuery(name="AgendaCompromisso.findAll", query="SELECT t FROM AgendaCompromisso t")
public class AgendaCompromisso implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_AGENDA_CATEGORIA_COMPROMISSO")
	private Integer idAgendaCategoriaCompromisso;

    @Column(name="ID_COLABORADOR")
	private Integer idColaborador;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_COMPROMISSO")
	private Date dataCompromisso;

    @Column(name="HORA")
	private String hora;

    @Column(name="DURACAO")
	private Integer duracao;

    @Column(name="ONDE")
	private String onde;

    @Column(name="DESCRICAO")
	private String descricao;

    @Column(name="TIPO")
	private String tipo;

	public AgendaCompromisso() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdAgendaCategoriaCompromisso() {
		return this.idAgendaCategoriaCompromisso;
	}

	public void setIdAgendaCategoriaCompromisso(Integer idAgendaCategoriaCompromisso) {
		this.idAgendaCategoriaCompromisso = idAgendaCategoriaCompromisso;
	}

    public Integer getIdColaborador() {
		return this.idColaborador;
	}

	public void setIdColaborador(Integer idColaborador) {
		this.idColaborador = idColaborador;
	}

    public Date getDataCompromisso() {
		return this.dataCompromisso;
	}

	public void setDataCompromisso(Date dataCompromisso) {
		this.dataCompromisso = dataCompromisso;
	}

    public String getHora() {
		return this.hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

    public Integer getDuracao() {
		return this.duracao;
	}

	public void setDuracao(Integer duracao) {
		this.duracao = duracao;
	}

    public String getOnde() {
		return this.onde;
	}

	public void setOnde(String onde) {
		this.onde = onde;
	}

    public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

    public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

		
}