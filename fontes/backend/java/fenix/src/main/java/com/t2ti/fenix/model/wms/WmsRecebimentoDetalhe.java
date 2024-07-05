/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [WMS_RECEBIMENTO_DETALHE] 
                                                                                
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
@Table(name="WMS_RECEBIMENTO_DETALHE")
@NamedQuery(name="WmsRecebimentoDetalhe.findAll", query="SELECT t FROM WmsRecebimentoDetalhe t")
public class WmsRecebimentoDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_WMS_RECEBIMENTO_CABECALHO")
	private Integer idWmsRecebimentoCabecalho;

    @Column(name="ID_PRODUTO")
	private Integer idProduto;

    @Column(name="QUANTIDADE_VOLUME")
	private Integer quantidadeVolume;

    @Column(name="QUANTIDADE_ITEM_POR_VOLUME")
	private Integer quantidadeItemPorVolume;

    @Column(name="QUANTIDADE_RECEBIDA")
	private Integer quantidadeRecebida;

    @Column(name="DESTINO")
	private String destino;

	public WmsRecebimentoDetalhe() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdWmsRecebimentoCabecalho() {
		return this.idWmsRecebimentoCabecalho;
	}

	public void setIdWmsRecebimentoCabecalho(Integer idWmsRecebimentoCabecalho) {
		this.idWmsRecebimentoCabecalho = idWmsRecebimentoCabecalho;
	}

    public Integer getIdProduto() {
		return this.idProduto;
	}

	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
	}

    public Integer getQuantidadeVolume() {
		return this.quantidadeVolume;
	}

	public void setQuantidadeVolume(Integer quantidadeVolume) {
		this.quantidadeVolume = quantidadeVolume;
	}

    public Integer getQuantidadeItemPorVolume() {
		return this.quantidadeItemPorVolume;
	}

	public void setQuantidadeItemPorVolume(Integer quantidadeItemPorVolume) {
		this.quantidadeItemPorVolume = quantidadeItemPorVolume;
	}

    public Integer getQuantidadeRecebida() {
		return this.quantidadeRecebida;
	}

	public void setQuantidadeRecebida(Integer quantidadeRecebida) {
		this.quantidadeRecebida = quantidadeRecebida;
	}

    public String getDestino() {
		return this.destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

		
}