/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Modules relacionados ao módulo Escrita Fiscal
                                                                                
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
import { FiscalApuracaoIcmsModule } from '../fiscal/fiscal-apuracao-icms/fiscal-apuracao-icms.module';
import { FiscalEstadualPorteModule } from '../fiscal/fiscal-estadual-porte/fiscal-estadual-porte.module';
import { FiscalEstadualRegimeModule } from '../fiscal/fiscal-estadual-regime/fiscal-estadual-regime.module';
import { FiscalInscricoesSubstitutasModule } from '../fiscal/fiscal-inscricoes-substitutas/fiscal-inscricoes-substitutas.module';
import { FiscalLivroModule } from '../fiscal/fiscal-livro/fiscal-livro.module';
import { FiscalMunicipalRegimeModule } from '../fiscal/fiscal-municipal-regime/fiscal-municipal-regime.module';
import { FiscalNotaFiscalEntradaModule } from '../fiscal/fiscal-nota-fiscal-entrada/fiscal-nota-fiscal-entrada.module';
import { FiscalNotaFiscalSaidaModule } from '../fiscal/fiscal-nota-fiscal-saida/fiscal-nota-fiscal-saida.module';
import { FiscalParametroModule } from '../fiscal/fiscal-parametro/fiscal-parametro.module';
import { FiscalTermoModule } from '../fiscal/fiscal-termo/fiscal-termo.module';
import { SimplesNacionalCabecalhoModule } from '../fiscal/simples-nacional-cabecalho/simples-nacional-cabecalho.module';

@Module({
    imports: [
		FiscalApuracaoIcmsModule,
		FiscalEstadualPorteModule,
		FiscalEstadualRegimeModule,
		FiscalInscricoesSubstitutasModule,
		FiscalLivroModule,
		FiscalMunicipalRegimeModule,
		FiscalNotaFiscalEntradaModule,
		FiscalNotaFiscalSaidaModule,
		FiscalParametroModule,
		FiscalTermoModule,
		SimplesNacionalCabecalhoModule,
    ],
})
export class FiscalModule { }
