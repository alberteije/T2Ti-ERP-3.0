/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_INFORMACAO_NF_OUTROS] 
                                                                                
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
package com.t2ti.fenix.model.cte;

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
@Table(name="CTE_INFORMACAO_NF_OUTROS")
@NamedQuery(name="CteInformacaoNfOutros.findAll", query="SELECT t FROM CteInformacaoNfOutros t")
public class CteInformacaoNfOutros implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CTE_CABECALHO")
	private Integer idCteCabecalho;

    @Column(name="NUMERO_ROMANEIO")
	private String numeroRomaneio;

    @Column(name="NUMERO_PEDIDO")
	private String numeroPedido;

    @Column(name="CHAVE_ACESSO_NFE")
	private String chaveAcessoNfe;

    @Column(name="CODIGO_MODELO")
	private String codigoModelo;

    @Column(name="SERIE")
	private String serie;

    @Column(name="NUMERO")
	private String numero;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_EMISSAO")
	private Date dataEmissao;

    @Column(name="UF_EMITENTE")
	private Integer ufEmitente;

    @Column(name="BASE_CALCULO_ICMS")
	private BigDecimal baseCalculoIcms;

    @Column(name="VALOR_ICMS")
	private BigDecimal valorIcms;

    @Column(name="BASE_CALCULO_ICMS_ST")
	private BigDecimal baseCalculoIcmsSt;

    @Column(name="VALOR_ICMS_ST")
	private BigDecimal valorIcmsSt;

    @Column(name="VALOR_TOTAL_PRODUTOS")
	private BigDecimal valorTotalProdutos;

    @Column(name="VALOR_TOTAL")
	private BigDecimal valorTotal;

    @Column(name="CFOP_PREDOMINANTE")
	private Integer cfopPredominante;

    @Column(name="PESO_TOTAL_KG")
	private BigDecimal pesoTotalKg;

    @Column(name="PIN_SUFRAMA")
	private Integer pinSuframa;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PREVISTA_ENTREGA")
	private Date dataPrevistaEntrega;

    @Column(name="OUTRO_TIPO_DOC_ORIG")
	private String outroTipoDocOrig;

    @Column(name="OUTRO_DESCRICAO")
	private String outroDescricao;

    @Column(name="OUTRO_VALOR_DOCUMENTO")
	private BigDecimal outroValorDocumento;

	public CteInformacaoNfOutros() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdCteCabecalho() {
		return this.idCteCabecalho;
	}

	public void setIdCteCabecalho(Integer idCteCabecalho) {
		this.idCteCabecalho = idCteCabecalho;
	}

    public String getNumeroRomaneio() {
		return this.numeroRomaneio;
	}

	public void setNumeroRomaneio(String numeroRomaneio) {
		this.numeroRomaneio = numeroRomaneio;
	}

    public String getNumeroPedido() {
		return this.numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}

    public String getChaveAcessoNfe() {
		return this.chaveAcessoNfe;
	}

	public void setChaveAcessoNfe(String chaveAcessoNfe) {
		this.chaveAcessoNfe = chaveAcessoNfe;
	}

    public String getCodigoModelo() {
		return this.codigoModelo;
	}

	public void setCodigoModelo(String codigoModelo) {
		this.codigoModelo = codigoModelo;
	}

    public String getSerie() {
		return this.serie;
	}

	public void setSerie(String serie) {
		this.serie = serie;
	}

    public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

    public Date getDataEmissao() {
		return this.dataEmissao;
	}

	public void setDataEmissao(Date dataEmissao) {
		this.dataEmissao = dataEmissao;
	}

    public Integer getUfEmitente() {
		return this.ufEmitente;
	}

	public void setUfEmitente(Integer ufEmitente) {
		this.ufEmitente = ufEmitente;
	}

    public BigDecimal getBaseCalculoIcms() {
		return this.baseCalculoIcms;
	}

	public void setBaseCalculoIcms(BigDecimal baseCalculoIcms) {
		this.baseCalculoIcms = baseCalculoIcms;
	}

    public BigDecimal getValorIcms() {
		return this.valorIcms;
	}

	public void setValorIcms(BigDecimal valorIcms) {
		this.valorIcms = valorIcms;
	}

    public BigDecimal getBaseCalculoIcmsSt() {
		return this.baseCalculoIcmsSt;
	}

	public void setBaseCalculoIcmsSt(BigDecimal baseCalculoIcmsSt) {
		this.baseCalculoIcmsSt = baseCalculoIcmsSt;
	}

    public BigDecimal getValorIcmsSt() {
		return this.valorIcmsSt;
	}

	public void setValorIcmsSt(BigDecimal valorIcmsSt) {
		this.valorIcmsSt = valorIcmsSt;
	}

    public BigDecimal getValorTotalProdutos() {
		return this.valorTotalProdutos;
	}

	public void setValorTotalProdutos(BigDecimal valorTotalProdutos) {
		this.valorTotalProdutos = valorTotalProdutos;
	}

    public BigDecimal getValorTotal() {
		return this.valorTotal;
	}

	public void setValorTotal(BigDecimal valorTotal) {
		this.valorTotal = valorTotal;
	}

    public Integer getCfopPredominante() {
		return this.cfopPredominante;
	}

	public void setCfopPredominante(Integer cfopPredominante) {
		this.cfopPredominante = cfopPredominante;
	}

    public BigDecimal getPesoTotalKg() {
		return this.pesoTotalKg;
	}

	public void setPesoTotalKg(BigDecimal pesoTotalKg) {
		this.pesoTotalKg = pesoTotalKg;
	}

    public Integer getPinSuframa() {
		return this.pinSuframa;
	}

	public void setPinSuframa(Integer pinSuframa) {
		this.pinSuframa = pinSuframa;
	}

    public Date getDataPrevistaEntrega() {
		return this.dataPrevistaEntrega;
	}

	public void setDataPrevistaEntrega(Date dataPrevistaEntrega) {
		this.dataPrevistaEntrega = dataPrevistaEntrega;
	}

    public String getOutroTipoDocOrig() {
		return this.outroTipoDocOrig;
	}

	public void setOutroTipoDocOrig(String outroTipoDocOrig) {
		this.outroTipoDocOrig = outroTipoDocOrig;
	}

    public String getOutroDescricao() {
		return this.outroDescricao;
	}

	public void setOutroDescricao(String outroDescricao) {
		this.outroDescricao = outroDescricao;
	}

    public BigDecimal getOutroValorDocumento() {
		return this.outroValorDocumento;
	}

	public void setOutroValorDocumento(BigDecimal outroValorDocumento) {
		this.outroValorDocumento = outroValorDocumento;
	}

		
}