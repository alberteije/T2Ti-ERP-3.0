/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
																			    
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
import { Inject, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { RequisicaoInternaCabecalho } from './requisicao-interna-cabecalho.entity';
import { DataSource, QueryRunner } from 'typeorm';
import { ControleEstoqueService } from 'estoque/controle-estoque/controle-estoque.service';

@Injectable()
export class RequisicaoInternaCabecalhoService extends TypeOrmCrudService<RequisicaoInternaCabecalho> {

	constructor(
		private dataSource: DataSource,
		@InjectRepository(RequisicaoInternaCabecalho) repository) { super(repository); }
			
	async persistir(requisicaoInternaCabecalho: RequisicaoInternaCabecalho, operacao: string): Promise<RequisicaoInternaCabecalho> {
		let objetoRetorno: RequisicaoInternaCabecalho;

		const queryRunner = this.dataSource.createQueryRunner();

		await queryRunner.connect();
		await queryRunner.startTransaction();
		try {
			if (operacao == 'A') {
				await this.excluirFilhos(queryRunner, requisicaoInternaCabecalho.id);
			}
			let requisicaoCabOld = await queryRunner.manager.findOne(RequisicaoInternaCabecalho, { where: { id: requisicaoInternaCabecalho.id } });
			objetoRetorno = await queryRunner.manager.save(requisicaoInternaCabecalho);
			this.atualizarEstoque(requisicaoInternaCabecalho, requisicaoCabOld);
			await queryRunner.commitTransaction();
		} catch (erro) {
			await queryRunner.rollbackTransaction();
			throw (erro);
		} finally {
			await queryRunner.release();
		}
		return objetoRetorno;
	}

	async excluirMestreDetalhe(id: number) {
		const queryRunner = this.dataSource.createQueryRunner();

		await queryRunner.connect();
		await queryRunner.startTransaction();
		try {
			await this.excluirFilhos(queryRunner, id);
			await queryRunner.query('delete from requisicaoInternaCabecalho where id=' + id);
			await queryRunner.commitTransaction();
		} catch (erro) {
			await queryRunner.rollbackTransaction();
			throw (erro);
		} finally {
			await queryRunner.release();
		}
	}

	async excluirFilhos(queryRunner: QueryRunner, id: number) {
		await queryRunner.query('delete from REQUISICAO_INTERNA_DETALHE where ID_REQUISICAO_INTERNA_CABECALHO=' + id);
	}

	async atualizarEstoque(requisicaoInternaCabecalho: RequisicaoInternaCabecalho, requisicaoCabOld: RequisicaoInternaCabecalho) {
		let controleEstoqueService = new ControleEstoqueService(this.dataSource);
		if (requisicaoCabOld != null) {
			for (let i = 0; i < requisicaoInternaCabecalho.listaRequisicaoInternaDetalhe.length; i++) {
				let detalhe = requisicaoInternaCabecalho.listaRequisicaoInternaDetalhe[i];
				/*
				  Tava Aberta OU Indeferida E foi Deferida - Drecementa Estoque
				  Tava Aberta E foi Indeferida - não faz nada
				  Tava Deferida E foi Indeferida OU Aberta - Incrementa Estoque
				  Tava Indeferida e foi Aberta - não faz nada
				*/
				if (
					(requisicaoCabOld.situacao == "A" || requisicaoCabOld.situacao == "I")
					&&
					(requisicaoInternaCabecalho.situacao == "D")
				) {
					await controleEstoqueService.atualizarEstoque(detalhe.produto, detalhe.quantidade, "D");
				} else if
					(
					(requisicaoCabOld.situacao == "D")
					&&
					(requisicaoInternaCabecalho.situacao == "I" || requisicaoInternaCabecalho.situacao == "A")
				) {
					await controleEstoqueService.atualizarEstoque(detalhe.produto, detalhe.quantidade, "I");
				}
			}

		}
	}

}