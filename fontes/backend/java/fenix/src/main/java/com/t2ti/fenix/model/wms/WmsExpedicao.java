/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [WMS_EXPEDICAO] 
                                                                                
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
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="WMS_EXPEDICAO")
@NamedQuery(name="WmsExpedicao.findAll", query="SELECT t FROM WmsExpedicao t")
public class WmsExpedicao implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_WMS_ORDEM_SEPARACAO_DET")
	private Integer idWmsOrdemSeparacaoDet;

    @Column(name="ID_WMS_ARMAZENAMENTO")
	private Integer idWmsArmazenamento;

    @Column(name="QUANTIDADE")
	private Integer quantidade;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_SAIDA")
	private Date dataSaida;

	public WmsExpedicao() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdWmsOrdemSeparacaoDet() {
		return this.idWmsOrdemSeparacaoDet;
	}

	public void setIdWmsOrdemSeparacaoDet(Integer idWmsOrdemSeparacaoDet) {
		this.idWmsOrdemSeparacaoDet = idWmsOrdemSeparacaoDet;
	}

    public Integer getIdWmsArmazenamento() {
		return this.idWmsArmazenamento;
	}

	public void setIdWmsArmazenamento(Integer idWmsArmazenamento) {
		this.idWmsArmazenamento = idWmsArmazenamento;
	}

    public Integer getQuantidade() {
		return this.quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

    public Date getDataSaida() {
		return this.dataSaida;
	}

	public void setDataSaida(Date dataSaida) {
		this.dataSaida = dataSaida;
	}

		
}