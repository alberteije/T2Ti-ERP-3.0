/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Lib T2Ti Sped Contábil - ECD

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

import { Bloco0 } from "./contabil/bloco-0/bloco-0";
import { BlocoI } from "./contabil/bloco-i/bloco-i";
import { BlocoJ } from "./contabil/bloco-j/bloco-j";
import { Bloco9 } from "./contabil/bloco-9/bloco-9";
import { Registro9900 } from "./contabil/bloco-9/registro-9900";
import { writeFileSync } from "fs";

export class T2TiSpedContabil {

    bloco0: Bloco0;
    blocoI: BlocoI;
    blocoJ: BlocoJ;
    bloco9: Bloco9;
    linhasArquivo: string[];
    private indexI030: number;
    private indexJ900: number;

    constructor() {
        this.bloco0 = new Bloco0();
        this.blocoI = new BlocoI();
        this.blocoJ = new BlocoJ();
        this.bloco9 = new Bloco9();
        this.linhasArquivo = [];
    }

    limpaRegistros() {
        this.bloco0.limpaRegistros();
        this.blocoI.limpaRegistros();
        this.blocoJ.limpaRegistros();
        this.bloco9.limpaRegistros();
    }

    geraArquivoTxt(nomeArquivo: string) {
        try {
            this.bloco9.listaRegistro9900 = [];

            //bloco 0
            this.linhasArquivo.push(this.bloco0.gravaRegistro0000());
            this.incluiRegistro9900("0000", 1);
            this.linhasArquivo.push(this.bloco0.gravaRegistro0001());
            this.incluiRegistro9900("0001", 1);
            if (this.bloco0.listaRegistro0007.length > 0) {
                this.linhasArquivo.push(this.bloco0.gravaRegistro0007());
                this.incluiRegistro9900("0007", this.bloco0.listaRegistro0007.length);
            }
            if (this.bloco0.listaRegistro0020.length > 0) {
                this.linhasArquivo.push(this.bloco0.gravaRegistro0020());
                this.incluiRegistro9900("0020", this.bloco0.listaRegistro0020.length);
            }
            if (this.bloco0.listaRegistro0150.length > 0) {
                this.linhasArquivo.push(this.bloco0.gravaRegistro0150());
                this.incluiRegistro9900("0150", this.bloco0.listaRegistro0150.length);
            }
            if (this.bloco0.listaRegistro0180.length > 0) {
                this.linhasArquivo.push(this.bloco0.gravaRegistro0180());
                this.incluiRegistro9900("0180", this.bloco0.listaRegistro0180.length);
            }
            this.linhasArquivo.push(this.bloco0.gravaRegistro0990());
            this.incluiRegistro9900("0990", 1);

            //bloco I
            this.linhasArquivo.push(this.blocoI.gravaRegistroI001());
            this.incluiRegistro9900("I001", 1);
            this.linhasArquivo.push(this.blocoI.gravaRegistroI010());
            this.incluiRegistro9900("I010", 1);
            if (this.blocoI.listaRegistroI012.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI012());
                this.incluiRegistro9900("I012", this.blocoI.listaRegistroI012.length);
                if (this.blocoI.numeroRegistrosI015 > 0) {
                    this.incluiRegistro9900("I015", this.blocoI.numeroRegistrosI015);
                }
            }
            if (this.blocoI.listaRegistroI020.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI020());
                this.incluiRegistro9900("I020", this.blocoI.listaRegistroI020.length);
            }

            this.linhasArquivo.push(this.blocoI.gravaRegistroI030());
            this.incluiRegistro9900("I030", 1);
            this.indexI030 = this.linhasArquivo.length - 1;

