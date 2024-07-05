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
    public class RegistroC350
    {
        public string ser { get; set; } // Série do documento fiscal
        public string subSer { get; set; } // Subsérie do documento fiscal
        public string numDoc { get; set; } // Número do documento fiscal
        public System.Nullable<System.DateTime> dtDoc { get; set; } // Data da emissão do documento fiscal
        public string cnpjCpf { get; set; } // CNPJ ou CPF do destinatário
        public System.Nullable<System.Decimal> vlMerc { get; set; } // Valor das mercadorias constantes no documento fiscal
        public System.Nullable<System.Decimal> vlDoc { get; set; } // Valor total do documento fiscal
        public System.Nullable<System.Decimal> vlDesc { get; set; } // Valor total do desconto
        public System.Nullable<System.Decimal> vlPis { get; set; } // Valor total do PIS
        public System.Nullable<System.Decimal> vlCofins { get; set; } // Valor total da COFINS
        public string codCta { get; set; } // Código da conta analítica contábil debitada/creditada
        public IList<RegistroC370> registroC370IList { get; set; } // BLOCO C - ILista de RegistroC370 (FILHO)
        public IList<RegistroC390> registroC390IList { get; set; } // BLOCO C - ILista de RegistroC390 (FILHO)

        public RegistroC350()
        {
            registroC370IList = new List<RegistroC370>();
            registroC390IList = new List<RegistroC390>();
        }
    }
}
