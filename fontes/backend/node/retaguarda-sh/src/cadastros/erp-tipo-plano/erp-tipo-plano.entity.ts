import { Entity, Column, PrimaryGeneratedColumn, OneToMany, OneToOne, ManyToOne, JoinColumn } from 'typeorm';

@Entity({ name: 'erp_tipo_plano' })
export class ErpTipoPlanoModel { 

	@PrimaryGeneratedColumn() 
	id: number; 

	@Column({ name: 'nome' }) 
	nome: string; 

	@Column({ name: 'valor' }) 
	valor: number; 

	@Column({ name: 'frequencia' }) 
	frequencia: string; 

	@Column({ name: 'acesso_total' }) 
	acessoTotal: Boolean; 

	@Column({ name: 'ativo' }) 
	ativo: Boolean; 


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(jsonObj: {}) {
		if (jsonObj != null) {
			this.id = jsonObj['id'] == 0 ? undefined : jsonObj['id'];
			this.id = jsonObj['nome'] == 0 ? undefined : jsonObj['nome'];
			this.id = jsonObj['valor'] == 0 ? undefined : jsonObj['valor'];
			this.id = jsonObj['frequencia'] == 0 ? undefined : jsonObj['frequencia'];
			this.id = jsonObj['acessoTotal'] == 0 ? undefined : jsonObj['acessoTotal'];
			this.id = jsonObj['ativo'] == 0 ? undefined : jsonObj['ativo'];
		}
	}
}