/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Model relacionado ao SPED Contabil

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
 * @author Albert Eije (alberteije@gmail.com)
@version 1.0.0
*******************************************************************************/
using System.Collections.Generic;

namespace T2Ti.Lib.Sped.Contabil
{

    public class RegistroJ005
    {
        public System.Nullable<System.DateTime> dtIni { get; set; } /// Data inicial das demonstrações contábeis.
        public System.Nullable<System.DateTime> dtFin { get; set; } /// Data final das demonstrações contábeis.
        public int idDem { get; set; } /// Identificação das demonstrações
        public string cabDem { get; set; } /// Cabeçalho das demonstrações.
        public IList<RegistroJ100> registroJ100List { get; set; } /// BLOCO J - Lista de RegistroJ100 (FILHO)
        public IList<RegistroJ150> registroJ150List { get; set; } /// BLOCO J - Lista de RegistroJ150 (FILHO)

        public RegistroJ005() {
            this.registroJ100List = new List<RegistroJ100>();
            this.registroJ150List = new List<RegistroJ150>();
        }
    }
}
