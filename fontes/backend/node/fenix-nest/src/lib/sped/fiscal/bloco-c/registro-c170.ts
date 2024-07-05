/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Model relacionado ào SPED

The MIT License

Copyright: Copyright (C) 2020 T2Ti.COM

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

export class RegistroC170 {

    numItem: string;	 // Número seqüencial do item no documento fiscal
    codItem: string;	 // Código do item (campo 02 do Registro 0200)
    descrCompl: string;	 // Descrição complementar do item como adotado no documento fiscal
    qtd: number;	 // Quantidade do item
    unid: string;	 // Unidade do item(Campo 02 do registro 0190)
    vlItem: number;	 // Valor total do item
    vlDesc: number;	 // Valor do desconto comercial
    indMov: number;	 // Movimentação física do ITEM/PRODUTO: 0 - SIM
    cstIcms: string;	 // Código da Situação Tributária referente ao ICMS, conforme a Tabela indicada no item 4.3.1
    cfop: string;	 // Código Fiscal de Operação e Prestação
    codNat: string;	 // Código da natureza da operação (campo 02 do Registro 0400)
    vlBcIcms: number;	 // Valor da base de cálculo do ICMS
    aliqIcms: number;	 // Alíquota do ICMS
    vlIcms: number;	 // Valor do ICMS creditado/debitado
    vlBcIcmsSt: number;	 // Valor da base de cálculo referente à substituição tributária
    aliqSt: number;	 // Alíquota do ICMS da substituição tributária na unidade da federação de destino
    vlIcmsSt: number;	 // Valor do ICMS referente à substituição tributária
    indApur: number;	 // Indicador de período de apuração do IPI: 0 - Mensal
    cstIpi: string;	 // Código da Situação Tributária referente ao IPI, conforme a Tabela indicada no item 4.3.2.
    codEnq: string;	 // Código de enquadramento legal do IPI, conforme tabela indicada no item 4.5.3.
    vlBcIpi: number;	 // Valor da base de cálculo do IPI
    aliqIpi: number;	 // Alíquota do IPI
    vlIpi: number;	 // Valor do IPI creditado/debitado
    cstPis: string;	 // Código da Situação Tributária referente ao PIS.
    vlBcPis: number;	 // Valor da base de cálculo do PIS
    aliqPisPerc: number;	 // Alíquota do PIS (em percentual)
    quantBcPis: number;	 // Quantidade - Base de cálculo PIS
    aliqPisR: number;	 // Alíquota do PIS (em reais)
    vlPis: number;	 // Valor do PIS
    cstCofins: string;	 // Código da Situação Tributária referente ao COFINS.
    vlBcCofins: number;	 // Valor da base de cálculo da COFINS
    aliqCofinsPerc: number;	 // Alíquota do COFINS (em percentual)
    quantBcCofins: number;	 // Quantidade - Base de cálculo COFINS
    aliqCofinsR: number;	 // Alíquota da COFINS (em reais)
    vlCofins: number;	 // Valor da COFINS
    codCta: string;	 // Código da conta analítica contábil debitada/creditada

}
