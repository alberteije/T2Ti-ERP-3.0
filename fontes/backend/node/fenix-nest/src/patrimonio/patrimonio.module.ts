/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Modules relacionados ao módulo Controle Patrimonial
                                                                                
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
import { PatrimApoliceSeguroModule } from '../patrimonio/patrim-apolice-seguro/patrim-apolice-seguro.module';
import { PatrimBemModule } from '../patrimonio/patrim-bem/patrim-bem.module';
import { PatrimDepreciacaoBemModule } from '../patrimonio/patrim-depreciacao-bem/patrim-depreciacao-bem.module';
import { PatrimDocumentoBemModule } from '../patrimonio/patrim-documento-bem/patrim-documento-bem.module';
import { PatrimEstadoConservacaoModule } from '../patrimonio/patrim-estado-conservacao/patrim-estado-conservacao.module';
import { PatrimGrupoBemModule } from '../patrimonio/patrim-grupo-bem/patrim-grupo-bem.module';
import { PatrimIndiceAtualizacaoModule } from '../patrimonio/patrim-indice-atualizacao/patrim-indice-atualizacao.module';
import { PatrimMovimentacaoBemModule } from '../patrimonio/patrim-movimentacao-bem/patrim-movimentacao-bem.module';
import { PatrimTaxaDepreciacaoModule } from '../patrimonio/patrim-taxa-depreciacao/patrim-taxa-depreciacao.module';
import { PatrimTipoAquisicaoBemModule } from '../patrimonio/patrim-tipo-aquisicao-bem/patrim-tipo-aquisicao-bem.module';
import { PatrimTipoMovimentacaoModule } from '../patrimonio/patrim-tipo-movimentacao/patrim-tipo-movimentacao.module';
import { SeguradoraModule } from '../patrimonio/seguradora/seguradora.module';

@Module({
    imports: [
		PatrimApoliceSeguroModule,
		PatrimBemModule,
		PatrimDepreciacaoBemModule,
		PatrimDocumentoBemModule,
		PatrimEstadoConservacaoModule,
		PatrimGrupoBemModule,
		PatrimIndiceAtualizacaoModule,
		PatrimMovimentacaoBemModule,
		PatrimTaxaDepreciacaoModule,
		PatrimTipoAquisicaoBemModule,
		PatrimTipoMovimentacaoModule,
		SeguradoraModule,
    ],
})
export class PatrimonioModule { }
