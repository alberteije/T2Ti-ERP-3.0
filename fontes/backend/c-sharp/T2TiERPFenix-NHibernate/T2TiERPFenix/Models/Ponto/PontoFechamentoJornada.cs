/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PONTO_FECHAMENTO_JORNADA] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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

namespace T2TiERPFenix.Models
{
    public class PontoFechamentoJornada
    {	
		public int Id { get; set; }

		public int? IdPontoClassificacaoJornada { get; set; }

		public int? IdColaborador { get; set; }

		public System.Nullable<System.DateTime> DataFechamento { get; set; }

		public string DiaSemana { get; set; }

		public string CodigoHorario { get; set; }

		public string CargaHorariaEsperada { get; set; }

		public string CargaHorariaDiurna { get; set; }

		public string CargaHorariaNoturna { get; set; }

		public string CargaHorariaTotal { get; set; }

		public string Entrada01 { get; set; }

		public string Saida01 { get; set; }

		public string Entrada02 { get; set; }

		public string Saida02 { get; set; }

		public string Entrada03 { get; set; }

		public string Saida03 { get; set; }

		public string Entrada04 { get; set; }

		public string Saida04 { get; set; }

		public string Entrada05 { get; set; }

		public string Saida05 { get; set; }

		public string HoraInicioJornada { get; set; }

		public string HoraFimJornada { get; set; }

		public string HoraExtra01 { get; set; }

		public System.Nullable<System.Decimal> PercentualHoraExtra01 { get; set; }

		public string ModalidadeHoraExtra01 { get; set; }

		public string HoraExtra02 { get; set; }

		public System.Nullable<System.Decimal> PercentualHoraExtra02 { get; set; }

		public string ModalidadeHoraExtra02 { get; set; }

		public string HoraExtra03 { get; set; }

		public System.Nullable<System.Decimal> PercentualHoraExtra03 { get; set; }

		public string ModalidadeHoraExtra03 { get; set; }

		public string HoraExtra04 { get; set; }

		public System.Nullable<System.Decimal> PercentualHoraExtra04 { get; set; }

		public string ModalidadeHoraExtra04 { get; set; }

		public string FaltaAtraso { get; set; }

		public string Compensar { get; set; }

		public string BancoHoras { get; set; }

		public string Observacao { get; set; }

    }
}
