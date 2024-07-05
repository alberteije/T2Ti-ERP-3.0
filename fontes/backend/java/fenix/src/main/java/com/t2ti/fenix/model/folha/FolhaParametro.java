/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PARAMETRO] 
                                                                                
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
package com.t2ti.fenix.model.folha;

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
@Table(name="FOLHA_PARAMETRO")
@NamedQuery(name="FolhaParametro.findAll", query="SELECT t FROM FolhaParametro t")
public class FolhaParametro implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="COMPETENCIA")
	private String competencia;

    @Column(name="CONTRIBUI_PIS")
	private String contribuiPis;

    @Column(name="ALIQUOTA_PIS")
	private BigDecimal aliquotaPis;

    @Column(name="DISCRIMINAR_DSR")
	private String discriminarDsr;

    @Column(name="DIA_PAGAMENTO")
	private String diaPagamento;

    @Column(name="CALCULO_PROPORCIONALIDADE")
	private String calculoProporcionalidade;

    @Column(name="DESCONTAR_FALTAS_13")
	private String descontarFaltas13;

    @Column(name="PAGAR_ADICIONAIS_13")
	private String pagarAdicionais13;

    @Column(name="PAGAR_ESTAGIARIOS_13")
	private String pagarEstagiarios13;

    @Column(name="MES_ADIANTAMENTO_13")
	private String mesAdiantamento13;

    @Column(name="PERCENTUAL_ADIANTAM_13")
	private BigDecimal percentualAdiantam13;

    @Column(name="FERIAS_DESCONTAR_FALTAS")
	private String feriasDescontarFaltas;

    @Column(name="FERIAS_PAGAR_ADICIONAIS")
	private String feriasPagarAdicionais;

    @Column(name="FERIAS_ADIANTAR_13")
	private String feriasAdiantar13;

    @Column(name="FERIAS_PAGAR_ESTAGIARIOS")
	private String feriasPagarEstagiarios;

    @Column(name="FERIAS_CALC_JUSTA_CAUSA")
	private String feriasCalcJustaCausa;

    @Column(name="FERIAS_MOVIMENTO_MENSAL")
	private String feriasMovimentoMensal;

	public FolhaParametro() {
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

    public String getContribuiPis() {
		return this.contribuiPis;
	}

	public void setContribuiPis(String contribuiPis) {
		this.contribuiPis = contribuiPis;
	}

    public BigDecimal getAliquotaPis() {
		return this.aliquotaPis;
	}

	public void setAliquotaPis(BigDecimal aliquotaPis) {
		this.aliquotaPis = aliquotaPis;
	}

    public String getDiscriminarDsr() {
		return this.discriminarDsr;
	}

	public void setDiscriminarDsr(String discriminarDsr) {
		this.discriminarDsr = discriminarDsr;
	}

    public String getDiaPagamento() {
		return this.diaPagamento;
	}

	public void setDiaPagamento(String diaPagamento) {
		this.diaPagamento = diaPagamento;
	}

    public String getCalculoProporcionalidade() {
		return this.calculoProporcionalidade;
	}

	public void setCalculoProporcionalidade(String calculoProporcionalidade) {
		this.calculoProporcionalidade = calculoProporcionalidade;
	}

    public String getDescontarFaltas13() {
		return this.descontarFaltas13;
	}

	public void setDescontarFaltas13(String descontarFaltas13) {
		this.descontarFaltas13 = descontarFaltas13;
	}

    public String getPagarAdicionais13() {
		return this.pagarAdicionais13;
	}

	public void setPagarAdicionais13(String pagarAdicionais13) {
		this.pagarAdicionais13 = pagarAdicionais13;
	}

    public String getPagarEstagiarios13() {
		return this.pagarEstagiarios13;
	}

	public void setPagarEstagiarios13(String pagarEstagiarios13) {
		this.pagarEstagiarios13 = pagarEstagiarios13;
	}

    public String getMesAdiantamento13() {
		return this.mesAdiantamento13;
	}

	public void setMesAdiantamento13(String mesAdiantamento13) {
		this.mesAdiantamento13 = mesAdiantamento13;
	}

    public BigDecimal getPercentualAdiantam13() {
		return this.percentualAdiantam13;
	}

	public void setPercentualAdiantam13(BigDecimal percentualAdiantam13) {
		this.percentualAdiantam13 = percentualAdiantam13;
	}

    public String getFeriasDescontarFaltas() {
		return this.feriasDescontarFaltas;
	}

	public void setFeriasDescontarFaltas(String feriasDescontarFaltas) {
		this.feriasDescontarFaltas = feriasDescontarFaltas;
	}

    public String getFeriasPagarAdicionais() {
		return this.feriasPagarAdicionais;
	}

	public void setFeriasPagarAdicionais(String feriasPagarAdicionais) {
		this.feriasPagarAdicionais = feriasPagarAdicionais;
	}

    public String getFeriasAdiantar13() {
		return this.feriasAdiantar13;
	}

	public void setFeriasAdiantar13(String feriasAdiantar13) {
		this.feriasAdiantar13 = feriasAdiantar13;
	}

    public String getFeriasPagarEstagiarios() {
		return this.feriasPagarEstagiarios;
	}

	public void setFeriasPagarEstagiarios(String feriasPagarEstagiarios) {
		this.feriasPagarEstagiarios = feriasPagarEstagiarios;
	}

    public String getFeriasCalcJustaCausa() {
		return this.feriasCalcJustaCausa;
	}

	public void setFeriasCalcJustaCausa(String feriasCalcJustaCausa) {
		this.feriasCalcJustaCausa = feriasCalcJustaCausa;
	}

    public String getFeriasMovimentoMensal() {
		return this.feriasMovimentoMensal;
	}

	public void setFeriasMovimentoMensal(String feriasMovimentoMensal) {
		this.feriasMovimentoMensal = feriasMovimentoMensal;
	}

		
}