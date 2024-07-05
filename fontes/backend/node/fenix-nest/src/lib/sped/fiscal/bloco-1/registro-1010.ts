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

export class Registro1010 {

    indExp: string;	 // Reg. 1100 - Ocorreu averbação (conclusão) de exportação no período
    indCcrf: string;	 // Reg. 1200 – Existem informações acerca de créditos de ICMS a serem controlados, definidos pela Sefaz
    indComb: string;	 // Reg. 1300 – É comercio varejista de combustíveis
    indUsina: string;	 // Reg. 1390 – Usinas de açúcar e/álcool – O estabelecimento é produtor de açúcar e/ou álcool carburante
    indVa: string;	 // Reg. 1400 – Existem informações a serem prestadas neste registro e o registro é obrigatório em sua Unidade da Federação
    indEe: string;	 // Reg. 1500 - A empresa é distribuidora de energia e ocorreu fornecimento de energia elétrica para consumidores de outra UF
    indCart: string;	 // Reg. 1600 - Realizou vendas com Cartão de Crédito ou de débito
    indForm: string;	 // Reg. 1700 - É obrigatório em sua unidade da federação o controle de utilização de documentos fiscais em papel
    indAer: string;	 // Reg. 1800 – A empresa prestou serviços de transporte aéreo de cargas e de passageiros

}
