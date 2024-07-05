/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { EstoqueReajusteCabecalho } from './estoque-reajuste-cabecalho.entity';
import { DataSource, QueryRunner } from 'typeorm';
import { Produto } from 'entities-export';

@Injectable()
export class EstoqueReajusteCabecalhoService extends TypeOrmCrudService<EstoqueReajusteCabecalho> {

  constructor(
	private dataSource: DataSource,
    @InjectRepository(EstoqueReajusteCabecalho) repository) { super(repository); }

	async persistir(estoqueReajusteCabecalho: EstoqueReajusteCabecalho, operacao: string): Promise<EstoqueReajusteCabecalho> {
	  let objetoRetorno: EstoqueReajusteCabecalho;
	
		const queryRunner = this.dataSource.createQueryRunner();
	
	  await queryRunner.connect();
	  await queryRunner.startTransaction();
	  try {
	    if (operacao == 'A') {
	      await this.excluirFilhos(queryRunner, estoqueReajusteCabecalho.id);
	    }
	    objetoRetorno = await queryRunner.manager.save(estoqueReajusteCabecalho);

		// reajusta o preço do produto
		for (let i = 0; i < estoqueReajusteCabecalho.listaEstoqueReajusteDetalhe.length; i++) {
			let detalhe = estoqueReajusteCabecalho.listaEstoqueReajusteDetalhe[i];
			let produto = await queryRunner.manager.findOne(Produto, { where: { id: detalhe.produto.id }} );
			produto.valorVenda = detalhe.valorReajuste;
			await queryRunner.manager.save(produto);
		}

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
	    await queryRunner.query('delete from estoqueReajusteCabecalho where id=' + id);
	    await queryRunner.commitTransaction();
	  } catch (erro) {
	    await queryRunner.rollbackTransaction();
	    throw (erro);
	  } finally {
	    await queryRunner.release();
	  }
	}

	async excluirFilhos(queryRunner: QueryRunner, id: number) {
		await queryRunner.query('delete from ESTOQUE_REAJUSTE_DETALHE where ID_ESTOQUE_REAJUSTE_CABECALHO=' + id);		
	}

	async formarPreco(estoqueReajusteCabecalho: EstoqueReajusteCabecalho) {
		const queryRunner = this.dataSource.createQueryRunner();
		
		// reajusta o preço do produto
		for (let i = 0; i < estoqueReajusteCabecalho.listaEstoqueReajusteDetalhe.length; i++) {
			let detalhe = estoqueReajusteCabecalho.listaEstoqueReajusteDetalhe[i];
			let produto = await queryRunner.manager.findOne(Produto, { where: { id: detalhe.produto.id }} );
			produto.valorVenda = detalhe.valorReajuste;
			await queryRunner.manager.save(produto);
		}		
	}
	
}