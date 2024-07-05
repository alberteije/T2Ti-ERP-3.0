/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Modules relacionados ao módulo PCP
                                                                                
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
import { PcpInstrucaoModule } from '../pcp/pcp-instrucao/pcp-instrucao.module';
import { PcpInstrucaoOpModule } from '../pcp/pcp-instrucao-op/pcp-instrucao-op.module';
import { PcpOpCabecalhoModule } from '../pcp/pcp-op-cabecalho/pcp-op-cabecalho.module';
import { PcpServicoModule } from '../pcp/pcp-servico/pcp-servico.module';
import { PcpServicoColaboradorModule } from '../pcp/pcp-servico-colaborador/pcp-servico-colaborador.module';
import { PcpServicoEquipamentoModule } from '../pcp/pcp-servico-equipamento/pcp-servico-equipamento.module';


@Module({
    imports: [
		PcpInstrucaoModule,
		PcpInstrucaoOpModule,
		PcpOpCabecalhoModule,
		PcpServicoModule,
		PcpServicoColaboradorModule,
		PcpServicoEquipamentoModule,
    ],
})
export class PcpModule { }
