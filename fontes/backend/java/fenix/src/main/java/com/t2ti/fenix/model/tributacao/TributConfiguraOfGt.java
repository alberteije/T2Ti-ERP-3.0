/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
package com.t2ti.fenix.model.tributacao;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@Table(name="TRIBUT_CONFIGURA_OF_GT")
@NamedQuery(name="TributConfiguraOfGt.findAll", query="SELECT t FROM TributConfiguraOfGt t")
public class TributConfiguraOfGt implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @OneToOne(mappedBy = "tributConfiguraOfGt", cascade = CascadeType.ALL, orphanRemoval = true)
    private TributCofins tributCofins;

    @OneToOne(mappedBy = "tributConfiguraOfGt", cascade = CascadeType.ALL, orphanRemoval = true)
    private TributIpi tributIpi;

    @OneToOne(mappedBy = "tributConfiguraOfGt", cascade = CascadeType.ALL, orphanRemoval = true)
    private TributPis tributPis;

    @ManyToOne
	@JoinColumn(name="ID_TRIBUT_GRUPO_TRIBUTARIO")
    private TributGrupoTributario tributGrupoTributario;

    @ManyToOne
	@JoinColumn(name="ID_TRIBUT_OPERACAO_FISCAL")
    private TributOperacaoFiscal tributOperacaoFiscal;

    @OneToMany(mappedBy = "tributConfiguraOfGt", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<TributIcmsUf> listaTributIcmsUf;

	public TributConfiguraOfGt() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public TributCofins getTributCofins() {
		return this.tributCofins;
	}

	public void setTributCofins(TributCofins tributCofins) {
		this.tributCofins = tributCofins;
		if (tributCofins != null) {
			tributCofins.setTributConfiguraOfGt(this);
		}
	}

    public TributIpi getTributIpi() {
		return this.tributIpi;
	}

	public void setTributIpi(TributIpi tributIpi) {
		this.tributIpi = tributIpi;
		if (tributIpi != null) {
			tributIpi.setTributConfiguraOfGt(this);
		}
	}

    public TributPis getTributPis() {
		return this.tributPis;
	}

	public void setTributPis(TributPis tributPis) {
		this.tributPis = tributPis;
		if (tributPis != null) {
			tributPis.setTributConfiguraOfGt(this);
		}
	}

    public TributGrupoTributario getTributGrupoTributario() {
		return this.tributGrupoTributario;
	}

	public void setTributGrupoTributario(TributGrupoTributario tributGrupoTributario) {
		this.tributGrupoTributario = tributGrupoTributario;
	}

    public TributOperacaoFiscal getTributOperacaoFiscal() {
		return this.tributOperacaoFiscal;
	}

	public void setTributOperacaoFiscal(TributOperacaoFiscal tributOperacaoFiscal) {
		this.tributOperacaoFiscal = tributOperacaoFiscal;
	}

    public Set<TributIcmsUf> getListaTributIcmsUf() {
		return this.listaTributIcmsUf;
	}

	public void setListaTributIcmsUf(Set<TributIcmsUf> listaTributIcmsUf) {
		this.listaTributIcmsUf = listaTributIcmsUf;
		for (TributIcmsUf tributIcmsUf : listaTributIcmsUf) {
			tributIcmsUf.setTributConfiguraOfGt(this);
		}
	}

		
}