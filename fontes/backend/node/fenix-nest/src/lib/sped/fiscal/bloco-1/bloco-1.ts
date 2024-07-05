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

import { Registro1001 } from "./registro-1001";
import { Registro1010 } from "./registro-1010";
import { Registro1990 } from "./registro-1990";
import { SpedUtil } from "../../sped-util";

export class Bloco1 {

    registro1001: Registro1001;
    listaRegistro1010: Registro1010[];
    registro1990: Registro1990;
    numeroRegistro1010: number;
    private u: SpedUtil;

    constructor() {
        this.registro1001 = new Registro1001();
        this.registro1001.indMov = 1;

        this.listaRegistro1010 = [];

        this.registro1990 = new Registro1990();
        this.registro1990.qtdLin1 = 0;

        this.numeroRegistro1010 = 0;

        this.u = new SpedUtil();
    }

    gravaRegistro1001() {
        this.registro1990.qtdLin1 = this.registro1990.qtdLin1 + 1;

        return this.u.preenche("1001")
            + this.u.preencheInteiro(this.registro1001.indMov)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistro1010() {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistro1010.length; i++) {
            registro += this.u.preenche("1010")
                + this.u.preenche(this.listaRegistro1010[i].indExp)
                + this.u.preenche(this.listaRegistro1010[i].indCcrf)
                + this.u.preenche(this.listaRegistro1010[i].indComb)
                + this.u.preenche(this.listaRegistro1010[i].indUsina)
                + this.u.preenche(this.listaRegistro1010[i].indVa)
                + this.u.preenche(this.listaRegistro1010[i].indEe)
                + this.u.preenche(this.listaRegistro1010[i].indCart)
                + this.u.preenche(this.listaRegistro1010[i].indForm)
                + this.u.preenche(this.listaRegistro1010[i].indAer)
                + this.u.delimitador
                + this.u.crlf;

            this.registro1990.qtdLin1 = this.registro1990.qtdLin1 + 1;
            this.numeroRegistro1010 += 1;
        }
        return registro;
    }

    gravaRegistro1990() {
        this.registro1990.qtdLin1 = this.registro1990.qtdLin1 + 1;

        return this.u.preenche("1990")
            + this.u.preencheInteiro(this.registro1990.qtdLin1)
            + this.u.delimitador
            + this.u.crlf;
    }

}
