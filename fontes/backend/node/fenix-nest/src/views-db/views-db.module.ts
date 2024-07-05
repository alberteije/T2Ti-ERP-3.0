/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Modules relacionados ao bloco Financeiro
                                                                                
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
import { Module } from '@nestjs/common';
import { ViewPessoaColaboradorModule } from '../views-db/view-pessoa-colaborador/view-pessoa-colaborador.module';
import { ViewPessoaClienteModule } from '../views-db/view-pessoa-cliente/view-pessoa-cliente.module';
import { ViewPessoaFornecedorModule } from '../views-db/view-pessoa-fornecedor/view-pessoa-fornecedor.module';
import { ViewPessoaVendedorModule } from '../views-db/view-pessoa-vendedor/view-pessoa-vendedor.module';
import { ViewPessoaTransportadoraModule } from '../views-db/view-pessoa-transportadora/view-pessoa-transportadora.module';
import { ViewFinLancamentoPagarModule } from '../views-db/view-fin-lancamento-pagar/view-fin-lancamento-pagar.module';
import { ViewFinLancamentoReceberModule } from '../views-db/view-fin-lancamento-receber/view-fin-lancamento-receber.module';
import { ViewFinChequeNaoCompensadoModule } from '../views-db/view-fin-cheque-nao-compensado/view-fin-cheque-nao-compensado.module';
import { ViewFinFluxoCaixaModule } from '../views-db/view-fin-fluxo-caixa/view-fin-fluxo-caixa.module';
import { ViewFinMovimentoCaixaBancoModule } from '../views-db/view-fin-movimento-caixa-banco/view-fin-movimento-caixa-banco.module';

@Module({
    imports: [
		ViewPessoaColaboradorModule,
		ViewPessoaClienteModule,
		ViewPessoaFornecedorModule,
		ViewPessoaVendedorModule,
		ViewPessoaTransportadoraModule,
		ViewFinLancamentoPagarModule,
		ViewFinLancamentoReceberModule,
		ViewFinChequeNaoCompensadoModule,
		ViewFinFluxoCaixaModule,
		ViewFinMovimentoCaixaBancoModule,
    ],
})
export class ViewsDBModule { }
