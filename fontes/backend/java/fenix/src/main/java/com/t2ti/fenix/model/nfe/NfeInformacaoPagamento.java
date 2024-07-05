/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_INFORMACAO_PAGAMENTO] 
                                                                                
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
@Table(name="NFE_INFORMACAO_PAGAMENTO")
@NamedQuery(name="NfeInformacaoPagamento.findAll", query="SELECT t FROM NfeInformacaoPagamento t")
public class NfeInformacaoPagamento implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="INDICADOR_PAGAMENTO")
	private String indicadorPagamento;

    @Column(name="MEIO_PAGAMENTO")
	private String meioPagamento;

    @Column(name="VALOR")
	private BigDecimal valor;

    @Column(name="TIPO_INTEGRACAO")
	private String tipoIntegracao;

    @Column(name="CNPJ_OPERADORA_CARTAO")
	private String cnpjOperadoraCartao;

    @Column(name="BANDEIRA")
	private String bandeira;

    @Column(name="NUMERO_AUTORIZACAO")
	private String numeroAutorizacao;

    @Column(name="TROCO")
	private BigDecimal troco;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_CABECALHO")
    private NfeCabecalho nfeCabecalho;

	public NfeInformacaoPagamento() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getIndicadorPagamento() {
		return this.indicadorPagamento;
	}

	public void setIndicadorPagamento(String indicadorPagamento) {
		this.indicadorPagamento = indicadorPagamento;
	}

    public String getMeioPagamento() {
		return this.meioPagamento;
	}

	public void setMeioPagamento(String meioPagamento) {
		this.meioPagamento = meioPagamento;
	}

    public BigDecimal getValor() {
		return this.valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

    public String getTipoIntegracao() {
		return this.tipoIntegracao;
	}

	public void setTipoIntegracao(String tipoIntegracao) {
		this.tipoIntegracao = tipoIntegracao;
	}

    public String getCnpjOperadoraCartao() {
		return this.cnpjOperadoraCartao;
	}

	public void setCnpjOperadoraCartao(String cnpjOperadoraCartao) {
		this.cnpjOperadoraCartao = cnpjOperadoraCartao;
	}

    public String getBandeira() {
		return this.bandeira;
	}

	public void setBandeira(String bandeira) {
		this.bandeira = bandeira;
	}

    public String getNumeroAutorizacao() {
		return this.numeroAutorizacao;
	}

	public void setNumeroAutorizacao(String numeroAutorizacao) {
		this.numeroAutorizacao = numeroAutorizacao;
	}

    public BigDecimal getTroco() {
		return this.troco;
	}

	public void setTroco(BigDecimal troco) {
		this.troco = troco;
	}

    public NfeCabecalho getNfeCabecalho() {
		return this.nfeCabecalho;
	}

	public void setNfeCabecalho(NfeCabecalho nfeCabecalho) {
		this.nfeCabecalho = nfeCabecalho;
	}

		
}