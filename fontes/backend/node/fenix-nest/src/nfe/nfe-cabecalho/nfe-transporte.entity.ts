/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE] 
                                                                                
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
import { NfeTransporteReboque } from '../../entities-export';
import { NfeTransporteVolume } from '../../entities-export';
import { NfeCabecalho } from '../../entities-export';
import { Transportadora } from '../../entities-export';

@Entity({ name: 'NFE_TRANSPORTE' })
export class NfeTransporte { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'MODALIDADE_FRETE' })
	modalidadeFrete: string;

	@Column({ name: 'CNPJ' })
	cnpj: string;

	@Column({ name: 'CPF' })
	cpf: string;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'INSCRICAO_ESTADUAL' })
	inscricaoEstadual: string;

	@Column({ name: 'ENDERECO' })
	endereco: string;

	@Column({ name: 'NOME_MUNICIPIO' })
	nomeMunicipio: string;

	@Column({ name: 'UF' })
	uf: string;

	@Column({ name: 'VALOR_SERVICO' })
	valorServico: number;

	@Column({ name: 'VALOR_BC_RETENCAO_ICMS' })
	valorBcRetencaoIcms: number;

	@Column({ name: 'ALIQUOTA_RETENCAO_ICMS' })
	aliquotaRetencaoIcms: number;

	@Column({ name: 'VALOR_ICMS_RETIDO' })
	valorIcmsRetido: number;

	@Column({ name: 'CFOP' })
	cfop: number;

	@Column({ name: 'MUNICIPIO' })
	municipio: number;

	@Column({ name: 'PLACA_VEICULO' })
	placaVeiculo: string;

	@Column({ name: 'UF_VEICULO' })
	ufVeiculo: string;

	@Column({ name: 'RNTC_VEICULO' })
	rntcVeiculo: string;


	/**
	* Relations
	*/
    @OneToOne(() => NfeCabecalho, nfeCabecalho => nfeCabecalho.nfeTransporte)
    @JoinColumn({ name: "ID_NFE_CABECALHO" })
    nfeCabecalho: NfeCabecalho;

    @OneToOne(() => Transportadora)
    @JoinColumn({ name: "ID_TRANSPORTADORA" })
    transportadora: Transportadora;

    @OneToMany(() => NfeTransporteReboque, nfeTransporteReboque => nfeTransporteReboque.nfeTransporte, { cascade: true })
    listaNfeTransporteReboque: NfeTransporteReboque[];

    @OneToMany(() => NfeTransporteVolume, nfeTransporteVolume => nfeTransporteVolume.nfeTransporte, { cascade: true })
    listaNfeTransporteVolume: NfeTransporteVolume[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.modalidadeFrete = objetoJson['modalidadeFrete'];
			this.cnpj = objetoJson['cnpj'];
			this.cpf = objetoJson['cpf'];
			this.nome = objetoJson['nome'];
			this.inscricaoEstadual = objetoJson['inscricaoEstadual'];
			this.endereco = objetoJson['endereco'];
			this.nomeMunicipio = objetoJson['nomeMunicipio'];
			this.uf = objetoJson['uf'];
			this.valorServico = objetoJson['valorServico'];
			this.valorBcRetencaoIcms = objetoJson['valorBcRetencaoIcms'];
			this.aliquotaRetencaoIcms = objetoJson['aliquotaRetencaoIcms'];
			this.valorIcmsRetido = objetoJson['valorIcmsRetido'];
			this.cfop = objetoJson['cfop'];
			this.municipio = objetoJson['municipio'];
			this.placaVeiculo = objetoJson['placaVeiculo'];
			this.ufVeiculo = objetoJson['ufVeiculo'];
			this.rntcVeiculo = objetoJson['rntcVeiculo'];
			
			if (objetoJson['transportadora'] != null) {
				this.transportadora = new Transportadora(objetoJson['transportadora']);
			}

			
			this.listaNfeTransporteReboque = [];
			let listaNfeTransporteReboqueJson = objetoJson['listaNfeTransporteReboque'];
			if (listaNfeTransporteReboqueJson != null) {
				for (let i = 0; i < listaNfeTransporteReboqueJson.length; i++) {
					let objeto = new NfeTransporteReboque(listaNfeTransporteReboqueJson[i]);
					this.listaNfeTransporteReboque.push(objeto);
				}
			}

			this.listaNfeTransporteVolume = [];
			let listaNfeTransporteVolumeJson = objetoJson['listaNfeTransporteVolume'];
			if (listaNfeTransporteVolumeJson != null) {
				for (let i = 0; i < listaNfeTransporteVolumeJson.length; i++) {
					let objeto = new NfeTransporteVolume(listaNfeTransporteVolumeJson[i]);
					this.listaNfeTransporteVolume.push(objeto);
				}
			}

		}
	}
}