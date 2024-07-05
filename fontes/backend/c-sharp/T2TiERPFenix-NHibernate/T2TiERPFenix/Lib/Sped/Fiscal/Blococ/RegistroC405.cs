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
    public class RegistroC405
    {
        public System.Nullable<System.DateTime> dtDoc { get; set; } // Data do movimento a que se refere a Redução Z
        public int cro { get; set; } // Posição do Contador de Reinício de Operação
        public int crz { get; set; } // Posição do Contador de Redução Z
        public int numCooFin { get; set; } // Número do Contador de Ordem de Operação do último documento emitido no dia. (Número do COO na Redução Z)
        public System.Nullable<System.Decimal> gtFin { get; set; } // Valor do Grande Total final
        public System.Nullable<System.Decimal> vlBrt { get; set; } // Valor da venda bruta
        public IList<RegistroC420> registroC420IList { get; set; } // BLOCO C - ILista de RegistroC420 (FILHO)
        public IList<RegistroC460> registroC460IList { get; set; } // BLOCO C - ILista de RegistroC460 (FILHO)
        public IList<RegistroC490> registroC490IList { get; set; } // BLOCO C - ILista de RegistroC490 (FILHO)

        public RegistroC405()
        {
            registroC420IList = new List<RegistroC420>();
            registroC460IList = new List<RegistroC460>();
            registroC490IList = new List<RegistroC490>();
        }
    }
}