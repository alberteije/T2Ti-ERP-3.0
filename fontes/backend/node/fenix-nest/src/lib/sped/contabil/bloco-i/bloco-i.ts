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

import { RegistroI001 } from "./registro-i001";
import { RegistroI010 } from "./registro-i010";
import { RegistroI012 } from "./registro-i012";
import { RegistroI020 } from "./registro-i020";
import { RegistroI030 } from "./registro-i030";
import { RegistroI050 } from "./registro-i050";
import { RegistroI075 } from "./registro-i075";
import { RegistroI100 } from "./registro-i100";
import { RegistroI150 } from "./registro-i150";
import { RegistroI200 } from "./registro-i200";
import { RegistroI300 } from "./registro-i300";
import { RegistroI350 } from "./registro-i350";
import { RegistroI500 } from "./registro-i500";
import { RegistroI510 } from "./registro-i510";
import { RegistroI550 } from "./registro-i550";
import { RegistroI990 } from "./registro-i990";
import { RegistroI015 } from "./registro-i015";
import { RegistroI051 } from "./registro-i051";
import { RegistroI052 } from "./registro-i052";
import { RegistroI151 } from "./registro-i151";
import { RegistroI155 } from "./registro-i155";
import { RegistroI250 } from "./registro-i250";
import { RegistroI310 } from "./registro-i310";
import { RegistroI355 } from "./registro-i355";
import { RegistroI555 } from "./registro-i555";
import { SpedUtil } from "../../sped-util";

export class BlocoI {

    registroI001:  RegistroI001;
    registroI010:  RegistroI010;
    listaRegistroI012:  RegistroI012[];
    listaRegistroI020:  RegistroI020[];
    registroI030:  RegistroI030;
    listaRegistroI050:  RegistroI050[];
    listaRegistroI075:  RegistroI075[];
    listaRegistroI100:  RegistroI100[];
    listaRegistroI150:  RegistroI150[];
    listaRegistroI200:  RegistroI200[];
    listaRegistroI300:  RegistroI300[];
    listaRegistroI350:  RegistroI350[];
    listaRegistroI500:  RegistroI500[];
    listaRegistroI510:  RegistroI510[];
    listaRegistroI550:  RegistroI550[];
    registroI990:  RegistroI990;
    numeroRegistrosI015:  number;
    numeroRegistrosI051:  number;
    numeroRegistrosI052:  number;
    numeroRegistrosI151:  number;
    numeroRegistrosI155:  number;
    numeroRegistrosI250:  number;
    numeroRegistrosI310:  number;
    numeroRegistrosI355:  number;
    numeroRegistrosI555:  number;
    private u: SpedUtil;
    
    constructor() {
        this.registroI001 = new RegistroI001();
        this.registroI001.indDad = 1;
        this.registroI010 = new RegistroI010();
        this.listaRegistroI012 = [];
        this.listaRegistroI020 = [];
        this.registroI030 = new RegistroI030();
        this.listaRegistroI050 = [];
        this.listaRegistroI075 = [];
        this.listaRegistroI100 = [];
        this.listaRegistroI150 = [];
        this.listaRegistroI200 = [];
        this.listaRegistroI300 = [];
        this.listaRegistroI350 = [];
        this.listaRegistroI500 = [];
        this.listaRegistroI510 = [];
        this.listaRegistroI550 = [];

        this.registroI990 = new RegistroI990();
        this.registroI990.qtdLinI = 0;

        this.numeroRegistrosI015 = 0;
        this.numeroRegistrosI051 = 0;
        this.numeroRegistrosI052 = 0;
        this.numeroRegistrosI151 = 0;
        this.numeroRegistrosI155 = 0;
        this.numeroRegistrosI250 = 0;
        this.numeroRegistrosI310 = 0;
        this.numeroRegistrosI355 = 0;
        this.numeroRegistrosI555 = 0;

        this.u = new SpedUtil();
    }

