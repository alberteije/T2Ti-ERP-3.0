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
import { Registro0000 } from "./registro-0000";
import { Registro0001 } from "./registro-0001";
import { Registro0007 } from "./registro-0007";
import { Registro0020 } from "./registro-0020";
import { Registro0150 } from "./registro-0150";
import { Registro0180 } from "./registro-0180";
import { Registro0990 } from "./registro-0990";
import { SpedUtil } from "../../sped-util";

export class Bloco0 {

    registro0000: Registro0000;
    registro0001: Registro0001;
    listaRegistro0007: Registro0007[];
    listaRegistro0020: Registro0020[];
    listaRegistro0150: Registro0150[];
    listaRegistro0180: Registro0180[];
    registro0990: Registro0990;
    private u: SpedUtil;

    constructor() {
        this.registro0000 = new Registro0000();
        this.registro0001 = new Registro0001();
        this.registro0001.indDad = 1;
        this.listaRegistro0007 = [];
        this.listaRegistro0020 = [];
        this.listaRegistro0150 = [];
        this.listaRegistro0180 = [];
        this.registro0990 = new Registro0990();
        this.registro0990.qtdLin0 = 0;

        this.u = new SpedUtil();
    }

    limpaRegistros() {
        this.listaRegistro0007 = [];
        this.listaRegistro0020 = [];
        this.listaRegistro0150 = [];
        this.listaRegistro0180 = [];
        this.registro0990.qtdLin0 = 0;
    }

    gravaRegistro0000(): string {
        this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;

        return this.u.preenche("0000")
            + this.u.preenche("LECD")
            + this.u.preencheData(this.registro0000.dtIni)
            + this.u.preencheData(this.registro0000.dtFin)
            + this.u.preenche(this.registro0000.nome)
            + this.u.preenche(this.registro0000.cnpj)
            + this.u.preenche(this.registro0000.uf)
            + this.u.preenche(this.registro0000.ie)
            + this.u.preencheInteiro(this.registro0000.codMun)
            + this.u.preenche(this.registro0000.im)
            + this.u.preenche(this.registro0000.indSitEsp)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistro0001(): string {
        this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;

        return this.u.preenche("0001")
            + this.u.preencheInteiro(this.registro0001.indDad)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistro0007(): string {
        let registro: string = "";

        for (let i: number = 0; i < this.listaRegistro0007.length; i++) {
            registro += this.u.preenche("0007")
                + this.u.preenche(this.listaRegistro0007[i].codEntRef)
                + this.u.preenche(this.listaRegistro0007[i].codInscr)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
        }
        return registro;
    }

    gravaRegistro0020(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistro0020.length; i++) {
            registro += this.u.preenche("0020")
                + this.u.preencheInteiro(this.listaRegistro0020[i].indDec)
                + this.u.preenche(this.listaRegistro0020[i].cnpj)
                + this.u.preenche(this.listaRegistro0020[i].uf)
                + this.u.preenche(this.listaRegistro0020[i].ie)
                + this.u.preencheInteiro(this.listaRegistro0020[i].codMun)
                + this.u.preenche(this.listaRegistro0020[i].im)
                + this.u.preenche(this.listaRegistro0020[i].nire)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
        }
        return registro;
    }

    gravaRegistro0150(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistro0150.length; i++) {
            registro += this.u.preenche("0150")
                + this.u.preenche(this.listaRegistro0150[i].codPart)
                + this.u.preenche(this.listaRegistro0150[i].nome)
                + this.u.preencheInteiro(this.listaRegistro0150[i].codPais)
                + this.u.preenche(this.listaRegistro0150[i].cnpj)
                + this.u.preenche(this.listaRegistro0150[i].cpf)
                + this.u.preenche(this.listaRegistro0150[i].nit)
                + this.u.preenche(this.listaRegistro0150[i].uf)
                + this.u.preenche(this.listaRegistro0150[i].ie)
                + this.u.preenche(this.listaRegistro0150[i].ieSt)
                + this.u.preencheInteiro(this.listaRegistro0150[i].codMun)
                + this.u.preenche(this.listaRegistro0150[i].im)
                + this.u.preenche(this.listaRegistro0150[i].suframa)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
        }
        return registro;
    }

    gravaRegistro0180(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistro0180.length; i++) {
            registro += this.u.preenche("0180")
                + this.u.preenche(this.listaRegistro0180[i].codRel)
                + this.u.preencheData(this.listaRegistro0180[i].dtIniRel)
                + this.u.preencheData(this.listaRegistro0180[i].dtFinRel)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
        }
        return registro;
    }

    gravaRegistro0990(): string {
        this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;

        return this.u.preenche("0990")
            + this.u.preencheInteiro(this.registro0990.qtdLin0)
            + this.u.delimitador
            + this.u.crlf;
    }

}
