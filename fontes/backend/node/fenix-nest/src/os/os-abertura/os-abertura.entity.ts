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
import { Entity, Column, PrimaryGeneratedColumn, OneToMany, OneToOne, JoinColumn } from 'typeorm';
import { OsAberturaEquipamento } from '../../entities-export';
import { OsEvolucao } from '../../entities-export';
import { OsProdutoServico } from '../../entities-export';
import { OsStatus } from '../../entities-export';
import { Cliente } from '../../entities-export';
import { Colaborador } from '../../entities-export';

@Entity({ name: 'OS_ABERTURA' })
export class OsAbertura { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'DATA_INICIO' })
	dataInicio: Date;

	@Column({ name: 'HORA_INICIO' })
	horaInicio: string;

	@Column({ name: 'DATA_PREVISAO' })
	dataPrevisao: Date;

	@Column({ name: 'HORA_PREVISAO' })
	horaPrevisao: string;

	@Column({ name: 'DATA_FIM' })
	dataFim: Date;

	@Column({ name: 'HORA_FIM' })
	horaFim: string;

	@Column({ name: 'NOME_CONTATO' })
	nomeContato: string;

	@Column({ name: 'FONE_CONTATO' })
	foneContato: string;

	@Column({ name: 'OBSERVACAO_CLIENTE' })
	observacaoCliente: string;

	@Column({ name: 'OBSERVACAO_ABERTURA' })
	observacaoAbertura: string;


	/**
	* Relations
	*/
    @OneToOne(() => OsStatus)
    @JoinColumn({ name: "ID_OS_STATUS" })
    osStatus: OsStatus;

    @OneToOne(() => Cliente)
    @JoinColumn({ name: "ID_CLIENTE" })
    cliente: Cliente;

    @OneToOne(() => Colaborador)
    @JoinColumn({ name: "ID_COLABORADOR" })
    colaborador: Colaborador;

    @OneToMany(() => OsAberturaEquipamento, osAberturaEquipamento => osAberturaEquipamento.osAbertura, { cascade: true })
    listaOsAberturaEquipamento: OsAberturaEquipamento[];

    @OneToMany(() => OsEvolucao, osEvolucao => osEvolucao.osAbertura, { cascade: true })
    listaOsEvolucao: OsEvolucao[];

    @OneToMany(() => OsProdutoServico, osProdutoServico => osProdutoServico.osAbertura, { cascade: true })
    listaOsProdutoServico: OsProdutoServico[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.numero = objetoJson['numero'];
			this.dataInicio = objetoJson['dataInicio'];
			this.horaInicio = objetoJson['horaInicio'];
			this.dataPrevisao = objetoJson['dataPrevisao'];
			this.horaPrevisao = objetoJson['horaPrevisao'];
			this.dataFim = objetoJson['dataFim'];
			this.horaFim = objetoJson['horaFim'];
			this.nomeContato = objetoJson['nomeContato'];
			this.foneContato = objetoJson['foneContato'];
			this.observacaoCliente = objetoJson['observacaoCliente'];
			this.observacaoAbertura = objetoJson['observacaoAbertura'];
			
			if (objetoJson['osStatus'] != null) {
				this.osStatus = new OsStatus(objetoJson['osStatus']);
			}

			if (objetoJson['cliente'] != null) {
				this.cliente = new Cliente(objetoJson['cliente']);
			}

			if (objetoJson['colaborador'] != null) {
				this.colaborador = new Colaborador(objetoJson['colaborador']);
			}

			
			this.listaOsAberturaEquipamento = [];
			let listaOsAberturaEquipamentoJson = objetoJson['listaOsAberturaEquipamento'];
			if (listaOsAberturaEquipamentoJson != null) {
				for (let i = 0; i < listaOsAberturaEquipamentoJson.length; i++) {
					let objeto = new OsAberturaEquipamento(listaOsAberturaEquipamentoJson[i]);
					this.listaOsAberturaEquipamento.push(objeto);
				}
			}

			this.listaOsEvolucao = [];
			let listaOsEvolucaoJson = objetoJson['listaOsEvolucao'];
			if (listaOsEvolucaoJson != null) {
				for (let i = 0; i < listaOsEvolucaoJson.length; i++) {
					let objeto = new OsEvolucao(listaOsEvolucaoJson[i]);
					this.listaOsEvolucao.push(objeto);
				}
			}

			this.listaOsProdutoServico = [];
			let listaOsProdutoServicoJson = objetoJson['listaOsProdutoServico'];
			if (listaOsProdutoServicoJson != null) {
				for (let i = 0; i < listaOsProdutoServicoJson.length; i++) {
					let objeto = new OsProdutoServico(listaOsProdutoServicoJson[i]);
					this.listaOsProdutoServico.push(objeto);
				}
			}

		}
	}
}