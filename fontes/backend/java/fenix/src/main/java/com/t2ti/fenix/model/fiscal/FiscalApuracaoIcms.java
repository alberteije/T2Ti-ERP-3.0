/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FISCAL_APURACAO_ICMS] 
                                                                                
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
package com.t2ti.fenix.model.fiscal;

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
@Table(name="FISCAL_APURACAO_ICMS")
@NamedQuery(name="FiscalApuracaoIcms.findAll", query="SELECT t FROM FiscalApuracaoIcms t")
public class FiscalApuracaoIcms implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="COMPETENCIA")
	private String competencia;

    @Column(name="VALOR_TOTAL_DEBITO")
	private BigDecimal valorTotalDebito;

    @Column(name="VALOR_AJUSTE_DEBITO")
	private BigDecimal valorAjusteDebito;

    @Column(name="VALOR_TOTAL_AJUSTE_DEBITO")
	private BigDecimal valorTotalAjusteDebito;

    @Column(name="VALOR_ESTORNO_CREDITO")
	private BigDecimal valorEstornoCredito;

    @Column(name="VALOR_TOTAL_CREDITO")
	private BigDecimal valorTotalCredito;

    @Column(name="VALOR_AJUSTE_CREDITO")
	private BigDecimal valorAjusteCredito;

    @Column(name="VALOR_TOTAL_AJUSTE_CREDITO")
	private BigDecimal valorTotalAjusteCredito;

    @Column(name="VALOR_ESTORNO_DEBITO")
	private BigDecimal valorEstornoDebito;

    @Column(name="VALOR_SALDO_CREDOR_ANTERIOR")
	private BigDecimal valorSaldoCredorAnterior;

    @Column(name="VALOR_SALDO_APURADO")
	private BigDecimal valorSaldoApurado;

    @Column(name="VALOR_TOTAL_DEDUCAO")
	private BigDecimal valorTotalDeducao;

    @Column(name="VALOR_ICMS_RECOLHER")
	private BigDecimal valorIcmsRecolher;

    @Column(name="VALOR_SALDO_CREDOR_TRANSP")
	private BigDecimal valorSaldoCredorTransp;

    @Column(name="VALOR_DEBITO_ESPECIAL")
	private BigDecimal valorDebitoEspecial;

	public FiscalApuracaoIcms() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCompetencia() {
		return this.competencia;
	}

	public void setCompetencia(String competencia) {
		this.competencia = competencia;
	}

    public BigDecimal getValorTotalDebito() {
		return this.valorTotalDebito;
	}

	public void setValorTotalDebito(BigDecimal valorTotalDebito) {
		this.valorTotalDebito = valorTotalDebito;
	}

    public BigDecimal getValorAjusteDebito() {
		return this.valorAjusteDebito;
	}

	public void setValorAjusteDebito(BigDecimal valorAjusteDebito) {
		this.valorAjusteDebito = valorAjusteDebito;
	}

    public BigDecimal getValorTotalAjusteDebito() {
		return this.valorTotalAjusteDebito;
	}

	public void setValorTotalAjusteDebito(BigDecimal valorTotalAjusteDebito) {
		this.valorTotalAjusteDebito = valorTotalAjusteDebito;
	}

    public BigDecimal getValorEstornoCredito() {
		return this.valorEstornoCredito;
	}

	public void setValorEstornoCredito(BigDecimal valorEstornoCredito) {
		this.valorEstornoCredito = valorEstornoCredito;
	}

    public BigDecimal getValorTotalCredito() {
		return this.valorTotalCredito;
	}

	public void setValorTotalCredito(BigDecimal valorTotalCredito) {
		this.valorTotalCredito = valorTotalCredito;
	}

    public BigDecimal getValorAjusteCredito() {
		return this.valorAjusteCredito;
	}

	public void setValorAjusteCredito(BigDecimal valorAjusteCredito) {
		this.valorAjusteCredito = valorAjusteCredito;
	}

    public BigDecimal getValorTotalAjusteCredito() {
		return this.valorTotalAjusteCredito;
	}

	public void setValorTotalAjusteCredito(BigDecimal valorTotalAjusteCredito) {
		this.valorTotalAjusteCredito = valorTotalAjusteCredito;
	}

    public BigDecimal getValorEstornoDebito() {
		return this.valorEstornoDebito;
	}

	public void setValorEstornoDebito(BigDecimal valorEstornoDebito) {
		this.valorEstornoDebito = valorEstornoDebito;
	}

    public BigDecimal getValorSaldoCredorAnterior() {
		return this.valorSaldoCredorAnterior;
	}

	public void setValorSaldoCredorAnterior(BigDecimal valorSaldoCredorAnterior) {
		this.valorSaldoCredorAnterior = valorSaldoCredorAnterior;
	}

    public BigDecimal getValorSaldoApurado() {
		return this.valorSaldoApurado;
	}

	public void setValorSaldoApurado(BigDecimal valorSaldoApurado) {
		this.valorSaldoApurado = valorSaldoApurado;
	}

    public BigDecimal getValorTotalDeducao() {
		return this.valorTotalDeducao;
	}

	public void setValorTotalDeducao(BigDecimal valorTotalDeducao) {
		this.valorTotalDeducao = valorTotalDeducao;
	}

    public BigDecimal getValorIcmsRecolher() {
		return this.valorIcmsRecolher;
	}

	public void setValorIcmsRecolher(BigDecimal valorIcmsRecolher) {
		this.valorIcmsRecolher = valorIcmsRecolher;
	}

    public BigDecimal getValorSaldoCredorTransp() {
		return this.valorSaldoCredorTransp;
	}

	public void setValorSaldoCredorTransp(BigDecimal valorSaldoCredorTransp) {
		this.valorSaldoCredorTransp = valorSaldoCredorTransp;
	}

    public BigDecimal getValorDebitoEspecial() {
		return this.valorDebitoEspecial;
	}

	public void setValorDebitoEspecial(BigDecimal valorDebitoEspecial) {
		this.valorDebitoEspecial = valorDebitoEspecial;
	}

		
}