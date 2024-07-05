/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_COFINS] 
                                                                                
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
@Table(name="NFE_DETALHE_IMPOSTO_COFINS")
@NamedQuery(name="NfeDetalheImpostoCofins.findAll", query="SELECT t FROM NfeDetalheImpostoCofins t")
public class NfeDetalheImpostoCofins implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CST_COFINS")
	private String cstCofins;

    @Column(name="BASE_CALCULO_COFINS")
	private BigDecimal baseCalculoCofins;

    @Column(name="ALIQUOTA_COFINS_PERCENTUAL")
	private BigDecimal aliquotaCofinsPercentual;

    @Column(name="QUANTIDADE_VENDIDA")
	private BigDecimal quantidadeVendida;

    @Column(name="ALIQUOTA_COFINS_REAIS")
	private BigDecimal aliquotaCofinsReais;

    @Column(name="VALOR_COFINS")
	private BigDecimal valorCofins;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DETALHE")
    private NfeDetalhe nfeDetalhe;

	public NfeDetalheImpostoCofins() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCstCofins() {
		return this.cstCofins;
	}

	public void setCstCofins(String cstCofins) {
		this.cstCofins = cstCofins;
	}

    public BigDecimal getBaseCalculoCofins() {
		return this.baseCalculoCofins;
	}

	public void setBaseCalculoCofins(BigDecimal baseCalculoCofins) {
		this.baseCalculoCofins = baseCalculoCofins == null ? new BigDecimal(0) : baseCalculoCofins;
	}

    public BigDecimal getAliquotaCofinsPercentual() {
		return this.aliquotaCofinsPercentual;
	}

	public void setAliquotaCofinsPercentual(BigDecimal aliquotaCofinsPercentual) {
		this.aliquotaCofinsPercentual = aliquotaCofinsPercentual == null ? new BigDecimal(0) : aliquotaCofinsPercentual;
	}

    public BigDecimal getQuantidadeVendida() {
		return this.quantidadeVendida;
	}

	public void setQuantidadeVendida(BigDecimal quantidadeVendida) {
		this.quantidadeVendida = quantidadeVendida == null ? new BigDecimal(0) : quantidadeVendida;
	}

    public BigDecimal getAliquotaCofinsReais() {
		return this.aliquotaCofinsReais;
	}

	public void setAliquotaCofinsReais(BigDecimal aliquotaCofinsReais) {
		this.aliquotaCofinsReais = aliquotaCofinsReais == null ? new BigDecimal(0) : aliquotaCofinsReais;
	}

    public BigDecimal getValorCofins() {
		return this.valorCofins;
	}

	public void setValorCofins(BigDecimal valorCofins) {
		this.valorCofins = valorCofins == null ? new BigDecimal(0) : valorCofins;
	}

    public NfeDetalhe getNfeDetalhe() {
		return this.nfeDetalhe;
	}

	public void setNfeDetalhe(NfeDetalhe nfeDetalhe) {
		this.nfeDetalhe = nfeDetalhe;
	}

		
}