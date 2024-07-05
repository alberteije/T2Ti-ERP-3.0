/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_COFINS_ST] 
                                                                                
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
@Table(name="NFE_DETALHE_IMPOSTO_COFINS_ST")
@NamedQuery(name="NfeDetalheImpostoCofinsSt.findAll", query="SELECT t FROM NfeDetalheImpostoCofinsSt t")
public class NfeDetalheImpostoCofinsSt implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="BASE_CALCULO_COFINS_ST")
	private BigDecimal baseCalculoCofinsSt;

    @Column(name="ALIQUOTA_COFINS_ST_PERCENTUAL")
	private BigDecimal aliquotaCofinsStPercentual;

    @Column(name="QUANTIDADE_VENDIDA_COFINS_ST")
	private BigDecimal quantidadeVendidaCofinsSt;

    @Column(name="ALIQUOTA_COFINS_ST_REAIS")
	private BigDecimal aliquotaCofinsStReais;

    @Column(name="VALOR_COFINS_ST")
	private BigDecimal valorCofinsSt;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DETALHE")
    private NfeDetalhe nfeDetalhe;

	public NfeDetalheImpostoCofinsSt() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public BigDecimal getBaseCalculoCofinsSt() {
		return this.baseCalculoCofinsSt;
	}

	public void setBaseCalculoCofinsSt(BigDecimal baseCalculoCofinsSt) {
		this.baseCalculoCofinsSt = baseCalculoCofinsSt;
	}

    public BigDecimal getAliquotaCofinsStPercentual() {
		return this.aliquotaCofinsStPercentual;
	}

	public void setAliquotaCofinsStPercentual(BigDecimal aliquotaCofinsStPercentual) {
		this.aliquotaCofinsStPercentual = aliquotaCofinsStPercentual;
	}

    public BigDecimal getQuantidadeVendidaCofinsSt() {
		return this.quantidadeVendidaCofinsSt;
	}

	public void setQuantidadeVendidaCofinsSt(BigDecimal quantidadeVendidaCofinsSt) {
		this.quantidadeVendidaCofinsSt = quantidadeVendidaCofinsSt;
	}

    public BigDecimal getAliquotaCofinsStReais() {
		return this.aliquotaCofinsStReais;
	}

	public void setAliquotaCofinsStReais(BigDecimal aliquotaCofinsStReais) {
		this.aliquotaCofinsStReais = aliquotaCofinsStReais;
	}

    public BigDecimal getValorCofinsSt() {
		return this.valorCofinsSt;
	}

	public void setValorCofinsSt(BigDecimal valorCofinsSt) {
		this.valorCofinsSt = valorCofinsSt;
	}

    public NfeDetalhe getNfeDetalhe() {
		return this.nfeDetalhe;
	}

	public void setNfeDetalhe(NfeDetalhe nfeDetalhe) {
		this.nfeDetalhe = nfeDetalhe;
	}

		
}