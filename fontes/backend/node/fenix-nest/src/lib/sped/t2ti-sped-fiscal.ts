/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Lib T2Ti Sped Fiscal - EFD

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

import { Bloco0 } from "./fiscal/bloco-0/bloco-0";
import { BlocoC } from "./fiscal/bloco-c/bloco-c";
import { BlocoE } from "./fiscal/bloco-e/bloco-e";
import { BlocoH } from "./fiscal/bloco-h/bloco-h";
import { Bloco1 } from "./fiscal/bloco-1/bloco-1";
import { Bloco9 } from "./fiscal/bloco-9/bloco-9";
import { Registro9900 } from "./fiscal/bloco-9/registro-9900";
import { writeFileSync } from "fs";

export class T2TiSpedFiscal {

    bloco0: Bloco0;
    blocoC: BlocoC;
    blocoE: BlocoE;
    blocoH: BlocoH;
    bloco1: Bloco1;
    bloco9: Bloco9;
    linhasArquivo: string[];

    constructor() {

        this.bloco0 = new Bloco0();
        this.blocoC = new BlocoC();
        this.blocoE = new BlocoE();
        this.blocoH = new BlocoH();
        this.bloco1 = new Bloco1();
        this.bloco9 = new Bloco9();
        this.linhasArquivo = [];
    }

