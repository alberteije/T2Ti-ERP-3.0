/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Model relacionado ao SPED Fiscal

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
@author Albert Eije (alberteije@gmail.com)
@version 1.0.0
*******************************************************************************/
using System.Collections.Generic;

namespace T2Ti.Lib.Sped.Fiscal
{
    public class Bloco1
    {
        public Registro1001 registro1001 { get; set; }
        public IList<Registro1010> IListaRegistro1010 { get; set; }
        public Registro1990 registro1990 { get; set; }
        public int numeroRegistro1010;
        private SpedUtil u;

        public Bloco1()
        {
            registro1001 = new Registro1001();
            registro1001.indMov = 1;

            IListaRegistro1010 = new List<Registro1010>();

            registro1990 = new Registro1990();
            registro1990.qtdLin1 = 0;

            numeroRegistro1010 = 0;

            this.u = new SpedUtil();
        }

        public string gravaRegistro1001()
        {
            registro1990.qtdLin1 = registro1990.qtdLin1 + 1;

            return u.preenche("1001")
                    + u.preenche(registro1001.indMov)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistro1010()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistro1010.Count; i++)
            {
                registro += u.preenche("1010")
                        + u.preenche(IListaRegistro1010[i].indExp)
                        + u.preenche(IListaRegistro1010[i].indCcrf)
                        + u.preenche(IListaRegistro1010[i].indComb)
                        + u.preenche(IListaRegistro1010[i].indUsina)
                        + u.preenche(IListaRegistro1010[i].indVa)
                        + u.preenche(IListaRegistro1010[i].indEe)
                        + u.preenche(IListaRegistro1010[i].indCart)
                        + u.preenche(IListaRegistro1010[i].indForm)
                        + u.preenche(IListaRegistro1010[i].indAer)
                        + u.delimitador;
                        //+ u.crlf;

                registro1990.qtdLin1 = registro1990.qtdLin1 + 1;
                numeroRegistro1010 += 1;
            }
            return registro;
        }

        public string gravaRegistro1990()
        {
            registro1990.qtdLin1 = registro1990.qtdLin1 + 1;

            return u.preenche("1990")
                    + u.preenche(registro1990.qtdLin1)
                    + u.delimitador;
                    //+ u.crlf;
        }
    }
}