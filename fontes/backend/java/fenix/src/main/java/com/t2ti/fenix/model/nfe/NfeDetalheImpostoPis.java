/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_PIS] 
                                                                                
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
package com.t2ti.fenix.model.nfe;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.math.BigDecimal;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="NFE_DETALHE_IMPOSTO_PIS")
@NamedQuery(name="NfeDetalheImpostoPis.findAll", query="SELECT t FROM NfeDetalheImpostoPis t")
public class NfeDetalheImpostoPis implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CST_PIS")
	private String cstPis;

    @Column(name="VALOR_BASE_CALCULO_PIS")
	private BigDecimal valorBaseCalculoPis;

    @Column(name="ALIQUOTA_PIS_PERCENTUAL")
	private BigDecimal aliquotaPisPercentual;

    @Column(name="VALOR_PIS")
	private BigDecimal valorPis;

    @Column(name="QUANTIDADE_VENDIDA")
	private BigDecimal quantidadeVendida;

    @Column(name="ALIQUOTA_PIS_REAIS")
	private BigDecimal aliquotaPisReais;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DETALHE")
    private NfeDetalhe nfeDetalhe;

	public NfeDetalheImpostoPis() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCstPis() {
		return this.cstPis;
	}

	public void setCstPis(String cstPis) {
		this.cstPis = cstPis;
	}

    public BigDecimal getValorBaseCalculoPis() {
		return this.valorBaseCalculoPis;
	}

	public void setValorBaseCalculoPis(BigDecimal valorBaseCalculoPis) {
		this.valorBaseCalculoPis = valorBaseCalculoPis == null ? new BigDecimal(0) : valorBaseCalculoPis;
	}

    public BigDecimal getAliquotaPisPercentual() {
		return this.aliquotaPisPercentual;
	}

	public void setAliquotaPisPercentual(BigDecimal aliquotaPisPercentual) {
		this.aliquotaPisPercentual = aliquotaPisPercentual == null ? new BigDecimal(0) : aliquotaPisPercentual;
	}

    public BigDecimal getValorPis() {
		return this.valorPis;
	}

	public void setValorPis(BigDecimal valorPis) {
		this.valorPis = valorPis == null ? new BigDecimal(0) : valorPis;
	}

    public BigDecimal getQuantidadeVendida() {
		return this.quantidadeVendida;
	}

	public void setQuantidadeVendida(BigDecimal quantidadeVendida) {
		this.quantidadeVendida = quantidadeVendida == null ? new BigDecimal(0) : quantidadeVendida;
	}

    public BigDecimal getAliquotaPisReais() {
		return this.aliquotaPisReais;
	}

	public void setAliquotaPisReais(BigDecimal aliquotaPisReais) {
		this.aliquotaPisReais = aliquotaPisReais == null ? new BigDecimal(0) : aliquotaPisReais;
	}

    public NfeDetalhe getNfeDetalhe() {
		return this.nfeDetalhe;
	}

	public void setNfeDetalhe(NfeDetalhe nfeDetalhe) {
		this.nfeDetalhe = nfeDetalhe;
	}

		
}