/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
import { Controller, Delete, Get, Header, HttpCode, Param, Post, Put, Req } from '@nestjs/common';
import { Crud, CrudController } from '@nestjsx/crud';
import { TributConfiguraOfGtService } from './tribut-configura-of-gt.service';
import { TributConfiguraOfGt } from './tribut-configura-of-gt.entity';
import { Request } from 'express';

@Crud({
  model: {
    type: TributConfiguraOfGt,
  },
  query: {
    join: {
		tributCofins: { eager: true },
		tributIpi: { eager: true },
		tributPis: { eager: true },
		tributGrupoTributario: { eager: true },
		tributOperacaoFiscal: { eager: true },
		listaTributIcmsUf: { eager: true },
    },
  },
})
@Controller('tribut-configura-of-gt')
export class TributConfiguraOfGtController implements CrudController<TributConfiguraOfGt> {
  constructor(public service: TributConfiguraOfGtService) { }

	@Post()
	async inserir(@Req() request: Request) {
		let objetoJson = request.body;
		let tributConfiguraOfGt = new TributConfiguraOfGt(objetoJson);
		const retorno = await this.service.persistir(tributConfiguraOfGt, 'I');
		return retorno;
	}

	@Put(':id')
	async alterar(@Param('id') id: number, @Req() request: Request) {
		let objetoJson = request.body;
		let tributConfiguraOfGt = new TributConfiguraOfGt(objetoJson);
		const retorno = await this.service.persistir(tributConfiguraOfGt, 'A');
		return retorno;
	}

	@Delete(':id')
	async excluir(@Param('id') id: number) {
		return this.service.excluirMestreDetalhe(id);
	}
  
	@HttpCode(200)
	@Get('consulta-tributacao')
	@Header('Content-Type', 'application/json')
	async consultarTributacao(@Req() request: Request) {
		// const idTributGrupoTributario = '1';
		// const idTributOperacaoFiscal = '2';
		
		const idTributGrupoTributario = request.headers['idtributgrupotributario'] as string;
		const idTributOperacaoFiscal = request.headers['idtributoperacaofiscal'] as string;

		const retorno = await this.service.consultarTributacao(idTributGrupoTributario, idTributOperacaoFiscal);

		return retorno;
	}

}