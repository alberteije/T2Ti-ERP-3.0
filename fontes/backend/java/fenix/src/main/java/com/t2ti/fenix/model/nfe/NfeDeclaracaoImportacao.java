/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DECLARACAO_IMPORTACAO] 
                                                                                
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
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.CascadeType;

@Entity
@Table(name="NFE_DECLARACAO_IMPORTACAO")
@NamedQuery(name="NfeDeclaracaoImportacao.findAll", query="SELECT t FROM NfeDeclaracaoImportacao t")
public class NfeDeclaracaoImportacao implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NUMERO_DOCUMENTO")
	private String numeroDocumento;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_REGISTRO")
	private Date dataRegistro;

    @Column(name="LOCAL_DESEMBARACO")
	private String localDesembaraco;

    @Column(name="UF_DESEMBARACO")
	private String ufDesembaraco;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_DESEMBARACO")
	private Date dataDesembaraco;

    @Column(name="VIA_TRANSPORTE")
	private String viaTransporte;

    @Column(name="VALOR_AFRMM")
	private BigDecimal valorAfrmm;

    @Column(name="FORMA_INTERMEDIACAO")
	private String formaIntermediacao;

    @Column(name="CNPJ")
	private String cnpj;

    @Column(name="UF_TERCEIRO")
	private String ufTerceiro;

    @Column(name="CODIGO_EXPORTADOR")
	private String codigoExportador;

    @OneToMany(mappedBy = "nfeDeclaracaoImportacao", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeImportacaoDetalhe> listaNfeImportacaoDetalhe;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DETALHE")
    private NfeDetalhe nfeDetalhe;

	public NfeDeclaracaoImportacao() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getNumeroDocumento() {
		return this.numeroDocumento;
	}

	public void setNumeroDocumento(String numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
	}

    public Date getDataRegistro() {
		return this.dataRegistro;
	}

	public void setDataRegistro(Date dataRegistro) {
		this.dataRegistro = dataRegistro;
	}

    public String getLocalDesembaraco() {
		return this.localDesembaraco;
	}

	public void setLocalDesembaraco(String localDesembaraco) {
		this.localDesembaraco = localDesembaraco;
	}

    public String getUfDesembaraco() {
		return this.ufDesembaraco;
	}

	public void setUfDesembaraco(String ufDesembaraco) {
		this.ufDesembaraco = ufDesembaraco;
	}

    public Date getDataDesembaraco() {
		return this.dataDesembaraco;
	}

	public void setDataDesembaraco(Date dataDesembaraco) {
		this.dataDesembaraco = dataDesembaraco;
	}

    public String getViaTransporte() {
		return this.viaTransporte;
	}

	public void setViaTransporte(String viaTransporte) {
		this.viaTransporte = viaTransporte;
	}

    public BigDecimal getValorAfrmm() {
		return this.valorAfrmm;
	}

	public void setValorAfrmm(BigDecimal valorAfrmm) {
		this.valorAfrmm = valorAfrmm;
	}

    public String getFormaIntermediacao() {
		return this.formaIntermediacao;
	}

	public void setFormaIntermediacao(String formaIntermediacao) {
		this.formaIntermediacao = formaIntermediacao;
	}

    public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

    public String getUfTerceiro() {
		return this.ufTerceiro;
	}

	public void setUfTerceiro(String ufTerceiro) {
		this.ufTerceiro = ufTerceiro;
	}

    public String getCodigoExportador() {
		return this.codigoExportador;
	}

	public void setCodigoExportador(String codigoExportador) {
		this.codigoExportador = codigoExportador;
	}

    public NfeDetalhe getNfeDetalhe() {
		return this.nfeDetalhe;
	}

	public void setNfeDetalhe(NfeDetalhe nfeDetalhe) {
		this.nfeDetalhe = nfeDetalhe;
	}

    public Set<NfeImportacaoDetalhe> getListaNfeImportacaoDetalhe() {
		return this.listaNfeImportacaoDetalhe;
	}

	public void setListaNfeImportacaoDetalhe(Set<NfeImportacaoDetalhe> listaNfeImportacaoDetalhe) {
		this.listaNfeImportacaoDetalhe = listaNfeImportacaoDetalhe;
		for (NfeImportacaoDetalhe nfeImportacaoDetalhe : listaNfeImportacaoDetalhe) {
			nfeImportacaoDetalhe.setNfeDeclaracaoImportacao(this);
		}
	}

		
}