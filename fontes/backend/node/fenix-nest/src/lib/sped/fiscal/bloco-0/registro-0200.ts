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

import { Registro0205 } from "./registro-0205";
import { Registro0206 } from "./registro-0206";
import { Registro0220 } from "./registro-0220";

export class Registro0200 {

    codItem: string;	 // Código do item
    descrItem: string;	 // Descrição do item
    codBarra: string;	 // Código de barra do produto, se houver
    codAntItem: string;	 // Código anterior do item (ultima apresentado)
    unidInv: string;	 // Unidade de medida do estoque
    tipoItem: string;	 // Tipo do item - Atividades Industriais, Comerciais e Serviços
    codNcm: string;	 // Código da Nomenclatura Comum do Mercosul
    exIpi: string;	 // Código EX, conforme a TIPI
    codGen: string;	 // Código gênero item, tabela indicada item 4.2.1
    codLst: string;	 // Código serviço Anexo I - Lei nº116/03
    aliqIcms: number;	 // Alíquota ICMS aplicável (operações internas)
    registro0205List: Registro0205[];	 // BLOCO C - Lista de Registro0205 (FILHO)
    registro0206List: Registro0206[];	 // BLOCO C - Lista de Registro0206 (FILHO)
    registro0220List: Registro0220[];	 // BLOCO C - Lista de Registro0220 (FILHO)

    constructor() {
        this.registro0205List = [];
        this.registro0206List = [];
        this.registro0220List = [];
    }

}
