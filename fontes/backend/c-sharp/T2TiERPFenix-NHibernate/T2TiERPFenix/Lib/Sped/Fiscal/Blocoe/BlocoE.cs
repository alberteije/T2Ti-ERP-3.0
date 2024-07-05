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
    public class BlocoE
    {
        public RegistroE001 registroE001 { get; set; }
        public IList<RegistroE100> IListaRegistroE100 { get; set; }
        public RegistroE990 registroE990 { get; set; }
        public int numeroRegistroE110;
        public int numeroRegistroE116;
        private SpedUtil u;

        public BlocoE()
        {
            registroE001 = new RegistroE001();
            registroE001.indMov = 1;

            IListaRegistroE100 = new List<RegistroE100>();

            registroE990 = new RegistroE990();
            registroE990.qtdLinE = 0;

            numeroRegistroE110 = 0;
            numeroRegistroE116 = 0;

            this.u = new SpedUtil();
        }

        public string gravaRegistroE001()
        {
            registroE990.qtdLinE = registroE990.qtdLinE + 1;

            return u.preenche("E001")
                    + u.preenche(registroE001.indMov)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistroE100(string codVer)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroE100.Count; i++)
            {
                registro += u.preenche("E100")
                        + u.preenche(IListaRegistroE100[i].dtIni)
                        + u.preenche(IListaRegistroE100[i].dtFin)
                        + u.delimitador;
                        //+ u.crlf;

                registroE990.qtdLinE = registroE990.qtdLinE + 1;
                gravaRegistroE110(IListaRegistroE100[i].registroE110, codVer);
            }
            return registro;
        }

        public string gravaRegistroE110(RegistroE110 registroE110, string codVer)
        {
            if (registroE110 == null)
            {
                return "";
            }
            string registro = "";

            registro += u.preenche("E110")
                    + u.preenche(registroE110.vlTotDebitos)
                    + u.preenche(registroE110.vlAjDebitos)
                    + u.preenche(registroE110.vlTotAjDebitos)
                    + u.preenche(registroE110.vlEstornosCred)
                    + u.preenche(registroE110.vlTotCreditos)
                    + u.preenche(registroE110.vlAjCreditos)
                    + u.preenche(registroE110.vlTotAjCreditos)
                    + u.preenche(registroE110.vlEstornosDeb)
                    + u.preenche(registroE110.vlSldCredorAnt)
                    + u.preenche(registroE110.vlSldApurado)
                    + u.preenche(registroE110.vlTotDed)
                    + u.preenche(registroE110.vlIcmsRecolher)
                    + u.preenche(registroE110.vlSldCredorTransportar)
                    + u.preenche(registroE110.debEsp)
                    + u.delimitador;
                    //+ u.crlf;

            registroE990.qtdLinE = registroE990.qtdLinE + 1;
            numeroRegistroE110 += 1;

            registro += gravaRegistroE116(registroE110.registroE116IList, codVer);

            return registro;

        }

        public string gravaRegistroE116(IList<RegistroE116> IListaRegistroE116, string codVer)
        {
            if (codVer == "002")
            {// versao 1.01
                return "";
            }
            string registro = "";
            for (int i = 0; i < IListaRegistroE116.Count; i++)
            {
                if (codVer == "003")
                {//versao 1.02
                    registro += u.preenche("E116")
                            + u.preenche(IListaRegistroE116[i].codOr)
                            + u.preenche(IListaRegistroE116[i].vlOr)
                            + u.preenche(IListaRegistroE116[i].dtVcto)
                            + u.preenche(IListaRegistroE116[i].codRec)
                            + u.preenche(IListaRegistroE116[i].numProc)
                            + u.preenche(IListaRegistroE116[i].indProc)
                            + u.preenche(IListaRegistroE116[i].proc)
                            + u.preenche(IListaRegistroE116[i].txtCompl)
                            + u.delimitador;
                            //+ u.crlf;
                }
                else
                {
                    registro += u.preenche("E116")
                            + u.preenche(IListaRegistroE116[i].codOr)
                            + u.preenche(IListaRegistroE116[i].vlOr)
                            + u.preenche(IListaRegistroE116[i].dtVcto)
                            + u.preenche(IListaRegistroE116[i].codRec)
                            + u.preenche(IListaRegistroE116[i].numProc)
                            + u.preenche(IListaRegistroE116[i].indProc)
                            + u.preenche(IListaRegistroE116[i].proc)
                            + u.preenche(IListaRegistroE116[i].txtCompl)
                            + u.preenche(IListaRegistroE116[i].mesRef)
                            + u.delimitador;
                            //+ u.crlf;
                }
                registroE990.qtdLinE = registroE990.qtdLinE + 1;
                numeroRegistroE116 += 1;
            }
            return registro;
        }

        public string gravaRegistroE990()
        {
            registroE990.qtdLinE = registroE990.qtdLinE + 1;

            return u.preenche("E990")
                    + u.preenche(registroE990.qtdLinE)
                    + u.delimitador;
                    //+ u.crlf;
        }
    }
}
