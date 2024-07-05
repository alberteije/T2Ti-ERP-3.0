/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Modules relacionados ao módulo Contabilidade
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2022 T2Ti.COM                                          
                                                                                
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
import { CentroResultadoModule } from '../contabilidade/centro-resultado/centro-resultado.module';
import { ContabilContaModule } from '../contabilidade/contabil-conta/contabil-conta.module';
import { ContabilDreCabecalhoModule } from '../contabilidade/contabil-dre-cabecalho/contabil-dre-cabecalho.module';
import { ContabilEncerramentoExeCabModule } from '../contabilidade/contabil-encerramento-exe-cab/contabil-encerramento-exe-cab.module';
import { ContabilIndiceModule } from '../contabilidade/contabil-indice/contabil-indice.module';
import { ContabilLancamentoCabecalhoModule } from '../contabilidade/contabil-lancamento-cabecalho/contabil-lancamento-cabecalho.module';
import { ContabilLancamentoOrcadoModule } from '../contabilidade/contabil-lancamento-orcado/contabil-lancamento-orcado.module';
import { ContabilLancamentoPadraoModule } from '../contabilidade/contabil-lancamento-padrao/contabil-lancamento-padrao.module';
import { ContabilLivroModule } from '../contabilidade/contabil-livro/contabil-livro.module';
import { ContabilLoteModule } from '../contabilidade/contabil-lote/contabil-lote.module';
import { ContabilParametroModule } from '../contabilidade/contabil-parametro/contabil-parametro.module';
import { ContabilTermoModule } from '../contabilidade/contabil-termo/contabil-termo.module';
import { PlanoCentroResultadoModule } from '../contabilidade/plano-centro-resultado/plano-centro-resultado.module';
import { PlanoContaModule } from '../contabilidade/plano-conta/plano-conta.module';
import { PlanoContaRefSpedModule } from '../contabilidade/plano-conta-ref-sped/plano-conta-ref-sped.module';
import { RegistroCartorioModule } from '../contabilidade/registro-cartorio/registro-cartorio.module';

@Module({
    imports: [
		CentroResultadoModule,
		ContabilContaModule,
		ContabilDreCabecalhoModule,
		ContabilEncerramentoExeCabModule,
		ContabilIndiceModule,
		ContabilLancamentoCabecalhoModule,
		ContabilLancamentoOrcadoModule,
		ContabilLancamentoPadraoModule,
		ContabilLivroModule,
		ContabilLoteModule,
		ContabilParametroModule,
		ContabilTermoModule,
		PlanoCentroResultadoModule,
		PlanoContaModule,
		PlanoContaRefSpedModule,
		RegistroCartorioModule,
    ],
})
export class ContabilidadeModule { }
