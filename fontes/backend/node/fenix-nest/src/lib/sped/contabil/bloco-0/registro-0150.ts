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
export class Registro0150 {

    codPart: string;	 /// Código de identificação do participante
    nome: string;	 /// Nome pessoal ou empresarial
    codPais: number;	 /// Código do país do participante
    cnpj: string;	 /// CNPJ do participante
    cpf: string;	 /// CPF do participante na unidade da federação do destinatário
    nit: string;	 /// Número de Identificação do Trabalhador, Pis, Pasep, SUS.
    uf: string;	 /// Sigla da unidade da federação do participante.
    ie: string;	 /// Inscrição Estadual do participante
    ieSt: string;	 /// Inscrição Estadual do participante na unidade da federação do destinatário, na condição de contribuinte substituto
    codMun: number;	 /// Código do município
    im: string;	 /// Inscrição Municipal do participante.
    suframa: string;	 /// Número de inscrição na Suframa

}
