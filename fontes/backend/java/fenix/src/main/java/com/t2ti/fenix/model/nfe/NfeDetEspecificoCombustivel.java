/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_COMBUSTIVEL] 
                                                                                
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
package com.t2ti.fenix.model.nfe;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.math.BigDecimal;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="NFE_DET_ESPECIFICO_COMBUSTIVEL")
@NamedQuery(name="NfeDetEspecificoCombustivel.findAll", query="SELECT t FROM NfeDetEspecificoCombustivel t")
public class NfeDetEspecificoCombustivel implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CODIGO_ANP")
	private Integer codigoAnp;

    @Column(name="DESCRICAO_ANP")
	private String descricaoAnp;

    @Column(name="PERCENTUAL_GLP")
	private BigDecimal percentualGlp;

    @Column(name="PERCENTUAL_GAS_NACIONAL")
	private BigDecimal percentualGasNacional;

    @Column(name="PERCENTUAL_GAS_IMPORTADO")
	private BigDecimal percentualGasImportado;

    @Column(name="VALOR_PARTIDA")
	private BigDecimal valorPartida;

    @Column(name="CODIF")
	private String codif;

    @Column(name="QUANTIDADE_TEMP_AMBIENTE")
	private BigDecimal quantidadeTempAmbiente;

    @Column(name="UF_CONSUMO")
	private String ufConsumo;

    @Column(name="CIDE_BASE_CALCULO")
	private BigDecimal cideBaseCalculo;

    @Column(name="CIDE_ALIQUOTA")
	private BigDecimal cideAliquota;

    @Column(name="CIDE_VALOR")
	private BigDecimal cideValor;

    @Column(name="ENCERRANTE_BICO")
	private Integer encerranteBico;

    @Column(name="ENCERRANTE_BOMBA")
	private Integer encerranteBomba;

    @Column(name="ENCERRANTE_TANQUE")
	private Integer encerranteTanque;

    @Column(name="ENCERRANTE_VALOR_INICIO")
	private BigDecimal encerranteValorInicio;

    @Column(name="ENCERRANTE_VALOR_FIM")
	private BigDecimal encerranteValorFim;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DETALHE")
    private NfeDetalhe nfeDetalhe;

	public NfeDetEspecificoCombustivel() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getCodigoAnp() {
		return this.codigoAnp;
	}

	public void setCodigoAnp(Integer codigoAnp) {
		this.codigoAnp = codigoAnp;
	}

    public String getDescricaoAnp() {
		return this.descricaoAnp;
	}

	public void setDescricaoAnp(String descricaoAnp) {
		this.descricaoAnp = descricaoAnp;
	}

    public BigDecimal getPercentualGlp() {
		return this.percentualGlp;
	}

	public void setPercentualGlp(BigDecimal percentualGlp) {
		this.percentualGlp = percentualGlp;
	}

    public BigDecimal getPercentualGasNacional() {
		return this.percentualGasNacional;
	}

	public void setPercentualGasNacional(BigDecimal percentualGasNacional) {
		this.percentualGasNacional = percentualGasNacional;
	}

    public BigDecimal getPercentualGasImportado() {
		return this.percentualGasImportado;
	}

	public void setPercentualGasImportado(BigDecimal percentualGasImportado) {
		this.percentualGasImportado = percentualGasImportado;
	}

    public BigDecimal getValorPartida() {
		return this.valorPartida;
	}

	public void setValorPartida(BigDecimal valorPartida) {
		this.valorPartida = valorPartida;
	}

    public String getCodif() {
		return this.codif;
	}

	public void setCodif(String codif) {
		this.codif = codif;
	}

    public BigDecimal getQuantidadeTempAmbiente() {
		return this.quantidadeTempAmbiente;
	}

	public void setQuantidadeTempAmbiente(BigDecimal quantidadeTempAmbiente) {
		this.quantidadeTempAmbiente = quantidadeTempAmbiente;
	}

    public String getUfConsumo() {
		return this.ufConsumo;
	}

	public void setUfConsumo(String ufConsumo) {
		this.ufConsumo = ufConsumo;
	}

    public BigDecimal getCideBaseCalculo() {
		return this.cideBaseCalculo;
	}

	public void setCideBaseCalculo(BigDecimal cideBaseCalculo) {
		this.cideBaseCalculo = cideBaseCalculo;
	}

    public BigDecimal getCideAliquota() {
		return this.cideAliquota;
	}

	public void setCideAliquota(BigDecimal cideAliquota) {
		this.cideAliquota = cideAliquota;
	}

    public BigDecimal getCideValor() {
		return this.cideValor;
	}

	public void setCideValor(BigDecimal cideValor) {
		this.cideValor = cideValor;
	}

    public Integer getEncerranteBico() {
		return this.encerranteBico;
	}

	public void setEncerranteBico(Integer encerranteBico) {
		this.encerranteBico = encerranteBico;
	}

    public Integer getEncerranteBomba() {
		return this.encerranteBomba;
	}

	public void setEncerranteBomba(Integer encerranteBomba) {
		this.encerranteBomba = encerranteBomba;
	}

    public Integer getEncerranteTanque() {
		return this.encerranteTanque;
	}

	public void setEncerranteTanque(Integer encerranteTanque) {
		this.encerranteTanque = encerranteTanque;
	}

    public BigDecimal getEncerranteValorInicio() {
		return this.encerranteValorInicio;
	}

	public void setEncerranteValorInicio(BigDecimal encerranteValorInicio) {
		this.encerranteValorInicio = encerranteValorInicio;
	}

    public BigDecimal getEncerranteValorFim() {
		return this.encerranteValorFim;
	}

	public void setEncerranteValorFim(BigDecimal encerranteValorFim) {
		this.encerranteValorFim = encerranteValorFim;
	}

    public NfeDetalhe getNfeDetalhe() {
		return this.nfeDetalhe;
	}

	public void setNfeDetalhe(NfeDetalhe nfeDetalhe) {
		this.nfeDetalhe = nfeDetalhe;
	}

		
}