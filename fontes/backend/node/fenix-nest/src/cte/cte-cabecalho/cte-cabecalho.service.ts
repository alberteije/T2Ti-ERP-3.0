/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CTE_CABECALHO] 
                                                                                
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
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { CteCabecalho } from './cte-cabecalho.entity';
import { DataSource, QueryRunner } from 'typeorm';

@Injectable()
export class CteCabecalhoService extends TypeOrmCrudService<CteCabecalho> {

  constructor(
	private dataSource: DataSource,
    @InjectRepository(CteCabecalho) repository) { super(repository); }

	async persistir(cteCabecalho: CteCabecalho, operacao: string): Promise<CteCabecalho> {
	  let objetoRetorno: CteCabecalho;
	
		const queryRunner = this.dataSource.createQueryRunner();
	
	  await queryRunner.connect();
	  await queryRunner.startTransaction();
	  try {
	    if (operacao == 'A') {
	      await this.excluirFilhos(queryRunner, cteCabecalho.id);
	    }
	    objetoRetorno = await queryRunner.manager.save(cteCabecalho);
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
	    await queryRunner.query('delete from cteCabecalho where id=' + id);
	    await queryRunner.commitTransaction();
	  } catch (erro) {
	    await queryRunner.rollbackTransaction();
	    throw (erro);
	  } finally {
	    await queryRunner.release();
	  }
	}

	async excluirFilhos(queryRunner: QueryRunner, id: number) {
		await queryRunner.query('delete from CTE_CARGA where ID_CTE_CABECALHO=' + id);
		await queryRunner.query('delete from CTE_DESTINATARIO where ID_CTE_CABECALHO=' + id);
		await queryRunner.query('delete from CTE_LOCAL_ENTREGA where ID_CTE_CABECALHO=' + id);
		await queryRunner.query('delete from CTE_REMETENTE where ID_CTE_CABECALHO=' + id);
		await queryRunner.query('delete from CTE_RODOVIARIO where ID_CTE_CABECALHO=' + id);
		await queryRunner.query('delete from CTE_TOMADOR where ID_CTE_CABECALHO=' + id);
		
	}
	
}