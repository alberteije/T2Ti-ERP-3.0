/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CTE_CABECALHO] 
                                                                                
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
import { Controller, Delete, Param, Post, Put, Req } from '@nestjs/common';
import { Crud, CrudController } from '@nestjsx/crud';
import { CteCabecalhoService } from './cte-cabecalho.service';
import { CteCabecalho } from './cte-cabecalho.entity';
import { Request } from 'express';

@Crud({
  model: {
    type: CteCabecalho,
  },
  query: {
    join: {
		cteDestinatario: { eager: true },
		cteLocalEntrega: { eager: true },
		cteRemetente: { eager: true },
		cteRodoviario: { eager: true },
		cteTomador: { eager: true },
		listaCteCarga: { eager: true },
    },
  },
})
@Controller('cte-cabecalho')
export class CteCabecalhoController implements CrudController<CteCabecalho> {
  constructor(public service: CteCabecalhoService) { }

	@Post()
	async inserir(@Req() request: Request) {
		let objetoJson = request.body;
		let cteCabecalho = new CteCabecalho(objetoJson);
		const retorno = await this.service.persistir(cteCabecalho, 'I');
		return retorno;
	}

	@Put(':id')
	async alterar(@Param('id') id: number, @Req() request: Request) {
		let objetoJson = request.body;
		let cteCabecalho = new CteCabecalho(objetoJson);
		const retorno = await this.service.persistir(cteCabecalho, 'A');
		return retorno;
	}

	@Delete(':id')
	async excluir(@Param('id') id: number) {
		return this.service.excluirMestreDetalhe(id);
	}
  


}