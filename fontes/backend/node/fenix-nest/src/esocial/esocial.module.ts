/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Modules relacionados ao módulo eSocial
                                                                                
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
import { EsocialClassificacaoTributModule } from '../esocial/esocial-classificacao-tribut/esocial-classificacao-tribut.module';
import { EsocialMotivoDesligamentoModule } from '../esocial/esocial-motivo-desligamento/esocial-motivo-desligamento.module';
import { EsocialNaturezaJuridicaModule } from '../esocial/esocial-natureza-juridica/esocial-natureza-juridica.module';
import { EsocialRubricaModule } from '../esocial/esocial-rubrica/esocial-rubrica.module';
import { EsocialTipoAfastamentoModule } from '../esocial/esocial-tipo-afastamento/esocial-tipo-afastamento.module';

@Module({
    imports: [
		EsocialClassificacaoTributModule,
		EsocialMotivoDesligamentoModule,
		EsocialNaturezaJuridicaModule,
		EsocialRubricaModule,
		EsocialTipoAfastamentoModule,
    ],
})
export class EsocialModule { }
