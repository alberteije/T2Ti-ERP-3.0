/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [EMPRESA] 
                                                                                
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
import { Controller, Get, Param, Post, Req, Res } from '@nestjs/common';
import { Crud, CrudController } from '@nestjsx/crud';
import { Request, Response } from 'express';
import { EmpresaService } from './empresa.service';
import { Empresa } from './empresa.entity';
import { EmpresaModel } from './empresa.model.entity';
import { Biblioteca } from '../../util/biblioteca';

@Crud({
  model: {
    // type: Empresa, // TODO: Para usar o PDV, descomente essa linha e comente a de baixo
    type: EmpresaModel,
  },
  query: {
    join: {
			admModuloModelList: { eager: true }, // para usar o PDV, comente essa linha
    },
  },
})
@Controller('empresa')
export class EmpresaController implements CrudController<Empresa> {
  constructor(public service: EmpresaService) { }

	@Post()
	async atualizar(
    @Req() request: Request,
    @Res() response: Response,
  ) {
    const corpoRequisicao = Biblioteca.decifrar(request.body);
    let empresa = new Empresa(JSON.parse(corpoRequisicao));
		empresa = await this.service.atualizar(empresa);		

    const retorno = Biblioteca.cifrar(JSON.stringify(empresa));

    response.setHeader('Content-Type', 'application/json');
    response.status(200);
		response.send(retorno);
	}

	@Post('registra-empresa')
	async registrarEmpresa(
    @Req() request: Request,
    @Res() response: Response,
  ) {
    const corpoRequisicao = Biblioteca.decifrar(request.body);
    let empresa = new Empresa(JSON.parse(corpoRequisicao));
    empresa = await this.service.registrar(empresa);		

    const retorno = Biblioteca.cifrar(JSON.stringify(empresa));

    response.setHeader('Content-Type', 'application/json');
    response.status(200);
		response.send(retorno);    
	}   

	@Post('registra-empresa-erp')
	async registrarEmpresaErp(
    @Req() request: Request,
    @Res() response: Response,
  ) {
    const corpoRequisicao = Biblioteca.decifrar(request.body);
    let empresa = new Empresa(JSON.parse(corpoRequisicao));
    empresa = await this.service.registrarEmpresaErp(empresa);		

    response.setHeader('Content-Type', 'application/json');
    response.status(200);
		response.send(empresa);    
	}   

	@Post('envia-email-confirmacao')
	async enviarEmailConfirmacao(
    @Req() request: Request,
    @Res() response: Response,
  ) {
    const corpoRequisicao = Biblioteca.decifrar(request.body);
    let empresa = new Empresa(JSON.parse(corpoRequisicao));
    empresa = await this.service.enviarEmailConfirmacao(empresa);		

    const retorno = Biblioteca.cifrar(JSON.stringify(empresa));

    response.setHeader('Content-Type', 'application/json');
    response.status(200);
		response.send(retorno);    
	}     

	@Post('confere-codigo-confirmacao')
	async conferirCodigoConfirmacao(
    @Req() request: Request,
    @Res() response: Response,
  ) {
    const corpoRequisicao = Biblioteca.decifrar(request.body);
    let empresa = new Empresa(JSON.parse(corpoRequisicao));
    const codigoConfirmacao = Biblioteca.decifrar(request.headers['codigo-confirmacao'] as string);

    empresa = await this.service.conferirCodigoConfirmacao(empresa, codigoConfirmacao);		

    const retorno = Biblioteca.cifrar(JSON.stringify(empresa));

    response.setHeader('Content-Type', 'application/json');
    response.status(200);
		response.send(retorno);
  }
 
  @Get('cnpj/:cnpj')
	async getEmpresaPorCnpj(
    @Req() request: Request, 
    @Res() response: Response,
    @Param('cnpj') cnpj
  ) {
    const empresa = await this.service.getEmpresaPorCnpj(cnpj);
    
    if (empresa == null) {
      response.status(404);
      response.send('Registro não localizado [Consultar Objeto PdvPlanoPagamento]');    
    } else {
      response.setHeader('Content-Type', 'application/json');
      response.status(200);
      response.send(empresa);    
    }
  }  

}