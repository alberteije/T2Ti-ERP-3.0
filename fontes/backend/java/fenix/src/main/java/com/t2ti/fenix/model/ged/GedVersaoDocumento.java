/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [GED_VERSAO_DOCUMENTO] 
                                                                                
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
package com.t2ti.fenix.model.ged;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.t2ti.fenix.model.cadastros.Colaborador;

@Entity
@Table(name="GED_VERSAO_DOCUMENTO")
@NamedQuery(name="GedVersaoDocumento.findAll", query="SELECT t FROM GedVersaoDocumento t")
public class GedVersaoDocumento implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="VERSAO")
	private Integer versao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_VERSAO")
	private Date dataVersao;

    @Column(name="HORA_VERSAO")
	private String horaVersao;

    @Column(name="HASH_ARQUIVO")
	private String hashArquivo;

    @Column(name="CAMINHO")
	private String caminho;

    @Column(name="ACAO")
	private String acao;

    @ManyToOne
	@JoinColumn(name="ID_COLABORADOR")
    private Colaborador colaborador;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_GED_DOCUMENTO_DETALHE")
    private GedDocumentoDetalhe gedDocumentoDetalhe;

	public GedVersaoDocumento() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getVersao() {
		return this.versao;
	}

	public void setVersao(Integer versao) {
		this.versao = versao;
	}

    public Date getDataVersao() {
		return this.dataVersao;
	}

	public void setDataVersao(Date dataVersao) {
		this.dataVersao = dataVersao;
	}

    public String getHoraVersao() {
		return this.horaVersao;
	}

	public void setHoraVersao(String horaVersao) {
		this.horaVersao = horaVersao;
	}

    public String getHashArquivo() {
		return this.hashArquivo;
	}

	public void setHashArquivo(String hashArquivo) {
		this.hashArquivo = hashArquivo;
	}

    public String getCaminho() {
		return this.caminho;
	}

	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

    public String getAcao() {
		return this.acao;
	}

	public void setAcao(String acao) {
		this.acao = acao;
	}

    public GedDocumentoDetalhe getGedDocumentoDetalhe() {
		return this.gedDocumentoDetalhe;
	}

	public void setGedDocumentoDetalhe(GedDocumentoDetalhe gedDocumentoDetalhe) {
		this.gedDocumentoDetalhe = gedDocumentoDetalhe;
	}

    public Colaborador getColaborador() {
		return this.colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

		
}