/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_FERROVIARIO] 
                                                                                
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
package com.t2ti.fenix.model.cte;

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
@Table(name="CTE_FERROVIARIO")
@NamedQuery(name="CteFerroviario.findAll", query="SELECT t FROM CteFerroviario t")
public class CteFerroviario implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CTE_CABECALHO")
	private Integer idCteCabecalho;

    @Column(name="TIPO_TRAFEGO")
	private String tipoTrafego;

    @Column(name="RESPONSAVEL_FATURAMENTO")
	private String responsavelFaturamento;

    @Column(name="FERROVIA_EMITENTE_CTE")
	private String ferroviaEmitenteCte;

    @Column(name="FLUXO")
	private String fluxo;

    @Column(name="VALOR_FRETE")
	private BigDecimal valorFrete;

	public CteFerroviario() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdCteCabecalho() {
		return this.idCteCabecalho;
	}

	public void setIdCteCabecalho(Integer idCteCabecalho) {
		this.idCteCabecalho = idCteCabecalho;
	}

    public String getTipoTrafego() {
		return this.tipoTrafego;
	}

	public void setTipoTrafego(String tipoTrafego) {
		this.tipoTrafego = tipoTrafego;
	}

    public String getResponsavelFaturamento() {
		return this.responsavelFaturamento;
	}

	public void setResponsavelFaturamento(String responsavelFaturamento) {
		this.responsavelFaturamento = responsavelFaturamento;
	}

    public String getFerroviaEmitenteCte() {
		return this.ferroviaEmitenteCte;
	}

	public void setFerroviaEmitenteCte(String ferroviaEmitenteCte) {
		this.ferroviaEmitenteCte = ferroviaEmitenteCte;
	}

    public String getFluxo() {
		return this.fluxo;
	}

	public void setFluxo(String fluxo) {
		this.fluxo = fluxo;
	}

    public BigDecimal getValorFrete() {
		return this.valorFrete;
	}

	public void setValorFrete(BigDecimal valorFrete) {
		this.valorFrete = valorFrete;
	}

		
}