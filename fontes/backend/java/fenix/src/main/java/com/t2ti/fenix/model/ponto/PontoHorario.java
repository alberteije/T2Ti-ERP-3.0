/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_HORARIO] 
                                                                                
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
package com.t2ti.fenix.model.ponto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="PONTO_HORARIO")
@NamedQuery(name="PontoHorario.findAll", query="SELECT t FROM PontoHorario t")
public class PontoHorario implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="TIPO")
	private String tipo;

    @Column(name="CODIGO")
	private String codigo;

    @Column(name="NOME")
	private String nome;

    @Column(name="TIPO_TRABALHO")
	private String tipoTrabalho;

    @Column(name="CARGA_HORARIA")
	private String cargaHoraria;

    @Column(name="ENTRADA01")
	private String entrada01;

    @Column(name="SAIDA01")
	private String saida01;

    @Column(name="ENTRADA02")
	private String entrada02;

    @Column(name="SAIDA02")
	private String saida02;

    @Column(name="ENTRADA03")
	private String entrada03;

    @Column(name="SAIDA03")
	private String saida03;

    @Column(name="ENTRADA04")
	private String entrada04;

    @Column(name="SAIDA04")
	private String saida04;

    @Column(name="ENTRADA05")
	private String entrada05;

    @Column(name="SAIDA05")
	private String saida05;

    @Column(name="HORA_INICIO_JORNADA")
	private String horaInicioJornada;

    @Column(name="HORA_FIM_JORNADA")
	private String horaFimJornada;

	public PontoHorario() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
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

    public String getTipoTrabalho() {
		return this.tipoTrabalho;
	}

	public void setTipoTrabalho(String tipoTrabalho) {
		this.tipoTrabalho = tipoTrabalho;
	}

    public String getCargaHoraria() {
		return this.cargaHoraria;
	}

	public void setCargaHoraria(String cargaHoraria) {
		this.cargaHoraria = cargaHoraria;
	}

    public String getEntrada01() {
		return this.entrada01;
	}

	public void setEntrada01(String entrada01) {
		this.entrada01 = entrada01;
	}

    public String getSaida01() {
		return this.saida01;
	}

	public void setSaida01(String saida01) {
		this.saida01 = saida01;
	}

    public String getEntrada02() {
		return this.entrada02;
	}

	public void setEntrada02(String entrada02) {
		this.entrada02 = entrada02;
	}

    public String getSaida02() {
		return this.saida02;
	}

	public void setSaida02(String saida02) {
		this.saida02 = saida02;
	}

    public String getEntrada03() {
		return this.entrada03;
	}

	public void setEntrada03(String entrada03) {
		this.entrada03 = entrada03;
	}

    public String getSaida03() {
		return this.saida03;
	}

	public void setSaida03(String saida03) {
		this.saida03 = saida03;
	}

    public String getEntrada04() {
		return this.entrada04;
	}

	public void setEntrada04(String entrada04) {
		this.entrada04 = entrada04;
	}

    public String getSaida04() {
		return this.saida04;
	}

	public void setSaida04(String saida04) {
		this.saida04 = saida04;
	}

    public String getEntrada05() {
		return this.entrada05;
	}

	public void setEntrada05(String entrada05) {
		this.entrada05 = entrada05;
	}

    public String getSaida05() {
		return this.saida05;
	}

	public void setSaida05(String saida05) {
		this.saida05 = saida05;
	}

    public String getHoraInicioJornada() {
		return this.horaInicioJornada;
	}

	public void setHoraInicioJornada(String horaInicioJornada) {
		this.horaInicioJornada = horaInicioJornada;
	}

    public String getHoraFimJornada() {
		return this.horaFimJornada;
	}

	public void setHoraFimJornada(String horaFimJornada) {
		this.horaFimJornada = horaFimJornada;
	}

		
}