/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_RODOVIARIO_VEICULO] 
                                                                                
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
package com.t2ti.fenix.model.mdfe;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="MDFE_RODOVIARIO_VEICULO")
@NamedQuery(name="MdfeRodoviarioVeiculo.findAll", query="SELECT t FROM MdfeRodoviarioVeiculo t")
public class MdfeRodoviarioVeiculo implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_MDFE_RODOVIARIO")
	private Integer idMdfeRodoviario;

    @Column(name="CODIGO_INTERNO")
	private String codigoInterno;

    @Column(name="PLACA")
	private String placa;

    @Column(name="RENAVAM")
	private String renavam;

    @Column(name="TARA")
	private Integer tara;

    @Column(name="CAPACIDADE_KG")
	private Integer capacidadeKg;

    @Column(name="CAPACIDADE_M3")
	private Integer capacidadeM3;

    @Column(name="TIPO_RODADO")
	private String tipoRodado;

    @Column(name="TIPO_CARROCERIA")
	private String tipoCarroceria;

    @Column(name="UF_LICENCIAMENTO")
	private String ufLicenciamento;

    @Column(name="PROPRIETARIO_CPF")
	private String proprietarioCpf;

    @Column(name="PROPRIETARIO_CNPJ")
	private String proprietarioCnpj;

    @Column(name="PROPRIETARIO_RNTRC")
	private String proprietarioRntrc;

    @Column(name="PROPRIETARIO_NOME")
	private String proprietarioNome;

    @Column(name="PROPRIETARIO_IE")
	private String proprietarioIe;

    @Column(name="PROPRIETARIO_TIPO")
	private Integer proprietarioTipo;

	public MdfeRodoviarioVeiculo() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdMdfeRodoviario() {
		return this.idMdfeRodoviario;
	}

	public void setIdMdfeRodoviario(Integer idMdfeRodoviario) {
		this.idMdfeRodoviario = idMdfeRodoviario;
	}

    public String getCodigoInterno() {
		return this.codigoInterno;
	}

	public void setCodigoInterno(String codigoInterno) {
		this.codigoInterno = codigoInterno;
	}

    public String getPlaca() {
		return this.placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

    public String getRenavam() {
		return this.renavam;
	}

	public void setRenavam(String renavam) {
		this.renavam = renavam;
	}

    public Integer getTara() {
		return this.tara;
	}

	public void setTara(Integer tara) {
		this.tara = tara;
	}

    public Integer getCapacidadeKg() {
		return this.capacidadeKg;
	}

	public void setCapacidadeKg(Integer capacidadeKg) {
		this.capacidadeKg = capacidadeKg;
	}

    public Integer getCapacidadeM3() {
		return this.capacidadeM3;
	}

	public void setCapacidadeM3(Integer capacidadeM3) {
		this.capacidadeM3 = capacidadeM3;
	}

    public String getTipoRodado() {
		return this.tipoRodado;
	}

	public void setTipoRodado(String tipoRodado) {
		this.tipoRodado = tipoRodado;
	}

    public String getTipoCarroceria() {
		return this.tipoCarroceria;
	}

	public void setTipoCarroceria(String tipoCarroceria) {
		this.tipoCarroceria = tipoCarroceria;
	}

    public String getUfLicenciamento() {
		return this.ufLicenciamento;
	}

	public void setUfLicenciamento(String ufLicenciamento) {
		this.ufLicenciamento = ufLicenciamento;
	}

    public String getProprietarioCpf() {
		return this.proprietarioCpf;
	}

	public void setProprietarioCpf(String proprietarioCpf) {
		this.proprietarioCpf = proprietarioCpf;
	}

    public String getProprietarioCnpj() {
		return this.proprietarioCnpj;
	}

	public void setProprietarioCnpj(String proprietarioCnpj) {
		this.proprietarioCnpj = proprietarioCnpj;
	}

    public String getProprietarioRntrc() {
		return this.proprietarioRntrc;
	}

	public void setProprietarioRntrc(String proprietarioRntrc) {
		this.proprietarioRntrc = proprietarioRntrc;
	}

    public String getProprietarioNome() {
		return this.proprietarioNome;
	}

	public void setProprietarioNome(String proprietarioNome) {
		this.proprietarioNome = proprietarioNome;
	}

    public String getProprietarioIe() {
		return this.proprietarioIe;
	}

	public void setProprietarioIe(String proprietarioIe) {
		this.proprietarioIe = proprietarioIe;
	}

    public Integer getProprietarioTipo() {
		return this.proprietarioTipo;
	}

	public void setProprietarioTipo(Integer proprietarioTipo) {
		this.proprietarioTipo = proprietarioTipo;
	}

		
}