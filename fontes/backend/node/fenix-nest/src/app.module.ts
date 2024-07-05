import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { configMySQL } from './orm.config';
import { CadastrosModule } from './cadastros/cadastros.module';
import { FinanceiroModule } from './financeiro/financeiro.module';
import { EstoqueModule } from './estoque/estoque.module';
import { TributacaoModule } from './tributacao/tributacao.module';
import { VendasModule } from './vendas/vendas.module';
import { ComprasModule } from './compras/compras.module';
import { NfeModule } from './nfe/nfe.module';
import { AdministrativoModule } from './administrativo/administrativo.module';
import { ComissoesModule } from './comissoes/comissoes.module';
import { OsModule } from './os/os.module';
import { AfvModule } from './afv/afv.module';
import { SpedModule } from './sped/sped.module';
import { GedModule } from './ged/ged.module';
import { InventarioModule } from './inventario/inventario.module';
import { ViewsDBModule } from './views-db/views-db.module';
import { APP_INTERCEPTOR } from '@nestjs/core';
import { AppInterceptor } from './app.interceptor';
import { LoginModule } from './login/login.module';

@Module(
  {
    imports: [
      TypeOrmModule.forRoot(configMySQL),
      CadastrosModule,
      FinanceiroModule,
      EstoqueModule,
      TributacaoModule,
      VendasModule,
      ComprasModule,
      NfeModule,
      AdministrativoModule,
      ComissoesModule,
      OsModule,
      AfvModule,
      SpedModule,
      GedModule,
      InventarioModule,
      ViewsDBModule,
      LoginModule,
    ],
    controllers: [AppController],
    providers: [AppService],//, {
    //   provide: APP_INTERCEPTOR,
    //   useClass: AppInterceptor,
    // }],
  }
)
export class AppModule { 
  constructor(private dataSource: DataSource) {}
}