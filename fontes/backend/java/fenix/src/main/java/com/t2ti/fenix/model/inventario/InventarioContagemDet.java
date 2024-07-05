/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [INVENTARIO_CONTAGEM_DET] 
                                                                                
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
package com.t2ti.fenix.model.inventario;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.t2ti.fenix.model.cadastros.Produto;

@Entity
@Table(name="INVENTARIO_CONTAGEM_DET")
@NamedQuery(name="InventarioContagemDet.findAll", query="SELECT t FROM InventarioContagemDet t")
public class InventarioContagemDet implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CONTAGEM01")
	private BigDecimal contagem01;

    @Column(name="CONTAGEM02")
	private BigDecimal contagem02;

    @Column(name="CONTAGEM03")
	private BigDecimal contagem03;

    @Column(name="FECHADO_CONTAGEM")
	private String fechadoContagem;

    @Column(name="QUANTIDADE_SISTEMA")
	private BigDecimal quantidadeSistema;

    @Column(name="ACURACIDADE")
	private BigDecimal acuracidade;

    @Column(name="DIVERGENCIA")
	private BigDecimal divergencia;

    @ManyToOne
	@JoinColumn(name="ID_PRODUTO")
    private Produto produto;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_INVENTARIO_CONTAGEM_CAB")
    private InventarioContagemCab inventarioContagemCab;

	public InventarioContagemDet() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public BigDecimal getContagem01() {
		return this.contagem01;
	}

	public void setContagem01(BigDecimal contagem01) {
		this.contagem01 = contagem01;
	}

    public BigDecimal getContagem02() {
		return this.contagem02;
	}

	public void setContagem02(BigDecimal contagem02) {
		this.contagem02 = contagem02;
	}

    public BigDecimal getContagem03() {
		return this.contagem03;
	}

	public void setContagem03(BigDecimal contagem03) {
		this.contagem03 = contagem03;
	}

    public String getFechadoContagem() {
		return this.fechadoContagem;
	}

	public void setFechadoContagem(String fechadoContagem) {
		this.fechadoContagem = fechadoContagem;
	}

    public BigDecimal getQuantidadeSistema() {
		return this.quantidadeSistema;
	}

	public void setQuantidadeSistema(BigDecimal quantidadeSistema) {
		this.quantidadeSistema = quantidadeSistema;
	}

    public BigDecimal getAcuracidade() {
		return this.acuracidade;
	}

	public void setAcuracidade(BigDecimal acuracidade) {
		this.acuracidade = acuracidade;
	}

    public BigDecimal getDivergencia() {
		return this.divergencia;
	}

	public void setDivergencia(BigDecimal divergencia) {
		this.divergencia = divergencia;
	}

    public InventarioContagemCab getInventarioContagemCab() {
		return this.inventarioContagemCab;
	}

	public void setInventarioContagemCab(InventarioContagemCab inventarioContagemCab) {
		this.inventarioContagemCab = inventarioContagemCab;
	}

    public Produto getProduto() {
		return this.produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

		
}