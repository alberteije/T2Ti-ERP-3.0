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
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';
import { Colaborador } from '../../entities-export';

@Entity({ name: 'FOLHA_RESCISAO' })
export class FolhaRescisao { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'DATA_DEMISSAO' })
	dataDemissao: Date;

	@Column({ name: 'DATA_PAGAMENTO' })
	dataPagamento: Date;

	@Column({ name: 'MOTIVO' })
	motivo: string;

	@Column({ name: 'MOTIVO_ESOCIAL' })
	motivoEsocial: string;

	@Column({ name: 'DATA_AVISO_PREVIO' })
	dataAvisoPrevio: Date;

	@Column({ name: 'DIAS_AVISO_PREVIO' })
	diasAvisoPrevio: number;

	@Column({ name: 'COMPROVOU_NOVO_EMPREGO' })
	comprovouNovoEmprego: string;

	@Column({ name: 'DISPENSOU_EMPREGADO' })
	dispensouEmpregado: string;

	@Column({ name: 'PENSAO_ALIMENTICIA' })
	pensaoAlimenticia: number;

	@Column({ name: 'PENSAO_ALIMENTICIA_FGTS' })
	pensaoAlimenticiaFgts: number;

	@Column({ name: 'FGTS_VALOR_RESCISAO' })
	fgtsValorRescisao: number;

	@Column({ name: 'FGTS_SALDO_BANCO' })
	fgtsSaldoBanco: number;

	@Column({ name: 'FGTS_COMPLEMENTO_SALDO' })
	fgtsComplementoSaldo: number;

	@Column({ name: 'FGTS_CODIGO_AFASTAMENTO' })
	fgtsCodigoAfastamento: string;

	@Column({ name: 'FGTS_CODIGO_SAQUE' })
	fgtsCodigoSaque: string;


	/**
	* Relations
	*/
    @OneToOne(() => Colaborador)
    @JoinColumn({ name: "ID_COLABORADOR" })
    colaborador: Colaborador;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.dataDemissao = objetoJson['dataDemissao'];
			this.dataPagamento = objetoJson['dataPagamento'];
			this.motivo = objetoJson['motivo'];
			this.motivoEsocial = objetoJson['motivoEsocial'];
			this.dataAvisoPrevio = objetoJson['dataAvisoPrevio'];
			this.diasAvisoPrevio = objetoJson['diasAvisoPrevio'];
			this.comprovouNovoEmprego = objetoJson['comprovouNovoEmprego'];
			this.dispensouEmpregado = objetoJson['dispensouEmpregado'];
			this.pensaoAlimenticia = objetoJson['pensaoAlimenticia'];
			this.pensaoAlimenticiaFgts = objetoJson['pensaoAlimenticiaFgts'];
			this.fgtsValorRescisao = objetoJson['fgtsValorRescisao'];
			this.fgtsSaldoBanco = objetoJson['fgtsSaldoBanco'];
			this.fgtsComplementoSaldo = objetoJson['fgtsComplementoSaldo'];
			this.fgtsCodigoAfastamento = objetoJson['fgtsCodigoAfastamento'];
			this.fgtsCodigoSaque = objetoJson['fgtsCodigoSaque'];
			
			if (objetoJson['colaborador'] != null) {
				this.colaborador = new Colaborador(objetoJson['colaborador']);
			}

			
		}
	}
}