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
    public class RegistroC460
    {
        public string codMod { get; set; } // Código do modelo do documento fiscal, conforme a Tabela 4.1.1
        public string codSit { get; set; } // Código da situação do documento fiscal, conforme a Tabela 4.1.2
        public string numDoc { get; set; } // Número do documento fiscal (COO)
        public System.Nullable<System.DateTime> dtDoc { get; set; } // Data da emissão do documento fiscal
        public System.Nullable<System.Decimal> vlDoc { get; set; } // Valor total do documento fiscal
        public System.Nullable<System.Decimal> vlPis { get; set; } // Valor do PIS
        public System.Nullable<System.Decimal> vlCofins { get; set; } // Valor da COFINS
        public string cpfCnpj { get; set; } // CPF ou CNPJ do adquirente
        public string nomAdq { get; set; } // Nome do adquirente
        public IList<RegistroC470> registroC470IList { get; set; } // BLOCO C - ILista de RegistroC110 (FILHO)

        public RegistroC460()
        {
            registroC470IList = new List<RegistroC470>();
        }
    }
}
