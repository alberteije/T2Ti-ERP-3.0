/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_INFORMACAO_CTE] 
                                                                                
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

@Entity
@Table(name="MDFE_INFORMACAO_CTE")
@NamedQuery(name="MdfeInformacaoCte.findAll", query="SELECT t FROM MdfeInformacaoCte t")
public class MdfeInformacaoCte implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_MDFE_MUNICIPIO_DESCARREGA")
	private Integer idMdfeMunicipioDescarrega;

    @Column(name="CHAVE_CTE")
	private String chaveCte;

    @Column(name="SEGUNDO_CODIGO_BARRA")
	private String segundoCodigoBarra;

    @Column(name="INDICADOR_REENTREGA")
	private Integer indicadorReentrega;

	public MdfeInformacaoCte() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdMdfeMunicipioDescarrega() {
		return this.idMdfeMunicipioDescarrega;
	}

	public void setIdMdfeMunicipioDescarrega(Integer idMdfeMunicipioDescarrega) {
		this.idMdfeMunicipioDescarrega = idMdfeMunicipioDescarrega;
	}

    public String getChaveCte() {
		return this.chaveCte;
	}

	public void setChaveCte(String chaveCte) {
		this.chaveCte = chaveCte;
	}

    public String getSegundoCodigoBarra() {
		return this.segundoCodigoBarra;
	}

	public void setSegundoCodigoBarra(String segundoCodigoBarra) {
		this.segundoCodigoBarra = segundoCodigoBarra;
	}

    public Integer getIndicadorReentrega() {
		return this.indicadorReentrega;
	}

	public void setIndicadorReentrega(Integer indicadorReentrega) {
		this.indicadorReentrega = indicadorReentrega;
	}

		
}