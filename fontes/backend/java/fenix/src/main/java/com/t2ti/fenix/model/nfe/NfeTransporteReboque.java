/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE_REBOQUE] 
                                                                                
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
import javax.persistence.ManyToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="NFE_TRANSPORTE_REBOQUE")
@NamedQuery(name="NfeTransporteReboque.findAll", query="SELECT t FROM NfeTransporteReboque t")
public class NfeTransporteReboque implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="PLACA")
	private String placa;

    @Column(name="UF")
	private String uf;

    @Column(name="RNTC")
	private String rntc;

    @Column(name="VAGAO")
	private String vagao;

    @Column(name="BALSA")
	private String balsa;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_TRANSPORTE")
    private NfeTransporte nfeTransporte;

	public NfeTransporteReboque() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getPlaca() {
		return this.placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

    public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

    public String getRntc() {
		return this.rntc;
	}

	public void setRntc(String rntc) {
		this.rntc = rntc;
	}

    public String getVagao() {
		return this.vagao;
	}

	public void setVagao(String vagao) {
		this.vagao = vagao;
	}

    public String getBalsa() {
		return this.balsa;
	}

	public void setBalsa(String balsa) {
		this.balsa = balsa;
	}

    public NfeTransporte getNfeTransporte() {
		return this.nfeTransporte;
	}

	public void setNfeTransporte(NfeTransporte nfeTransporte) {
		this.nfeTransporte = nfeTransporte;
	}

		
}