    limpaRegistros() {
        this.listaRegistroI012 = [];
        this.listaRegistroI020 = [];
        this.listaRegistroI050 = [];
        this.listaRegistroI075 = [];
        this.listaRegistroI100 = [];
        this.listaRegistroI150 = [];
        this.listaRegistroI200 = [];
        this.listaRegistroI300 = [];
        this.listaRegistroI350 = [];
        this.listaRegistroI500 = [];
        this.listaRegistroI510 = [];
        this.listaRegistroI550 = [];

        this.registroI990.qtdLinI = 0;

        this.numeroRegistrosI015 = 0;
        this.numeroRegistrosI051 = 0;
        this.numeroRegistrosI052 = 0;
        this.numeroRegistrosI151 = 0;
        this.numeroRegistrosI155 = 0;
        this.numeroRegistrosI250 = 0;
        this.numeroRegistrosI310 = 0;
        this.numeroRegistrosI355 = 0;
        this.numeroRegistrosI555 = 0;
    }

    gravaRegistroI001(): string {
        this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        return this.u.preenche("I001")
                + this.u.preencheInteiro(this.registroI001.indDad)
                + this.u.delimitador
                + this.u.crlf;
    }

    gravaRegistroI010(): string {
        this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;

        return this.u.preenche("I010")
                + this.u.preenche(this.registroI010.indEsc)
                + this.u.preenche(this.registroI010.codVerLc)
                + this.u.delimitador
                + this.u.crlf;
    }

    gravaRegistroI012(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI012.length; i++) {
            registro += this.u.preenche("I012")
                    + this.u.preenche(this.listaRegistroI012[i].numOrd)
                    + this.u.preenche(this.listaRegistroI012[i].natLivr)
                    + this.u.preenche(this.listaRegistroI012[i].tipo)
                    + this.u.preenche(this.listaRegistroI012[i].codHashAux)
                    + this.u.delimitador
                    + this.u.crlf;

            registro += this.gravaRegistroI015(this.listaRegistroI012[i].registroI015List);

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }

