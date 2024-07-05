/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Modules relacionados ao módulo Gestão de Contratos
                                                                                
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
import { ContratoModule } from '../contratos/contrato/contrato.module';
import { ContratoHistFaturamentoModule } from '../contratos/contrato-hist-faturamento/contrato-hist-faturamento.module';
import { ContratoHistoricoReajusteModule } from '../contratos/contrato-historico-reajuste/contrato-historico-reajuste.module';
import { ContratoPrevFaturamentoModule } from '../contratos/contrato-prev-faturamento/contrato-prev-faturamento.module';
import { ContratoSolicitacaoServicoModule } from '../contratos/contrato-solicitacao-servico/contrato-solicitacao-servico.module';
import { ContratoTemplateModule } from '../contratos/contrato-template/contrato-template.module';
import { ContratoTipoServicoModule } from '../contratos/contrato-tipo-servico/contrato-tipo-servico.module';
import { TipoContratoModule } from '../contratos/tipo-contrato/tipo-contrato.module';


@Module({
    imports: [
		ContratoModule,
		ContratoHistFaturamentoModule,
		ContratoHistoricoReajusteModule,
		ContratoPrevFaturamentoModule,
		ContratoSolicitacaoServicoModule,
		ContratoTemplateModule,
		ContratoTipoServicoModule,
		TipoContratoModule,
    ],
})
export class ContratosModule { }
