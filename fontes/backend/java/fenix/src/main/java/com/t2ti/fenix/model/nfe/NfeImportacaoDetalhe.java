/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_IMPORTACAO_DETALHE] 
                                                                                
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
import javax.persistence.ManyToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="NFE_IMPORTACAO_DETALHE")
@NamedQuery(name="NfeImportacaoDetalhe.findAll", query="SELECT t FROM NfeImportacaoDetalhe t")
public class NfeImportacaoDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NUMERO_ADICAO")
	private Integer numeroAdicao;

    @Column(name="NUMERO_SEQUENCIAL")
	private Integer numeroSequencial;

    @Column(name="CODIGO_FABRICANTE_ESTRANGEIRO")
	private String codigoFabricanteEstrangeiro;

    @Column(name="VALOR_DESCONTO")
	private BigDecimal valorDesconto;

    @Column(name="DRAWBACK")
	private Integer drawback;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_NFE_DECLARACAO_IMPORTACAO")
    private NfeDeclaracaoImportacao nfeDeclaracaoImportacao;

	public NfeImportacaoDetalhe() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getNumeroAdicao() {
		return this.numeroAdicao;
	}

	public void setNumeroAdicao(Integer numeroAdicao) {
		this.numeroAdicao = numeroAdicao;
	}

    public Integer getNumeroSequencial() {
		return this.numeroSequencial;
	}

	public void setNumeroSequencial(Integer numeroSequencial) {
		this.numeroSequencial = numeroSequencial;
	}

    public String getCodigoFabricanteEstrangeiro() {
		return this.codigoFabricanteEstrangeiro;
	}

	public void setCodigoFabricanteEstrangeiro(String codigoFabricanteEstrangeiro) {
		this.codigoFabricanteEstrangeiro = codigoFabricanteEstrangeiro;
	}

    public BigDecimal getValorDesconto() {
		return this.valorDesconto;
	}

	public void setValorDesconto(BigDecimal valorDesconto) {
		this.valorDesconto = valorDesconto;
	}

    public Integer getDrawback() {
		return this.drawback;
	}

	public void setDrawback(Integer drawback) {
		this.drawback = drawback;
	}

    public NfeDeclaracaoImportacao getNfeDeclaracaoImportacao() {
		return this.nfeDeclaracaoImportacao;
	}

	public void setNfeDeclaracaoImportacao(NfeDeclaracaoImportacao nfeDeclaracaoImportacao) {
		this.nfeDeclaracaoImportacao = nfeDeclaracaoImportacao;
	}

		
}