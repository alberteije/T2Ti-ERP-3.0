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
    public class BlocoC
    {
        public RegistroC001 registroC001 { get; set; }
        public IList<RegistroC100> IListaRegistroC100 { get; set; }
        public IList<RegistroC114> IListaRegistroC114 { get; set; }
        public IList<RegistroC300> IListaRegistroC300 { get; set; }
        public IList<RegistroC350> IListaRegistroC350 { get; set; }
        public IList<RegistroC400> IListaRegistroC400 { get; set; }
        public IList<RegistroC425> IListaRegistroC425 { get; set; }
        public RegistroC990 registroC990 { get; set; }
        public int numeroRegistroC170;
        public int numeroRegistroC190;
        public int numeroRegistroC310;
        public int numeroRegistroC320;
        public int numeroRegistroC321;
        public int numeroRegistroC370;
        public int numeroRegistroC390;
        public int numeroRegistroC405;
        public int numeroRegistroC420;
        public int numeroRegistroC460;
        public int numeroRegistroC470;
        public int numeroRegistroC490;
        private SpedUtil u;

        public BlocoC()
        {
            registroC001 = new RegistroC001();
            registroC001.indMov = 1;

            IListaRegistroC100 = new List<RegistroC100>();
            IListaRegistroC114 = new List<RegistroC114>();
            IListaRegistroC300 = new List<RegistroC300>();
            IListaRegistroC350 = new List<RegistroC350>();
            IListaRegistroC400 = new List<RegistroC400>();
            IListaRegistroC425 = new List<RegistroC425>();

            registroC990 = new RegistroC990();
            registroC990.qtdLinC = 0;

            numeroRegistroC170 = 0;
            numeroRegistroC190 = 0;
            numeroRegistroC310 = 0;
            numeroRegistroC320 = 0;
            numeroRegistroC321 = 0;
            numeroRegistroC370 = 0;
            numeroRegistroC390 = 0;
            numeroRegistroC405 = 0;
            numeroRegistroC420 = 0;
            numeroRegistroC460 = 0;
            numeroRegistroC470 = 0;
            numeroRegistroC490 = 0;

            this.u = new SpedUtil();
        }

        public string gravaRegistroC001()
        {
            registroC990.qtdLinC = registroC990.qtdLinC + 1;

            return u.preenche("C001")
                    + u.preenche(registroC001.indMov)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistroC100()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC100.Count; i++)
            {
                registro += u.preenche("C100")
                        + u.preenche(IListaRegistroC100[i].indOper)
                        + u.preenche(IListaRegistroC100[i].indEmit)
                        + u.preenche(IListaRegistroC100[i].codPart)
                        + u.preenche(IListaRegistroC100[i].codMod)
                        + u.preenche(IListaRegistroC100[i].codSit)
                        + u.preenche(IListaRegistroC100[i].ser)
                        + u.preenche(IListaRegistroC100[i].numDoc)
                        + u.preenche(IListaRegistroC100[i].chvNfe)
                        + u.preenche(IListaRegistroC100[i].dtDoc)
                        + u.preenche(IListaRegistroC100[i].dtES)
                        + u.preenche(IListaRegistroC100[i].vlDoc)
                        + u.preenche(IListaRegistroC100[i].indPgto)
                        + u.preenche(IListaRegistroC100[i].vlDesc)
                        + u.preenche(IListaRegistroC100[i].vlAbatNt)
                        + u.preenche(IListaRegistroC100[i].vlMerc)
                        + u.preenche(IListaRegistroC100[i].indFrt)
                        + u.preenche(IListaRegistroC100[i].vlFrt)
                        + u.preenche(IListaRegistroC100[i].vlSeg)
                        + u.preenche(IListaRegistroC100[i].vlOutDa)
                        + u.preenche(IListaRegistroC100[i].vlBcIcms)
                        + u.preenche(IListaRegistroC100[i].vlIcms)
                        + u.preenche(IListaRegistroC100[i].vlBcIcmsSt)
                        + u.preenche(IListaRegistroC100[i].vlIcmsSt)
                        + u.preenche(IListaRegistroC100[i].vlIpi)
                        + u.preenche(IListaRegistroC100[i].vlPis)
                        + u.preenche(IListaRegistroC100[i].vlCofins)
                        + u.preenche(IListaRegistroC100[i].vlPisSt)
                        + u.preenche(IListaRegistroC100[i].vlCofinsSt)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                registro += gravaRegistroC170(IListaRegistroC100[i].registroC170IList);
                registro += gravaRegistroC190(IListaRegistroC100[i].registroC190IList);
            }
            return registro;
        }

        public string gravaRegistroC114()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC114.Count; i++)
            {
                registro += u.preenche("C114")
                        + u.preenche(IListaRegistroC114[i].codMod)
                        + u.preenche(IListaRegistroC114[i].ecfFab)
                        + u.preenche(IListaRegistroC114[i].ecfCx)
                        + u.preenche(IListaRegistroC114[i].numDoc)
                        + u.preenche(IListaRegistroC114[i].dtDoc)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
            }
            return registro;
        }

        public string gravaRegistroC170(IList<RegistroC170> IListaRegistroC170)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC170.Count; i++)
            {
                registro += u.preenche("C170")
                        + u.preenche(IListaRegistroC170[i].numItem)
                        + u.preenche(IListaRegistroC170[i].codItem)
                        + u.preenche(IListaRegistroC170[i].descrCompl)
                        + u.preenche(IListaRegistroC170[i].qtd)
                        + u.preenche(IListaRegistroC170[i].unid)
                        + u.preenche(IListaRegistroC170[i].vlItem)
                        + u.preenche(IListaRegistroC170[i].vlDesc)
                        + u.preenche(IListaRegistroC170[i].indMov)
                        + u.preenche(IListaRegistroC170[i].cstIcms)
                        + u.preenche(IListaRegistroC170[i].cfop)
                        + u.preenche(IListaRegistroC170[i].codNat)
                        + u.preenche(IListaRegistroC170[i].vlBcIcms)
                        + u.preenche(IListaRegistroC170[i].aliqIcms)
                        + u.preenche(IListaRegistroC170[i].vlIcms)
                        + u.preenche(IListaRegistroC170[i].vlBcIcmsSt)
                        + u.preenche(IListaRegistroC170[i].aliqSt)
                        + u.preenche(IListaRegistroC170[i].vlIcmsSt)
                        + u.preenche(IListaRegistroC170[i].indApur)
                        + u.preenche(IListaRegistroC170[i].cstIpi)
                        + u.preenche(IListaRegistroC170[i].codEnq)
                        + u.preenche(IListaRegistroC170[i].vlBcIpi)
                        + u.preenche(IListaRegistroC170[i].aliqIpi)
                        + u.preenche(IListaRegistroC170[i].vlIpi)
                        + u.preenche(IListaRegistroC170[i].cstPis)
                        + u.preenche(IListaRegistroC170[i].vlBcPis)
                        + u.preenche(IListaRegistroC170[i].aliqPisPerc)
                        + u.preenche(IListaRegistroC170[i].quantBcPis)
                        + u.preenche(IListaRegistroC170[i].aliqPisR)
                        + u.preenche(IListaRegistroC170[i].vlPis)
                        + u.preenche(IListaRegistroC170[i].cstCofins)
                        + u.preenche(IListaRegistroC170[i].vlBcCofins)
                        + u.preenche(IListaRegistroC170[i].aliqCofinsPerc)
                        + u.preenche(IListaRegistroC170[i].quantBcCofins)
                        + u.preenche(IListaRegistroC170[i].aliqCofinsR)
                        + u.preenche(IListaRegistroC170[i].vlCofins)
                        + u.preenche(IListaRegistroC170[i].codCta)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC170 += 1;
            }
            return registro;
        }

        public string gravaRegistroC190(IList<RegistroC190> IListaRegistroC190)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC190.Count; i++)
            {
                registro += u.preenche("C190")
                        + u.preenche(IListaRegistroC190[i].cstIcms)
                        + u.preenche(IListaRegistroC190[i].cfop)
                        + u.preenche(IListaRegistroC190[i].aliqIcms)
                        + u.preenche(IListaRegistroC190[i].vlOpr)
                        + u.preenche(IListaRegistroC190[i].vlBcIcms)
                        + u.preenche(IListaRegistroC190[i].vlIcms)
                        + u.preenche(IListaRegistroC190[i].vlBcIcmsSt)
                        + u.preenche(IListaRegistroC190[i].vlIcmsSt)
                        + u.preenche(IListaRegistroC190[i].vlRedBc)
                        + u.preenche(IListaRegistroC190[i].vlIpi)
                        + u.preenche(IListaRegistroC190[i].codObs)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC190 += 1;
            }
            return registro;
        }

        public string gravaRegistroC300()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC300.Count; i++)
            {
                registro += u.preenche("C300")
                        + u.preenche(IListaRegistroC300[i].codMod)
                        + u.preenche(IListaRegistroC300[i].ser)
                        + u.preenche(IListaRegistroC300[i].sub)
                        + u.preenche(IListaRegistroC300[i].numDocIni)
                        + u.preenche(IListaRegistroC300[i].numDocFin)
                        + u.preenche(IListaRegistroC300[i].dtDoc)
                        + u.preenche(IListaRegistroC300[i].vlDoc)
                        + u.preenche(IListaRegistroC300[i].vlPis)
                        + u.preenche(IListaRegistroC300[i].vlCofins)
                        + u.preenche(IListaRegistroC300[i].codCta)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                registro += gravaRegistroC310(IListaRegistroC300[i].registroC310IList);
                registro += gravaRegistroC320(IListaRegistroC300[i].registroC320IList);
            }
            return registro;
        }

        public string gravaRegistroC310(IList<RegistroC310> IListaRegistroC310)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC310.Count; i++)
            {
                registro += u.preenche("C310")
                        + u.preenche(IListaRegistroC310[i].numDocCanc)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC310 += 1;
            }
            return registro;
        }

        public string gravaRegistroC320(IList<RegistroC320> IListaRegistroC320)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC320.Count; i++)
            {
                registro += u.preenche("C320")
                        + u.preenche(IListaRegistroC320[i].cstIcms)
                        + u.preenche(IListaRegistroC320[i].cfop)
                        + u.preenche(IListaRegistroC320[i].aliqIcms)
                        + u.preenche(IListaRegistroC320[i].vlOpr)
                        + u.preenche(IListaRegistroC320[i].vlBcIcms)
                        + u.preenche(IListaRegistroC320[i].vlIcms)
                        + u.preenche(IListaRegistroC320[i].vlRedBc)
                        + u.preenche(IListaRegistroC320[i].codObs)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC320 += 1;
                registro += gravaRegistroC321(IListaRegistroC320[i].registroC321IList);
            }
            return registro;
        }

        public string gravaRegistroC321(IList<RegistroC321> IListaRegistroC321)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC321.Count; i++)
            {
                registro += u.preenche("C321")
                        + u.preenche(IListaRegistroC321[i].codItem)
                        + u.preenche(IListaRegistroC321[i].qtd)
                        + u.preenche(IListaRegistroC321[i].unid)
                        + u.preenche(IListaRegistroC321[i].vlItem)
                        + u.preenche(IListaRegistroC321[i].vlDesc)
                        + u.preenche(IListaRegistroC321[i].vlBcIcms)
                        + u.preenche(IListaRegistroC321[i].vlIcms)
                        + u.preenche(IListaRegistroC321[i].vlPis)
                        + u.preenche(IListaRegistroC321[i].vlCofins)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC321 += 1;
            }
            return registro;
        }

        public string gravaRegistroC350()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC350.Count; i++)
            {
                registro += u.preenche("C350")
                        + u.preenche(IListaRegistroC350[i].ser)
                        + u.preenche(IListaRegistroC350[i].subSer)
                        + u.preenche(IListaRegistroC350[i].numDoc)
                        + u.preenche(IListaRegistroC350[i].dtDoc)
                        + u.preenche(IListaRegistroC350[i].cnpjCpf)
                        + u.preenche(IListaRegistroC350[i].vlMerc)
                        + u.preenche(IListaRegistroC350[i].vlDoc)
                        + u.preenche(IListaRegistroC350[i].vlDesc)
                        + u.preenche(IListaRegistroC350[i].vlPis)
                        + u.preenche(IListaRegistroC350[i].codCta)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                registro += gravaRegistroC370(IListaRegistroC350[i].registroC370IList);
                registro += gravaRegistroC390(IListaRegistroC350[i].registroC390IList);
            }
            return registro;
        }

        public string gravaRegistroC370(IList<RegistroC370> IListaRegistroC370)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC370.Count; i++)
            {
                registro += u.preenche("C370")
                        + u.preenche(IListaRegistroC370[i].numItem)
                        + u.preenche(IListaRegistroC370[i].codItem)
                        + u.preenche(IListaRegistroC370[i].qtd)
                        + u.preenche(IListaRegistroC370[i].unid)
                        + u.preenche(IListaRegistroC370[i].vlItem)
                        + u.preenche(IListaRegistroC370[i].vlDesc)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC370 += 1;
            }
            return registro;
        }

        public string gravaRegistroC390(IList<RegistroC390> IListaRegistroC390)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC390.Count; i++)
            {
                registro += u.preenche("C390")
                        + u.preenche(IListaRegistroC390[i].cstIcms)
                        + u.preenche(IListaRegistroC390[i].cfop)
                        + u.preenche(IListaRegistroC390[i].aliqIcms)
                        + u.preenche(IListaRegistroC390[i].vlOpr)
                        + u.preenche(IListaRegistroC390[i].vlBcIcms)
                        + u.preenche(IListaRegistroC390[i].vlIcms)
                        + u.preenche(IListaRegistroC390[i].vlRedBc)
                        + u.preenche(IListaRegistroC390[i].codObs)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC390 += 1;
            }
            return registro;
        }

        public string gravaRegistroC400()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC400.Count; i++)
            {
                registro += u.preenche("C400")
                        + u.preenche(IListaRegistroC400[i].codMod)
                        + u.preenche(IListaRegistroC400[i].ecfMod)
                        + u.preenche(IListaRegistroC400[i].ecfFab)
                        + u.preenche(IListaRegistroC400[i].ecfCx)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                registro += gravaRegistroC405(IListaRegistroC400[i].registroC405IList);
            }
            return registro;
        }

        public string gravaRegistroC405(IList<RegistroC405> IListaRegistroC405)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC405.Count; i++)
            {
                registro += u.preenche("C405")
                        + u.preenche(IListaRegistroC405[i].dtDoc)
                        + u.preenche(IListaRegistroC405[i].cro)
                        + u.preenche(IListaRegistroC405[i].crz)
                        + u.preenche(IListaRegistroC405[i].numCooFin)
                        + u.preenche(IListaRegistroC405[i].gtFin)
                        + u.preenche(IListaRegistroC405[i].vlBrt)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC405 += 1;
                registro += gravaRegistroC420(IListaRegistroC405[i].registroC420IList);
                registro += gravaRegistroC460(IListaRegistroC405[i].registroC460IList);
                registro += gravaRegistroC490(IListaRegistroC405[i].registroC490IList);
            }
            return registro;
        }

        public string gravaRegistroC420(IList<RegistroC420> IListaRegistroC420)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC420.Count; i++)
            {
                registro += u.preenche("C420")
                        + u.preenche(IListaRegistroC420[i].codTotPar)
                        + u.preenche(IListaRegistroC420[i].vlrAcumTot)
                        + u.preenche(IListaRegistroC420[i].nrTot)
                        + u.preenche(IListaRegistroC420[i].descrNrTot)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC420 += 1;
            }
            return registro;
        }

        public string gravaRegistroC425()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC425.Count; i++)
            {
                registro += u.preenche("C425")
                        + u.preenche(IListaRegistroC425[i].codItem)
                        + u.preenche(IListaRegistroC425[i].qtd)
                        + u.preenche(IListaRegistroC425[i].unid)
                        + u.preenche(IListaRegistroC425[i].vlItem)
                        + u.preenche(IListaRegistroC425[i].vlPis)
                        + u.preenche(IListaRegistroC425[i].vlCofins)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
            }
            return registro;
        }

        public string gravaRegistroC460(IList<RegistroC460> IListaRegistroC460)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC460.Count; i++)
            {
                registro += u.preenche("C460")
                        + u.preenche(IListaRegistroC460[i].codMod)
                        + u.preenche(IListaRegistroC460[i].codSit)
                        + u.preenche(IListaRegistroC460[i].numDoc)
                        + u.preenche(IListaRegistroC460[i].dtDoc)
                        + u.preenche(IListaRegistroC460[i].vlDoc)
                        + u.preenche(IListaRegistroC460[i].vlPis)
                        + u.preenche(IListaRegistroC460[i].vlCofins)
                        + u.preenche(IListaRegistroC460[i].cpfCnpj)
                        + u.preenche(IListaRegistroC460[i].nomAdq)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC460 += 1;
                gravaRegistroC470(IListaRegistroC460[i].registroC470IList);
            }
            return registro;
        }

        public string gravaRegistroC470(IList<RegistroC470> IListaRegistroC470)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC470.Count; i++)
            {
                registro += u.preenche("C470")
                        + u.preenche(IListaRegistroC470[i].codItem)
                        + u.preenche(IListaRegistroC470[i].qtd)
                        + u.preenche(IListaRegistroC470[i].qtdCanc)
                        + u.preenche(IListaRegistroC470[i].unid)
                        + u.preenche(IListaRegistroC470[i].vlItem)
                        + u.preenche(IListaRegistroC470[i].cstIcms)
                        + u.preenche(IListaRegistroC470[i].cfop)
                        + u.preenche(IListaRegistroC470[i].aliqIcms)
                        + u.preenche(IListaRegistroC470[i].vlPis)
                        + u.preenche(IListaRegistroC470[i].vlCofins)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC470 += 1;
            }
            return registro;
        }

        public string gravaRegistroC490(IList<RegistroC490> IListaRegistroC490)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistroC490.Count; i++)
            {
                registro += u.preenche("C490")
                        + u.preenche(IListaRegistroC490[i].cstIcms)
                        + u.preenche(IListaRegistroC490[i].cfop)
                        + u.preenche(IListaRegistroC490[i].aliqIcms)
                        + u.preenche(IListaRegistroC490[i].vlOpr)
                        + u.preenche(IListaRegistroC490[i].vlBcIcms)
                        + u.preenche(IListaRegistroC490[i].vlIcms)
                        + u.preenche(IListaRegistroC490[i].codObs)
                        + u.delimitador;
                        //+ u.crlf;

                registroC990.qtdLinC = registroC990.qtdLinC + 1;
                numeroRegistroC490 += 1;
            }
            return registro;
        }

        public string gravaRegistroC990()
        {
            registroC990.qtdLinC = registroC990.qtdLinC + 1;

            return u.preenche("C990")
                    + u.preenche(registroC990.qtdLinC)
                    + u.delimitador;
                    //+ u.crlf;
        }

    }
}
