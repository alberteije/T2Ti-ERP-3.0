/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_INSS_RETENCAO] 
                                                                                
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
@Table(name="FOLHA_INSS_RETENCAO")
@NamedQuery(name="FolhaInssRetencao.findAll", query="SELECT t FROM FolhaInssRetencao t")
public class FolhaInssRetencao implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="VALOR_MENSAL")
	private BigDecimal valorMensal;

    @Column(name="VALOR_13")
	private BigDecimal valor13;

    @ManyToOne
	@JoinColumn(name="ID_FOLHA_INSS_SERVICO")
    private FolhaInssServico folhaInssServico;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_FOLHA_INSS")
    private FolhaInss folhaInss;

	public FolhaInssRetencao() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public BigDecimal getValorMensal() {
		return this.valorMensal;
	}

	public void setValorMensal(BigDecimal valorMensal) {
		this.valorMensal = valorMensal;
	}

    public BigDecimal getValor13() {
		return this.valor13;
	}

	public void setValor13(BigDecimal valor13) {
		this.valor13 = valor13;
	}

    public FolhaInss getFolhaInss() {
		return this.folhaInss;
	}

	public void setFolhaInss(FolhaInss folhaInss) {
		this.folhaInss = folhaInss;
	}

    public FolhaInssServico getFolhaInssServico() {
		return this.folhaInssServico;
	}

	public void setFolhaInssServico(FolhaInssServico folhaInssServico) {
		this.folhaInssServico = folhaInssServico;
	}

		
}