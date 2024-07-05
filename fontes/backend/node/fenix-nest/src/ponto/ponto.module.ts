/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Modules relacionados ao módulo Ponto Eletrônico
                                                                                
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
import { PontoAbonoModule } from '../ponto/ponto-abono/ponto-abono.module';
import { PontoAbonoUtilizacaoModule } from '../ponto/ponto-abono-utilizacao/ponto-abono-utilizacao.module';
import { PontoBancoHorasModule } from '../ponto/ponto-banco-horas/ponto-banco-horas.module';
import { PontoBancoHorasUtilizacaoModule } from '../ponto/ponto-banco-horas-utilizacao/ponto-banco-horas-utilizacao.module';
import { PontoClassificacaoJornadaModule } from '../ponto/ponto-classificacao-jornada/ponto-classificacao-jornada.module';
import { PontoEscalaModule } from '../ponto/ponto-escala/ponto-escala.module';
import { PontoFechamentoJornadaModule } from '../ponto/ponto-fechamento-jornada/ponto-fechamento-jornada.module';
import { PontoHorarioModule } from '../ponto/ponto-horario/ponto-horario.module';
import { PontoHorarioAutorizadoModule } from '../ponto/ponto-horario-autorizado/ponto-horario-autorizado.module';
import { PontoMarcacaoModule } from '../ponto/ponto-marcacao/ponto-marcacao.module';
import { PontoParametroModule } from '../ponto/ponto-parametro/ponto-parametro.module';
import { PontoRelogioModule } from '../ponto/ponto-relogio/ponto-relogio.module';
import { PontoTurmaModule } from '../ponto/ponto-turma/ponto-turma.module';


@Module({
    imports: [
		PontoAbonoModule,
		PontoAbonoUtilizacaoModule,
		PontoBancoHorasModule,
		PontoBancoHorasUtilizacaoModule,
		PontoClassificacaoJornadaModule,
		PontoEscalaModule,
		PontoFechamentoJornadaModule,
		PontoHorarioModule,
		PontoHorarioAutorizadoModule,
		PontoMarcacaoModule,
		PontoParametroModule,
		PontoRelogioModule,
		PontoTurmaModule,
    ],
})
export class PontoModule { }