        return registro;
    }

    gravaRegistroI015(listaRegistroI015: RegistroI015[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroI015.length; i++) {
            registro += this.u.preenche("I015")
                    + this.u.preenche(listaRegistroI015[i].codCtaRes)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
            this.numeroRegistrosI015 += 1;
        }
        return registro;
    }

    gravaRegistroI020(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI020.length; i++) {
            registro += this.u.preenche("I020")
                    + this.u.preenche(this.listaRegistroI020[i].regCod)
                    + this.u.preenche(this.listaRegistroI020[i].numAd)
                    + this.u.preenche(this.listaRegistroI020[i].campo)
                    + this.u.preenche(this.listaRegistroI020[i].descricao)
                    + this.u.preenche(this.listaRegistroI020[i].tipoDado)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }

        return registro;
    }

    gravaRegistroI030(): string {
        this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;

        return this.u.preenche("I030")
                + this.u.preenche("TERMO DE ABERTURA")
                + this.u.preenche(this.registroI030.numOrd)
                + this.u.preenche(this.registroI030.natLivr)
                + this.u.preencheInteiro(this.registroI030.qtdLin)
                + this.u.preenche(this.registroI030.nome)
                + this.u.preenche(this.registroI030.nire)
                + this.u.preenche(this.registroI030.cnpj)
                + this.u.preencheData(this.registroI030.dtArq)
                + this.u.preencheData(this.registroI030.dtArqConv)
                + this.u.preenche(this.registroI030.descMun)
                + this.u.delimitador
                + this.u.crlf;
    }

    gravaRegistroI050(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI050.length; i++) {
            registro += this.u.preenche("I050")
                    + this.u.preencheData(this.listaRegistroI050[i].dtAlt)
                    + this.u.preenche(this.listaRegistroI050[i].codNat)
                    + this.u.preenche(this.listaRegistroI050[i].indCta)
                    + this.u.preenche(this.listaRegistroI050[i].nivel)
                    + this.u.preenche(this.listaRegistroI050[i].codCta)
                    + this.u.preenche(this.listaRegistroI050[i].codCtaSup)
                    + this.u.preenche(this.listaRegistroI050[i].cta)
                    + this.u.delimitador
                    + this.u.crlf;

            registro += this.gravaRegistroI051(this.listaRegistroI050[i].registroi051List);
            registro += this.gravaRegistroI052(this.listaRegistroI050[i].registroi052List);

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }

        return registro;
    }

    gravaRegistroI051(listaRegistroI051: RegistroI051[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroI051.length; i++) {
            registro += this.u.preenche("I051")
                    + this.u.preenche(listaRegistroI051[i].codEntRef)
                    + this.u.preenche(listaRegistroI051[i].codCcus)
                    + this.u.preenche(listaRegistroI051[i].codCtaRef)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
            this.numeroRegistrosI051 += 1;
        }
        return registro;
    }

    gravaRegistroI052(listaRegistroI052: RegistroI052[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroI052.length; i++) {
            registro += this.u.preenche("I052")
                    + this.u.preenche(listaRegistroI052[i].codCcus)
                    + this.u.preenche(listaRegistroI052[i].codAgl)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
            this.numeroRegistrosI052 += 1;
        }
        return registro;
    }

    gravaRegistroI075(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI075.length; i++) {
            registro += this.u.preenche("I075")
                    + this.u.preenche(this.listaRegistroI075[i].codHist)
                    + this.u.preenche(this.listaRegistroI075[i].descrHist)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }
        return registro;
    }

    gravaRegistroI100(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI100.length; i++) {
            registro += this.u.preenche("I100")
                    + this.u.preencheData(this.listaRegistroI100[i].dtAlt)
                    + this.u.preenche(this.listaRegistroI100[i].codCcus)
                    + this.u.preenche(this.listaRegistroI100[i].ccus)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }
        return registro;
    }

    gravaRegistroI150(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI150.length; i++) {
            registro += this.u.preenche("I150")
                    + this.u.preencheData(this.listaRegistroI150[i].dtIni)
                    + this.u.preencheData(this.listaRegistroI150[i].dtFin)
                    + this.u.delimitador
                    + this.u.crlf;

            registro += this.gravaRegistroI151(this.listaRegistroI150[i].registroi151List);
            registro += this.gravaRegistroI155(this.listaRegistroI150[i].registroi155List);

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }

        return registro;
    }

    gravaRegistroI151(listaRegistroI151: RegistroI151[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroI151.length; i++) {
            registro += this.u.preenche("I151")
                    + this.u.preenche(listaRegistroI151[i].assinDig)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
            this.numeroRegistrosI151 += 1;
        }
        return registro;
    }

    gravaRegistroI155(listaRegistroI155: RegistroI155[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroI155.length; i++) {
            registro += this.u.preenche("I155")
                    + this.u.preenche(listaRegistroI155[i].codCta)
                    + this.u.preenche(listaRegistroI155[i].codCcus)
                    + this.u.preencheDecimal(listaRegistroI155[i].vlSldIni)
                    + this.u.preenche(listaRegistroI155[i].indDcIni)
                    + this.u.preencheDecimal(listaRegistroI155[i].vlDeb)
                    + this.u.preencheDecimal(listaRegistroI155[i].vlCred)
                    + this.u.preencheDecimal(listaRegistroI155[i].vlSldFin)
                    + this.u.preenche(listaRegistroI155[i].indDcFin)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
            this.numeroRegistrosI155 += 1;
        }
        return registro;
    }

    gravaRegistroI200(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI200.length; i++) {
            registro += this.u.preenche("I200")
                    + this.u.preenche(this.listaRegistroI200[i].numLcto)
                    + this.u.preencheData(this.listaRegistroI200[i].dtLcto)
                    + this.u.preencheDecimal(this.listaRegistroI200[i].vlLcto)
                    + this.u.preenche(this.listaRegistroI200[i].indLcto)
                    + this.u.delimitador
                    + this.u.crlf;

            registro += this.gravaRegistroI250(this.listaRegistroI200[i].registroi250List);

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }

        return registro;
    }

    gravaRegistroI250(listaRegistroI250: RegistroI250[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroI250.length; i++) {
            registro += this.u.preenche("I250")
                    + this.u.preenche(listaRegistroI250[i].codCta)
                    + this.u.preenche(listaRegistroI250[i].codCcus)
                    + this.u.preencheDecimal(listaRegistroI250[i].vlDc)
                    + this.u.preenche(listaRegistroI250[i].indDc)
                    + this.u.preenche(listaRegistroI250[i].numArq)
                    + this.u.preenche(listaRegistroI250[i].codHistPad)
                    + this.u.preenche(listaRegistroI250[i].hist)
                    + this.u.preenche(listaRegistroI250[i].codPart)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
            this.numeroRegistrosI250 += 1;
        }
        return registro;
    }

    gravaRegistroI300(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI300.length; i++) {
            registro += this.u.preenche("I300")
                    + this.u.preencheData(this.listaRegistroI300[i].dtBcte)
                    + this.u.delimitador
                    + this.u.crlf;

            registro += this.gravaRegistroI310(this.listaRegistroI300[i].registroi310List);

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }

        return registro;
    }

    private gravaRegistroI310(listaRegistroI310: RegistroI310[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroI310.length; i++) {
            registro += this.u.preenche("I310")
                    + this.u.preenche(listaRegistroI310[i].codCta)
                    + this.u.preenche(listaRegistroI310[i].codCcus)
                    + this.u.preencheDecimal(listaRegistroI310[i].valDebd)
                    + this.u.preencheDecimal(listaRegistroI310[i].valCred)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
            this.numeroRegistrosI310 += 1;
        }
        return registro;
    }

    gravaRegistroI350(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI350.length; i++) {
            registro += this.u.preenche("I350")
                    + this.u.preencheData(this.listaRegistroI350[i].dtRes)
                    + this.u.delimitador
                    + this.u.crlf;

            registro += this.gravaRegistroI355(this.listaRegistroI350[i].registroi355List);

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }

        return registro;
    }

    private gravaRegistroI355(listaRegistroI355: RegistroI355[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroI355.length; i++) {
            registro += this.u.preenche("I355")
                    + this.u.preenche(listaRegistroI355[i].codCta)
                    + this.u.preenche(listaRegistroI355[i].codCcus)
                    + this.u.preencheDecimal(listaRegistroI355[i].vlCta)
                    + this.u.preenche(listaRegistroI355[i].indDc)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
            this.numeroRegistrosI355 += 1;
        }
        return registro;
    }

    gravaRegistroI500(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI500.length; i++) {
            registro += this.u.preenche("I500")
                    + this.u.preencheInteiro(this.listaRegistroI500[i].tamFonte)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }
        return registro;
    }

    gravaRegistroI510(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI510.length; i++) {
            registro += this.u.preenche("I510")
                    + this.u.preenche(this.listaRegistroI510[i].nmCampo)
                    + this.u.preenche(this.listaRegistroI510[i].descCampo)
                    + this.u.preenche(this.listaRegistroI510[i].tipoCampo)
                    + this.u.preencheInteiro(this.listaRegistroI510[i].tamCampo)
                    + this.u.preencheInteiro(this.listaRegistroI510[i].decCampo)
                    + this.u.preencheInteiro(this.listaRegistroI510[i].colCampo)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }
        return registro;
    }

    gravaRegistroI550(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroI550.length; i++) {
            registro += this.u.preenche("I550")
                    + this.u.preenche(this.listaRegistroI550[i].rzCont)
                    + this.u.delimitador
                    + this.u.crlf;

            registro += this.gravaRegistroI555(this.listaRegistroI550[i].registroi555List);

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
        }

        return registro;
    }

    private gravaRegistroI555(listaRegistroI555: RegistroI555[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroI555.length; i++) {
            registro += this.u.preenche("I555")
                    + this.u.preenche(listaRegistroI555[i].rzContTot)
                    + this.u.delimitador
                    + this.u.crlf;

            this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;
            this.numeroRegistrosI555 += 1;
        }
        return registro;
    }

    gravaRegistroI990(): string {
        this.registroI990.qtdLinI = this.registroI990.qtdLinI + 1;

        return this.u.preenche("I990")
                + this.u.preencheInteiro(this.registroI990.qtdLinI)
                + this.u.delimitador
                + this.u.crlf;
    }

}
