/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_PARAMETRO] 
                                                                                
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
    public class ContabilParametro
    {	
		public int Id { get; set; }

		public string Mascara { get; set; }

		public int? Niveis { get; set; }

		public string InformarContaPor { get; set; }

		public string CompartilhaPlanoConta { get; set; }

		public string CompartilhaHistoricos { get; set; }

		public string AlteraLancamentoOutro { get; set; }

		public string HistoricoObrigatorio { get; set; }

		public string PermiteLancamentoZerado { get; set; }

		public string GeraInformativoSped { get; set; }

		public string SpedFormaEscritDiario { get; set; }

		public string SpedNomeLivroDiario { get; set; }

		public string AssinaturaDireita { get; set; }

		public string AssinaturaEsquerda { get; set; }

		public string ContaAtivo { get; set; }

		public string ContaPassivo { get; set; }

		public string ContaPatrimonioLiquido { get; set; }

		public string ContaDepreciacaoAcumulada { get; set; }

		public string ContaCapitalSocial { get; set; }

		public string ContaResultadoExercicio { get; set; }

		public string ContaPrejuizoAcumulado { get; set; }

		public string ContaLucroAcumulado { get; set; }

		public string ContaTituloPagar { get; set; }

		public string ContaTituloReceber { get; set; }

		public string ContaJurosPassivo { get; set; }

		public string ContaJurosAtivo { get; set; }

		public string ContaDescontoObtido { get; set; }

		public string ContaDescontoConcedido { get; set; }

		public string ContaCmv { get; set; }

		public string ContaVenda { get; set; }

		public string ContaVendaServico { get; set; }

		public string ContaEstoque { get; set; }

		public string ContaApuraResultado { get; set; }

		public string ContaJurosApropriar { get; set; }

		public int? IdHistPadraoResultado { get; set; }

		public int? IdHistPadraoLucro { get; set; }

		public int? IdHistPadraoPrejuizo { get; set; }

    }
}
