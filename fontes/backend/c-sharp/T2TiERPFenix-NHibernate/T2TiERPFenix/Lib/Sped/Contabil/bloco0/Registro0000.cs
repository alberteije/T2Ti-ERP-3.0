/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [BANCO] 
                                                                                
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

namespace T2Ti.Lib.Sped.Contabil
{

    public class Registro0000
    {

        public System.Nullable<System.DateTime> dtIni { get; set; } /// Data inicial das informações contidas no arquivo
        public System.Nullable<System.DateTime> dtFin { get; set; } /// Data final das informações contidas no arquivo
        public string nome { get; set; } /// Nome empresarial do empresário ou sociedade empresária.
        public string cnpj { get; set; } /// Número de inscrição do empresário ou sociedade empresária no CNPJ.
        public string uf { get; set; } /// Sigla da unidade da federação do empresário ou sociedade empresária.
        public string ie { get; set; } /// Inscrição Estadual do empresário ou sociedade empresária.
        public int codMun { get; set; } /// Código do município do domicílio fiscal do empresário ou sociedade empresária, conforme tabela do IBGE - Instituto Brasileiro de Geografia e Estatística.
        public string im { get; set; } /// Inscrição Municipal do empresário ou sociedade empresária.
        public string indSitEsp { get; set; } /// Indicador de situação especial (conforme tabela publicada pelo Sped).

    }
}