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

import { RegistroC370 } from "./registro-c370";
import { RegistroC390 } from "./registro-c390";

export class RegistroC350 {

    ser: string;	 // Série do documento fiscal
    subSer: string;	 // Subsérie do documento fiscal
    numDoc: string;	 // Número do documento fiscal
    dtDoc: Date;	 // Data da emissão do documento fiscal
    cnpjCpf: string;	 // CNPJ ou CPF do destinatário
    vlMerc: number;	 // Valor das mercadorias constantes no documento fiscal
    vlDoc: number;	 // Valor total do documento fiscal
    vlDesc: number;	 // Valor total do desconto
    vlPis: number;	 // Valor total do PIS
    vlCofins: number;	 // Valor total da COFINS
    codCta: string;	 // Código da conta analítica contábil debitada/creditada
    registroC370List: RegistroC370[];	 // BLOCO C - Lista de RegistroC370 (FILHO)
    registroC390List: RegistroC390[];	 // BLOCO C - Lista de RegistroC390 (FILHO)

    public RegistroC350() {
        this.registroC370List = [];
        this.registroC390List = [];
    }

}