            if (this.blocoI.listaRegistroI050.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI050());
                this.incluiRegistro9900("I050", this.blocoI.listaRegistroI050.length);
                if (this.blocoI.numeroRegistrosI051 > 0) {
                    this.incluiRegistro9900("I051", this.blocoI.numeroRegistrosI051);
                }
                if (this.blocoI.numeroRegistrosI052 > 0) {
                    this.incluiRegistro9900("I052", this.blocoI.numeroRegistrosI052);
                }
            }
            if (this.blocoI.listaRegistroI075.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI075());
                this.incluiRegistro9900("I075", this.blocoI.listaRegistroI075.length);
            }
            if (this.blocoI.listaRegistroI100.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI100());
                this.incluiRegistro9900("I100", this.blocoI.listaRegistroI100.length);
            }
            if (this.blocoI.listaRegistroI150.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI150());
                this.incluiRegistro9900("I150", this.blocoI.listaRegistroI150.length);
                if (this.blocoI.numeroRegistrosI151 > 0) {
                    this.incluiRegistro9900("I151", this.blocoI.numeroRegistrosI151);
                }
                if (this.blocoI.numeroRegistrosI155 > 0) {
                    this.incluiRegistro9900("I155", this.blocoI.numeroRegistrosI155);
                }
            }
            if (this.blocoI.listaRegistroI200.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI200());
                this.incluiRegistro9900("I200", this.blocoI.listaRegistroI200.length);
                if (this.blocoI.numeroRegistrosI250 > 0) {
                    this.incluiRegistro9900("I250", this.blocoI.numeroRegistrosI250);
                }
            }
            if (this.blocoI.listaRegistroI300.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI300());
                this.incluiRegistro9900("I300", this.blocoI.listaRegistroI300.length);
                if (this.blocoI.numeroRegistrosI310 > 0) {
                    this.incluiRegistro9900("I310", this.blocoI.numeroRegistrosI310);
                }
            }
            if (this.blocoI.listaRegistroI350.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI350());
                this.incluiRegistro9900("I350", this.blocoI.listaRegistroI350.length);
                if (this.blocoI.numeroRegistrosI355 > 0) {
                    this.incluiRegistro9900("I355", this.blocoI.numeroRegistrosI355);
                }
            }
            if (this.blocoI.listaRegistroI500.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI500());
                this.incluiRegistro9900("I500", this.blocoI.listaRegistroI500.length);
            }
            if (this.blocoI.listaRegistroI510.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI510());
                this.incluiRegistro9900("I510", this.blocoI.listaRegistroI510.length);
            }
            if (this.blocoI.listaRegistroI550.length > 0) {
                this.linhasArquivo.push(this.blocoI.gravaRegistroI550());
                this.incluiRegistro9900("I550", this.blocoI.listaRegistroI550.length);
                if (this.blocoI.numeroRegistrosI555 > 0) {
                    this.incluiRegistro9900("I555", this.blocoI.numeroRegistrosI555);
                }
            }
            this.linhasArquivo.push(this.blocoI.gravaRegistroI990());
            this.incluiRegistro9900("I990", 1);

            //bloco J
            this.linhasArquivo.push(this.blocoJ.gravaRegistroJ001());
            this.incluiRegistro9900("J001", 1);
            if (this.blocoJ.listaRegistroJ005.length > 0) {
                this.linhasArquivo.push(this.blocoJ.gravaRegistroJ005());
                this.incluiRegistro9900("J005", this.blocoJ.listaRegistroJ005.length);
                if (this.blocoJ.numeroRegistrosJ100 > 0) {
                    this.incluiRegistro9900("J100", this.blocoJ.numeroRegistrosJ100);
                }
                if (this.blocoJ.numeroRegistrosJ150 > 0) {
                    this.incluiRegistro9900("J150", this.blocoJ.numeroRegistrosJ150);
                }
            }
            if (this.blocoJ.listaRegistroJ800.length > 0) {
                this.linhasArquivo.push(this.blocoJ.gravaRegistroJ800());
                this.incluiRegistro9900("J800", this.blocoJ.listaRegistroJ800.length);
            }
            this.linhasArquivo.push(this.blocoJ.gravaRegistroJ900());
            this.incluiRegistro9900("J900", 1);
            this.indexJ900 = this.linhasArquivo.length - 1;

            if (this.blocoJ.listaRegistroJ930.length > 0) {
                this.linhasArquivo.push(this.blocoJ.gravaRegistroJ930());
                this.incluiRegistro9900("J930", this.blocoJ.listaRegistroJ930.length);
            }
            this.linhasArquivo.push(this.blocoJ.gravaRegistroJ990());
            this.incluiRegistro9900("J990", 1);

            //bloco 9
            this.linhasArquivo.push(this.bloco9.gravaRegistro9001());
            this.incluiRegistro9900("9001", 1);

            this.incluiRegistro9900("9900", this.bloco9.listaRegistro9900.length + 2);
            this.incluiRegistro9900("9990", 1);
            this.incluiRegistro9900("9999", 1);
            this.linhasArquivo.push(this.bloco9.gravaRegistro9900());
            this.linhasArquivo.push(this.bloco9.gravaRegistro9990());

            this.bloco9.registro9999.qtdLin =
                this.bloco0.registro0990.qtdLin0
                + this.blocoI.registroI990.qtdLinI
                + this.blocoJ.registroJ990.qtdLinJ
                + this.bloco9.registro9990.qtdLin9;
            this.linhasArquivo.push(this.bloco9.gravaRegistro9999());

            this.blocoI.registroI030.qtdLin = this.bloco9.registro9999.qtdLin;
            this.linhasArquivo[this.indexI030] = this.blocoI.gravaRegistroI030();

            this.blocoJ.registroJ900.qtdLin = this.bloco9.registro9999.qtdLin;
            this.linhasArquivo[this.indexJ900] = this.blocoJ.gravaRegistroJ900();

            // writeFileSync(nomeArquivo, this.linhasArquivo);
        } catch (e) {
            console.log(e);
            //TODO: tratar erro ao gerar o arquivo
        }
    }

    incluiRegistro9900(registro: string, quantidade: number) {
        let registro9900: Registro9900 = new Registro9900();
        registro9900.regBlc = registro;
        registro9900.qtdRegBlc = quantidade;

        this.bloco9.listaRegistro9900.push(registro9900);
    }

}
