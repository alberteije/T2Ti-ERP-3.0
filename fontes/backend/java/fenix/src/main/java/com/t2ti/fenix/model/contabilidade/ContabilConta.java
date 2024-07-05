/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_CONTA] 
                                                                                
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
@Table(name="CONTABIL_CONTA")
@NamedQuery(name="ContabilConta.findAll", query="SELECT t FROM ContabilConta t")
public class ContabilConta implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_PLANO_CONTA")
	private Integer idPlanoConta;

    @Column(name="ID_CONTABIL_CONTA")
	private Integer idContabilConta;

    @Column(name="ID_PLANO_CONTA_REF_SPED")
	private Integer idPlanoContaRefSped;

    @Column(name="CLASSIFICACAO")
	private String classificacao;

    @Column(name="TIPO")
	private String tipo;

    @Column(name="DESCRICAO")
	private String descricao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_INCLUSAO")
	private Date dataInclusao;

    @Column(name="SITUACAO")
	private String situacao;

    @Column(name="NATUREZA")
	private String natureza;

    @Column(name="PATRIMONIO_RESULTADO")
	private String patrimonioResultado;

    @Column(name="LIVRO_CAIXA")
	private String livroCaixa;

    @Column(name="DFC")
	private String dfc;

    @Column(name="ORDEM")
	private String ordem;

    @Column(name="CODIGO_REDUZIDO")
	private String codigoReduzido;

    @Column(name="CODIGO_EFD")
	private String codigoEfd;

	public ContabilConta() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdPlanoConta() {
		return this.idPlanoConta;
	}

	public void setIdPlanoConta(Integer idPlanoConta) {
		this.idPlanoConta = idPlanoConta;
	}

    public Integer getIdContabilConta() {
		return this.idContabilConta;
	}

	public void setIdContabilConta(Integer idContabilConta) {
		this.idContabilConta = idContabilConta;
	}

    public Integer getIdPlanoContaRefSped() {
		return this.idPlanoContaRefSped;
	}

	public void setIdPlanoContaRefSped(Integer idPlanoContaRefSped) {
		this.idPlanoContaRefSped = idPlanoContaRefSped;
	}

    public String getClassificacao() {
		return this.classificacao;
	}

	public void setClassificacao(String classificacao) {
		this.classificacao = classificacao;
	}

    public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

    public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

    public Date getDataInclusao() {
		return this.dataInclusao;
	}

	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

    public String getSituacao() {
		return this.situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

    public String getNatureza() {
		return this.natureza;
	}

	public void setNatureza(String natureza) {
		this.natureza = natureza;
	}

    public String getPatrimonioResultado() {
		return this.patrimonioResultado;
	}

	public void setPatrimonioResultado(String patrimonioResultado) {
		this.patrimonioResultado = patrimonioResultado;
	}

    public String getLivroCaixa() {
		return this.livroCaixa;
	}

	public void setLivroCaixa(String livroCaixa) {
		this.livroCaixa = livroCaixa;
	}

    public String getDfc() {
		return this.dfc;
	}

	public void setDfc(String dfc) {
		this.dfc = dfc;
	}

    public String getOrdem() {
		return this.ordem;
	}

	public void setOrdem(String ordem) {
		this.ordem = ordem;
	}

    public String getCodigoReduzido() {
		return this.codigoReduzido;
	}

	public void setCodigoReduzido(String codigoReduzido) {
		this.codigoReduzido = codigoReduzido;
	}

    public String getCodigoEfd() {
		return this.codigoEfd;
	}

	public void setCodigoEfd(String codigoEfd) {
		this.codigoEfd = codigoEfd;
	}

		
}