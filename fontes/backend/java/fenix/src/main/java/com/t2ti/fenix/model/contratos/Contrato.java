/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTRATO] 
                                                                                
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
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="CONTRATO")
@NamedQuery(name="Contrato.findAll", query="SELECT t FROM Contrato t")
public class Contrato implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_SOLICITACAO_SERVICO")
	private Integer idSolicitacaoServico;

    @Column(name="ID_TIPO_CONTRATO")
	private Integer idTipoContrato;

    @Column(name="NUMERO")
	private String numero;

    @Column(name="NOME")
	private String nome;

    @Column(name="DESCRICAO")
	private String descricao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_CADASTRO")
	private Date dataCadastro;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_INICIO_VIGENCIA")
	private Date dataInicioVigencia;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_FIM_VIGENCIA")
	private Date dataFimVigencia;

    @Column(name="DIA_FATURAMENTO")
	private String diaFaturamento;

    @Column(name="VALOR")
	private BigDecimal valor;

    @Column(name="QUANTIDADE_PARCELAS")
	private Integer quantidadeParcelas;

    @Column(name="INTERVALO_ENTRE_PARCELAS")
	private Integer intervaloEntreParcelas;

    @Column(name="OBSERVACAO")
	private String observacao;

    @Column(name="CLASSIFICACAO_CONTABIL_CONTA")
	private String classificacaoContabilConta;

	public Contrato() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdSolicitacaoServico() {
		return this.idSolicitacaoServico;
	}

	public void setIdSolicitacaoServico(Integer idSolicitacaoServico) {
		this.idSolicitacaoServico = idSolicitacaoServico;
	}

    public Integer getIdTipoContrato() {
		return this.idTipoContrato;
	}

	public void setIdTipoContrato(Integer idTipoContrato) {
		this.idTipoContrato = idTipoContrato;
	}

    public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
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

    public Date getDataCadastro() {
		return this.dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

    public Date getDataInicioVigencia() {
		return this.dataInicioVigencia;
	}

	public void setDataInicioVigencia(Date dataInicioVigencia) {
		this.dataInicioVigencia = dataInicioVigencia;
	}

    public Date getDataFimVigencia() {
		return this.dataFimVigencia;
	}

	public void setDataFimVigencia(Date dataFimVigencia) {
		this.dataFimVigencia = dataFimVigencia;
	}

    public String getDiaFaturamento() {
		return this.diaFaturamento;
	}

	public void setDiaFaturamento(String diaFaturamento) {
		this.diaFaturamento = diaFaturamento;
	}

    public BigDecimal getValor() {
		return this.valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

    public Integer getQuantidadeParcelas() {
		return this.quantidadeParcelas;
	}

	public void setQuantidadeParcelas(Integer quantidadeParcelas) {
		this.quantidadeParcelas = quantidadeParcelas;
	}

    public Integer getIntervaloEntreParcelas() {
		return this.intervaloEntreParcelas;
	}

	public void setIntervaloEntreParcelas(Integer intervaloEntreParcelas) {
		this.intervaloEntreParcelas = intervaloEntreParcelas;
	}

    public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

    public String getClassificacaoContabilConta() {
		return this.classificacaoContabilConta;
	}

	public void setClassificacaoContabilConta(String classificacaoContabilConta) {
		this.classificacaoContabilConta = classificacaoContabilConta;
	}

		
}