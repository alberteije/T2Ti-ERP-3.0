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

import { RegistroC001 } from "./registro-c001";
import { RegistroC100 } from "./registro-c100";
import { RegistroC114 } from "./registro-c114";
import { RegistroC300 } from "./registro-c300";
import { RegistroC350 } from "./registro-c350";
import { RegistroC400 } from "./registro-c400";
import { RegistroC425 } from "./registro-c425";
import { RegistroC990 } from "./registro-c990";
import { RegistroC170 } from "./registro-c170";
import { RegistroC190 } from "./registro-c190";
import { RegistroC310 } from "./registro-c310";
import { RegistroC320 } from "./registro-c320";
import { RegistroC321 } from "./registro-c321";
import { RegistroC370 } from "./registro-c370";
import { RegistroC390 } from "./registro-c390";
import { RegistroC405 } from "./registro-c405";
import { RegistroC420 } from "./registro-c420";
import { RegistroC460 } from "./registro-c460";
import { RegistroC470 } from "./registro-c470";
import { RegistroC490 } from "./registro-c490";
import { SpedUtil } from "../../sped-util";

export class BlocoC {

    registroC001: RegistroC001;
    listaRegistroC100: RegistroC100[];
    listaRegistroC114: RegistroC114[];
    listaRegistroC300: RegistroC300[];
    listaRegistroC350: RegistroC350[];
    listaRegistroC400: RegistroC400[];
    listaRegistroC425: RegistroC425[];
    registroC990: RegistroC990;
    numeroRegistroC170: number;
    numeroRegistroC190: number;
    numeroRegistroC310: number;
    numeroRegistroC320: number;
    numeroRegistroC321: number;
    numeroRegistroC370: number;
    numeroRegistroC390: number;
    numeroRegistroC405: number;
    numeroRegistroC420: number;
    numeroRegistroC460: number;
    numeroRegistroC470: number;
    numeroRegistroC490: number;
    u: SpedUtil;

    constructor() {
        this.registroC001 = new RegistroC001();
        this.registroC001.indMov = 1;

        this.listaRegistroC100 = [];
        this.listaRegistroC114 = [];
        this.listaRegistroC300 = [];
        this.listaRegistroC350 = [];
        this.listaRegistroC400 = [];
        this.listaRegistroC425 = [];

        this.registroC990 = new RegistroC990();
        this.registroC990.qtdLinC = 0;

        this.numeroRegistroC170 = 0;
        this.numeroRegistroC190 = 0;
        this.numeroRegistroC310 = 0;
        this.numeroRegistroC320 = 0;
        this.numeroRegistroC321 = 0;
        this.numeroRegistroC370 = 0;
        this.numeroRegistroC390 = 0;
        this.numeroRegistroC405 = 0;
        this.numeroRegistroC420 = 0;
        this.numeroRegistroC460 = 0;
        this.numeroRegistroC470 = 0;
        this.numeroRegistroC490 = 0;

        this.u = new SpedUtil();
    }

    gravaRegistroC001(): string {
        this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;

        return this.u.preenche("C001")
            + this.u.preencheInteiro(this.registroC001.indMov)
            + this.u.delimitador
            + this.u.crlf;
    }

