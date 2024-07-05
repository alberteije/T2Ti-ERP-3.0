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
    public class Registro0200
    {
        public string codItem { get; set; } // Código do item
        public string descrItem { get; set; } // Descrição do item
        public string codBarra { get; set; } // Código de barra do produto, se houver
        public string codAntItem { get; set; } // Código anterior do item (ultima apresentado)
        public string unidInv { get; set; } // Unidade de medida do estoque
        public string tipoItem { get; set; } // Tipo do item - Atividades Industriais, Comerciais e Serviços
        public string codNcm { get; set; } // Código da Nomenclatura Comum do Mercosul
        public string exIpi { get; set; } // Código EX, conforme a TIPI
        public string codGen { get; set; } // Código gênero item, tabela indicada item 4.2.1
        public string codLst { get; set; } // Código serviço Anexo I - Lei nº116/03
        public System.Nullable<System.Decimal> aliqIcms { get; set; } // Alíquota ICMS aplicável (operações internas)
        public IList<Registro0205> registro0205IList { get; set; } // BLOCO C - ILista de Registro0205 (FILHO)
        public IList<Registro0206> registro0206IList { get; set; } // BLOCO C - ILista de Registro0206 (FILHO)
        public IList<Registro0220> registro0220IList { get; set; } // BLOCO C - ILista de Registro0220 (FILHO)

        public Registro0200()
        {
            registro0205IList = new List<Registro0205>();
            registro0206IList = new List<Registro0206>();
            registro0220IList = new List<Registro0220>();
        }
    }
}
