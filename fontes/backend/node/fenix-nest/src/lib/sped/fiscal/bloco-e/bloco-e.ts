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

import { RegistroE001 } from "./registro-e001";
import { RegistroE100 } from "./registro-e100";
import { RegistroE990 } from "./registro-e990";
import { RegistroE110 } from "./registro-e110";
import { RegistroE116 } from "./registro-e116";
import { SpedUtil } from "../../sped-util";

export class BlocoE {

    registroE001: RegistroE001;
    listaRegistroE100: RegistroE100[];
    registroE990: RegistroE990;
    numeroRegistroE110: number;
    numeroRegistroE116: number;
    u: SpedUtil;

    constructor() {
        this.registroE001 = new RegistroE001();
        this.registroE001.indMov = 1;

        this.listaRegistroE100 = [];

        this.registroE990 = new RegistroE990();
        this.registroE990.qtdLinE = 0;

        this.numeroRegistroE110 = 0;
        this.numeroRegistroE116 = 0;

        this.u = new SpedUtil();
    }

    gravaRegistroE001(): string {
        this.registroE990.qtdLinE = this.registroE990.qtdLinE + 1;

        return this.u.preenche("E001")
            + this.u.preencheInteiro(this.registroE001.indMov)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistroE100(codVer: string) {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroE100.length; i++) {
            registro += this.u.preenche("E100")
                + this.u.preencheData(this.listaRegistroE100[i].dtIni)
                + this.u.preencheData(this.listaRegistroE100[i].dtFin)
                + this.u.delimitador
                + this.u.crlf;

            this.registroE990.qtdLinE = this.registroE990.qtdLinE + 1;
            this.gravaRegistroE110(this.listaRegistroE100[i].registroE110, codVer);
        }
        return registro;
    }

    private gravaRegistroE110(registroE110: RegistroE110, codVer: string): string {
        if (registroE110 == null) {
            return "";
        }
        let registro: string = "";

        registro += this.u.preenche("E110")
            + this.u.preencheDecimal(registroE110.vlTotDebitos)
            + this.u.preencheDecimal(registroE110.vlAjDebitos)
            + this.u.preencheDecimal(registroE110.vlTotAjDebitos)
            + this.u.preencheDecimal(registroE110.vlEstornosCred)
            + this.u.preencheDecimal(registroE110.vlTotCreditos)
            + this.u.preencheDecimal(registroE110.vlAjCreditos)
            + this.u.preencheDecimal(registroE110.vlTotAjCreditos)
            + this.u.preencheDecimal(registroE110.vlEstornosDeb)
            + this.u.preencheDecimal(registroE110.vlSldCredorAnt)
            + this.u.preencheDecimal(registroE110.vlSldApurado)
            + this.u.preencheDecimal(registroE110.vlTotDed)
            + this.u.preencheDecimal(registroE110.vlIcmsRecolher)
            + this.u.preencheDecimal(registroE110.vlSldCredorTransportar)
            + this.u.preencheDecimal(registroE110.debEsp)
            + this.u.delimitador
            + this.u.crlf;

        this.registroE990.qtdLinE = this.registroE990.qtdLinE + 1;
        this.numeroRegistroE110 += 1;

        registro += this.gravaRegistroE116(registroE110.registroE116List, codVer);

        return registro;

    }

    private gravaRegistroE116(listaRegistroE116: RegistroE116[], codVer: string): string {
        if (codVer == "002") {// versao 1.01
            return "";
        }
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroE116.length; i++) {
            if (codVer == "003") {//versao 1.02
                registro += this.u.preenche("E116")
                    + this.u.preenche(listaRegistroE116[i].codOr)
                    + this.u.preencheDecimal(listaRegistroE116[i].vlOr)
                    + this.u.preencheData(listaRegistroE116[i].dtVcto)
                    + this.u.preenche(listaRegistroE116[i].codRec)
                    + this.u.preenche(listaRegistroE116[i].numProc)
                    + this.u.preenche(listaRegistroE116[i].indProc)
                    + this.u.preenche(listaRegistroE116[i].proc)
                    + this.u.preenche(listaRegistroE116[i].txtCompl)
                    + this.u.delimitador
                    + this.u.crlf;
            } else {
                registro += this.u.preenche("E116")
                    + this.u.preenche(listaRegistroE116[i].codOr)
                    + this.u.preencheDecimal(listaRegistroE116[i].vlOr)
                    + this.u.preencheData(listaRegistroE116[i].dtVcto)
                    + this.u.preenche(listaRegistroE116[i].codRec)
                    + this.u.preenche(listaRegistroE116[i].numProc)
                    + this.u.preenche(listaRegistroE116[i].indProc)
                    + this.u.preenche(listaRegistroE116[i].proc)
                    + this.u.preenche(listaRegistroE116[i].txtCompl)
                    + this.u.preenche(listaRegistroE116[i].mesRef)
                    + this.u.delimitador
                    + this.u.crlf;
            }
            this.registroE990.qtdLinE = this.registroE990.qtdLinE + 1;
            this.numeroRegistroE116 += 1;
        }
        return registro;
    }

    gravaRegistroE990() {
        this.registroE990.qtdLinE = this.registroE990.qtdLinE + 1;

        return this.u.preenche("E990")
            + this.u.preencheInteiro(this.registroE990.qtdLinE)
            + this.u.delimitador
            + this.u.crlf;
    }

}
