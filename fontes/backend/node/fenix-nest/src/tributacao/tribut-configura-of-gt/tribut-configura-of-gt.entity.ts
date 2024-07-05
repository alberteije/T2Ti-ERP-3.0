/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
import { TributCofins } from '../../entities-export';
import { TributIcmsUf } from '../../entities-export';
import { TributIpi } from '../../entities-export';
import { TributPis } from '../../entities-export';
import { TributGrupoTributario } from '../../entities-export';
import { TributOperacaoFiscal } from '../../entities-export';

@Entity({ name: 'TRIBUT_CONFIGURA_OF_GT' })
export class TributConfiguraOfGt { 

	@PrimaryGeneratedColumn()
	id: number;


	/**
	* Relations
	*/
    @OneToOne(() => TributCofins, tributCofins => tributCofins.tributConfiguraOfGt, { cascade: true })
    tributCofins: TributCofins;

    @OneToOne(() => TributIpi, tributIpi => tributIpi.tributConfiguraOfGt, { cascade: true })
    tributIpi: TributIpi;

    @OneToOne(() => TributPis, tributPis => tributPis.tributConfiguraOfGt, { cascade: true })
    tributPis: TributPis;

    @OneToOne(() => TributGrupoTributario)
    @JoinColumn({ name: "ID_TRIBUT_GRUPO_TRIBUTARIO" })
    tributGrupoTributario: TributGrupoTributario;

    @OneToOne(() => TributOperacaoFiscal)
    @JoinColumn({ name: "ID_TRIBUT_OPERACAO_FISCAL" })
    tributOperacaoFiscal: TributOperacaoFiscal;

    @OneToMany(() => TributIcmsUf, tributIcmsUf => tributIcmsUf.tributConfiguraOfGt, { cascade: true })
    listaTributIcmsUf: TributIcmsUf[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			
			if (objetoJson['tributCofins'] != null) {
				this.tributCofins = new TributCofins(objetoJson['tributCofins']);
			}

			if (objetoJson['tributIpi'] != null) {
				this.tributIpi = new TributIpi(objetoJson['tributIpi']);
			}

			if (objetoJson['tributPis'] != null) {
				this.tributPis = new TributPis(objetoJson['tributPis']);
			}

			if (objetoJson['tributGrupoTributario'] != null) {
				this.tributGrupoTributario = new TributGrupoTributario(objetoJson['tributGrupoTributario']);
			}

			if (objetoJson['tributOperacaoFiscal'] != null) {
				this.tributOperacaoFiscal = new TributOperacaoFiscal(objetoJson['tributOperacaoFiscal']);
			}

			
			this.listaTributIcmsUf = [];
			let listaTributIcmsUfJson = objetoJson['listaTributIcmsUf'];
			if (listaTributIcmsUfJson != null) {
				for (let i = 0; i < listaTributIcmsUfJson.length; i++) {
					let objeto = new TributIcmsUf(listaTributIcmsUfJson[i]);
					this.listaTributIcmsUf.push(objeto);
				}
			}

		}
	}
}