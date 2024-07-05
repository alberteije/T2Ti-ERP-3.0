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

    public class BlocoJ
    {
        public RegistroJ001 registroJ001 { get; set; }
        public IList<RegistroJ005> listaRegistroJ005 { get; set; }
        public IList<RegistroJ800> listaRegistroJ800 { get; set; }
        public RegistroJ900 registroJ900 { get; set; }
        public IList<RegistroJ930> listaRegistroJ930 { get; set; }
        public RegistroJ990 registroJ990 { get; set; }
        public int numeroRegistrosJ100 { get; set; }
        public int numeroRegistrosJ150 { get; set; }
        private SpedUtil u;

        public BlocoJ()
        {
            registroJ001 = new RegistroJ001();
            registroJ001.indDad = 1;
            listaRegistroJ005 = new List<RegistroJ005>();
            listaRegistroJ800 = new List<RegistroJ800>();
            listaRegistroJ930 = new List<RegistroJ930>();
            registroJ900 = new RegistroJ900();

            registroJ990 = new RegistroJ990();
            registroJ990.qtdLinJ = 0;

            numeroRegistrosJ100 = 0;
            numeroRegistrosJ150 = 0;

            this.u = new SpedUtil();
        }

        public void limpaRegistros()
        {
            listaRegistroJ005.Clear();
            listaRegistroJ800.Clear();
            listaRegistroJ930.Clear();

            registroJ990.qtdLinJ = 0;
        }

        public string gravaRegistroJ001()
        {
            registroJ990.qtdLinJ = registroJ990.qtdLinJ + 1;

            return u.preenche("J001")
                    + u.preenche(registroJ001.indDad)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistroJ005()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroJ005.Count; i++)
            {
                registro += u.preenche("J005")
                        + u.preenche(listaRegistroJ005[i].dtIni)
                        + u.preenche(listaRegistroJ005[i].dtFin)
                        + u.preenche(listaRegistroJ005[i].idDem)
                        + u.preenche(listaRegistroJ005[i].cabDem)
                        + u.delimitador;
                        //+ u.crlf;

                registro += gravaRegistroJ100(listaRegistroJ005[i].registroJ100List);
                registro += gravaRegistroJ150(listaRegistroJ005[i].registroJ150List);

                registroJ990.qtdLinJ = registroJ990.qtdLinJ + 1;
            }
            return registro;
        }

        public string gravaRegistroJ100(IList<RegistroJ100> listaRegistroJ100)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroJ100.Count; i++)
            {
                registro += u.preenche("J100")
                        + u.preenche(listaRegistroJ100[i].codAgl)
                        + u.preenche(listaRegistroJ100[i].nivelAgl)
                        + u.preenche(listaRegistroJ100[i].indGrpBal)
                        + u.preenche(listaRegistroJ100[i].descrCodAgl)
                        + u.preenche(listaRegistroJ100[i].vlCta)
                        + u.preenche(listaRegistroJ100[i].indDcBal)
                        + u.delimitador;
                        //+ u.crlf;

                registroJ990.qtdLinJ = registroJ990.qtdLinJ + 1;
                numeroRegistrosJ100 += 1;
            }
            return registro;
        }

        public string gravaRegistroJ150(IList<RegistroJ150> listaRegistroJ150)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroJ150.Count; i++)
            {
                registro += u.preenche("J150")
                        + u.preenche(listaRegistroJ150[i].codAgl)
                        + u.preenche(listaRegistroJ150[i].nivelAgl)
                        + u.preenche(listaRegistroJ150[i].descrCodAgl)
                        + u.preenche(listaRegistroJ150[i].vlCta)
                        + u.preenche(listaRegistroJ150[i].indVl)
                        + u.delimitador;
                        //+ u.crlf;

                registroJ990.qtdLinJ = registroJ990.qtdLinJ + 1;
                numeroRegistrosJ150 += 1;
            }
            return registro;
        }

        public string gravaRegistroJ800()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroJ800.Count; i++)
            {
                registro += u.preenche("J800")
                        + u.preenche(listaRegistroJ800[i].arqRtf)
                        + u.preenche("J800FIM")
                        + u.delimitador;
                        //+ u.crlf;

                registroJ990.qtdLinJ = registroJ990.qtdLinJ + 1;
            }
            return registro;
        }

        public string gravaRegistroJ900()
        {
            registroJ990.qtdLinJ = registroJ990.qtdLinJ + 1;

            return u.preenche("J900")
                    + u.preenche("TERMO DE ENCERRAMENTO")
                    + u.preenche(registroJ900.numOrd)
                    + u.preenche(registroJ900.natLivro)
                    + u.preenche(registroJ900.nome)
                    + u.preenche(registroJ900.qtdLin)
                    + u.preenche(registroJ900.dtIniEscr)
                    + u.preenche(registroJ900.dtFinEscr)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistroJ930()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroJ800.Count; i++)
            {
                registro += u.preenche("J930")
                        + u.preenche(listaRegistroJ930[i].identNom)
                        + u.preenche(listaRegistroJ930[i].identCpf)
                        + u.preenche(listaRegistroJ930[i].identQualif)
                        + u.preenche(listaRegistroJ930[i].codAssin)
                        + u.preenche(listaRegistroJ930[i].indCrc)
                        + u.delimitador;
                        //+ u.crlf;

                registroJ990.qtdLinJ = registroJ990.qtdLinJ + 1;
            }
            return registro;
        }

        public string gravaRegistroJ990()
        {
            registroJ990.qtdLinJ = registroJ990.qtdLinJ + 1;

            return u.preenche("J990")
                    + u.preenche(registroJ990.qtdLinJ)
                    + u.delimitador;
                    //+ u.crlf;
        }
    }
}
