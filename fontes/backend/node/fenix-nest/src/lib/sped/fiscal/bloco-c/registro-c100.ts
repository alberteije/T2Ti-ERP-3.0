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

import { RegistroC170 } from "./registro-c170";
import { RegistroC190 } from "./registro-c190";

export class RegistroC100 {

    indOper: string;	 // Indicador do tipo de operação
    indEmit: string;	 // Indicador do emitente do documento fiscal
    codPart: string;	 // Código do participante (campo 02 do Registro 0150)
    codMod: string;	 // Código do modelo do documento fiscal, conforme a Tabela 4.1.1
    codSit: string;	 // Código da situação do documento fiscal, conforme a Tabela 4.1.2
    ser: string;	 // Série do documento fiscal
    numDoc: string;	 // Número do documento fiscal
    chvNfe: string;	 // Chave da Nota Fiscal Eletrônica
    dtDoc: Date;	 // Data da emissão do documento fiscal
    dtES: Date;	 // Data da entrada ou da saída
    vlDoc: number;	 // Valor total do documento fiscal
    indPgto: string;	 // Indicador do tipo de pagamento
    vlDesc: number;	 // Valor total do desconto // Prates
    vlAbatNt: number;	 // Abatimento não tributado e não comercial Ex. desconto ICMS nas remessas para ZFM
    vlMerc: number;	 // Valor das mercadorias constantes no documento fiscal
    indFrt: string;	 // Indicador do tipo do frete
    vlFrt: number;	 // Valor do frete indicado no documento fiscal
    vlSeg: number;	 // Valor do seguro indicado no documento fiscal
    vlOutDa: number;	 // Valor de outras despesas acessórias
    vlBcIcms: number;	 // Valor da base de cálculo do ICMS
    vlIcms: number;	 // Valor do ICMS
    vlBcIcmsSt: number;	 // Valor da base de cálculo do ICMS substituição tributária
    vlIcmsSt: number;	 // Valor do ICMS retido por substituição tributária
    vlIpi: number;	 // Valor total do IPI
    vlPis: number;	 // Valor total do PIS
    vlCofins: number;	 // Valor total da COFINS
    vlPisSt: number;	 // Valor total do PIS retido por substituição tributária
    vlCofinsSt: number;	 // Valor total da COFINS retido por substituição tributária
    registroC170List: RegistroC170[];	 // BLOCO C - Lista de RegistroC170 (FILHO)
    registroC190List: RegistroC190[];	 // BLOCO C - Lista de RegistroC190 (FILHO)

    constructor() {
        this.registroC170List = [];
        this.registroC190List = [];
    }

}
