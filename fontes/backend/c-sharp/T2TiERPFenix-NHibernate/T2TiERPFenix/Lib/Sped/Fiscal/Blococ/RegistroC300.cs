/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Model relacionado ao SPED Fiscal

The MIT License

Copyright: Copyright (C) 2020 T2Ti.COM

* 
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
* 
* The author may be contacted at: t2ti.com@gmail.com
*
@author Albert Eije (alberteije@gmail.com)
@version 1.0.0
*******************************************************************************/
using System.Collections.Generic;

namespace T2Ti.Lib.Sped.Fiscal
{
    public class RegistroC300
    {
        public string codMod { get; set; } // Código do modelo do documento fiscal, conforme a Tabela 4.1.1
        public string ser { get; set; } // Série do documento fiscal
        public string sub { get; set; } // Subsérie do documento fiscal
        public string numDocIni { get; set; } // Número do documento fiscal inicial
        public string numDocFin { get; set; } // Número do documento fiscal final
        public System.Nullable<System.DateTime> dtDoc { get; set; } // Data da emissão dos documentos fiscais
        public System.Nullable<System.Decimal> vlDoc { get; set; } // Valor total dos documentos
        public System.Nullable<System.Decimal> vlPis { get; set; } // Valor total do PIS
        public System.Nullable<System.Decimal> vlCofins { get; set; } // Valor total da COFINS
        public string codCta { get; set; } // Código da conta analítica contábil debitada/creditada
        public IList<RegistroC310> registroC310IList;
        public IList<RegistroC320> registroC320IList;

        public RegistroC300()
        {
            registroC310IList = new List<RegistroC310>();
            registroC320IList = new List<RegistroC320>();
        }
    }
}
