/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CANA] 
                                                                                
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
import java.util.Set;
import javax.persistence.OneToMany;
import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.CascadeType;

@Entity
@Table(name="NFE_CANA")
@NamedQuery(name="NfeCana.findAll", query="SELECT t FROM NfeCana t")
public class NfeCana implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="SAFRA")
	private String safra;

    @Column(name="MES_ANO_REFERENCIA")
	private String mesAnoReferencia;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

    @OneToMany(mappedBy = "nfeCana", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeCanaDeducoesSafra> listaNfeCanaDeducoesSafra;

    @OneToMany(mappedBy = "nfeCana", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<NfeCanaFornecimentoDiario> listaNfeCanaFornecimentoDiario;

	public NfeCana() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getSafra() {
		return this.safra;
	}

	public void setSafra(String safra) {
		this.safra = safra;
	}

    public String getMesAnoReferencia() {
		return this.mesAnoReferencia;
	}

	public void setMesAnoReferencia(String mesAnoReferencia) {
		this.mesAnoReferencia = mesAnoReferencia;
	}

    public NfeCabecalho getNfeCabecalho() {
		return this.nfeCabecalho;
	}

	public void setNfeCabecalho(NfeCabecalho nfeCabecalho) {
		this.nfeCabecalho = nfeCabecalho;
	}

    public Set<NfeCanaDeducoesSafra> getListaNfeCanaDeducoesSafra() {
		return this.listaNfeCanaDeducoesSafra;
	}

	public void setListaNfeCanaDeducoesSafra(Set<NfeCanaDeducoesSafra> listaNfeCanaDeducoesSafra) {
		this.listaNfeCanaDeducoesSafra = listaNfeCanaDeducoesSafra;
		for (NfeCanaDeducoesSafra nfeCanaDeducoesSafra : listaNfeCanaDeducoesSafra) {
			nfeCanaDeducoesSafra.setNfeCana(this);
		}
	}

    public Set<NfeCanaFornecimentoDiario> getListaNfeCanaFornecimentoDiario() {
		return this.listaNfeCanaFornecimentoDiario;
	}

	public void setListaNfeCanaFornecimentoDiario(Set<NfeCanaFornecimentoDiario> listaNfeCanaFornecimentoDiario) {
		this.listaNfeCanaFornecimentoDiario = listaNfeCanaFornecimentoDiario;
		for (NfeCanaFornecimentoDiario nfeCanaFornecimentoDiario : listaNfeCanaFornecimentoDiario) {
			nfeCanaFornecimentoDiario.setNfeCana(this);
		}
	}

		
}