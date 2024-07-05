/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_EVENTO] 
                                                                                
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
@Table(name="FOLHA_EVENTO")
@NamedQuery(name="FolhaEvento.findAll", query="SELECT t FROM FolhaEvento t")
public class FolhaEvento implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CODIGO")
	private String codigo;

    @Column(name="NOME")
	private String nome;

    @Column(name="DESCRICAO")
	private String descricao;

    @Column(name="TIPO")
	private String tipo;

    @Column(name="UNIDADE")
	private String unidade;

    @Column(name="BASE_CALCULO")
	private String baseCalculo;

    @Column(name="TAXA")
	private BigDecimal taxa;

    @Column(name="RUBRICA_ESOCIAL")
	private String rubricaEsocial;

    @Column(name="COD_INCIDENCIA_PREVIDENCIA")
	private String codIncidenciaPrevidencia;

    @Column(name="COD_INCIDENCIA_IRRF")
	private String codIncidenciaIrrf;

    @Column(name="COD_INCIDENCIA_FGTS")
	private String codIncidenciaFgts;

    @Column(name="COD_INCIDENCIA_SINDICATO")
	private String codIncidenciaSindicato;

    @Column(name="REPERCUTE_DSR")
	private String repercuteDsr;

    @Column(name="REPERCUTE_13")
	private String repercute13;

    @Column(name="REPERCUTE_FERIAS")
	private String repercuteFerias;

    @Column(name="REPERCUTE_AVISO")
	private String repercuteAviso;

	public FolhaEvento() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCodigo() {
		return this.codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

    public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

    public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

    public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

    public String getUnidade() {
		return this.unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}

    public String getBaseCalculo() {
		return this.baseCalculo;
	}

	public void setBaseCalculo(String baseCalculo) {
		this.baseCalculo = baseCalculo;
	}

    public BigDecimal getTaxa() {
		return this.taxa;
	}

	public void setTaxa(BigDecimal taxa) {
		this.taxa = taxa;
	}

    public String getRubricaEsocial() {
		return this.rubricaEsocial;
	}

	public void setRubricaEsocial(String rubricaEsocial) {
		this.rubricaEsocial = rubricaEsocial;
	}

    public String getCodIncidenciaPrevidencia() {
		return this.codIncidenciaPrevidencia;
	}

	public void setCodIncidenciaPrevidencia(String codIncidenciaPrevidencia) {
		this.codIncidenciaPrevidencia = codIncidenciaPrevidencia;
	}

    public String getCodIncidenciaIrrf() {
		return this.codIncidenciaIrrf;
	}

	public void setCodIncidenciaIrrf(String codIncidenciaIrrf) {
		this.codIncidenciaIrrf = codIncidenciaIrrf;
	}

    public String getCodIncidenciaFgts() {
		return this.codIncidenciaFgts;
	}

	public void setCodIncidenciaFgts(String codIncidenciaFgts) {
		this.codIncidenciaFgts = codIncidenciaFgts;
	}

    public String getCodIncidenciaSindicato() {
		return this.codIncidenciaSindicato;
	}

	public void setCodIncidenciaSindicato(String codIncidenciaSindicato) {
		this.codIncidenciaSindicato = codIncidenciaSindicato;
	}

    public String getRepercuteDsr() {
		return this.repercuteDsr;
	}

	public void setRepercuteDsr(String repercuteDsr) {
		this.repercuteDsr = repercuteDsr;
	}

    public String getRepercute13() {
		return this.repercute13;
	}

	public void setRepercute13(String repercute13) {
		this.repercute13 = repercute13;
	}

    public String getRepercuteFerias() {
		return this.repercuteFerias;
	}

	public void setRepercuteFerias(String repercuteFerias) {
		this.repercuteFerias = repercuteFerias;
	}

    public String getRepercuteAviso() {
		return this.repercuteAviso;
	}

	public void setRepercuteAviso(String repercuteAviso) {
		this.repercuteAviso = repercuteAviso;
	}

		
}