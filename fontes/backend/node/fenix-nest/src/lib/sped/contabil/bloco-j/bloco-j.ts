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

import { RegistroJ001 } from "./registro-j001";
import { RegistroJ005 } from "./registro-j005";
import { RegistroJ800 } from "./registro-j800";
import { RegistroJ900 } from "./registro-j900";
import { RegistroJ930 } from "./registro-j930";
import { RegistroJ990 } from "./registro-j990";
import { RegistroJ100 } from "./registro-j100";
import { RegistroJ150 } from "./registro-j150";
import { SpedUtil } from "../../sped-util";

export class BlocoJ {

    registroJ001: RegistroJ001;
    listaRegistroJ005: RegistroJ005[];
    listaRegistroJ800: RegistroJ800[];
    registroJ900: RegistroJ900;
    listaRegistroJ930: RegistroJ930[];
    registroJ990: RegistroJ990;
    numeroRegistrosJ100: number;
    numeroRegistrosJ150: number;
    private u: SpedUtil;

    constructor() {
        this.registroJ001 = new RegistroJ001();
        this.registroJ001.indDad = 1;
        this.listaRegistroJ005 = [];
        this.listaRegistroJ800 = [];
        this.listaRegistroJ930 = [];
        this.registroJ900 = new RegistroJ900();

        this.registroJ990 = new RegistroJ990();
        this.registroJ990.qtdLinJ = 0;

        this.numeroRegistrosJ100 = 0;
        this.numeroRegistrosJ150 = 0;

        this.u = new SpedUtil();
    }

    limpaRegistros() {
        this.listaRegistroJ005 = [];
        this.listaRegistroJ800 = [];
        this.listaRegistroJ930 = [];

        this.registroJ990.qtdLinJ = 0;
    }

    gravaRegistroJ001(): string {
        this.registroJ990.qtdLinJ = this.registroJ990.qtdLinJ + 1;
        return this.u.preenche("J001")
            + this.u.preencheInteiro(this.registroJ001.indDad)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistroJ005(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroJ005.length; i++) {
            registro += this.u.preenche("J005")
                + this.u.preencheData(this.listaRegistroJ005[i].dtIni)
                + this.u.preencheData(this.listaRegistroJ005[i].dtFin)
                + this.u.preencheInteiro(this.listaRegistroJ005[i].idDem)
                + this.u.preenche(this.listaRegistroJ005[i].cabDem)
                + this.u.delimitador
                + this.u.crlf;

            registro += this.gravaRegistroJ100(this.listaRegistroJ005[i].registroJ100List);
            registro += this.gravaRegistroJ150(this.listaRegistroJ005[i].registroJ150List);

            this.registroJ990.qtdLinJ = this.registroJ990.qtdLinJ + 1;
        }
        return registro;
    }

    private gravaRegistroJ100(listaRegistroJ100: RegistroJ100[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroJ100.length; i++) {
            registro += this.u.preenche("J100")
                + this.u.preenche(listaRegistroJ100[i].codAgl)
                + this.u.preenche(listaRegistroJ100[i].nivelAgl)
                + this.u.preenche(listaRegistroJ100[i].indGrpBal)
                + this.u.preenche(listaRegistroJ100[i].descrCodAgl)
                + this.u.preencheDecimal(listaRegistroJ100[i].vlCta)
                + this.u.preenche(listaRegistroJ100[i].indDcBal)
                + this.u.delimitador
                + this.u.crlf;

            this.registroJ990.qtdLinJ = this.registroJ990.qtdLinJ + 1;
            this.numeroRegistrosJ100 += 1;
        }
        return registro;
    }

    private gravaRegistroJ150(listaRegistroJ150: RegistroJ150[]) {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroJ150.length; i++) {
            registro += this.u.preenche("J150")
                + this.u.preenche(listaRegistroJ150[i].codAgl)
                + this.u.preenche(listaRegistroJ150[i].nivelAgl)
                + this.u.preenche(listaRegistroJ150[i].descrCodAgl)
                + this.u.preencheDecimal(listaRegistroJ150[i].vlCta)
                + this.u.preenche(listaRegistroJ150[i].indVl)
                + this.u.delimitador
                + this.u.crlf;

            this.registroJ990.qtdLinJ = this.registroJ990.qtdLinJ + 1;
            this.numeroRegistrosJ150 += 1;
        }
        return registro;
    }

    gravaRegistroJ800(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroJ800.length; i++) {
            registro += this.u.preenche("J800")
                + this.u.preenche(this.listaRegistroJ800[i].arqRtf)
                + this.u.preenche("J800FIM")
                + this.u.delimitador
                + this.u.crlf;

            this.registroJ990.qtdLinJ = this.registroJ990.qtdLinJ + 1;
        }
        return registro;
    }

    gravaRegistroJ900(): string {
        this.registroJ990.qtdLinJ = this.registroJ990.qtdLinJ + 1;

        return this.u.preenche("J900")
            + this.u.preenche("TERMO DE ENCERRAMENTO")
            + this.u.preenche(this.registroJ900.numOrd)
            + this.u.preenche(this.registroJ900.natLivro)
            + this.u.preenche(this.registroJ900.nome)
            + this.u.preencheInteiro(this.registroJ900.qtdLin)
            + this.u.preencheData(this.registroJ900.dtIniEscr)
            + this.u.preencheData(this.registroJ900.dtFinEscr)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistroJ930(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroJ800.length; i++) {
            registro += this.u.preenche("J930")
                + this.u.preenche(this.listaRegistroJ930[i].identNom)
                + this.u.preenche(this.listaRegistroJ930[i].identCpf)
                + this.u.preenche(this.listaRegistroJ930[i].identQualif)
                + this.u.preenche(this.listaRegistroJ930[i].codAssin)
                + this.u.preenche(this.listaRegistroJ930[i].indCrc)
                + this.u.delimitador
                + this.u.crlf;

            this.registroJ990.qtdLinJ = this.registroJ990.qtdLinJ + 1;
        }
        return registro;
    }

    gravaRegistroJ990(): string {
        this.registroJ990.qtdLinJ = this.registroJ990.qtdLinJ + 1;

        return this.u.preenche("J990")
            + this.u.preencheInteiro(this.registroJ990.qtdLinJ)
            + this.u.delimitador
            + this.u.crlf;
    }

}
