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
    public class RegistroC170
    {
        public string numItem { get; set; } // Número seqüencial do item no documento fiscal
        public string codItem { get; set; } // Código do item (campo 02 do Registro 0200)
        public string descrCompl { get; set; } // Descrição complementar do item como adotado no documento fiscal
        public System.Nullable<System.Decimal> qtd { get; set; } // Quantidade do item
        public string unid { get; set; } // Unidade do item(Campo 02 do registro 0190)
        public System.Nullable<System.Decimal> vlItem { get; set; } // Valor total do item
        public System.Nullable<System.Decimal> vlDesc { get; set; } // Valor do desconto comercial
        public int indMov { get; set; } // Movimentação física do ITEM/PRODUTO: 0 - SIM; 1- NÃO
        public string cstIcms { get; set; } // Código da Situação Tributária referente ao ICMS, conforme a Tabela indicada no item 4.3.1
        public string cfop { get; set; } // Código Fiscal de Operação e Prestação
        public string codNat { get; set; } // Código da natureza da operação (campo 02 do Registro 0400)
        public System.Nullable<System.Decimal> vlBcIcms { get; set; } // Valor da base de cálculo do ICMS
        public System.Nullable<System.Decimal> aliqIcms { get; set; } // Alíquota do ICMS
        public System.Nullable<System.Decimal> vlIcms { get; set; } // Valor do ICMS creditado/debitado
        public System.Nullable<System.Decimal> vlBcIcmsSt { get; set; } // Valor da base de cálculo referente à substituição tributária
        public System.Nullable<System.Decimal> aliqSt { get; set; } // Alíquota do ICMS da substituição tributária na unidade da federação de destino
        public System.Nullable<System.Decimal> vlIcmsSt { get; set; } // Valor do ICMS referente à substituição tributária
        public int indApur { get; set; } // Indicador de período de apuração do IPI: 0 - Mensal; 1 - Decendial
        public string cstIpi { get; set; } // Código da Situação Tributária referente ao IPI, conforme a Tabela indicada no item 4.3.2.
        public string codEnq { get; set; } // Código de enquadramento legal do IPI, conforme tabela indicada no item 4.5.3.
        public System.Nullable<System.Decimal> vlBcIpi { get; set; } // Valor da base de cálculo do IPI
        public System.Nullable<System.Decimal> aliqIpi { get; set; } // Alíquota do IPI
        public System.Nullable<System.Decimal> vlIpi { get; set; } // Valor do IPI creditado/debitado
        public string cstPis { get; set; } // Código da Situação Tributária referente ao PIS.
        public System.Nullable<System.Decimal> vlBcPis { get; set; } // Valor da base de cálculo do PIS
        public System.Nullable<System.Decimal> aliqPisPerc { get; set; } // Alíquota do PIS (em percentual)
        public System.Nullable<System.Decimal> quantBcPis { get; set; } // Quantidade - Base de cálculo PIS
        public System.Nullable<System.Decimal> aliqPisR { get; set; } // Alíquota do PIS (em reais)
        public System.Nullable<System.Decimal> vlPis { get; set; } // Valor do PIS
        public string cstCofins { get; set; } // Código da Situação Tributária referente ao COFINS.
        public System.Nullable<System.Decimal> vlBcCofins { get; set; } // Valor da base de cálculo da COFINS
        public System.Nullable<System.Decimal> aliqCofinsPerc { get; set; } // Alíquota do COFINS (em percentual)
        public System.Nullable<System.Decimal> quantBcCofins { get; set; } // Quantidade - Base de cálculo COFINS
        public System.Nullable<System.Decimal> aliqCofinsR { get; set; } // Alíquota da COFINS (em reais)
        public System.Nullable<System.Decimal> vlCofins { get; set; } // Valor da COFINS
        public string codCta { get; set; } // Código da conta analítica contábil debitada/creditada
    }
}
