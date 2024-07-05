/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DECLARACAO_IMPORTACAO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToMany, ManyToOne, JoinColumn } from 'typeorm';
import { NfeImportacaoDetalhe } from '../../entities-export';
import { NfeDetalhe } from '../../entities-export';

@Entity({ name: 'NFE_DECLARACAO_IMPORTACAO' })
export class NfeDeclaracaoImportacao { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'NUMERO_DOCUMENTO' })
	numeroDocumento: string;

	@Column({ name: 'DATA_REGISTRO' })
	dataRegistro: Date;

	@Column({ name: 'LOCAL_DESEMBARACO' })
	localDesembaraco: string;

	@Column({ name: 'UF_DESEMBARACO' })
	ufDesembaraco: string;

	@Column({ name: 'DATA_DESEMBARACO' })
	dataDesembaraco: Date;

	@Column({ name: 'VIA_TRANSPORTE' })
	viaTransporte: string;

	@Column({ name: 'VALOR_AFRMM' })
	valorAfrmm: number;

	@Column({ name: 'FORMA_INTERMEDIACAO' })
	formaIntermediacao: string;

	@Column({ name: 'CNPJ' })
	cnpj: string;

	@Column({ name: 'UF_TERCEIRO' })
	ufTerceiro: string;

	@Column({ name: 'CODIGO_EXPORTADOR' })
	codigoExportador: string;


	/**
	* Relations
	*/
    @OneToMany(() => NfeImportacaoDetalhe, nfeImportacaoDetalhe => nfeImportacaoDetalhe.nfeDeclaracaoImportacao, { cascade: true })
    listaNfeImportacaoDetalhe: NfeImportacaoDetalhe[];

    @ManyToOne(() => NfeDetalhe, nfeDetalhe => nfeDetalhe.listaNfeDeclaracaoImportacao)
    @JoinColumn({ name: "ID_NFE_DETALHE" })
    nfeDetalhe: NfeDetalhe;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.numeroDocumento = objetoJson['numeroDocumento'];
			this.dataRegistro = objetoJson['dataRegistro'];
			this.localDesembaraco = objetoJson['localDesembaraco'];
			this.ufDesembaraco = objetoJson['ufDesembaraco'];
			this.dataDesembaraco = objetoJson['dataDesembaraco'];
			this.viaTransporte = objetoJson['viaTransporte'];
			this.valorAfrmm = objetoJson['valorAfrmm'];
			this.formaIntermediacao = objetoJson['formaIntermediacao'];
			this.cnpj = objetoJson['cnpj'];
			this.ufTerceiro = objetoJson['ufTerceiro'];
			this.codigoExportador = objetoJson['codigoExportador'];
			
			
			this.listaNfeImportacaoDetalhe = [];
			let listaNfeImportacaoDetalheJson = objetoJson['listaNfeImportacaoDetalhe'];
			if (listaNfeImportacaoDetalheJson != null) {
				for (let i = 0; i < listaNfeImportacaoDetalheJson.length; i++) {
					let objeto = new NfeImportacaoDetalhe(listaNfeImportacaoDetalheJson[i]);
					this.listaNfeImportacaoDetalhe.push(objeto);
				}
			}

		}
	}
}