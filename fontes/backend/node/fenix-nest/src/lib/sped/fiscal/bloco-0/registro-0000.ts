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

export class Registro0000 {

    codVer: string;	   // Código da versão do leiaute: 100, 101, 102	
    codFin: string;	   // Código da finalidade do arquivo: 0 - Remessa do arquivo original / 1 - Remessa do arquivo substituto.	
    dtIni: Date;	      // Data inicial das informações contidas no arquivo	
    dtFin: Date;	      // Data final das informações contidas no arquivo	
    nome: string;	     // Nome empresarial do contribuinte:	
    cnpj: string;	     // Número de inscrição do contribuinte:	
    cpf: string;	      // Número de inscrição do contribuinte:	
    uf: string;	       // Sigla da unidade da federação:	
    ie: string;	       // Inscrição Estadual do contribuinte:	
    codMun: string;	   // Código do município do domicílio fiscal:	
    im: string;	       // Inscrição Municipal do contribuinte:	
    suframa: string;	  // Número de inscrição do contribuinte:	
    indPerfil: string;	// Perfil de apresentação do arquivo fiscal: A - Perfil A / B - Perfil B / C - Perfil C	
    indAtiv: string;	  // Indicador de tipo de atividade: 0 - Industrial ou equiparado a industrial	 1 - Outros.

}
