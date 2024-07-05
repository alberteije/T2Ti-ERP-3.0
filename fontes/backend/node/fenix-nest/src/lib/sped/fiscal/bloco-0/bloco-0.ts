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
import { Registro0005 } from "./registro-0005";
import { Registro0100 } from "./registro-0100";
import { Registro0150 } from "./registro-0150";
import { Registro0190 } from "./registro-0190";
import { Registro0200 } from "./registro-0200";
import { Registro0990 } from "./registro-0990";
import { Registro0175 } from "./registro-0175";
import { Registro0205 } from "./registro-0205";
import { Registro0220 } from "./registro-0220";
import { SpedUtil } from "../../sped-util";

export class Bloco0 {

    registro0000: Registro0000;
    registro0001: Registro0001;
    registro0005: Registro0005;
    registro0100: Registro0100;
    listaRegistro0150: Registro0150[];
    listaRegistro0190: Registro0190[];
    listaRegistro0200: Registro0200[];

    registro0990: Registro0990;
    numeroRegistro0175: number;
    numeroRegistro0205: number;
    numeroRegistro0220: number;

    private u: SpedUtil;

    constructor() {
        this.registro0000 = new Registro0000();
        this.registro0001 = new Registro0001();
        this.registro0001.indMov = 1;
        this.registro0005 = new Registro0005();
        this.registro0100 = new Registro0100();
        this.listaRegistro0150 = [];
        this.listaRegistro0190 = [];
        this.listaRegistro0200 = [];

        this.registro0990 = new Registro0990();
        this.registro0990.qtdLin0 = 0;

        this.numeroRegistro0175 = 0;
        this.numeroRegistro0205 = 0;
        this.numeroRegistro0220 = 0;

        this.u = new SpedUtil();
    }

