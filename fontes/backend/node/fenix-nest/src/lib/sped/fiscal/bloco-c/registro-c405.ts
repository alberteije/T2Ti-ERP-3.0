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

import { RegistroC420 } from "./registro-c420";
import { RegistroC460 } from "./registro-c460";
import { RegistroC490 } from "./registro-c490";

export class RegistroC405 {

    dtDoc: Date;	 // Data do movimento a que se refere a Redução Z
    cro: number;	 // Posição do Contador de Reinício de Operação
    crz: number;	 // Posição do Contador de Redução Z
    numCooFin: number;	 // Número do Contador de Ordem de Operação do último documento emitido no dia. (Número do COO na Redução Z)
    gtFin: number;	 // Valor do Grande Total final
    vlBrt: number;	 // Valor da venda bruta
    registroC420List: RegistroC420[];	 // BLOCO C - Lista de RegistroC420 (FILHO)
    registroC460List: RegistroC460[];	 // BLOCO C - Lista de RegistroC460 (FILHO)
    registroC490List: RegistroC490[];	 // BLOCO C - Lista de RegistroC490 (FILHO)

    constructor() {
        this.registroC420List = [];
        this.registroC460List = [];
        this.registroC490List = [];
    }

}