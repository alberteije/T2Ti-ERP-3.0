/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_AFASTAMENTO] 
                                                                                
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
@Table(name="FOLHA_AFASTAMENTO")
@NamedQuery(name="FolhaAfastamento.findAll", query="SELECT t FROM FolhaAfastamento t")
public class FolhaAfastamento implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_INICIO")
	private Date dataInicio;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_FIM")
	private Date dataFim;

    @Column(name="DIAS_AFASTADO")
	private Integer diasAfastado;

    @ManyToOne
	@JoinColumn(name="ID_FOLHA_TIPO_AFASTAMENTO")
    private FolhaTipoAfastamento folhaTipoAfastamento;

    @ManyToOne
	@JoinColumn(name="ID_COLABORADOR")
    private Colaborador colaborador;

	public FolhaAfastamento() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Date getDataInicio() {
		return this.dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

    public Date getDataFim() {
		return this.dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

    public Integer getDiasAfastado() {
		return this.diasAfastado;
	}

	public void setDiasAfastado(Integer diasAfastado) {
		this.diasAfastado = diasAfastado;
	}

    public FolhaTipoAfastamento getFolhaTipoAfastamento() {
		return this.folhaTipoAfastamento;
	}

	public void setFolhaTipoAfastamento(FolhaTipoAfastamento folhaTipoAfastamento) {
		this.folhaTipoAfastamento = folhaTipoAfastamento;
	}

    public Colaborador getColaborador() {
		return this.colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

		
}