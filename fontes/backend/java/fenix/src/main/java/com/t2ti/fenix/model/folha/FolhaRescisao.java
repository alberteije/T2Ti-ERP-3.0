/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_RESCISAO] 
                                                                                
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
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.t2ti.fenix.model.cadastros.Colaborador;

@Entity
@Table(name="FOLHA_RESCISAO")
@NamedQuery(name="FolhaRescisao.findAll", query="SELECT t FROM FolhaRescisao t")
public class FolhaRescisao implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_DEMISSAO")
	private Date dataDemissao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PAGAMENTO")
	private Date dataPagamento;

    @Column(name="MOTIVO")
	private String motivo;

    @Column(name="MOTIVO_ESOCIAL")
	private String motivoEsocial;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_AVISO_PREVIO")
	private Date dataAvisoPrevio;

    @Column(name="DIAS_AVISO_PREVIO")
	private Integer diasAvisoPrevio;

    @Column(name="COMPROVOU_NOVO_EMPREGO")
	private String comprovouNovoEmprego;

    @Column(name="DISPENSOU_EMPREGADO")
	private String dispensouEmpregado;

    @Column(name="PENSAO_ALIMENTICIA")
	private BigDecimal pensaoAlimenticia;

    @Column(name="PENSAO_ALIMENTICIA_FGTS")
	private BigDecimal pensaoAlimenticiaFgts;

    @Column(name="FGTS_VALOR_RESCISAO")
	private BigDecimal fgtsValorRescisao;

    @Column(name="FGTS_SALDO_BANCO")
	private BigDecimal fgtsSaldoBanco;

    @Column(name="FGTS_COMPLEMENTO_SALDO")
	private BigDecimal fgtsComplementoSaldo;

    @Column(name="FGTS_CODIGO_AFASTAMENTO")
	private String fgtsCodigoAfastamento;

    @Column(name="FGTS_CODIGO_SAQUE")
	private String fgtsCodigoSaque;

    @ManyToOne
	@JoinColumn(name="ID_COLABORADOR")
    private Colaborador colaborador;

	public FolhaRescisao() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getDataDemissao() {
		return this.dataDemissao;
	}

	public void setDataDemissao(Date dataDemissao) {
		this.dataDemissao = dataDemissao;
	}

    public Date getDataPagamento() {
		return this.dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

    public String getMotivo() {
		return this.motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

    public String getMotivoEsocial() {
		return this.motivoEsocial;
	}

	public void setMotivoEsocial(String motivoEsocial) {
		this.motivoEsocial = motivoEsocial;
	}

    public Date getDataAvisoPrevio() {
		return this.dataAvisoPrevio;
	}

	public void setDataAvisoPrevio(Date dataAvisoPrevio) {
		this.dataAvisoPrevio = dataAvisoPrevio;
	}

    public Integer getDiasAvisoPrevio() {
		return this.diasAvisoPrevio;
	}

	public void setDiasAvisoPrevio(Integer diasAvisoPrevio) {
		this.diasAvisoPrevio = diasAvisoPrevio;
	}

    public String getComprovouNovoEmprego() {
		return this.comprovouNovoEmprego;
	}

	public void setComprovouNovoEmprego(String comprovouNovoEmprego) {
		this.comprovouNovoEmprego = comprovouNovoEmprego;
	}

    public String getDispensouEmpregado() {
		return this.dispensouEmpregado;
	}

	public void setDispensouEmpregado(String dispensouEmpregado) {
		this.dispensouEmpregado = dispensouEmpregado;
	}

    public BigDecimal getPensaoAlimenticia() {
		return this.pensaoAlimenticia;
	}

	public void setPensaoAlimenticia(BigDecimal pensaoAlimenticia) {
		this.pensaoAlimenticia = pensaoAlimenticia;
	}

    public BigDecimal getPensaoAlimenticiaFgts() {
		return this.pensaoAlimenticiaFgts;
	}

	public void setPensaoAlimenticiaFgts(BigDecimal pensaoAlimenticiaFgts) {
		this.pensaoAlimenticiaFgts = pensaoAlimenticiaFgts;
	}

    public BigDecimal getFgtsValorRescisao() {
		return this.fgtsValorRescisao;
	}

	public void setFgtsValorRescisao(BigDecimal fgtsValorRescisao) {
		this.fgtsValorRescisao = fgtsValorRescisao;
	}

    public BigDecimal getFgtsSaldoBanco() {
		return this.fgtsSaldoBanco;
	}

	public void setFgtsSaldoBanco(BigDecimal fgtsSaldoBanco) {
		this.fgtsSaldoBanco = fgtsSaldoBanco;
	}

    public BigDecimal getFgtsComplementoSaldo() {
		return this.fgtsComplementoSaldo;
	}

	public void setFgtsComplementoSaldo(BigDecimal fgtsComplementoSaldo) {
		this.fgtsComplementoSaldo = fgtsComplementoSaldo;
	}

    public String getFgtsCodigoAfastamento() {
		return this.fgtsCodigoAfastamento;
	}

	public void setFgtsCodigoAfastamento(String fgtsCodigoAfastamento) {
		this.fgtsCodigoAfastamento = fgtsCodigoAfastamento;
	}

    public String getFgtsCodigoSaque() {
		return this.fgtsCodigoSaque;
	}

	public void setFgtsCodigoSaque(String fgtsCodigoSaque) {
		this.fgtsCodigoSaque = fgtsCodigoSaque;
	}

    public Colaborador getColaborador() {
		return this.colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

		
}