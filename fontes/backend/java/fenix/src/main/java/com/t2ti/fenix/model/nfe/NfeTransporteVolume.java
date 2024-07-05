/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE_VOLUME] 
                                                                                
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
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.CascadeType;

@Entity
@Table(name="NFE_TRANSPORTE_VOLUME")
@NamedQuery(name="NfeTransporteVolume.findAll", query="SELECT t FROM NfeTransporteVolume t")
public class NfeTransporteVolume implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="QUANTIDADE")
	private Integer quantidade;

    @Column(name="ESPECIE")
	private String especie;

    @Column(name="MARCA")
	private String marca;

    @Column(name="NUMERACAO")
	private String numeracao;

    @Column(name="PESO_LIQUIDO")
	private BigDecimal pesoLiquido;

    @Column(name="PESO_BRUTO")
	private BigDecimal pesoBruto;

    @OneToMany(mappedBy = "nfeTransporteVolume", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeTransporteVolumeLacre> listaNfeTransporteVolumeLacre;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_TRANSPORTE")
    private NfeTransporte nfeTransporte;

	public NfeTransporteVolume() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getQuantidade() {
		return this.quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

    public String getEspecie() {
		return this.especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

    public String getMarca() {
		return this.marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

    public String getNumeracao() {
		return this.numeracao;
	}

	public void setNumeracao(String numeracao) {
		this.numeracao = numeracao;
	}

    public BigDecimal getPesoLiquido() {
		return this.pesoLiquido;
	}

	public void setPesoLiquido(BigDecimal pesoLiquido) {
		this.pesoLiquido = pesoLiquido;
	}

    public BigDecimal getPesoBruto() {
		return this.pesoBruto;
	}

	public void setPesoBruto(BigDecimal pesoBruto) {
		this.pesoBruto = pesoBruto;
	}

    public NfeTransporte getNfeTransporte() {
		return this.nfeTransporte;
	}

	public void setNfeTransporte(NfeTransporte nfeTransporte) {
		this.nfeTransporte = nfeTransporte;
	}

    public Set<NfeTransporteVolumeLacre> getListaNfeTransporteVolumeLacre() {
		return this.listaNfeTransporteVolumeLacre;
	}

	public void setListaNfeTransporteVolumeLacre(Set<NfeTransporteVolumeLacre> listaNfeTransporteVolumeLacre) {
		this.listaNfeTransporteVolumeLacre = listaNfeTransporteVolumeLacre;
		for (NfeTransporteVolumeLacre nfeTransporteVolumeLacre : listaNfeTransporteVolumeLacre) {
			nfeTransporteVolumeLacre.setNfeTransporteVolume(this);
		}
	}

		
}