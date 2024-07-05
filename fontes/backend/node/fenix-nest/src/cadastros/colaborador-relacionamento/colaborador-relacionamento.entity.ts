/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COLABORADOR_RELACIONAMENTO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';
import { TipoRelacionamento } from '../../entities-export';
import { Colaborador } from '../../entities-export';

@Entity({ name: 'COLABORADOR_RELACIONAMENTO' })
export class ColaboradorRelacionamento { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'DATA_NASCIMENTO' })
	dataNascimento: Date;

	@Column({ name: 'CPF' })
	cpf: string;

	@Column({ name: 'REGISTRO_MATRICULA' })
	registroMatricula: string;

	@Column({ name: 'REGISTRO_CARTORIO' })
	registroCartorio: string;

	@Column({ name: 'REGISTRO_CARTORIO_NUMERO' })
	registroCartorioNumero: string;

	@Column({ name: 'REGISTRO_NUMERO_LIVRO' })
	registroNumeroLivro: string;

	@Column({ name: 'REGISTRO_NUMERO_FOLHA' })
	registroNumeroFolha: string;

	@Column({ name: 'DATA_ENTREGA_DOCUMENTO' })
	dataEntregaDocumento: Date;

	@Column({ name: 'SALARIO_FAMILIA' })
	salarioFamilia: string;

	@Column({ name: 'SALARIO_FAMILIA_IDADE_LIMITE' })
	salarioFamiliaIdadeLimite: number;

	@Column({ name: 'SALARIO_FAMILIA_DATA_FIM' })
	salarioFamiliaDataFim: Date;

	@Column({ name: 'IMPOSTO_RENDA_IDADE_LIMITE' })
	impostoRendaIdadeLimite: number;

	@Column({ name: 'IMPOSTO_RENDA_DATA_FIM' })
	impostoRendaDataFim: number;


	/**
	* Relations
	*/
    @OneToOne(() => TipoRelacionamento)
    @JoinColumn({ name: "ID_TIPO_RELACIONAMENTO" })
    tipoRelacionamento: TipoRelacionamento;

    @OneToOne(() => Colaborador)
    @JoinColumn({ name: "ID_COLABORADOR" })
    colaborador: Colaborador;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.nome = objetoJson['nome'];
			this.dataNascimento = objetoJson['dataNascimento'];
			this.cpf = objetoJson['cpf'];
			this.registroMatricula = objetoJson['registroMatricula'];
			this.registroCartorio = objetoJson['registroCartorio'];
			this.registroCartorioNumero = objetoJson['registroCartorioNumero'];
			this.registroNumeroLivro = objetoJson['registroNumeroLivro'];
			this.registroNumeroFolha = objetoJson['registroNumeroFolha'];
			this.dataEntregaDocumento = objetoJson['dataEntregaDocumento'];
			this.salarioFamilia = objetoJson['salarioFamilia'];
			this.salarioFamiliaIdadeLimite = objetoJson['salarioFamiliaIdadeLimite'];
			this.salarioFamiliaDataFim = objetoJson['salarioFamiliaDataFim'];
			this.impostoRendaIdadeLimite = objetoJson['impostoRendaIdadeLimite'];
			this.impostoRendaDataFim = objetoJson['impostoRendaDataFim'];
			
			if (objetoJson['tipoRelacionamento'] != null) {
				this.tipoRelacionamento = new TipoRelacionamento(objetoJson['tipoRelacionamento']);
			}

			if (objetoJson['colaborador'] != null) {
				this.colaborador = new Colaborador(objetoJson['colaborador']);
			}

			
		}
	}
}