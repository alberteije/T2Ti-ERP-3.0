/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [WMS_PARAMETRO] 
                                                                                
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
package com.t2ti.fenix.model.wms;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="WMS_PARAMETRO")
@NamedQuery(name="WmsParametro.findAll", query="SELECT t FROM WmsParametro t")
public class WmsParametro implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="HORA_POR_VOLUME")
	private Integer horaPorVolume;

    @Column(name="PESSOA_POR_VOLUME")
	private Integer pessoaPorVolume;

    @Column(name="HORA_POR_PESO")
	private Integer horaPorPeso;

    @Column(name="PESSOA_POR_PESO")
	private Integer pessoaPorPeso;

    @Column(name="ITEM_DIFERENTE_CAIXA")
	private String itemDiferenteCaixa;

	public WmsParametro() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getHoraPorVolume() {
		return this.horaPorVolume;
	}

	public void setHoraPorVolume(Integer horaPorVolume) {
		this.horaPorVolume = horaPorVolume;
	}

    public Integer getPessoaPorVolume() {
		return this.pessoaPorVolume;
	}

	public void setPessoaPorVolume(Integer pessoaPorVolume) {
		this.pessoaPorVolume = pessoaPorVolume;
	}

    public Integer getHoraPorPeso() {
		return this.horaPorPeso;
	}

	public void setHoraPorPeso(Integer horaPorPeso) {
		this.horaPorPeso = horaPorPeso;
	}

    public Integer getPessoaPorPeso() {
		return this.pessoaPorPeso;
	}

	public void setPessoaPorPeso(Integer pessoaPorPeso) {
		this.pessoaPorPeso = pessoaPorPeso;
	}

    public String getItemDiferenteCaixa() {
		return this.itemDiferenteCaixa;
	}

	public void setItemDiferenteCaixa(String itemDiferenteCaixa) {
		this.itemDiferenteCaixa = itemDiferenteCaixa;
	}

		
}