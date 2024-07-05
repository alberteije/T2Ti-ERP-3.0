/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_VEICULO] 
                                                                                
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
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="NFE_DET_ESPECIFICO_VEICULO")
@NamedQuery(name="NfeDetEspecificoVeiculo.findAll", query="SELECT t FROM NfeDetEspecificoVeiculo t")
public class NfeDetEspecificoVeiculo implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="TIPO_OPERACAO")
	private String tipoOperacao;

    @Column(name="CHASSI")
	private String chassi;

    @Column(name="COR")
	private String cor;

    @Column(name="DESCRICAO_COR")
	private String descricaoCor;

    @Column(name="POTENCIA_MOTOR")
	private String potenciaMotor;

    @Column(name="CILINDRADAS")
	private String cilindradas;

    @Column(name="PESO_LIQUIDO")
	private String pesoLiquido;

    @Column(name="PESO_BRUTO")
	private String pesoBruto;

    @Column(name="NUMERO_SERIE")
	private String numeroSerie;

    @Column(name="TIPO_COMBUSTIVEL")
	private String tipoCombustivel;

    @Column(name="NUMERO_MOTOR")
	private String numeroMotor;

    @Column(name="CAPACIDADE_MAXIMA_TRACAO")
	private String capacidadeMaximaTracao;

    @Column(name="DISTANCIA_EIXOS")
	private String distanciaEixos;

    @Column(name="ANO_MODELO")
	private String anoModelo;

    @Column(name="ANO_FABRICACAO")
	private String anoFabricacao;

    @Column(name="TIPO_PINTURA")
	private String tipoPintura;

    @Column(name="TIPO_VEICULO")
	private String tipoVeiculo;

    @Column(name="ESPECIE_VEICULO")
	private String especieVeiculo;

    @Column(name="CONDICAO_VIN")
	private String condicaoVin;

    @Column(name="CONDICAO_VEICULO")
	private String condicaoVeiculo;

    @Column(name="CODIGO_MARCA_MODELO")
	private String codigoMarcaModelo;

    @Column(name="CODIGO_COR_DENATRAN")
	private String codigoCorDenatran;

    @Column(name="LOTACAO_MAXIMA")
	private Integer lotacaoMaxima;

    @Column(name="RESTRICAO")
	private String restricao;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DETALHE")
    private NfeDetalhe nfeDetalhe;

	public NfeDetEspecificoVeiculo() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getTipoOperacao() {
		return this.tipoOperacao;
	}

	public void setTipoOperacao(String tipoOperacao) {
		this.tipoOperacao = tipoOperacao;
	}

    public String getChassi() {
		return this.chassi;
	}

	public void setChassi(String chassi) {
		this.chassi = chassi;
	}

    public String getCor() {
		return this.cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

    public String getDescricaoCor() {
		return this.descricaoCor;
	}

	public void setDescricaoCor(String descricaoCor) {
		this.descricaoCor = descricaoCor;
	}

    public String getPotenciaMotor() {
		return this.potenciaMotor;
	}

	public void setPotenciaMotor(String potenciaMotor) {
		this.potenciaMotor = potenciaMotor;
	}

    public String getCilindradas() {
		return this.cilindradas;
	}

	public void setCilindradas(String cilindradas) {
		this.cilindradas = cilindradas;
	}

    public String getPesoLiquido() {
		return this.pesoLiquido;
	}

	public void setPesoLiquido(String pesoLiquido) {
		this.pesoLiquido = pesoLiquido;
	}

    public String getPesoBruto() {
		return this.pesoBruto;
	}

	public void setPesoBruto(String pesoBruto) {
		this.pesoBruto = pesoBruto;
	}

    public String getNumeroSerie() {
		return this.numeroSerie;
	}

	public void setNumeroSerie(String numeroSerie) {
		this.numeroSerie = numeroSerie;
	}

    public String getTipoCombustivel() {
		return this.tipoCombustivel;
	}

	public void setTipoCombustivel(String tipoCombustivel) {
		this.tipoCombustivel = tipoCombustivel;
	}

    public String getNumeroMotor() {
		return this.numeroMotor;
	}

	public void setNumeroMotor(String numeroMotor) {
		this.numeroMotor = numeroMotor;
	}

    public String getCapacidadeMaximaTracao() {
		return this.capacidadeMaximaTracao;
	}

	public void setCapacidadeMaximaTracao(String capacidadeMaximaTracao) {
		this.capacidadeMaximaTracao = capacidadeMaximaTracao;
	}

    public String getDistanciaEixos() {
		return this.distanciaEixos;
	}

	public void setDistanciaEixos(String distanciaEixos) {
		this.distanciaEixos = distanciaEixos;
	}

    public String getAnoModelo() {
		return this.anoModelo;
	}

	public void setAnoModelo(String anoModelo) {
		this.anoModelo = anoModelo;
	}

    public String getAnoFabricacao() {
		return this.anoFabricacao;
	}

	public void setAnoFabricacao(String anoFabricacao) {
		this.anoFabricacao = anoFabricacao;
	}

    public String getTipoPintura() {
		return this.tipoPintura;
	}

	public void setTipoPintura(String tipoPintura) {
		this.tipoPintura = tipoPintura;
	}

    public String getTipoVeiculo() {
		return this.tipoVeiculo;
	}

	public void setTipoVeiculo(String tipoVeiculo) {
		this.tipoVeiculo = tipoVeiculo;
	}

    public String getEspecieVeiculo() {
		return this.especieVeiculo;
	}

	public void setEspecieVeiculo(String especieVeiculo) {
		this.especieVeiculo = especieVeiculo;
	}

    public String getCondicaoVin() {
		return this.condicaoVin;
	}

	public void setCondicaoVin(String condicaoVin) {
		this.condicaoVin = condicaoVin;
	}

    public String getCondicaoVeiculo() {
		return this.condicaoVeiculo;
	}

	public void setCondicaoVeiculo(String condicaoVeiculo) {
		this.condicaoVeiculo = condicaoVeiculo;
	}

    public String getCodigoMarcaModelo() {
		return this.codigoMarcaModelo;
	}

	public void setCodigoMarcaModelo(String codigoMarcaModelo) {
		this.codigoMarcaModelo = codigoMarcaModelo;
	}

    public String getCodigoCorDenatran() {
		return this.codigoCorDenatran;
	}

	public void setCodigoCorDenatran(String codigoCorDenatran) {
		this.codigoCorDenatran = codigoCorDenatran;
	}

    public Integer getLotacaoMaxima() {
		return this.lotacaoMaxima;
	}

	public void setLotacaoMaxima(Integer lotacaoMaxima) {
		this.lotacaoMaxima = lotacaoMaxima;
	}

    public String getRestricao() {
		return this.restricao;
	}

	public void setRestricao(String restricao) {
		this.restricao = restricao;
	}

    public NfeDetalhe getNfeDetalhe() {
		return this.nfeDetalhe;
	}

	public void setNfeDetalhe(NfeDetalhe nfeDetalhe) {
		this.nfeDetalhe = nfeDetalhe;
	}

		
}