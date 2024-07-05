/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Lib T2Ti Sped Util
                                                                                
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
using System;

namespace T2Ti.Lib.Sped
{
    public class SpedUtil
    {
        public string delimitador { get; set; }
        public string crlf { get; set; } 

        public SpedUtil()
        {
            this.delimitador = "|";
            this.crlf = Environment.NewLine;
        }

        public string preenche(string valor)
        {
            return valor == null ? delimitador : delimitador + valor.Trim();
        }

        public string preenche(System.Nullable<System.DateTime> valor)
        {
            return valor == null ? delimitador : delimitador + string.Format("{0:yyyyMMdd}", valor);
        }

        public string preenche(int? valor)
        {
            return valor == null ? delimitador : delimitador + valor;
        }

        public string preenche(System.Nullable<System.Decimal> valor)
        {
            return valor == null ? delimitador : delimitador + string.Format("{0:0.00}", valor); ;
        }
    }
}
