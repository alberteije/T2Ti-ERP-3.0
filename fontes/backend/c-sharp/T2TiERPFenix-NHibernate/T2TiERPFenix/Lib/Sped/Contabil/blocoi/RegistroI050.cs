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
    public class RegistroI050
    {
        public System.Nullable<System.DateTime> dtAlt { get; set; } /// Data da inclusão/alteração.
        public string codNat { get; set; } /// Código da natureza da conta/grupo de contas, conforme tabela publicada pelo Sped.
        public string indCta { get; set; } /// Indicador do tipo de conta
        public string nivel { get; set; } /// Nível da conta analítica/grupo de contas.
        public string codCta { get; set; } /// Código da conta analítica/grupo de contas.
        public string codCtaSup { get; set; } /// Código da conta sintética /grupo de contas de nível imediatamente superior.
        public string cta { get; set; } /// Nome da conta analítica/grupo de contas.
        public IList<RegistroI051> registroi051List { get; set; } /// BLOCO I - Lista de RegistroI051 (FILHO)
        public IList<RegistroI052> registroi052List { get; set; } /// BLOCO I - Lista de RegistroI052 (FILHO)

        public RegistroI050()
        {
            this.registroi051List = new List<RegistroI051>();
            this.registroi052List = new List<RegistroI052>();
        }

    }
}
