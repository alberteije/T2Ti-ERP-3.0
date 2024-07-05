/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [OS_ABERTURA] 
                                                                                
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
package com.t2ti.fenix.model.os;

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

import com.t2ti.fenix.model.cadastros.Cliente;
import com.t2ti.fenix.model.cadastros.Colaborador;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@Entity
@Table(name="OS_ABERTURA")
@NamedQuery(name="OsAbertura.findAll", query="SELECT t FROM OsAbertura t")
public class OsAbertura implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NUMERO")
	private String numero;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_INICIO")
	private Date dataInicio;

    @Column(name="HORA_INICIO")
	private String horaInicio;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_PREVISAO")
	private Date dataPrevisao;

    @Column(name="HORA_PREVISAO")
	private String horaPrevisao;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_FIM")
	private Date dataFim;

    @Column(name="HORA_FIM")
	private String horaFim;

    @Column(name="NOME_CONTATO")
	private String nomeContato;

    @Column(name="FONE_CONTATO")
	private String foneContato;

    @Column(name="OBSERVACAO_CLIENTE")
	private String observacaoCliente;

    @Column(name="OBSERVACAO_ABERTURA")
	private String observacaoAbertura;

    @ManyToOne
	@JoinColumn(name="ID_OS_STATUS")
    private OsStatus osStatus;

    @ManyToOne
	@JoinColumn(name="ID_CLIENTE")
    private Cliente cliente;

    @ManyToOne
	@JoinColumn(name="ID_COLABORADOR")
    private Colaborador colaborador;

    @OneToMany(mappedBy = "osAbertura", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<OsAberturaEquipamento> listaOsAberturaEquipamento;

    @OneToMany(mappedBy = "osAbertura", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<OsEvolucao> listaOsEvolucao;

    @OneToMany(mappedBy = "osAbertura", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<OsProdutoServico> listaOsProdutoServico;

	public OsAbertura() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

    public Date getDataInicio() {
		return this.dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

    public String getHoraInicio() {
		return this.horaInicio;
	}

	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}

    public Date getDataPrevisao() {
		return this.dataPrevisao;
	}

	public void setDataPrevisao(Date dataPrevisao) {
		this.dataPrevisao = dataPrevisao;
	}

    public String getHoraPrevisao() {
		return this.horaPrevisao;
	}

	public void setHoraPrevisao(String horaPrevisao) {
		this.horaPrevisao = horaPrevisao;
	}

    public Date getDataFim() {
		return this.dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

    public String getHoraFim() {
		return this.horaFim;
	}

	public void setHoraFim(String horaFim) {
		this.horaFim = horaFim;
	}

    public String getNomeContato() {
		return this.nomeContato;
	}

	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}

    public String getFoneContato() {
		return this.foneContato;
	}

	public void setFoneContato(String foneContato) {
		this.foneContato = foneContato;
	}

    public String getObservacaoCliente() {
		return this.observacaoCliente;
	}

	public void setObservacaoCliente(String observacaoCliente) {
		this.observacaoCliente = observacaoCliente;
	}

    public String getObservacaoAbertura() {
		return this.observacaoAbertura;
	}

	public void setObservacaoAbertura(String observacaoAbertura) {
		this.observacaoAbertura = observacaoAbertura;
	}

    public OsStatus getOsStatus() {
		return this.osStatus;
	}

	public void setOsStatus(OsStatus osStatus) {
		this.osStatus = osStatus;
	}

    public Cliente getCliente() {
		return this.cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

    public Colaborador getColaborador() {
		return this.colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

    public Set<OsAberturaEquipamento> getListaOsAberturaEquipamento() {
		return this.listaOsAberturaEquipamento;
	}

	public void setListaOsAberturaEquipamento(Set<OsAberturaEquipamento> listaOsAberturaEquipamento) {
		this.listaOsAberturaEquipamento = listaOsAberturaEquipamento;
		for (OsAberturaEquipamento osAberturaEquipamento : listaOsAberturaEquipamento) {
			osAberturaEquipamento.setOsAbertura(this);
		}
	}

    public Set<OsEvolucao> getListaOsEvolucao() {
		return this.listaOsEvolucao;
	}

	public void setListaOsEvolucao(Set<OsEvolucao> listaOsEvolucao) {
		this.listaOsEvolucao = listaOsEvolucao;
		for (OsEvolucao osEvolucao : listaOsEvolucao) {
			osEvolucao.setOsAbertura(this);
		}
	}

    public Set<OsProdutoServico> getListaOsProdutoServico() {
		return this.listaOsProdutoServico;
	}

	public void setListaOsProdutoServico(Set<OsProdutoServico> listaOsProdutoServico) {
		this.listaOsProdutoServico = listaOsProdutoServico;
		for (OsProdutoServico osProdutoServico : listaOsProdutoServico) {
			osProdutoServico.setOsAbertura(this);
		}
	}

		
}