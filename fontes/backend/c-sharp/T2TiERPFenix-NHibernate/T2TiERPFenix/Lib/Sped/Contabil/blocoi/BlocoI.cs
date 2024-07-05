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

    public class BlocoI
    {


        public RegistroI001 registroI001 { get; set; }
        public RegistroI010 registroI010 { get; set; }
        public IList<RegistroI012> listaRegistroI012 { get; set; }
        public IList<RegistroI020> listaRegistroI020 { get; set; }
        public RegistroI030 registroI030 { get; set; }
        public IList<RegistroI050> listaRegistroI050 { get; set; }
        public IList<RegistroI075> listaRegistroI075 { get; set; }
        public IList<RegistroI100> listaRegistroI100 { get; set; }
        public IList<RegistroI150> listaRegistroI150 { get; set; }
        public IList<RegistroI200> listaRegistroI200 { get; set; }
        public IList<RegistroI300> listaRegistroI300 { get; set; }
        public IList<RegistroI350> listaRegistroI350 { get; set; }
        public IList<RegistroI500> listaRegistroI500 { get; set; }
        public IList<RegistroI510> listaRegistroI510 { get; set; }
        public IList<RegistroI550> listaRegistroI550 { get; set; }
        public RegistroI990 registroI990 { get; set; }
        public int numeroRegistrosI015 { get; set; }
        public int numeroRegistrosI051 { get; set; }
        public int numeroRegistrosI052 { get; set; }
        public int numeroRegistrosI151 { get; set; }
        public int numeroRegistrosI155 { get; set; }
        public int numeroRegistrosI250 { get; set; }
        public int numeroRegistrosI310 { get; set; }
        public int numeroRegistrosI355 { get; set; }
        public int numeroRegistrosI555 { get; set; }
        public SpedUtil u;

        public BlocoI()
        {
            registroI001 = new RegistroI001();
            registroI001.indDad = 1;
            registroI010 = new RegistroI010();
            listaRegistroI012 = new List<RegistroI012>();
            listaRegistroI020 = new List<RegistroI020>();
            registroI030 = new RegistroI030();
            listaRegistroI050 = new List<RegistroI050>();
            listaRegistroI075 = new List<RegistroI075>();
            listaRegistroI100 = new List<RegistroI100>();
            listaRegistroI150 = new List<RegistroI150>();
            listaRegistroI200 = new List<RegistroI200>();
            listaRegistroI300 = new List<RegistroI300>();
            listaRegistroI350 = new List<RegistroI350>();
            listaRegistroI500 = new List<RegistroI500>();
            listaRegistroI510 = new List<RegistroI510>();
            listaRegistroI550 = new List<RegistroI550>();

            registroI990 = new RegistroI990();
            registroI990.qtdLinI = 0;

            numeroRegistrosI015 = 0;
            numeroRegistrosI051 = 0;
            numeroRegistrosI052 = 0;
            numeroRegistrosI151 = 0;
            numeroRegistrosI155 = 0;
            numeroRegistrosI250 = 0;
            numeroRegistrosI310 = 0;
            numeroRegistrosI355 = 0;
            numeroRegistrosI555 = 0;

            this.u = new SpedUtil();
        }

        public void limpaRegistros()
        {
            listaRegistroI012.Clear();
            listaRegistroI020.Clear();
            listaRegistroI050.Clear();
            listaRegistroI075.Clear();
            listaRegistroI100.Clear();
            listaRegistroI150.Clear();
            listaRegistroI200.Clear();
            listaRegistroI300.Clear();
            listaRegistroI350.Clear();
            listaRegistroI500.Clear();
            listaRegistroI510.Clear();
            listaRegistroI550.Clear();

            registroI990.qtdLinI = 0;

            numeroRegistrosI015 = 0;
            numeroRegistrosI051 = 0;
            numeroRegistrosI052 = 0;
            numeroRegistrosI151 = 0;
            numeroRegistrosI155 = 0;
            numeroRegistrosI250 = 0;
            numeroRegistrosI310 = 0;
            numeroRegistrosI355 = 0;
            numeroRegistrosI555 = 0;
        }

        public string gravaRegistroI001()
        {
            registroI990.qtdLinI = registroI990.qtdLinI + 1;

            return u.preenche("I001")
                    + u.preenche(registroI001.indDad)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistroI010()
        {
            registroI990.qtdLinI = registroI990.qtdLinI + 1;

            return u.preenche("I010")
                    + u.preenche(registroI010.indEsc)
                    + u.preenche(registroI010.codVerLc)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistroI012()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI012.Count; i++)
            {
                registro += u.preenche("I012")
                        + u.preenche(listaRegistroI012[i].numOrd)
                        + u.preenche(listaRegistroI012[i].natLivr)
                        + u.preenche(listaRegistroI012[i].tipo)
                        + u.preenche(listaRegistroI012[i].codHashAux)
                        + u.delimitador;
                        //+ u.crlf;

                registro += gravaRegistroI015(listaRegistroI012[i].registroI015List);

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }

            return registro;
        }

        public string gravaRegistroI015(IList<RegistroI015> listaRegistroI015)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI015.Count; i++)
            {
                registro += u.preenche("I015")
                        + u.preenche(listaRegistroI015[i].codCtaRes)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
                numeroRegistrosI015 += 1;
            }
            return registro;
        }

        public string gravaRegistroI020()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI020.Count; i++)
            {
                registro += u.preenche("I020")
                        + u.preenche(listaRegistroI020[i].regCod)
                        + u.preenche(listaRegistroI020[i].numAd)
                        + u.preenche(listaRegistroI020[i].campo)
                        + u.preenche(listaRegistroI020[i].descricao)
                        + u.preenche(listaRegistroI020[i].tipoDado)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }

            return registro;
        }

        public string gravaRegistroI030()
        {
            registroI990.qtdLinI = registroI990.qtdLinI + 1;

            return u.preenche("I030")
                    + u.preenche("TERMO DE ABERTURA")
                    + u.preenche(registroI030.numOrd)
                    + u.preenche(registroI030.natLivr)
                    + u.preenche(registroI030.qtdLin)
                    + u.preenche(registroI030.nome)
                    + u.preenche(registroI030.nire)
                    + u.preenche(registroI030.cnpj)
                    + u.preenche(registroI030.dtArq)
                    + u.preenche(registroI030.dtArqConv)
                    + u.preenche(registroI030.descMun)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistroI050()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI050.Count; i++)
            {
                registro += u.preenche("I050")
                        + u.preenche(listaRegistroI050[i].dtAlt)
                        + u.preenche(listaRegistroI050[i].codNat)
                        + u.preenche(listaRegistroI050[i].indCta)
                        + u.preenche(listaRegistroI050[i].nivel)
                        + u.preenche(listaRegistroI050[i].codCta)
                        + u.preenche(listaRegistroI050[i].codCtaSup)
                        + u.preenche(listaRegistroI050[i].cta)
                        + u.delimitador;
                        //+ u.crlf;

                registro += gravaRegistroI051(listaRegistroI050[i].registroi051List);
                registro += gravaRegistroI052(listaRegistroI050[i].registroi052List);

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }

            return registro;
        }

        public string gravaRegistroI051(IList<RegistroI051> listaRegistroI051)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI051.Count; i++)
            {
                registro += u.preenche("I051")
                        + u.preenche(listaRegistroI051[i].codEntRef)
                        + u.preenche(listaRegistroI051[i].codCcus)
                        + u.preenche(listaRegistroI051[i].codCtaRef)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
                numeroRegistrosI051 += 1;
            }
            return registro;
        }

        public string gravaRegistroI052(IList<RegistroI052> listaRegistroI052)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI052.Count; i++)
            {
                registro += u.preenche("I052")
                        + u.preenche(listaRegistroI052[i].codCcus)
                        + u.preenche(listaRegistroI052[i].codAgl)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
                numeroRegistrosI052 += 1;
            }
            return registro;
        }

        public string gravaRegistroI075()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI075.Count; i++)
            {
                registro += u.preenche("I075")
                        + u.preenche(listaRegistroI075[i].codHist)
                        + u.preenche(listaRegistroI075[i].descrHist)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }
            return registro;
        }

        public string gravaRegistroI100()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI100.Count; i++)
            {
                registro += u.preenche("I100")
                        + u.preenche(listaRegistroI100[i].dtAlt)
                        + u.preenche(listaRegistroI100[i].codCcus)
                        + u.preenche(listaRegistroI100[i].ccus)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }
            return registro;
        }

        public string gravaRegistroI150()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI150.Count; i++)
            {
                registro += u.preenche("I150")
                        + u.preenche(listaRegistroI150[i].dtIni)
                        + u.preenche(listaRegistroI150[i].dtFin)
                        + u.delimitador;
                        //+ u.crlf;

                registro += gravaRegistroI151(listaRegistroI150[i].registroi151List);
                registro += gravaRegistroI155(listaRegistroI150[i].registroi155List);

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }

            return registro;
        }

        public string gravaRegistroI151(IList<RegistroI151> listaRegistroI151)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI151.Count; i++)
            {
                registro += u.preenche("I151")
                        + u.preenche(listaRegistroI151[i].assinDig)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
                numeroRegistrosI151 += 1;
            }
            return registro;
        }

        public string gravaRegistroI155(IList<RegistroI155> listaRegistroI155)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI155.Count; i++)
            {
                registro += u.preenche("I155")
                        + u.preenche(listaRegistroI155[i].codCta)
                        + u.preenche(listaRegistroI155[i].codCcus)
                        + u.preenche(listaRegistroI155[i].vlSldIni)
                        + u.preenche(listaRegistroI155[i].indDcIni)
                        + u.preenche(listaRegistroI155[i].vlDeb)
                        + u.preenche(listaRegistroI155[i].vlCred)
                        + u.preenche(listaRegistroI155[i].vlSldFin)
                        + u.preenche(listaRegistroI155[i].indDcFin)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
                numeroRegistrosI155 += 1;
            }
            return registro;
        }

        public string gravaRegistroI200()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI200.Count; i++)
            {
                registro += u.preenche("I200")
                        + u.preenche(listaRegistroI200[i].numLcto)
                        + u.preenche(listaRegistroI200[i].dtLcto)
                        + u.preenche(listaRegistroI200[i].vlLcto)
                        + u.preenche(listaRegistroI200[i].indLcto)
                        + u.delimitador;
                        //+ u.crlf;

                registro += gravaRegistroI250(listaRegistroI200[i].registroi250List);

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }

            return registro;
        }

        public string gravaRegistroI250(IList<RegistroI250> listaRegistroI250)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI250.Count; i++)
            {
                registro += u.preenche("I250")
                        + u.preenche(listaRegistroI250[i].codCta)
                        + u.preenche(listaRegistroI250[i].codCcus)
                        + u.preenche(listaRegistroI250[i].vlDc)
                        + u.preenche(listaRegistroI250[i].indDc)
                        + u.preenche(listaRegistroI250[i].numArq)
                        + u.preenche(listaRegistroI250[i].codHistPad)
                        + u.preenche(listaRegistroI250[i].hist)
                        + u.preenche(listaRegistroI250[i].codPart)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
                numeroRegistrosI250 += 1;
            }
            return registro;
        }

        public string gravaRegistroI300()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI300.Count; i++)
            {
                registro += u.preenche("I300")
                        + u.preenche(listaRegistroI300[i].dtBcte)
                        + u.delimitador;
                        //+ u.crlf;

                registro += gravaRegistroI310(listaRegistroI300[i].registroi310List);

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }

            return registro;
        }

        public string gravaRegistroI310(IList<RegistroI310> listaRegistroI310)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI310.Count; i++)
            {
                registro += u.preenche("I310")
                        + u.preenche(listaRegistroI310[i].codCta)
                        + u.preenche(listaRegistroI310[i].codCcus)
                        + u.preenche(listaRegistroI310[i].valDebd)
                        + u.preenche(listaRegistroI310[i].valCred)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
                numeroRegistrosI310 += 1;
            }
            return registro;
        }

        public string gravaRegistroI350()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI350.Count; i++)
            {
                registro += u.preenche("I350")
                        + u.preenche(listaRegistroI350[i].dtRes)
                        + u.delimitador;
                        //+ u.crlf;

                registro += gravaRegistroI355(listaRegistroI350[i].registroi355List);

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }

            return registro;
        }

        public string gravaRegistroI355(IList<RegistroI355> listaRegistroI355)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI355.Count; i++)
            {
                registro += u.preenche("I355")
                        + u.preenche(listaRegistroI355[i].codCta)
                        + u.preenche(listaRegistroI355[i].codCcus)
                        + u.preenche(listaRegistroI355[i].vlCta)
                        + u.preenche(listaRegistroI355[i].indDc)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
                numeroRegistrosI355 += 1;
            }
            return registro;
        }

        public string gravaRegistroI500()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI500.Count; i++)
            {
                registro += u.preenche("I500")
                        + u.preenche(listaRegistroI500[i].tamFonte)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }
            return registro;
        }

        public string gravaRegistroI510()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI510.Count; i++)
            {
                registro += u.preenche("I510")
                        + u.preenche(listaRegistroI510[i].nmCampo)
                        + u.preenche(listaRegistroI510[i].descCampo)
                        + u.preenche(listaRegistroI510[i].tipoCampo)
                        + u.preenche(listaRegistroI510[i].tamCampo)
                        + u.preenche(listaRegistroI510[i].decCampo)
                        + u.preenche(listaRegistroI510[i].colCampo)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }
            return registro;
        }

        public string gravaRegistroI550()
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI550.Count; i++)
            {
                registro += u.preenche("I550")
                        + u.preenche(listaRegistroI550[i].rzCont)
                        + u.delimitador;
                        //+ u.crlf;

                registro += gravaRegistroI555(listaRegistroI550[i].registroi555List);

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
            }

            return registro;
        }

        public string gravaRegistroI555(IList<RegistroI555> listaRegistroI555)
        {
            string registro = "";
            for (int i = 0; i < listaRegistroI555.Count; i++)
            {
                registro += u.preenche("I555")
                        + u.preenche(listaRegistroI555[i].rzContTot)
                        + u.delimitador;
                        //+ u.crlf;

                registroI990.qtdLinI = registroI990.qtdLinI + 1;
                numeroRegistrosI555 += 1;
            }
            return registro;
        }

        public string gravaRegistroI990()
        {
            registroI990.qtdLinI = registroI990.qtdLinI + 1;

            return u.preenche("I990")
                    + u.preenche(registroI990.qtdLinI)
                    + u.delimitador;
                    //+ u.crlf;
        }

    }
}
