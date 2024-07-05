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

import { RegistroH001 } from "./registro-h001";
import { RegistroH005 } from "./registro-h005";
import { RegistroH990 } from "./registro-h990";
import { RegistroH010 } from "./registro-h010";
import { SpedUtil } from "../../sped-util";

export class BlocoH {

    registroH001: RegistroH001;
    listaRegistroH005: RegistroH005[];
    registroH990: RegistroH990;
    numeroRegistroH005: number;
    numeroRegistroH010: number;
    private u: SpedUtil;

    constructor() {
        this.registroH001 = new RegistroH001();
        this.registroH001.indMov = 1;

        this.listaRegistroH005 = [];

        this.registroH990 = new RegistroH990();
        this.registroH990.qtdLinH = 0;

        this.numeroRegistroH005 = 0;
        this.numeroRegistroH010 = 0;

        this.u = new SpedUtil();
    }

    gravaRegistroH001(): string {
        this.registroH990.qtdLinH = this.registroH990.qtdLinH + 1;

        return this.u.preenche("H001")
            + this.u.preencheInteiro(this.registroH001.indMov)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistroH005(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroH005.length; i++) {
            registro += this.u.preenche("H005")
                + this.u.preencheData(this.listaRegistroH005[i].dtInv)
                + this.u.preencheDecimal(this.listaRegistroH005[i].vlInv)
                + this.u.preenche(this.listaRegistroH005[i].motInv)
                + this.u.delimitador
                + this.u.crlf;

            this.registroH990.qtdLinH = this.registroH990.qtdLinH + 1;
            this.numeroRegistroH005 += 1;
            this.gravaRegistroH010(this.listaRegistroH005[i].registroH010List);
        }
        return registro;
    }

    private gravaRegistroH010(listaRegistroH010: RegistroH010[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroH010.length; i++) {
            registro += this.u.preenche("H010")
                + this.u.preenche(listaRegistroH010[i].codItem)
                + this.u.preenche(listaRegistroH010[i].unid)
                + this.u.preencheDecimal(listaRegistroH010[i].qtd)
                + this.u.preencheDecimal(listaRegistroH010[i].vlUnit)
                + this.u.preencheDecimal(listaRegistroH010[i].vlItem)
                + this.u.preenche(listaRegistroH010[i].indProp)
                + this.u.preenche(listaRegistroH010[i].codPart)
                + this.u.preenche(listaRegistroH010[i].txtCompl)
                + this.u.preenche(listaRegistroH010[i].codCta)
                + this.u.delimitador
                + this.u.crlf;

            this.registroH990.qtdLinH = this.registroH990.qtdLinH + 1;
            this.numeroRegistroH010 += 1;
        }
        return registro;
    }

    gravaRegistroH990(): string {
        this.registroH990.qtdLinH = this.registroH990.qtdLinH + 1;

        return this.u.preenche("H990")
            + this.u.preencheInteiro(this.registroH990.qtdLinH)
            + this.u.delimitador
            + this.u.crlf;
    }

}
