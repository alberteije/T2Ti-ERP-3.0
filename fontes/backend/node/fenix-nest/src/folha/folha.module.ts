/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Modules relacionados ao módulo Folha de Pagamento
                                                                                
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
import { FolhaAfastamentoModule } from '../folha/folha-afastamento/folha-afastamento.module';
import { FolhaEventoModule } from '../folha/folha-evento/folha-evento.module';
import { FolhaFechamentoModule } from '../folha/folha-fechamento/folha-fechamento.module';
import { FolhaFeriasColetivasModule } from '../folha/folha-ferias-coletivas/folha-ferias-coletivas.module';
import { FolhaHistoricoSalarialModule } from '../folha/folha-historico-salarial/folha-historico-salarial.module';
import { FolhaInssModule } from '../folha/folha-inss/folha-inss.module';
import { FolhaInssRetencaoModule } from '../folha/folha-inss-retencao/folha-inss-retencao.module';
import { FolhaInssServicoModule } from '../folha/folha-inss-servico/folha-inss-servico.module';
import { FolhaLancamentoCabecalhoModule } from '../folha/folha-lancamento-cabecalho/folha-lancamento-cabecalho.module';
import { FolhaLancamentoComissaoModule } from '../folha/folha-lancamento-comissao/folha-lancamento-comissao.module';
import { FolhaParametroModule } from '../folha/folha-parametro/folha-parametro.module';
import { FolhaPlanoSaudeModule } from '../folha/folha-plano-saude/folha-plano-saude.module';
import { FolhaPppModule } from '../folha/folha-ppp/folha-ppp.module';
import { FolhaRescisaoModule } from '../folha/folha-rescisao/folha-rescisao.module';
import { FolhaTipoAfastamentoModule } from '../folha/folha-tipo-afastamento/folha-tipo-afastamento.module';
import { FolhaValeTransporteModule } from '../folha/folha-vale-transporte/folha-vale-transporte.module';


@Module({
    imports: [
		FolhaAfastamentoModule,
		FolhaEventoModule,
		FolhaFechamentoModule,
		FolhaFeriasColetivasModule,
		FolhaHistoricoSalarialModule,
		FolhaInssModule,
		FolhaInssRetencaoModule,
		FolhaInssServicoModule,
		FolhaLancamentoCabecalhoModule,
		FolhaLancamentoComissaoModule,
		FolhaParametroModule,
		FolhaPlanoSaudeModule,
		FolhaPppModule,
		FolhaRescisaoModule,
		FolhaTipoAfastamentoModule,
		FolhaValeTransporteModule,
    ],
})
export class FiscalModule { }
