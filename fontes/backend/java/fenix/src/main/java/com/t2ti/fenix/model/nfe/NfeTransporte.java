/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE] 
                                                                                
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
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.t2ti.fenix.model.cadastros.Transportadora;

import javax.persistence.CascadeType;

@Entity
@Table(name="NFE_TRANSPORTE")
@NamedQuery(name="NfeTransporte.findAll", query="SELECT t FROM NfeTransporte t")
public class NfeTransporte implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="MODALIDADE_FRETE")
	private String modalidadeFrete;

    @Column(name="CNPJ")
	private String cnpj;

    @Column(name="CPF")
	private String cpf;

    @Column(name="NOME")
	private String nome;

    @Column(name="INSCRICAO_ESTADUAL")
	private String inscricaoEstadual;

    @Column(name="ENDERECO")
	private String endereco;

    @Column(name="NOME_MUNICIPIO")
	private String nomeMunicipio;

    @Column(name="UF")
	private String uf;

    @Column(name="VALOR_SERVICO")
	private BigDecimal valorServico;

    @Column(name="VALOR_BC_RETENCAO_ICMS")
	private BigDecimal valorBcRetencaoIcms;

    @Column(name="ALIQUOTA_RETENCAO_ICMS")
	private BigDecimal aliquotaRetencaoIcms;

    @Column(name="VALOR_ICMS_RETIDO")
	private BigDecimal valorIcmsRetido;

    @Column(name="CFOP")
	private Integer cfop;

    @Column(name="MUNICIPIO")
	private Integer municipio;

    @Column(name="PLACA_VEICULO")
	private String placaVeiculo;

    @Column(name="UF_VEICULO")
	private String ufVeiculo;

    @Column(name="RNTC_VEICULO")
	private String rntcVeiculo;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

    @ManyToOne
	@JoinColumn(name="ID_TRANSPORTADORA")
    private Transportadora transportadora;

    @OneToMany(mappedBy = "nfeTransporte", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeTransporteReboque> listaNfeTransporteReboque;

    @OneToMany(mappedBy = "nfeTransporte", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeTransporteVolume> listaNfeTransporteVolume;

	public NfeTransporte() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getModalidadeFrete() {
		return this.modalidadeFrete;
	}

	public void setModalidadeFrete(String modalidadeFrete) {
		this.modalidadeFrete = modalidadeFrete;
	}

    public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

    public String getCpf() {
		return this.cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

    public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

    public String getInscricaoEstadual() {
		return this.inscricaoEstadual;
	}

	public void setInscricaoEstadual(String inscricaoEstadual) {
		this.inscricaoEstadual = inscricaoEstadual;
	}

    public String getEndereco() {
		return this.endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

    public String getNomeMunicipio() {
		return this.nomeMunicipio;
	}

	public void setNomeMunicipio(String nomeMunicipio) {
		this.nomeMunicipio = nomeMunicipio;
	}

    public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

    public BigDecimal getValorServico() {
		return this.valorServico;
	}

	public void setValorServico(BigDecimal valorServico) {
		this.valorServico = valorServico;
	}

    public BigDecimal getValorBcRetencaoIcms() {
		return this.valorBcRetencaoIcms;
	}

	public void setValorBcRetencaoIcms(BigDecimal valorBcRetencaoIcms) {
		this.valorBcRetencaoIcms = valorBcRetencaoIcms;
	}

    public BigDecimal getAliquotaRetencaoIcms() {
		return this.aliquotaRetencaoIcms;
	}

	public void setAliquotaRetencaoIcms(BigDecimal aliquotaRetencaoIcms) {
		this.aliquotaRetencaoIcms = aliquotaRetencaoIcms;
	}

    public BigDecimal getValorIcmsRetido() {
		return this.valorIcmsRetido;
	}

	public void setValorIcmsRetido(BigDecimal valorIcmsRetido) {
		this.valorIcmsRetido = valorIcmsRetido;
	}

    public Integer getCfop() {
		return this.cfop;
	}

	public void setCfop(Integer cfop) {
		this.cfop = cfop;
	}

    public Integer getMunicipio() {
		return this.municipio;
	}

	public void setMunicipio(Integer municipio) {
		this.municipio = municipio;
	}

    public String getPlacaVeiculo() {
		return this.placaVeiculo;
	}

	public void setPlacaVeiculo(String placaVeiculo) {
		this.placaVeiculo = placaVeiculo;
	}

    public String getUfVeiculo() {
		return this.ufVeiculo;
	}

	public void setUfVeiculo(String ufVeiculo) {
		this.ufVeiculo = ufVeiculo;
	}

    public String getRntcVeiculo() {
		return this.rntcVeiculo;
	}

	public void setRntcVeiculo(String rntcVeiculo) {
		this.rntcVeiculo = rntcVeiculo;
	}

    public NfeCabecalho getNfeCabecalho() {
		return this.nfeCabecalho;
	}

	public void setNfeCabecalho(NfeCabecalho nfeCabecalho) {
		this.nfeCabecalho = nfeCabecalho;
	}

    public Transportadora getTransportadora() {
		return this.transportadora;
	}

	public void setTransportadora(Transportadora transportadora) {
		this.transportadora = transportadora;
	}

    public Set<NfeTransporteReboque> getListaNfeTransporteReboque() {
		return this.listaNfeTransporteReboque;
	}

	public void setListaNfeTransporteReboque(Set<NfeTransporteReboque> listaNfeTransporteReboque) {
		this.listaNfeTransporteReboque = listaNfeTransporteReboque;
		for (NfeTransporteReboque nfeTransporteReboque : listaNfeTransporteReboque) {
			nfeTransporteReboque.setNfeTransporte(this);
		}
	}

    public Set<NfeTransporteVolume> getListaNfeTransporteVolume() {
		return this.listaNfeTransporteVolume;
	}

	public void setListaNfeTransporteVolume(Set<NfeTransporteVolume> listaNfeTransporteVolume) {
		this.listaNfeTransporteVolume = listaNfeTransporteVolume;
		for (NfeTransporteVolume nfeTransporteVolume : listaNfeTransporteVolume) {
			nfeTransporteVolume.setNfeTransporte(this);
		}
	}

		
}