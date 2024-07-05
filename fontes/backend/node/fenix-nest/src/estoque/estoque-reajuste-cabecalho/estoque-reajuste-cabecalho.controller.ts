/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
import { Controller, Delete, HttpStatus, Param, Post, Put, Req, Res } from '@nestjs/common';
import { Crud, CrudController } from '@nestjsx/crud';
import { EstoqueReajusteCabecalhoService } from './estoque-reajuste-cabecalho.service';
import { EstoqueReajusteCabecalho } from './estoque-reajuste-cabecalho.entity';
import { Request, Response } from 'express';

@Crud({
  model: {
    type: EstoqueReajusteCabecalho,
  },
  query: {
    join: {
		colaborador: { eager: true },
		"colaborador.pessoa": { eager: true },
		listaEstoqueReajusteDetalhe: { eager: true },
		"colaborador.viewPessoaColaborador": { eager: true },
		"listaEstoqueReajusteDetalhe.produto": { eager: true },
    },
  },
})
@Controller('estoque-reajuste-cabecalho')
export class EstoqueReajusteCabecalhoController implements CrudController<EstoqueReajusteCabecalho> {
  constructor(public service: EstoqueReajusteCabecalhoService) { }

	@Post()
	async inserir(@Req() request: Request) {
		let objetoJson = request.body;
		let estoqueReajusteCabecalho = new EstoqueReajusteCabecalho(objetoJson);
		const retorno = await this.service.persistir(estoqueReajusteCabecalho, 'I');
		return retorno;
	}

	@Put(':id')
	async alterar(@Param('id') id: number, @Req() request: Request) {
		let objetoJson = request.body;
		let estoqueReajusteCabecalho = new EstoqueReajusteCabecalho(objetoJson);
		const retorno = await this.service.persistir(estoqueReajusteCabecalho, 'A');
		return retorno;
	}

	@Delete(':id')
	async excluir(@Param('id') id: number) {
		return this.service.excluirMestreDetalhe(id);
	}
  
	@Post('forma-preco')
	async formarPreco(@Req() request: Request, @Res() response: Response,) {
		let objetoJson = request.body;
		let estoqueReajusteCabecalho = new EstoqueReajusteCabecalho(objetoJson);
		await this.service.formarPreco(estoqueReajusteCabecalho);
		return response.status(HttpStatus.OK).json({ response: "Formação de Preços Realizada com Sucesso." });
	}

}