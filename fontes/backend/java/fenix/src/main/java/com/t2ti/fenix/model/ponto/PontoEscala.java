/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_ESCALA] 
                                                                                
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
@Table(name="PONTO_ESCALA")
@NamedQuery(name="PontoEscala.findAll", query="SELECT t FROM PontoEscala t")
public class PontoEscala implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NOME")
	private String nome;

    @Column(name="DESCONTO_HORA_DIA")
	private String descontoHoraDia;

    @Column(name="DESCONTO_DSR")
	private String descontoDsr;

    @Column(name="CODIGO_HORARIO_DOMINGO")
	private String codigoHorarioDomingo;

    @Column(name="CODIGO_HORARIO_SEGUNDA")
	private String codigoHorarioSegunda;

    @Column(name="CODIGO_HORARIO_TERCA")
	private String codigoHorarioTerca;

    @Column(name="CODIGO_HORARIO_QUARTA")
	private String codigoHorarioQuarta;

    @Column(name="CODIGO_HORARIO_QUINTA")
	private String codigoHorarioQuinta;

    @Column(name="CODIGO_HORARIO_SEXTA")
	private String codigoHorarioSexta;

    @Column(name="CODIGO_HORARIO_SABADO")
	private String codigoHorarioSabado;

	public PontoEscala() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

    public String getDescontoHoraDia() {
		return this.descontoHoraDia;
	}

	public void setDescontoHoraDia(String descontoHoraDia) {
		this.descontoHoraDia = descontoHoraDia;
	}

    public String getDescontoDsr() {
		return this.descontoDsr;
	}

	public void setDescontoDsr(String descontoDsr) {
		this.descontoDsr = descontoDsr;
	}

    public String getCodigoHorarioDomingo() {
		return this.codigoHorarioDomingo;
	}

	public void setCodigoHorarioDomingo(String codigoHorarioDomingo) {
		this.codigoHorarioDomingo = codigoHorarioDomingo;
	}

    public String getCodigoHorarioSegunda() {
		return this.codigoHorarioSegunda;
	}

	public void setCodigoHorarioSegunda(String codigoHorarioSegunda) {
		this.codigoHorarioSegunda = codigoHorarioSegunda;
	}

    public String getCodigoHorarioTerca() {
		return this.codigoHorarioTerca;
	}

	public void setCodigoHorarioTerca(String codigoHorarioTerca) {
		this.codigoHorarioTerca = codigoHorarioTerca;
	}

    public String getCodigoHorarioQuarta() {
		return this.codigoHorarioQuarta;
	}

	public void setCodigoHorarioQuarta(String codigoHorarioQuarta) {
		this.codigoHorarioQuarta = codigoHorarioQuarta;
	}

    public String getCodigoHorarioQuinta() {
		return this.codigoHorarioQuinta;
	}

	public void setCodigoHorarioQuinta(String codigoHorarioQuinta) {
		this.codigoHorarioQuinta = codigoHorarioQuinta;
	}

    public String getCodigoHorarioSexta() {
		return this.codigoHorarioSexta;
	}

	public void setCodigoHorarioSexta(String codigoHorarioSexta) {
		this.codigoHorarioSexta = codigoHorarioSexta;
	}

    public String getCodigoHorarioSabado() {
		return this.codigoHorarioSabado;
	}

	public void setCodigoHorarioSabado(String codigoHorarioSabado) {
		this.codigoHorarioSabado = codigoHorarioSabado;
	}

		
}