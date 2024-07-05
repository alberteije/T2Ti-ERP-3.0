/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_IPI] 
                                                                                
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
package com.t2ti.fenix.model.tributacao;

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
@Table(name="TRIBUT_IPI")
@NamedQuery(name="TributIpi.findAll", query="SELECT t FROM TributIpi t")
public class TributIpi implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CST_IPI")
	private String cstIpi;

    @Column(name="MODALIDADE_BASE_CALCULO")
	private String modalidadeBaseCalculo;

    @Column(name="PORCENTO_BASE_CALCULO")
	private BigDecimal porcentoBaseCalculo;

    @Column(name="ALIQUOTA_PORCENTO")
	private BigDecimal aliquotaPorcento;

    @Column(name="ALIQUOTA_UNIDADE")
	private BigDecimal aliquotaUnidade;

    @Column(name="VALOR_PRECO_MAXIMO")
	private BigDecimal valorPrecoMaximo;

    @Column(name="VALOR_PAUTA_FISCAL")
	private BigDecimal valorPautaFiscal;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_TRIBUT_CONFIGURA_OF_GT")
    private TributConfiguraOfGt tributConfiguraOfGt;

	public TributIpi() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCstIpi() {
		return this.cstIpi;
	}

	public void setCstIpi(String cstIpi) {
		this.cstIpi = cstIpi;
	}

    public String getModalidadeBaseCalculo() {
		return this.modalidadeBaseCalculo;
	}

	public void setModalidadeBaseCalculo(String modalidadeBaseCalculo) {
		this.modalidadeBaseCalculo = modalidadeBaseCalculo;
	}

    public BigDecimal getPorcentoBaseCalculo() {
		return this.porcentoBaseCalculo;
	}

	public void setPorcentoBaseCalculo(BigDecimal porcentoBaseCalculo) {
		this.porcentoBaseCalculo = porcentoBaseCalculo;
	}

    public BigDecimal getAliquotaPorcento() {
		return this.aliquotaPorcento;
	}

	public void setAliquotaPorcento(BigDecimal aliquotaPorcento) {
		this.aliquotaPorcento = aliquotaPorcento;
	}

    public BigDecimal getAliquotaUnidade() {
		return this.aliquotaUnidade;
	}

	public void setAliquotaUnidade(BigDecimal aliquotaUnidade) {
		this.aliquotaUnidade = aliquotaUnidade;
	}

    public BigDecimal getValorPrecoMaximo() {
		return this.valorPrecoMaximo;
	}

	public void setValorPrecoMaximo(BigDecimal valorPrecoMaximo) {
		this.valorPrecoMaximo = valorPrecoMaximo;
	}

    public BigDecimal getValorPautaFiscal() {
		return this.valorPautaFiscal;
	}

	public void setValorPautaFiscal(BigDecimal valorPautaFiscal) {
		this.valorPautaFiscal = valorPautaFiscal;
	}

    public TributConfiguraOfGt getTributConfiguraOfGt() {
		return this.tributConfiguraOfGt;
	}

	public void setTributConfiguraOfGt(TributConfiguraOfGt tributConfiguraOfGt) {
		this.tributConfiguraOfGt = tributConfiguraOfGt;
	}

		
}