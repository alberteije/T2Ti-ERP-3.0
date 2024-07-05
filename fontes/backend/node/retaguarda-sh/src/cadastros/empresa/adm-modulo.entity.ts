import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { EmpresaModel } from '../../entities-export';

@Entity({ name: 'adm_modulo' })
export class AdmModuloModel { 

	@PrimaryGeneratedColumn() 
	id: number; 

	@Column({ name: 'codigo' }) 
	codigo: string; 

	@Column({ name: 'bloco' }) 
	bloco: string; 

	@Column({ name: 'nome' }) 
	nome: string; 

	@Column({ name: 'descricao' }) 
	descricao: string; 

	@Column({ name: 'link' }) 
	link: string; 


	/**
	* Relations
	*/
	@ManyToOne(() => EmpresaModel, empresaModel => empresaModel.admModuloModelList)
	@JoinColumn({ name: 'id_empresa' })
	empresaModel: EmpresaModel;


	/**
	* Constructor
	*/
	constructor(jsonObj: object) {
		if (jsonObj != null) {
			this.id = jsonObj['id'] == 0 ? undefined : jsonObj['id'];
			this.id = jsonObj['codigo'] == 0 ? undefined : jsonObj['codigo'];
			this.id = jsonObj['bloco'] == 0 ? undefined : jsonObj['bloco'];
			this.id = jsonObj['nome'] == 0 ? undefined : jsonObj['nome'];
			this.id = jsonObj['descricao'] == 0 ? undefined : jsonObj['descricao'];
			this.id = jsonObj['link'] == 0 ? undefined : jsonObj['link'];
		}
	}
}