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
    public class BlocoH
    {
        public RegistroH001 registroH001 { get; set; }
        public IList<RegistroH005> IListaRegistroH005 { get; set; }
        public RegistroH990 registroH990 { get; set; }
        public int numeroRegistroH005;
        public int numeroRegistroH010;
        private SpedUtil u;

        public BlocoH()
        {
            registroH001 = new RegistroH001();
            registroH001.indMov = 1;

            IListaRegistroH005 = new List<RegistroH005>();

            registroH990 = new RegistroH990();
            registroH990.qtdLinH = 0;

            numeroRegistroH005 = 0;
            numeroRegistroH010 = 0;

            this.u = new SpedUtil();
        }

        public string gravaRegistroH001()
        {
            registroH990.qtdLinH = registroH990.qtdLinH + 1;

            return u.preenche("H001")
                    + u.preenche(registroH001.indMov)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistroH005()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroH005.Count; i++)
            {
                registro += u.preenche("H005")
                        + u.preenche(IListaRegistroH005[i].dtInv)
                        + u.preenche(IListaRegistroH005[i].vlInv)
                        + u.preenche(IListaRegistroH005[i].motInv)
                        + u.delimitador;
                        //+ u.crlf;

                registroH990.qtdLinH = registroH990.qtdLinH + 1;
                numeroRegistroH005 += 1;
                gravaRegistroH010(IListaRegistroH005[i].registroH010IList);
            }
            return registro;
        }

        public string gravaRegistroH010(IList<RegistroH010> IListaRegistroH010)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroH010.Count; i++)
            {
                registro += u.preenche("H010")
                        + u.preenche(IListaRegistroH010[i].codItem)
                        + u.preenche(IListaRegistroH010[i].unid)
                        + u.preenche(IListaRegistroH010[i].qtd)
                        + u.preenche(IListaRegistroH010[i].vlUnit)
                        + u.preenche(IListaRegistroH010[i].vlItem)
                        + u.preenche(IListaRegistroH010[i].indProp)
                        + u.preenche(IListaRegistroH010[i].codPart)
                        + u.preenche(IListaRegistroH010[i].txtCompl)
                        + u.preenche(IListaRegistroH010[i].codCta)
                        + u.delimitador;
                        //+ u.crlf;

                registroH990.qtdLinH = registroH990.qtdLinH + 1;
                numeroRegistroH010 += 1;
            }
            return registro;
        }

        public string gravaRegistroH990()
        {
            registroH990.qtdLinH = registroH990.qtdLinH + 1;

            return u.preenche("H990")
                    + u.preenche(registroH990.qtdLinH)
                    + u.delimitador;
                    //+ u.crlf;
        }

    }
}
