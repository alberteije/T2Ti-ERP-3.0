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
namespace T2Ti.Lib.Sped.Fiscal
{
    public class RegistroC470
    {
        public string codItem { get; set; } // Código do item (campo 02 do Registro 0200)
        public System.Nullable<System.Decimal> qtd { get; set; } // Quantidade do item
        public System.Nullable<System.Decimal> qtdCanc { get; set; } // Quantidade cancelada, no caso de cancelamento parcial de item
        public string unid { get; set; } // Unidade do item (Campo 02 do registro 0190)
        public System.Nullable<System.Decimal> vlItem { get; set; } // Valor do item
        public string cstIcms { get; set; } // Código da Situação Tributária, conforme a Tabela indicada no item 4.3.1.
        public string cfop { get; set; } // Código Fiscal de Operação e Prestação
        public System.Nullable<System.Decimal> aliqIcms { get; set; } // Alíquota do ICMS - Carga tributária efetiva em percentual
        public System.Nullable<System.Decimal> vlPis { get; set; } // Valor do PIS
        public System.Nullable<System.Decimal> vlCofins { get; set; } // Valor da COFINS
    }
}
