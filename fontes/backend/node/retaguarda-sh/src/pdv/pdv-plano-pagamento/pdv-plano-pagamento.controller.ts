/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PDV_PLANO_PAGAMENTO] 
                                                                                
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
import { Controller, Get, Post, Req, Res } from '@nestjs/common';
import { Crud, CrudController } from '@nestjsx/crud';
import { PdvPlanoPagamentoService } from './pdv-plano-pagamento.service';
import { PdvPlanoPagamento } from './pdv-plano-pagamento.entity';
import { Request, Response } from 'express';
import { Biblioteca } from '../../util/biblioteca';
import { ObjetoPagSeguro } from '../../util/objeto.pagseguro';

@Crud({
  model: {
    type: PdvPlanoPagamento,
  },
  query: {
    join: {
    },
  },
})
@Controller('pdv-plano-pagamento')
export class PdvPlanoPagamentoController implements CrudController<PdvPlanoPagamento> {
  constructor(public service: PdvPlanoPagamentoService) { }

  @Get('consulta-plano')
	async consultarPlanoAtivo(
    @Req() request: Request, 
    @Res() response: Response
  ) {
    const cnpj = Biblioteca.decifrar(request.headers['cnpj'] as string);
    const pdvPlanoPagamento = await this.service.consultarPlanoAtivo(cnpj);

    if (pdvPlanoPagamento == null) {
      response.status(404);
      response.send('Registro não localizado [Consultar Objeto PdvPlanoPagamento]');    
    } else {
      const retorno = Biblioteca.cifrar(JSON.stringify(pdvPlanoPagamento));

      response.setHeader('Content-Type', 'application/json');
      response.status(200);
      response.send(retorno);    
    }
  }  

	@Post('insere-plano')
	async inserirPlano(
    @Req() request: Request, 
    @Res() response: Response
  ) {
    const corpoRequisicao = Biblioteca.decifrar(request.body);
    const objetoPagSeguro = new ObjetoPagSeguro(JSON.parse(corpoRequisicao));
		const pdvPlanoPagamento = await this.service.atualizar(objetoPagSeguro);

    const retorno = Biblioteca.cifrar(JSON.stringify(pdvPlanoPagamento));

    response.setHeader('Content-Type', 'application/json');
    response.status(200);
		response.send(retorno);
	}


	@Post('confirma-transacao')
	async confirmarTransacao(
    @Req() request: Request,
    @Res() response: Response,
  ) {
    const cnpj = Biblioteca.decifrar(request.headers['cnpj'] as string);
    const codigo = Biblioteca.decifrar(request.headers['codigo'] as string);
    const retorno = await this.service.confirmarTransacao(codigo, cnpj);

    /*
    Vamos usar os códigos HTTP para nossa conveniência:
    200 - achou a transação e vinculou o ID da empresa
    404 - não achou o código da transação no banco de dados
    418 - achou o código da transação, mas ele já foi utilizado
    */

    response.setHeader('Content-Type', 'application/json');
    response.status(retorno);
		response.send(retorno);
	}  

}