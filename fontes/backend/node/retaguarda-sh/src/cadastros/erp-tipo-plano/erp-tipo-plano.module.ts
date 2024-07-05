import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ErpTipoPlanoController } from './erp-tipo-plano.controller';
import { ErpTipoPlanoService } from './erp-tipo-plano.service';
import { ErpTipoPlanoModel } from './erp-tipo-plano.entity';

@Module({
    imports: [TypeOrmModule.forFeature([ErpTipoPlanoModel])],
    controllers: [ErpTipoPlanoController],
    providers: [ErpTipoPlanoService],
})
export class ErpTipoPlanoModule { }