    gravaRegistro0000(): string {
        this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;

        return this.u.preenche("0000")
            + this.u.preenche(this.registro0000.codVer)
            + this.u.preenche(this.registro0000.codFin)
            + this.u.preencheData(this.registro0000.dtIni)
            + this.u.preencheData(this.registro0000.dtFin)
            + this.u.preenche(this.registro0000.nome)
            + this.u.preenche(this.registro0000.cnpj)
            + this.u.preenche(this.registro0000.cpf)
            + this.u.preenche(this.registro0000.uf)
            + this.u.preenche(this.registro0000.ie)
            + this.u.preenche(this.registro0000.codMun)
            + this.u.preenche(this.registro0000.im)
            + this.u.preenche(this.registro0000.suframa)
            + this.u.preenche(this.registro0000.indPerfil)
            + this.u.preenche(this.registro0000.indAtiv)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistro0001(): string {
        this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;

        return this.u.preenche("0001")
            + this.u.preencheInteiro(this.registro0001.indMov)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistro0005(): string {
        this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;

        return this.u.preenche("0005")
            + this.u.preenche(this.registro0005.fantasia)
            + this.u.preenche(this.registro0005.cep)
            + this.u.preenche(this.registro0005.endereco)
            + this.u.preenche(this.registro0005.num)
            + this.u.preenche(this.registro0005.compl)
            + this.u.preenche(this.registro0005.bairro)
            + this.u.preenche(this.registro0005.fone)
            + this.u.preenche(this.registro0005.fax)
            + this.u.preenche(this.registro0005.email)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistro0100(): string {
        this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;

        return this.u.preenche("0100")
            + this.u.preenche(this.registro0100.nome)
            + this.u.preenche(this.registro0100.cpf)
            + this.u.preenche(this.registro0100.crc)
            + this.u.preenche(this.registro0100.cnpj)
            + this.u.preenche(this.registro0100.cep)
            + this.u.preenche(this.registro0100.endereco)
            + this.u.preenche(this.registro0100.num)
            + this.u.preenche(this.registro0100.compl)
            + this.u.preenche(this.registro0100.bairro)
            + this.u.preenche(this.registro0100.fone)
            + this.u.preenche(this.registro0100.fax)
            + this.u.preenche(this.registro0100.email)
            + this.u.preencheInteiro(this.registro0100.codMun)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistro0150(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistro0150.length; i++) {
            registro += this.u.preenche("0150")
                + this.u.preenche(this.listaRegistro0150[i].codPart)
                + this.u.preenche(this.listaRegistro0150[i].nome)
                + this.u.preenche(this.listaRegistro0150[i].codPais)
                + this.u.preenche(this.listaRegistro0150[i].cnpj)
                + this.u.preenche(this.listaRegistro0150[i].cpf)
                + this.u.preenche(this.listaRegistro0150[i].ie)
                + this.u.preencheInteiro(this.listaRegistro0150[i].codMun)
                + this.u.preenche(this.listaRegistro0150[i].suframa)
                + this.u.preenche(this.listaRegistro0150[i].endereco)
                + this.u.preenche(this.listaRegistro0150[i].num)
                + this.u.preenche(this.listaRegistro0150[i].compl)
                + this.u.preenche(this.listaRegistro0150[i].bairro)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
            registro += this.gravaRegistro0175(this.listaRegistro0150[i].registro0175List);
        }
        return registro;
    }

    private gravaRegistro0175(listaRegistro0175: Registro0175[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistro0175.length; i++) {
            registro += this.u.preenche("0175")
                + this.u.preencheData(listaRegistro0175[i].dtAlt)
                + this.u.preenche(listaRegistro0175[i].nrCampo)
                + this.u.preenche(listaRegistro0175[i].contAnt)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
            this.numeroRegistro0175 += 1;
        }
        return registro;
    }

    gravaRegistro0190(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistro0190.length; i++) {
            registro += this.u.preenche("0190")
                + this.u.preenche(this.listaRegistro0190[i].unid)
                + this.u.preenche(this.listaRegistro0190[i].descr)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
        }
        return registro;
    }

    gravaRegistro0200(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistro0200.length; i++) {
            registro += this.u.preenche("0200")
                + this.u.preenche(this.listaRegistro0200[i].codItem)
                + this.u.preenche(this.listaRegistro0200[i].descrItem)
                + this.u.preenche(this.listaRegistro0200[i].codBarra)
                + this.u.preenche(this.listaRegistro0200[i].codAntItem)
                + this.u.preenche(this.listaRegistro0200[i].unidInv)
                + this.u.preenche(this.listaRegistro0200[i].tipoItem)
                + this.u.preenche(this.listaRegistro0200[i].codNcm)
                + this.u.preenche(this.listaRegistro0200[i].exIpi)
                + this.u.preenche(this.listaRegistro0200[i].codGen)
                + this.u.preenche(this.listaRegistro0200[i].codLst)
                + this.u.preencheDecimal(this.listaRegistro0200[i].aliqIcms)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
            registro += this.gravaRegistro0205(this.listaRegistro0200[i].registro0205List);
            registro += this.gravaRegistro0220(this.listaRegistro0200[i].registro0220List);
        }
        return registro;
    }

    private gravaRegistro0205(listaRegistro0205: Registro0205[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistro0205.length; i++) {
            registro += this.u.preenche("0205")
                + this.u.preenche(listaRegistro0205[i].descrAntItem)
                + this.u.preencheData(listaRegistro0205[i].dtIni)
                + this.u.preencheData(listaRegistro0205[i].dtFin)
                + this.u.preenche(listaRegistro0205[i].codAntItem)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
            this.numeroRegistro0205 += 1;
        }
        return registro;
    }

    private gravaRegistro0220(listaRegistro0220: Registro0220[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistro0220.length; i++) {
            registro += this.u.preenche("0220")
                + this.u.preenche(listaRegistro0220[i].unidConv)
                + this.u.preencheDecimal(listaRegistro0220[i].fatConv)
                + this.u.delimitador
                + this.u.crlf;

            this.registro0990.qtdLin0 = this.registro0990.qtdLin0 + 1;
            this.numeroRegistro0220 += 1;
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
