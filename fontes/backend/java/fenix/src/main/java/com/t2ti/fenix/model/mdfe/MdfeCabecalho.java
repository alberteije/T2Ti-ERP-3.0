/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_CABECALHO] 
                                                                                
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
package com.t2ti.fenix.model.mdfe;

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
@Table(name="MDFE_CABECALHO")
@NamedQuery(name="MdfeCabecalho.findAll", query="SELECT t FROM MdfeCabecalho t")
public class MdfeCabecalho implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="UF")
	private Integer uf;

    @Column(name="TIPO_AMBIENTE")
	private Integer tipoAmbiente;

    @Column(name="TIPO_EMITENTE")
	private Integer tipoEmitente;

    @Column(name="TIPO_TRANSPORTADORA")
	private Integer tipoTransportadora;

    @Column(name="MODELO")
	private String modelo;

    @Column(name="SERIE")
	private String serie;

    @Column(name="NUMERO_MDFE")
	private String numeroMdfe;

    @Column(name="CODIGO_NUMERICO")
	private String codigoNumerico;

    @Column(name="CHAVE_ACESSO")
	private String chaveAcesso;

    @Column(name="DIGITO_VERIFICADOR")
	private Integer digitoVerificador;

    @Column(name="MODAL")
	private Integer modal;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_HORA_EMISSAO")
	private Date dataHoraEmissao;

    @Column(name="TIPO_EMISSAO")
	private Integer tipoEmissao;

    @Column(name="PROCESSO_EMISSAO")
	private Integer processoEmissao;

    @Column(name="VERSAO_PROCESSO_EMISSAO")
	private String versaoProcessoEmissao;

    @Column(name="UF_INICIO")
	private String ufInicio;

    @Column(name="UF_FIM")
	private String ufFim;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_HORA_PREVISAO_VIAGEM")
	private Date dataHoraPrevisaoViagem;

    @Column(name="QUANTIDADE_TOTAL_CTE")
	private Integer quantidadeTotalCte;

    @Column(name="QUANTIDADE_TOTAL_NFE")
	private Integer quantidadeTotalNfe;

    @Column(name="QUANTIDADE_TOTAL_MDFE")
	private Integer quantidadeTotalMdfe;

    @Column(name="CODIGO_UNIDADE_MEDIDA")
	private String codigoUnidadeMedida;

    @Column(name="PESO_BRUTO_CARGA")
	private BigDecimal pesoBrutoCarga;

    @Column(name="VALOR_CARGA")
	private BigDecimal valorCarga;

    @Column(name="NUMERO_PROTOCOLO")
	private String numeroProtocolo;

	public MdfeCabecalho() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getUf() {
		return this.uf;
	}

	public void setUf(Integer uf) {
		this.uf = uf;
	}

    public Integer getTipoAmbiente() {
		return this.tipoAmbiente;
	}

	public void setTipoAmbiente(Integer tipoAmbiente) {
		this.tipoAmbiente = tipoAmbiente;
	}

    public Integer getTipoEmitente() {
		return this.tipoEmitente;
	}

	public void setTipoEmitente(Integer tipoEmitente) {
		this.tipoEmitente = tipoEmitente;
	}

    public Integer getTipoTransportadora() {
		return this.tipoTransportadora;
	}

	public void setTipoTransportadora(Integer tipoTransportadora) {
		this.tipoTransportadora = tipoTransportadora;
	}

    public String getModelo() {
		return this.modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

    public String getSerie() {
		return this.serie;
	}

	public void setSerie(String serie) {
		this.serie = serie;
	}

    public String getNumeroMdfe() {
		return this.numeroMdfe;
	}

	public void setNumeroMdfe(String numeroMdfe) {
		this.numeroMdfe = numeroMdfe;
	}

    public String getCodigoNumerico() {
		return this.codigoNumerico;
	}

	public void setCodigoNumerico(String codigoNumerico) {
		this.codigoNumerico = codigoNumerico;
	}

    public String getChaveAcesso() {
		return this.chaveAcesso;
	}

	public void setChaveAcesso(String chaveAcesso) {
		this.chaveAcesso = chaveAcesso;
	}

    public Integer getDigitoVerificador() {
		return this.digitoVerificador;
	}

	public void setDigitoVerificador(Integer digitoVerificador) {
		this.digitoVerificador = digitoVerificador;
	}

    public Integer getModal() {
		return this.modal;
	}

	public void setModal(Integer modal) {
		this.modal = modal;
	}

    public Date getDataHoraEmissao() {
		return this.dataHoraEmissao;
	}

	public void setDataHoraEmissao(Date dataHoraEmissao) {
		this.dataHoraEmissao = dataHoraEmissao;
	}

    public Integer getTipoEmissao() {
		return this.tipoEmissao;
	}

	public void setTipoEmissao(Integer tipoEmissao) {
		this.tipoEmissao = tipoEmissao;
	}

    public Integer getProcessoEmissao() {
		return this.processoEmissao;
	}

	public void setProcessoEmissao(Integer processoEmissao) {
		this.processoEmissao = processoEmissao;
	}

    public String getVersaoProcessoEmissao() {
		return this.versaoProcessoEmissao;
	}

	public void setVersaoProcessoEmissao(String versaoProcessoEmissao) {
		this.versaoProcessoEmissao = versaoProcessoEmissao;
	}

    public String getUfInicio() {
		return this.ufInicio;
	}

	public void setUfInicio(String ufInicio) {
		this.ufInicio = ufInicio;
	}

    public String getUfFim() {
		return this.ufFim;
	}

	public void setUfFim(String ufFim) {
		this.ufFim = ufFim;
	}

    public Date getDataHoraPrevisaoViagem() {
		return this.dataHoraPrevisaoViagem;
	}

	public void setDataHoraPrevisaoViagem(Date dataHoraPrevisaoViagem) {
		this.dataHoraPrevisaoViagem = dataHoraPrevisaoViagem;
	}

    public Integer getQuantidadeTotalCte() {
		return this.quantidadeTotalCte;
	}

	public void setQuantidadeTotalCte(Integer quantidadeTotalCte) {
		this.quantidadeTotalCte = quantidadeTotalCte;
	}

    public Integer getQuantidadeTotalNfe() {
		return this.quantidadeTotalNfe;
	}

	public void setQuantidadeTotalNfe(Integer quantidadeTotalNfe) {
		this.quantidadeTotalNfe = quantidadeTotalNfe;
	}

    public Integer getQuantidadeTotalMdfe() {
		return this.quantidadeTotalMdfe;
	}

	public void setQuantidadeTotalMdfe(Integer quantidadeTotalMdfe) {
		this.quantidadeTotalMdfe = quantidadeTotalMdfe;
	}

    public String getCodigoUnidadeMedida() {
		return this.codigoUnidadeMedida;
	}

	public void setCodigoUnidadeMedida(String codigoUnidadeMedida) {
		this.codigoUnidadeMedida = codigoUnidadeMedida;
	}

    public BigDecimal getPesoBrutoCarga() {
		return this.pesoBrutoCarga;
	}

	public void setPesoBrutoCarga(BigDecimal pesoBrutoCarga) {
		this.pesoBrutoCarga = pesoBrutoCarga;
	}

    public BigDecimal getValorCarga() {
		return this.valorCarga;
	}

	public void setValorCarga(BigDecimal valorCarga) {
		this.valorCarga = valorCarga;
	}

    public String getNumeroProtocolo() {
		return this.numeroProtocolo;
	}

	public void setNumeroProtocolo(String numeroProtocolo) {
		this.numeroProtocolo = numeroProtocolo;
	}

		
}