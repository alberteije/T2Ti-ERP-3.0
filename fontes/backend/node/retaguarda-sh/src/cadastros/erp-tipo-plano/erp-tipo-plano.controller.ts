import { Controller } from '@nestjs/common';
import { Crud, CrudController } from '@nestjsx/crud';
import { ErpTipoPlanoService } from './erp-tipo-plano.service';
import { ErpTipoPlanoModel } from './erp-tipo-plano.entity';

@Crud({
  model: {
    type: ErpTipoPlanoModel,
  },
  query: {
    join: {
    },
  },
})
@Controller('erp-tipo-plano')
export class ErpTipoPlanoController implements CrudController<ErpTipoPlanoModel> {
  constructor(public service: ErpTipoPlanoService) { }

  


}


















