/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Model relacionado ao SPED Contabil

The MIT License

Copyright: Copyright (C) 2020 T2Ti.COM

 * 
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
 * @author Albert Eije (alberteije@gmail.com)
@version 1.0.0
*******************************************************************************/
using System.Collections.Generic;

namespace T2Ti.Lib.Sped.Contabil
{
    public class Bloco9
    {
        public Registro9001 registro9001 { get; set; }
        public IList<Registro9900> listaRegistro9900 { get; set; }
        public Registro9990 registro9990 { get; set; }
        public Registro9999 registro9999 { get; set; }
        private SpedUtil u;

        public Bloco9()
        {
            registro9001 = new Registro9001();
            registro9001.indDad = 1;
            listaRegistro9900 = new List<Registro9900>();
            registro9990 = new Registro9990();
            registro9999 = new Registro9999();

            registro9990.qtdLin9 = 0;

            this.u = new SpedUtil();
        }

        public void limpaRegistros()
        {
            listaRegistro9900.Clear();

            registro9990.qtdLin9 = 0;
        }

        public string gravaRegistro9001()
        {
            registro9990.qtdLin9 = registro9990.qtdLin9 + 1;

            return u.preenche("9001") +
                    u.preenche(registro9001.indDad) +
                    u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistro9900()
        {
            string registro = "";
            for (int i = 0; i < listaRegistro9900.Count; i++)
            {
                registro += u.preenche("9900") +
                        u.preenche(listaRegistro9900[i].regBlc) +
                        u.preenche(listaRegistro9900[i].qtdRegBlc) +
                        u.delimitador;
                        //+ u.crlf;
            }
            registro9990.qtdLin9 = registro9990.qtdLin9 + listaRegistro9900.Count + 2;
            return registro;
        }

        public string gravaRegistro9990()
        {
            return u.preenche("9990") +
                    u.preenche(registro9990.qtdLin9) +
                    u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistro9999()
        {
            return u.preenche("9999") +
                    u.preenche(registro9999.qtdLin) +
                    u.delimitador; 
                    //+u.crlf;
        }
    }
}