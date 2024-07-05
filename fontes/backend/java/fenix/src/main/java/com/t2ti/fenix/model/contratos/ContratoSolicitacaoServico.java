/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTRATO_SOLICITACAO_SERVICO] 
                                                                                
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
package com.t2ti.fenix.model.contratos;

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
@Table(name="CONTRATO_SOLICITACAO_SERVICO")
@NamedQuery(name="ContratoSolicitacaoServico.findAll", query="SELECT t FROM ContratoSolicitacaoServico t")
public class ContratoSolicitacaoServico implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CONTRATO_TIPO_SERVICO")
	private Integer idContratoTipoServico;

    @Column(name="ID_SETOR")
	private Integer idSetor;

    @Column(name="ID_COLABORADOR")
	private Integer idColaborador;

    @Column(name="ID_CLIENTE")
	private Integer idCliente;

    @Column(name="ID_FORNECEDOR")
	private Integer idFornecedor;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_SOLICITACAO")
	private Date dataSolicitacao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_DESEJADA_INICIO")
	private Date dataDesejadaInicio;

    @Column(name="URGENTE")
	private String urgente;

    @Column(name="STATUS_SOLICITACAO")
	private String statusSolicitacao;

    @Column(name="DESCRICAO")
	private String descricao;

	public ContratoSolicitacaoServico() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdContratoTipoServico() {
		return this.idContratoTipoServico;
	}

	public void setIdContratoTipoServico(Integer idContratoTipoServico) {
		this.idContratoTipoServico = idContratoTipoServico;
	}

    public Integer getIdSetor() {
		return this.idSetor;
	}

	public void setIdSetor(Integer idSetor) {
		this.idSetor = idSetor;
	}

    public Integer getIdColaborador() {
		return this.idColaborador;
	}

	public void setIdColaborador(Integer idColaborador) {
		this.idColaborador = idColaborador;
	}

    public Integer getIdCliente() {
		return this.idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

    public Integer getIdFornecedor() {
		return this.idFornecedor;
	}

	public void setIdFornecedor(Integer idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

    public Date getDataSolicitacao() {
		return this.dataSolicitacao;
	}

	public void setDataSolicitacao(Date dataSolicitacao) {
		this.dataSolicitacao = dataSolicitacao;
	}

    public Date getDataDesejadaInicio() {
		return this.dataDesejadaInicio;
	}

	public void setDataDesejadaInicio(Date dataDesejadaInicio) {
		this.dataDesejadaInicio = dataDesejadaInicio;
	}

    public String getUrgente() {
		return this.urgente;
	}

	public void setUrgente(String urgente) {
		this.urgente = urgente;
	}

    public String getStatusSolicitacao() {
		return this.statusSolicitacao;
	}

	public void setStatusSolicitacao(String statusSolicitacao) {
		this.statusSolicitacao = statusSolicitacao;
	}

    public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

		
}