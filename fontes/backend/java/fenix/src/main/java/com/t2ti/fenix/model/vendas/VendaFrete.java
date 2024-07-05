/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_FRETE] 
                                                                                
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
package com.t2ti.fenix.model.vendas;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.t2ti.fenix.model.cadastros.Transportadora;

@Entity
@Table(name="VENDA_FRETE")
@NamedQuery(name="VendaFrete.findAll", query="SELECT t FROM VendaFrete t")
public class VendaFrete implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CONHECIMENTO")
	private Integer conhecimento;

    @Column(name="RESPONSAVEL")
	private String responsavel;

    @Column(name="PLACA")
	private String placa;

    @Column(name="UF_PLACA")
	private String ufPlaca;

    @Column(name="SELO_FISCAL")
	private Integer seloFiscal;

    @Column(name="QUANTIDADE_VOLUME")
	private BigDecimal quantidadeVolume;

    @Column(name="MARCA_VOLUME")
	private String marcaVolume;

    @Column(name="ESPECIE_VOLUME")
	private String especieVolume;

    @Column(name="PESO_BRUTO")
	private BigDecimal pesoBruto;

    @Column(name="PESO_LIQUIDO")
	private BigDecimal pesoLiquido;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_VENDA_CABECALHO")
    private VendaCabecalho vendaCabecalho;

    @ManyToOne
	@JoinColumn(name="ID_TRANSPORTADORA")
    private Transportadora transportadora;

	public VendaFrete() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getConhecimento() {
		return this.conhecimento;
	}

	public void setConhecimento(Integer conhecimento) {
		this.conhecimento = conhecimento;
	}

    public String getResponsavel() {
		return this.responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

    public String getPlaca() {
		return this.placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

    public String getUfPlaca() {
		return this.ufPlaca;
	}

	public void setUfPlaca(String ufPlaca) {
		this.ufPlaca = ufPlaca;
	}

    public Integer getSeloFiscal() {
		return this.seloFiscal;
	}

	public void setSeloFiscal(Integer seloFiscal) {
		this.seloFiscal = seloFiscal;
	}

    public BigDecimal getQuantidadeVolume() {
		return this.quantidadeVolume;
	}

	public void setQuantidadeVolume(BigDecimal quantidadeVolume) {
		this.quantidadeVolume = quantidadeVolume;
	}

    public String getMarcaVolume() {
		return this.marcaVolume;
	}

	public void setMarcaVolume(String marcaVolume) {
		this.marcaVolume = marcaVolume;
	}

    public String getEspecieVolume() {
		return this.especieVolume;
	}

	public void setEspecieVolume(String especieVolume) {
		this.especieVolume = especieVolume;
	}

    public BigDecimal getPesoBruto() {
		return this.pesoBruto;
	}

	public void setPesoBruto(BigDecimal pesoBruto) {
		this.pesoBruto = pesoBruto;
	}

    public BigDecimal getPesoLiquido() {
		return this.pesoLiquido;
	}

	public void setPesoLiquido(BigDecimal pesoLiquido) {
		this.pesoLiquido = pesoLiquido;
	}

    public VendaCabecalho getVendaCabecalho() {
		return this.vendaCabecalho;
	}

	public void setVendaCabecalho(VendaCabecalho vendaCabecalho) {
		this.vendaCabecalho = vendaCabecalho;
	}

    public Transportadora getTransportadora() {
		return this.transportadora;
	}

	public void setTransportadora(Transportadora transportadora) {
		this.transportadora = transportadora;
	}

		
}