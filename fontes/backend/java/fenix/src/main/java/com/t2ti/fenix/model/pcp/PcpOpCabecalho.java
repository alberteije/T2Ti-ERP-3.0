/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PCP_OP_CABECALHO] 
                                                                                
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
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="PCP_OP_CABECALHO")
@NamedQuery(name="PcpOpCabecalho.findAll", query="SELECT t FROM PcpOpCabecalho t")
public class PcpOpCabecalho implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="INICIO")
	private Date inicio;

    @Temporal(TemporalType.DATE)
	@Column(name="PREVISAO_ENTREGA")
	private Date previsaoEntrega;

    @Temporal(TemporalType.DATE)
	@Column(name="TERMINO")
	private Date termino;

    @Column(name="CUSTO_TOTAL_PREVISTO")
	private BigDecimal custoTotalPrevisto;

    @Column(name="CUSTO_TOTAL_REALIZADO")
	private BigDecimal custoTotalRealizado;

    @Column(name="PORCENTO_VENDA")
	private BigDecimal porcentoVenda;

    @Column(name="PORCENTO_ESTOQUE")
	private BigDecimal porcentoEstoque;

	public PcpOpCabecalho() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getInicio() {
		return this.inicio;
	}

	public void setInicio(Date inicio) {
		this.inicio = inicio;
	}

    public Date getPrevisaoEntrega() {
		return this.previsaoEntrega;
	}

	public void setPrevisaoEntrega(Date previsaoEntrega) {
		this.previsaoEntrega = previsaoEntrega;
	}

    public Date getTermino() {
		return this.termino;
	}

	public void setTermino(Date termino) {
		this.termino = termino;
	}

    public BigDecimal getCustoTotalPrevisto() {
		return this.custoTotalPrevisto;
	}

	public void setCustoTotalPrevisto(BigDecimal custoTotalPrevisto) {
		this.custoTotalPrevisto = custoTotalPrevisto;
	}

    public BigDecimal getCustoTotalRealizado() {
		return this.custoTotalRealizado;
	}

	public void setCustoTotalRealizado(BigDecimal custoTotalRealizado) {
		this.custoTotalRealizado = custoTotalRealizado;
	}

    public BigDecimal getPorcentoVenda() {
		return this.porcentoVenda;
	}

	public void setPorcentoVenda(BigDecimal porcentoVenda) {
		this.porcentoVenda = porcentoVenda;
	}

    public BigDecimal getPorcentoEstoque() {
		return this.porcentoEstoque;
	}

	public void setPorcentoEstoque(BigDecimal porcentoEstoque) {
		this.porcentoEstoque = porcentoEstoque;
	}

		
}