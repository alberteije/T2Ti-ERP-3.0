/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_LANCAMENTO_DETALHE] 
                                                                                
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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="FOLHA_LANCAMENTO_DETALHE")
@NamedQuery(name="FolhaLancamentoDetalhe.findAll", query="SELECT t FROM FolhaLancamentoDetalhe t")
public class FolhaLancamentoDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ORIGEM")
	private BigDecimal origem;

    @Column(name="PROVENTO")
	private BigDecimal provento;

    @Column(name="DESCONTO")
	private BigDecimal desconto;

    @ManyToOne
	@JoinColumn(name="ID_FOLHA_EVENTO")
    private FolhaEvento folhaEvento;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_FOLHA_LANCAMENTO_CABECALHO")
    private FolhaLancamentoCabecalho folhaLancamentoCabecalho;

	public FolhaLancamentoDetalhe() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public BigDecimal getOrigem() {
		return this.origem;
	}

	public void setOrigem(BigDecimal origem) {
		this.origem = origem;
	}

    public BigDecimal getProvento() {
		return this.provento;
	}

	public void setProvento(BigDecimal provento) {
		this.provento = provento;
	}

    public BigDecimal getDesconto() {
		return this.desconto;
	}

	public void setDesconto(BigDecimal desconto) {
		this.desconto = desconto;
	}

    public FolhaEvento getFolhaEvento() {
		return this.folhaEvento;
	}

	public void setFolhaEvento(FolhaEvento folhaEvento) {
		this.folhaEvento = folhaEvento;
	}

    public FolhaLancamentoCabecalho getFolhaLancamentoCabecalho() {
		return this.folhaLancamentoCabecalho;
	}

	public void setFolhaLancamentoCabecalho(FolhaLancamentoCabecalho folhaLancamentoCabecalho) {
		this.folhaLancamentoCabecalho = folhaLancamentoCabecalho;
	}

		
}