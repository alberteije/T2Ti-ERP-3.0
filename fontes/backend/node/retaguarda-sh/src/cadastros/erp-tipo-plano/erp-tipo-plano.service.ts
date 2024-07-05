import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { ErpTipoPlanoModel } from '../../entities-export';

@Injectable()
export class ErpTipoPlanoService extends TypeOrmCrudService<ErpTipoPlanoModel> {

  constructor(
    @InjectRepository(ErpTipoPlanoModel) repository) { super(repository); }
	
}