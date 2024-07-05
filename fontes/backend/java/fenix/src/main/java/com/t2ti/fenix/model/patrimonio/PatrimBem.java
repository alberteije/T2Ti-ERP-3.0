/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PATRIM_BEM] 
                                                                                
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
package com.t2ti.fenix.model.patrimonio;

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
@Table(name="PATRIM_BEM")
@NamedQuery(name="PatrimBem.findAll", query="SELECT t FROM PatrimBem t")
public class PatrimBem implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CENTRO_RESULTADO")
	private Integer idCentroResultado;

    @Column(name="ID_PATRIM_TIPO_AQUISICAO_BEM")
	private Integer idPatrimTipoAquisicaoBem;

    @Column(name="ID_PATRIM_ESTADO_CONSERVACAO")
	private Integer idPatrimEstadoConservacao;

    @Column(name="ID_PATRIM_GRUPO_BEM")
	private Integer idPatrimGrupoBem;

    @Column(name="ID_FORNECEDOR")
	private Integer idFornecedor;

    @Column(name="ID_COLABORADOR")
	private Integer idColaborador;

    @Column(name="ID_SETOR")
	private Integer idSetor;

    @Column(name="NUMERO_NB")
	private String numeroNb;

    @Column(name="NOME")
	private String nome;

    @Column(name="DESCRICAO")
	private String descricao;

    @Column(name="NUMERO_SERIE")
	private String numeroSerie;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_AQUISICAO")
	private Date dataAquisicao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_ACEITE")
	private Date dataAceite;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_CADASTRO")
	private Date dataCadastro;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_CONTABILIZADO")
	private Date dataContabilizado;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_VISTORIA")
	private Date dataVistoria;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_MARCACAO")
	private Date dataMarcacao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_BAIXA")
	private Date dataBaixa;

    @Temporal(TemporalType.DATE)
	@Column(name="VENCIMENTO_GARANTIA")
	private Date vencimentoGarantia;

    @Column(name="NUMERO_NOTA_FISCAL")
	private String numeroNotaFiscal;

    @Column(name="CHAVE_NFE")
	private String chaveNfe;

    @Column(name="VALOR_ORIGINAL")
	private BigDecimal valorOriginal;

    @Column(name="VALOR_COMPRA")
	private BigDecimal valorCompra;

    @Column(name="VALOR_ATUALIZADO")
	private BigDecimal valorAtualizado;

    @Column(name="VALOR_BAIXA")
	private BigDecimal valorBaixa;

    @Column(name="DEPRECIA")
	private String deprecia;

    @Column(name="METODO_DEPRECIACAO")
	private String metodoDepreciacao;

    @Temporal(TemporalType.DATE)
	@Column(name="INICIO_DEPRECIACAO")
	private Date inicioDepreciacao;

    @Temporal(TemporalType.DATE)
	@Column(name="ULTIMA_DEPRECIACAO")
	private Date ultimaDepreciacao;

    @Column(name="TIPO_DEPRECIACAO")
	private String tipoDepreciacao;

    @Column(name="TAXA_ANUAL_DEPRECIACAO")
	private BigDecimal taxaAnualDepreciacao;

    @Column(name="TAXA_MENSAL_DEPRECIACAO")
	private BigDecimal taxaMensalDepreciacao;

    @Column(name="TAXA_DEPRECIACAO_ACELERADA")
	private BigDecimal taxaDepreciacaoAcelerada;

    @Column(name="TAXA_DEPRECIACAO_INCENTIVADA")
	private BigDecimal taxaDepreciacaoIncentivada;

    @Column(name="FUNCAO")
	private String funcao;

	public PatrimBem() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdCentroResultado() {
		return this.idCentroResultado;
	}

	public void setIdCentroResultado(Integer idCentroResultado) {
		this.idCentroResultado = idCentroResultado;
	}

    public Integer getIdPatrimTipoAquisicaoBem() {
		return this.idPatrimTipoAquisicaoBem;
	}

	public void setIdPatrimTipoAquisicaoBem(Integer idPatrimTipoAquisicaoBem) {
		this.idPatrimTipoAquisicaoBem = idPatrimTipoAquisicaoBem;
	}

    public Integer getIdPatrimEstadoConservacao() {
		return this.idPatrimEstadoConservacao;
	}

	public void setIdPatrimEstadoConservacao(Integer idPatrimEstadoConservacao) {
		this.idPatrimEstadoConservacao = idPatrimEstadoConservacao;
	}

    public Integer getIdPatrimGrupoBem() {
		return this.idPatrimGrupoBem;
	}

	public void setIdPatrimGrupoBem(Integer idPatrimGrupoBem) {
		this.idPatrimGrupoBem = idPatrimGrupoBem;
	}

    public Integer getIdFornecedor() {
		return this.idFornecedor;
	}

	public void setIdFornecedor(Integer idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

    public Integer getIdColaborador() {
		return this.idColaborador;
	}

	public void setIdColaborador(Integer idColaborador) {
		this.idColaborador = idColaborador;
	}

    public Integer getIdSetor() {
		return this.idSetor;
	}

	public void setIdSetor(Integer idSetor) {
		this.idSetor = idSetor;
	}

    public String getNumeroNb() {
		return this.numeroNb;
	}

	public void setNumeroNb(String numeroNb) {
		this.numeroNb = numeroNb;
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

    public String getNumeroSerie() {
		return this.numeroSerie;
	}

	public void setNumeroSerie(String numeroSerie) {
		this.numeroSerie = numeroSerie;
	}

    public Date getDataAquisicao() {
		return this.dataAquisicao;
	}

	public void setDataAquisicao(Date dataAquisicao) {
		this.dataAquisicao = dataAquisicao;
	}

    public Date getDataAceite() {
		return this.dataAceite;
	}

	public void setDataAceite(Date dataAceite) {
		this.dataAceite = dataAceite;
	}

    public Date getDataCadastro() {
		return this.dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

    public Date getDataContabilizado() {
		return this.dataContabilizado;
	}

	public void setDataContabilizado(Date dataContabilizado) {
		this.dataContabilizado = dataContabilizado;
	}

    public Date getDataVistoria() {
		return this.dataVistoria;
	}

	public void setDataVistoria(Date dataVistoria) {
		this.dataVistoria = dataVistoria;
	}

    public Date getDataMarcacao() {
		return this.dataMarcacao;
	}

	public void setDataMarcacao(Date dataMarcacao) {
		this.dataMarcacao = dataMarcacao;
	}

    public Date getDataBaixa() {
		return this.dataBaixa;
	}

	public void setDataBaixa(Date dataBaixa) {
		this.dataBaixa = dataBaixa;
	}

    public Date getVencimentoGarantia() {
		return this.vencimentoGarantia;
	}

	public void setVencimentoGarantia(Date vencimentoGarantia) {
		this.vencimentoGarantia = vencimentoGarantia;
	}

    public String getNumeroNotaFiscal() {
		return this.numeroNotaFiscal;
	}

	public void setNumeroNotaFiscal(String numeroNotaFiscal) {
		this.numeroNotaFiscal = numeroNotaFiscal;
	}

    public String getChaveNfe() {
		return this.chaveNfe;
	}

	public void setChaveNfe(String chaveNfe) {
		this.chaveNfe = chaveNfe;
	}

    public BigDecimal getValorOriginal() {
		return this.valorOriginal;
	}

	public void setValorOriginal(BigDecimal valorOriginal) {
		this.valorOriginal = valorOriginal;
	}

    public BigDecimal getValorCompra() {
		return this.valorCompra;
	}

	public void setValorCompra(BigDecimal valorCompra) {
		this.valorCompra = valorCompra;
	}

    public BigDecimal getValorAtualizado() {
		return this.valorAtualizado;
	}

	public void setValorAtualizado(BigDecimal valorAtualizado) {
		this.valorAtualizado = valorAtualizado;
	}

    public BigDecimal getValorBaixa() {
		return this.valorBaixa;
	}

	public void setValorBaixa(BigDecimal valorBaixa) {
		this.valorBaixa = valorBaixa;
	}

    public String getDeprecia() {
		return this.deprecia;
	}

	public void setDeprecia(String deprecia) {
		this.deprecia = deprecia;
	}

    public String getMetodoDepreciacao() {
		return this.metodoDepreciacao;
	}

	public void setMetodoDepreciacao(String metodoDepreciacao) {
		this.metodoDepreciacao = metodoDepreciacao;
	}

    public Date getInicioDepreciacao() {
		return this.inicioDepreciacao;
	}

	public void setInicioDepreciacao(Date inicioDepreciacao) {
		this.inicioDepreciacao = inicioDepreciacao;
	}

    public Date getUltimaDepreciacao() {
		return this.ultimaDepreciacao;
	}

	public void setUltimaDepreciacao(Date ultimaDepreciacao) {
		this.ultimaDepreciacao = ultimaDepreciacao;
	}

    public String getTipoDepreciacao() {
		return this.tipoDepreciacao;
	}

	public void setTipoDepreciacao(String tipoDepreciacao) {
		this.tipoDepreciacao = tipoDepreciacao;
	}

    public BigDecimal getTaxaAnualDepreciacao() {
		return this.taxaAnualDepreciacao;
	}

	public void setTaxaAnualDepreciacao(BigDecimal taxaAnualDepreciacao) {
		this.taxaAnualDepreciacao = taxaAnualDepreciacao;
	}

    public BigDecimal getTaxaMensalDepreciacao() {
		return this.taxaMensalDepreciacao;
	}

	public void setTaxaMensalDepreciacao(BigDecimal taxaMensalDepreciacao) {
		this.taxaMensalDepreciacao = taxaMensalDepreciacao;
	}

    public BigDecimal getTaxaDepreciacaoAcelerada() {
		return this.taxaDepreciacaoAcelerada;
	}

	public void setTaxaDepreciacaoAcelerada(BigDecimal taxaDepreciacaoAcelerada) {
		this.taxaDepreciacaoAcelerada = taxaDepreciacaoAcelerada;
	}

    public BigDecimal getTaxaDepreciacaoIncentivada() {
		return this.taxaDepreciacaoIncentivada;
	}

	public void setTaxaDepreciacaoIncentivada(BigDecimal taxaDepreciacaoIncentivada) {
		this.taxaDepreciacaoIncentivada = taxaDepreciacaoIncentivada;
	}

    public String getFuncao() {
		return this.funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}

		
}