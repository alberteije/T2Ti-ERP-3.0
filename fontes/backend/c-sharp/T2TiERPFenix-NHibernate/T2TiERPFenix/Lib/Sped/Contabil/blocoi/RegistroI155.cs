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
namespace T2Ti.Lib.Sped.Contabil
{
    public class RegistroI155
    {
        public string codCta { get; set; } /// Código da conta analítica.
        public string codCcus { get; set; } /// Código do centro de custos.
        public System.Nullable<System.Decimal> vlSldIni { get; set; } /// Valor do saldo inicial do período.
        public string indDcIni { get; set; } /// Indicador da situação do saldo inicial
        public System.Nullable<System.Decimal> vlDeb { get; set; } /// Valor total dos débitos no período.
        public System.Nullable<System.Decimal> vlCred { get; set; } /// Valor total dos créditos no período.
        public System.Nullable<System.Decimal> vlSldFin { get; set; } /// Valor do saldo final do período.
        public string indDcFin { get; set; } /// Indicador da situação do saldo final
    }
}