    geraArquivoTxt(nomeArquivo: string) {
        try {
            //bloco 0
            this.linhasArquivo.push(this.bloco0.gravaRegistro0000());
            this.incluiRegistro9900("0000", 1);
            this.linhasArquivo.push(this.bloco0.gravaRegistro0001());
            this.incluiRegistro9900("0001", 1);
            this.linhasArquivo.push(this.bloco0.gravaRegistro0005());
            this.incluiRegistro9900("0005", 1);
            this.linhasArquivo.push(this.bloco0.gravaRegistro0100());
            this.incluiRegistro9900("0100", 1);
            if (this.bloco0.listaRegistro0150.length > 0) {
                this.linhasArquivo.push(this.bloco0.gravaRegistro0150());
                this.incluiRegistro9900("0150", this.bloco0.listaRegistro0150.length);
                if (this.bloco0.numeroRegistro0175 > 0) {
                    this.incluiRegistro9900("0175", this.bloco0.numeroRegistro0175);
                }
            }
            if (this.bloco0.listaRegistro0190.length > 0) {
                this.linhasArquivo.push(this.bloco0.gravaRegistro0190());
                this.incluiRegistro9900("0190", this.bloco0.listaRegistro0190.length);
            }
            if (this.bloco0.listaRegistro0200.length > 0) {
                this.linhasArquivo.push(this.bloco0.gravaRegistro0200());
                this.incluiRegistro9900("0200", this.bloco0.listaRegistro0200.length);
                if (this.bloco0.numeroRegistro0205 > 0) {
                    this.incluiRegistro9900("0205", this.bloco0.numeroRegistro0205);
                }
                if (this.bloco0.numeroRegistro0220 > 0) {
                    this.incluiRegistro9900("0220", this.bloco0.numeroRegistro0220);
                }
            }
            this.linhasArquivo.push(this.bloco0.gravaRegistro0990());
            this.incluiRegistro9900("0990", 1);

            //bloco C
            this.linhasArquivo.push(this.blocoC.gravaRegistroC001());
            this.incluiRegistro9900("C001", 1);
            if (this.blocoC.listaRegistroC100.length > 0) {
                this.linhasArquivo.push(this.blocoC.gravaRegistroC100());
                this.incluiRegistro9900("C100", this.blocoC.listaRegistroC100.length);
                if (this.blocoC.numeroRegistroC170 > 0) {
                    this.incluiRegistro9900("C170", this.blocoC.numeroRegistroC170);
                }
                if (this.blocoC.numeroRegistroC190 > 0) {
                    this.incluiRegistro9900("C190", this.blocoC.numeroRegistroC190);
                }
            }
            if (this.blocoC.listaRegistroC114.length > 0) {
                this.linhasArquivo.push(this.blocoC.gravaRegistroC114());
                this.incluiRegistro9900("C114", this.blocoC.listaRegistroC114.length);
            }
            if (this.blocoC.listaRegistroC300.length > 0) {
                this.linhasArquivo.push(this.blocoC.gravaRegistroC300());
                this.incluiRegistro9900("C300", this.blocoC.listaRegistroC300.length);
                if (this.blocoC.numeroRegistroC310 > 0) {
                    this.incluiRegistro9900("C310", this.blocoC.numeroRegistroC310);
                }
                if (this.blocoC.numeroRegistroC320 > 0) {
                    this.incluiRegistro9900("C320", this.blocoC.numeroRegistroC320);
                    if (this.blocoC.numeroRegistroC321 > 0) {
                        this.incluiRegistro9900("C321", this.blocoC.numeroRegistroC321);
                    }
                }
            }
            if (this.blocoC.listaRegistroC350.length > 0) {
                this.linhasArquivo.push(this.blocoC.gravaRegistroC350());
                this.incluiRegistro9900("C350", this.blocoC.listaRegistroC350.length);
                if (this.blocoC.numeroRegistroC370 > 0) {
                    this.incluiRegistro9900("C370", this.blocoC.numeroRegistroC370);
                }
                if (this.blocoC.numeroRegistroC390 > 0) {
                    this.incluiRegistro9900("C390", this.blocoC.numeroRegistroC390);
                }
            }
            if (this.blocoC.listaRegistroC400.length > 0) {
                this.linhasArquivo.push(this.blocoC.gravaRegistroC400());
                this.incluiRegistro9900("C400", this.blocoC.listaRegistroC400.length);
                if (this.blocoC.numeroRegistroC405 > 0) {
                    this.incluiRegistro9900("C405", this.blocoC.numeroRegistroC405);
                    if (this.blocoC.numeroRegistroC420 > 0) {
                        this.incluiRegistro9900("C420", this.blocoC.numeroRegistroC420);
                    }
                    if (this.blocoC.numeroRegistroC460 > 0) {
                        this.incluiRegistro9900("C460", this.blocoC.numeroRegistroC460);
                        if (this.blocoC.numeroRegistroC470 > 0) {
                            this.incluiRegistro9900("C470", this.blocoC.numeroRegistroC470);
                        }
                    }
                    if (this.blocoC.numeroRegistroC490 > 0) {
                        this.incluiRegistro9900("C490", this.blocoC.numeroRegistroC490);
                    }
                }
            }
            if (this.blocoC.listaRegistroC425.length > 0) {
                this.linhasArquivo.push(this.blocoC.gravaRegistroC425());
                this.incluiRegistro9900("C425", this.blocoC.listaRegistroC425.length);
            }
            this.linhasArquivo.push(this.blocoC.gravaRegistroC990());
            this.incluiRegistro9900("C990", 1);

            //bloco E
            this.linhasArquivo.push(this.blocoE.gravaRegistroE001());
            this.incluiRegistro9900("E001", 1);
            if (this.blocoE.listaRegistroE100.length > 0) {
                this.linhasArquivo.push(this.blocoE.gravaRegistroE100(this.bloco0.registro0000.codVer));
                this.incluiRegistro9900("E100", this.blocoE.listaRegistroE100.length);
                if (this.blocoE.numeroRegistroE110 > 0) {
                    this.incluiRegistro9900("E110", this.blocoE.numeroRegistroE110);
                    if (this.blocoE.numeroRegistroE116 > 0) {
                        this.incluiRegistro9900("E116", this.blocoE.numeroRegistroE116);
                    }
                }
            }
            this.linhasArquivo.push(this.blocoE.gravaRegistroE990());
            this.incluiRegistro9900("E990", 1);

            //bloco H
            this.linhasArquivo.push(this.blocoH.gravaRegistroH001());
            this.incluiRegistro9900("H001", 1);
            if (this.blocoH.listaRegistroH005.length > 0) {
                this.linhasArquivo.push(this.blocoH.gravaRegistroH005());
                this.incluiRegistro9900("H005", this.blocoH.numeroRegistroH005);
                if (this.blocoH.numeroRegistroH010 > 0) {
                    this.incluiRegistro9900("H010", this.blocoH.numeroRegistroH010);
                }
            }
            this.linhasArquivo.push(this.blocoH.gravaRegistroH990());
            this.incluiRegistro9900("H990", 1);

            //bloco 1
            this.linhasArquivo.push(this.bloco1.gravaRegistro1001());
            this.incluiRegistro9900("1001", 1);
            if (this.bloco1.listaRegistro1010.length > 0) {
                this.linhasArquivo.push(this.bloco1.gravaRegistro1010());
                this.incluiRegistro9900("1010", this.bloco1.numeroRegistro1010);
            }
            this.linhasArquivo.push(this.bloco1.gravaRegistro1990());
            this.incluiRegistro9900("1990", 1);

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
                + this.blocoC.registroC990.qtdLinC
                + this.blocoE.registroE990.qtdLinE
                + this.blocoH.registroH990.qtdLinH
                + this.bloco1.registro1990.qtdLin1
                + this.bloco9.registro9990.qtdLin9;
            this.linhasArquivo.push(this.bloco9.gravaRegistro9999());

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
