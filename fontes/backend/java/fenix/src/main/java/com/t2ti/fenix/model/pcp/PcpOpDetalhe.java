/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PCP_OP_DETALHE] 
                                                                                
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
package com.t2ti.fenix.model.pcp;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.math.BigDecimal;

@Entity
@Table(name="PCP_OP_DETALHE")
@NamedQuery(name="PcpOpDetalhe.findAll", query="SELECT t FROM PcpOpDetalhe t")
public class PcpOpDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_PCP_OP_CABECALHO")
	private Integer idPcpOpCabecalho;

    @Column(name="ID_PRODUTO")
	private Integer idProduto;

    @Column(name="QUANTIDADE_PRODUZIR")
	private BigDecimal quantidadeProduzir;

    @Column(name="QUANTIDADE_PRODUZIDA")
	private BigDecimal quantidadeProduzida;

    @Column(name="QUANTIDADE_ENTREGUE")
	private BigDecimal quantidadeEntregue;

    @Column(name="CUSTO_PREVISTO")
	private BigDecimal custoPrevisto;

    @Column(name="CUSTO_REALIZADO")
	private BigDecimal custoRealizado;

	public PcpOpDetalhe() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdPcpOpCabecalho() {
		return this.idPcpOpCabecalho;
	}

	public void setIdPcpOpCabecalho(Integer idPcpOpCabecalho) {
		this.idPcpOpCabecalho = idPcpOpCabecalho;
	}

    public Integer getIdProduto() {
		return this.idProduto;
	}

	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
	}

    public BigDecimal getQuantidadeProduzir() {
		return this.quantidadeProduzir;
	}

	public void setQuantidadeProduzir(BigDecimal quantidadeProduzir) {
		this.quantidadeProduzir = quantidadeProduzir;
	}

    public BigDecimal getQuantidadeProduzida() {
		return this.quantidadeProduzida;
	}

	public void setQuantidadeProduzida(BigDecimal quantidadeProduzida) {
		this.quantidadeProduzida = quantidadeProduzida;
	}

    public BigDecimal getQuantidadeEntregue() {
		return this.quantidadeEntregue;
	}

	public void setQuantidadeEntregue(BigDecimal quantidadeEntregue) {
		this.quantidadeEntregue = quantidadeEntregue;
	}

    public BigDecimal getCustoPrevisto() {
		return this.custoPrevisto;
	}

	public void setCustoPrevisto(BigDecimal custoPrevisto) {
		this.custoPrevisto = custoPrevisto;
	}

    public BigDecimal getCustoRealizado() {
		return this.custoRealizado;
	}

	public void setCustoRealizado(BigDecimal custoRealizado) {
		this.custoRealizado = custoRealizado;
	}

		
}