    gravaRegistroC100(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroC100.length; i++) {
            registro += this.u.preenche("C100")
                + this.u.preenche(this.listaRegistroC100[i].indOper)
                + this.u.preenche(this.listaRegistroC100[i].indEmit)
                + this.u.preenche(this.listaRegistroC100[i].codPart)
                + this.u.preenche(this.listaRegistroC100[i].codMod)
                + this.u.preenche(this.listaRegistroC100[i].codSit)
                + this.u.preenche(this.listaRegistroC100[i].ser)
                + this.u.preenche(this.listaRegistroC100[i].numDoc)
                + this.u.preenche(this.listaRegistroC100[i].chvNfe)
                + this.u.preencheData(this.listaRegistroC100[i].dtDoc)
                + this.u.preencheData(this.listaRegistroC100[i].dtES)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlDoc)
                + this.u.preenche(this.listaRegistroC100[i].indPgto)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlDesc)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlAbatNt)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlMerc)
                + this.u.preenche(this.listaRegistroC100[i].indFrt)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlFrt)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlSeg)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlOutDa)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlBcIcms)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlIcms)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlBcIcmsSt)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlIcmsSt)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlIpi)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlPis)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlCofins)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlPisSt)
                + this.u.preencheDecimal(this.listaRegistroC100[i].vlCofinsSt)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            registro += this.gravaRegistroC170(this.listaRegistroC100[i].registroC170List);
            registro += this.gravaRegistroC190(this.listaRegistroC100[i].registroC190List);
        }
        return registro;
    }

    gravaRegistroC114(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroC114.length; i++) {
            registro += this.u.preenche("C114")
                + this.u.preenche(this.listaRegistroC114[i].codMod)
                + this.u.preenche(this.listaRegistroC114[i].ecfFab)
                + this.u.preenche(this.listaRegistroC114[i].ecfCx)
                + this.u.preenche(this.listaRegistroC114[i].numDoc)
                + this.u.preencheData(this.listaRegistroC114[i].dtDoc)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
        }
        return registro;
    }

    private gravaRegistroC170(listaRegistroC170: RegistroC170[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC170.length; i++) {
            registro += this.u.preenche("C170")
                + this.u.preenche(listaRegistroC170[i].numItem)
                + this.u.preenche(listaRegistroC170[i].codItem)
                + this.u.preenche(listaRegistroC170[i].descrCompl)
                + this.u.preencheDecimal(listaRegistroC170[i].qtd)
                + this.u.preenche(listaRegistroC170[i].unid)
                + this.u.preencheDecimal(listaRegistroC170[i].vlItem)
                + this.u.preencheDecimal(listaRegistroC170[i].vlDesc)
                + this.u.preencheInteiro(listaRegistroC170[i].indMov)
                + this.u.preenche(listaRegistroC170[i].cstIcms)
                + this.u.preenche(listaRegistroC170[i].cfop)
                + this.u.preenche(listaRegistroC170[i].codNat)
                + this.u.preencheDecimal(listaRegistroC170[i].vlBcIcms)
                + this.u.preencheDecimal(listaRegistroC170[i].aliqIcms)
                + this.u.preencheDecimal(listaRegistroC170[i].vlIcms)
                + this.u.preencheDecimal(listaRegistroC170[i].vlBcIcmsSt)
                + this.u.preencheDecimal(listaRegistroC170[i].aliqSt)
                + this.u.preencheDecimal(listaRegistroC170[i].vlIcmsSt)
                + this.u.preencheDecimal(listaRegistroC170[i].indApur)
                + this.u.preenche(listaRegistroC170[i].cstIpi)
                + this.u.preenche(listaRegistroC170[i].codEnq)
                + this.u.preencheDecimal(listaRegistroC170[i].vlBcIpi)
                + this.u.preencheDecimal(listaRegistroC170[i].aliqIpi)
                + this.u.preencheDecimal(listaRegistroC170[i].vlIpi)
                + this.u.preenche(listaRegistroC170[i].cstPis)
                + this.u.preencheDecimal(listaRegistroC170[i].vlBcPis)
                + this.u.preencheDecimal(listaRegistroC170[i].aliqPisPerc)
                + this.u.preencheDecimal(listaRegistroC170[i].quantBcPis)
                + this.u.preencheDecimal(listaRegistroC170[i].aliqPisR)
                + this.u.preencheDecimal(listaRegistroC170[i].vlPis)
                + this.u.preenche(listaRegistroC170[i].cstCofins)
                + this.u.preencheDecimal(listaRegistroC170[i].vlBcCofins)
                + this.u.preencheDecimal(listaRegistroC170[i].aliqCofinsPerc)
                + this.u.preencheDecimal(listaRegistroC170[i].quantBcCofins)
                + this.u.preencheDecimal(listaRegistroC170[i].aliqCofinsR)
                + this.u.preencheDecimal(listaRegistroC170[i].vlCofins)
                + this.u.preenche(listaRegistroC170[i].codCta)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC170 += 1;
        }
        return registro;
    }

    private gravaRegistroC190(listaRegistroC190: RegistroC190[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC190.length; i++) {
            registro += this.u.preenche("C190")
                + this.u.preenche(listaRegistroC190[i].cstIcms)
                + this.u.preenche(listaRegistroC190[i].cfop)
                + this.u.preencheDecimal(listaRegistroC190[i].aliqIcms)
                + this.u.preencheDecimal(listaRegistroC190[i].vlOpr)
                + this.u.preencheDecimal(listaRegistroC190[i].vlBcIcms)
                + this.u.preencheDecimal(listaRegistroC190[i].vlIcms)
                + this.u.preencheDecimal(listaRegistroC190[i].vlBcIcmsSt)
                + this.u.preencheDecimal(listaRegistroC190[i].vlIcmsSt)
                + this.u.preencheDecimal(listaRegistroC190[i].vlRedBc)
                + this.u.preencheDecimal(listaRegistroC190[i].vlIpi)
                + this.u.preenche(listaRegistroC190[i].codObs)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC190 += 1;
        }
        return registro;
    }

    gravaRegistroC300(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroC300.length; i++) {
            registro += this.u.preenche("C300")
                + this.u.preenche(this.listaRegistroC300[i].codMod)
                + this.u.preenche(this.listaRegistroC300[i].ser)
                + this.u.preenche(this.listaRegistroC300[i].sub)
                + this.u.preenche(this.listaRegistroC300[i].numDocIni)
                + this.u.preenche(this.listaRegistroC300[i].numDocFin)
                + this.u.preencheData(this.listaRegistroC300[i].dtDoc)
                + this.u.preencheDecimal(this.listaRegistroC300[i].vlDoc)
                + this.u.preencheDecimal(this.listaRegistroC300[i].vlPis)
                + this.u.preencheDecimal(this.listaRegistroC300[i].vlCofins)
                + this.u.preenche(this.listaRegistroC300[i].codCta)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            registro += this.gravaRegistroC310(this.listaRegistroC300[i].registroC310List);
            registro += this.gravaRegistroC320(this.listaRegistroC300[i].registroC320List);
        }
        return registro;
    }

    private gravaRegistroC310(listaRegistroC310: RegistroC310[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC310.length; i++) {
            registro += this.u.preenche("C310")
                + this.u.preenche(listaRegistroC310[i].numDocCanc)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC310 += 1;
        }
        return registro;
    }

    private gravaRegistroC320(listaRegistroC320: RegistroC320[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC320.length; i++) {
            registro += this.u.preenche("C320")
                + this.u.preenche(listaRegistroC320[i].cstIcms)
                + this.u.preenche(listaRegistroC320[i].cfop)
                + this.u.preencheDecimal(listaRegistroC320[i].aliqIcms)
                + this.u.preencheDecimal(listaRegistroC320[i].vlOpr)
                + this.u.preencheDecimal(listaRegistroC320[i].vlBcIcms)
                + this.u.preencheDecimal(listaRegistroC320[i].vlIcms)
                + this.u.preencheDecimal(listaRegistroC320[i].vlRedBc)
                + this.u.preenche(listaRegistroC320[i].codObs)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC320 += 1;
            registro += this.gravaRegistroC321(listaRegistroC320[i].registroC321List);
        }
        return registro;
    }

    private gravaRegistroC321(listaRegistroC321: RegistroC321[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC321.length; i++) {
            registro += this.u.preenche("C321")
                + this.u.preenche(listaRegistroC321[i].codItem)
                + this.u.preencheDecimal(listaRegistroC321[i].qtd)
                + this.u.preenche(listaRegistroC321[i].unid)
                + this.u.preencheDecimal(listaRegistroC321[i].vlItem)
                + this.u.preencheDecimal(listaRegistroC321[i].vlDesc)
                + this.u.preencheDecimal(listaRegistroC321[i].vlBcIcms)
                + this.u.preencheDecimal(listaRegistroC321[i].vlIcms)
                + this.u.preencheDecimal(listaRegistroC321[i].vlPis)
                + this.u.preencheDecimal(listaRegistroC321[i].vlCofins)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC321 += 1;
        }
        return registro;
    }

    gravaRegistroC350(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroC350.length; i++) {
            registro += this.u.preenche("C350")
                + this.u.preenche(this.listaRegistroC350[i].ser)
                + this.u.preenche(this.listaRegistroC350[i].subSer)
                + this.u.preenche(this.listaRegistroC350[i].numDoc)
                + this.u.preencheData(this.listaRegistroC350[i].dtDoc)
                + this.u.preenche(this.listaRegistroC350[i].cnpjCpf)
                + this.u.preencheDecimal(this.listaRegistroC350[i].vlMerc)
                + this.u.preencheDecimal(this.listaRegistroC350[i].vlDoc)
                + this.u.preencheDecimal(this.listaRegistroC350[i].vlDesc)
                + this.u.preencheDecimal(this.listaRegistroC350[i].vlPis)
                + this.u.preenche(this.listaRegistroC350[i].codCta)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            registro += this.gravaRegistroC370(this.listaRegistroC350[i].registroC370List);
            registro += this.gravaRegistroC390(this.listaRegistroC350[i].registroC390List);
        }
        return registro;
    }

    private gravaRegistroC370(listaRegistroC370: RegistroC370[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC370.length; i++) {
            registro += this.u.preenche("C370")
                + this.u.preenche(listaRegistroC370[i].numItem)
                + this.u.preenche(listaRegistroC370[i].codItem)
                + this.u.preencheDecimal(listaRegistroC370[i].qtd)
                + this.u.preenche(listaRegistroC370[i].unid)
                + this.u.preencheDecimal(listaRegistroC370[i].vlItem)
                + this.u.preencheDecimal(listaRegistroC370[i].vlDesc)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC370 += 1;
        }
        return registro;
    }

    private gravaRegistroC390(listaRegistroC390: RegistroC390[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC390.length; i++) {
            registro += this.u.preenche("C390")
                + this.u.preenche(listaRegistroC390[i].cstIcms)
                + this.u.preenche(listaRegistroC390[i].cfop)
                + this.u.preencheDecimal(listaRegistroC390[i].aliqIcms)
                + this.u.preencheDecimal(listaRegistroC390[i].vlOpr)
                + this.u.preencheDecimal(listaRegistroC390[i].vlBcIcms)
                + this.u.preencheDecimal(listaRegistroC390[i].vlIcms)
                + this.u.preencheDecimal(listaRegistroC390[i].vlRedBc)
                + this.u.preenche(listaRegistroC390[i].codObs)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC390 += 1;
        }
        return registro;
    }

    gravaRegistroC400(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroC400.length; i++) {
            registro += this.u.preenche("C400")
                + this.u.preenche(this.listaRegistroC400[i].codMod)
                + this.u.preenche(this.listaRegistroC400[i].ecfMod)
                + this.u.preenche(this.listaRegistroC400[i].ecfFab)
                + this.u.preenche(this.listaRegistroC400[i].ecfCx)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            registro += this.gravaRegistroC405(this.listaRegistroC400[i].registroC405List);
        }
        return registro;
    }

    private gravaRegistroC405(listaRegistroC405: RegistroC405[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC405.length; i++) {
            registro += this.u.preenche("C405")
                + this.u.preencheData(listaRegistroC405[i].dtDoc)
                + this.u.preencheInteiro(listaRegistroC405[i].cro)
                + this.u.preencheInteiro(listaRegistroC405[i].crz)
                + this.u.preencheInteiro(listaRegistroC405[i].numCooFin)
                + this.u.preencheDecimal(listaRegistroC405[i].gtFin)
                + this.u.preencheDecimal(listaRegistroC405[i].vlBrt)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC405 += 1;
            registro += this.gravaRegistroC420(listaRegistroC405[i].registroC420List);
            registro += this.gravaRegistroC460(listaRegistroC405[i].registroC460List);
            registro += this.gravaRegistroC490(listaRegistroC405[i].registroC490List);
        }
        return registro;
    }

    private gravaRegistroC420(listaRegistroC420: RegistroC420[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC420.length; i++) {
            registro += this.u.preenche("C420")
                + this.u.preenche(listaRegistroC420[i].codTotPar)
                + this.u.preencheDecimal(listaRegistroC420[i].vlrAcumTot)
                + this.u.preencheInteiro(listaRegistroC420[i].nrTot)
                + this.u.preenche(listaRegistroC420[i].descrNrTot)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC420 += 1;
        }
        return registro;
    }

    gravaRegistroC425(): string {
        let registro: string = "";
        for (let i: number = 0; i < this.listaRegistroC425.length; i++) {
            registro += this.u.preenche("C425")
                + this.u.preenche(this.listaRegistroC425[i].codItem)
                + this.u.preencheDecimal(this.listaRegistroC425[i].qtd)
                + this.u.preenche(this.listaRegistroC425[i].unid)
                + this.u.preencheDecimal(this.listaRegistroC425[i].vlItem)
                + this.u.preencheDecimal(this.listaRegistroC425[i].vlPis)
                + this.u.preencheDecimal(this.listaRegistroC425[i].vlCofins)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
        }
        return registro;
    }

    private gravaRegistroC460(listaRegistroC460: RegistroC460[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC460.length; i++) {
            registro += this.u.preenche("C460")
                + this.u.preenche(listaRegistroC460[i].codMod)
                + this.u.preenche(listaRegistroC460[i].codSit)
                + this.u.preenche(listaRegistroC460[i].numDoc)
                + this.u.preencheData(listaRegistroC460[i].dtDoc)
                + this.u.preencheDecimal(listaRegistroC460[i].vlDoc)
                + this.u.preencheDecimal(listaRegistroC460[i].vlPis)
                + this.u.preencheDecimal(listaRegistroC460[i].vlCofins)
                + this.u.preenche(listaRegistroC460[i].cpfCnpj)
                + this.u.preenche(listaRegistroC460[i].nomAdq)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC460 += 1;
            this.gravaRegistroC470(listaRegistroC460[i].registroC470List);
        }
        return registro;
    }

    private gravaRegistroC470(listaRegistroC470: RegistroC470[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC470.length; i++) {
            registro += this.u.preenche("C470")
                + this.u.preenche(listaRegistroC470[i].codItem)
                + this.u.preencheDecimal(listaRegistroC470[i].qtd)
                + this.u.preencheDecimal(listaRegistroC470[i].qtdCanc)
                + this.u.preenche(listaRegistroC470[i].unid)
                + this.u.preencheDecimal(listaRegistroC470[i].vlItem)
                + this.u.preenche(listaRegistroC470[i].cstIcms)
                + this.u.preenche(listaRegistroC470[i].cfop)
                + this.u.preencheDecimal(listaRegistroC470[i].aliqIcms)
                + this.u.preencheDecimal(listaRegistroC470[i].vlPis)
                + this.u.preencheDecimal(listaRegistroC470[i].vlCofins)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC470 += 1;
        }
        return registro;
    }

    private gravaRegistroC490(listaRegistroC490: RegistroC490[]): string {
        let registro: string = "";
        for (let i: number = 0; i < listaRegistroC490.length; i++) {
            registro += this.u.preenche("C490")
                + this.u.preenche(listaRegistroC490[i].cstIcms)
                + this.u.preenche(listaRegistroC490[i].cfop)
                + this.u.preencheDecimal(listaRegistroC490[i].aliqIcms)
                + this.u.preencheDecimal(listaRegistroC490[i].vlOpr)
                + this.u.preencheDecimal(listaRegistroC490[i].vlBcIcms)
                + this.u.preencheDecimal(listaRegistroC490[i].vlIcms)
                + this.u.preenche(listaRegistroC490[i].codObs)
                + this.u.delimitador
                + this.u.crlf;

            this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;
            this.numeroRegistroC490 += 1;
        }
        return registro;
    }

    gravaRegistroC990(): string {
        this.registroC990.qtdLinC = this.registroC990.qtdLinC + 1;

        return this.u.preenche("C990")
            + this.u.preencheInteiro(this.registroC990.qtdLinC)
            + this.u.delimitador
            + this.u.crlf;
    }
}
