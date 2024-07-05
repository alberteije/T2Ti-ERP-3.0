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
import { Registro9001 } from "./registro-9001";
import { Registro9900 } from "./registro-9900";
import { Registro9990 } from "./registro-9990";
import { Registro9999 } from "./registro-9999";
import { SpedUtil } from "../../sped-util";

export class Bloco9 {

    registro9001: Registro9001;
    listaRegistro9900: Registro9900[];
    registro9990: Registro9990;
    registro9999: Registro9999;
    private u: SpedUtil;

    constructor() {
        this.registro9001 = new Registro9001();
        this.registro9001.indDad = 1;
        this.listaRegistro9900 = [];
        this.registro9990 = new Registro9990();
        this.registro9999 = new Registro9999();

        this.registro9990.qtdLin9 = 0;

        this.u = new SpedUtil();
    }

    limpaRegistros() {
        this.listaRegistro9900 = [];

        this.registro9990.qtdLin9 = 0;
    }

    gravaRegistro9001(): string {
        this.registro9990.qtdLin9 = this.registro9990.qtdLin9 + 1;
        return this.u.preenche("9001") +
            this.u.preencheInteiro(this.registro9001.indDad) +
            this.u.delimitador +
            this.u.crlf;
    }

    gravaRegistro9900(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistro9900.length; i++) {
            registro += this.u.preenche("9900") +
                this.u.preenche(this.listaRegistro9900[i].regBlc) +
                this.u.preencheInteiro(this.listaRegistro9900[i].qtdRegBlc) +
                this.u.delimitador +
                this.u.crlf;
        }
        this.registro9990.qtdLin9 = this.registro9990.qtdLin9 + this.listaRegistro9900.length + 2;
        return registro;
    }

    gravaRegistro9990(): string {
        return this.u.preenche("9990") +
            this.u.preencheInteiro(this.registro9990.qtdLin9) +
            this.u.delimitador +
            this.u.crlf;
    }

    gravaRegistro9999(): string {
        return this.u.preenche("9999") +
            this.u.preencheInteiro(this.registro9999.qtdLin) +
            this.u.delimitador +
            this.u.crlf;
    }
}
