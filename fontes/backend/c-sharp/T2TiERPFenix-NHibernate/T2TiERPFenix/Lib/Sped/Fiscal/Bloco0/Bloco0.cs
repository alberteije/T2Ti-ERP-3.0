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
    public class Bloco0
    {
        public Registro0000 registro0000 { get; set; }
        public Registro0001 registro0001 { get; set; }
        public Registro0005 registro0005 { get; set; }
        public Registro0100 registro0100 { get; set; }
        public IList<Registro0150> IListaRegistro0150 { get; set; }
        public IList<Registro0190> IListaRegistro0190 { get; set; }
        public IList<Registro0200> IListaRegistro0200 { get; set; }

        public Registro0990 registro0990 { get; set; }
        public int numeroRegistro0175;
        public int numeroRegistro0205;
        public int numeroRegistro0220;

        public SpedUtil u;

        public Bloco0()
        {
            registro0000 = new Registro0000();
            registro0001 = new Registro0001();
            registro0001.indMov = 1;
            registro0005 = new Registro0005();
            registro0100 = new Registro0100();
            IListaRegistro0150 = new List<Registro0150>();
            IListaRegistro0190 = new List<Registro0190>();
            IListaRegistro0200 = new List<Registro0200>();

            registro0990 = new Registro0990();
            registro0990.qtdLin0 = 0;

            numeroRegistro0175 = 0;
            numeroRegistro0205 = 0;
            numeroRegistro0220 = 0;

            this.u = new SpedUtil();
        }

        public string gravaRegistro0000()
        {
            registro0990.qtdLin0 = registro0990.qtdLin0 = 1;

            return u.preenche("0000")
                    + u.preenche(registro0000.codVer)
                    + u.preenche(registro0000.codFin)
                    + u.preenche(registro0000.dtIni)
                    + u.preenche(registro0000.dtFin)
                    + u.preenche(registro0000.nome)
                    + u.preenche(registro0000.cnpj)
                    + u.preenche(registro0000.cpf)
                    + u.preenche(registro0000.uf)
                    + u.preenche(registro0000.ie)
                    + u.preenche(registro0000.codMun)
                    + u.preenche(registro0000.im)
                    + u.preenche(registro0000.suframa)
                    + u.preenche(registro0000.indPerfil)
                    + u.preenche(registro0000.indAtiv)
                    + u.delimitador;;
                    ////+ u.crlf;
        }

        public string gravaRegistro0001()
        {
            registro0990.qtdLin0 = registro0990.qtdLin0 = 1;

            return u.preenche("0001")
                    + u.preenche(registro0001.indMov)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistro0005()
        {
            registro0990.qtdLin0 = registro0990.qtdLin0 = 1;

            return u.preenche("0005")
                    + u.preenche(registro0005.fantasia)
                    + u.preenche(registro0005.cep)
                    + u.preenche(registro0005.endereco)
                    + u.preenche(registro0005.num)
                    + u.preenche(registro0005.compl)
                    + u.preenche(registro0005.bairro)
                    + u.preenche(registro0005.fone)
                    + u.preenche(registro0005.fax)
                    + u.preenche(registro0005.email)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistro0100()
        {
            registro0990.qtdLin0 = registro0990.qtdLin0 = 1;

            return u.preenche("0100")
                    + u.preenche(registro0100.nome)
                    + u.preenche(registro0100.cpf)
                    + u.preenche(registro0100.crc)
                    + u.preenche(registro0100.cnpj)
                    + u.preenche(registro0100.cep)
                    + u.preenche(registro0100.endereco)
                    + u.preenche(registro0100.num)
                    + u.preenche(registro0100.compl)
                    + u.preenche(registro0100.bairro)
                    + u.preenche(registro0100.fone)
                    + u.preenche(registro0100.fax)
                    + u.preenche(registro0100.email)
                    + u.preenche(registro0100.codMun)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistro0150()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistro0150.Count; i++)
            {
                registro += u.preenche("0150")
                        + u.preenche(IListaRegistro0150[i].codPart)
                        + u.preenche(IListaRegistro0150[i].nome)
                        + u.preenche(IListaRegistro0150[i].codPais)
                        + u.preenche(IListaRegistro0150[i].cnpj)
                        + u.preenche(IListaRegistro0150[i].cpf)
                        + u.preenche(IListaRegistro0150[i].ie)
                        + u.preenche(IListaRegistro0150[i].codMun)
                        + u.preenche(IListaRegistro0150[i].suframa)
                        + u.preenche(IListaRegistro0150[i].endereco)
                        + u.preenche(IListaRegistro0150[i].num)
                        + u.preenche(IListaRegistro0150[i].compl)
                        + u.preenche(IListaRegistro0150[i].bairro)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 = 1;
                registro += gravaRegistro0175(IListaRegistro0150[i].registro0175IList);
            }
            return registro;
        }

        public string gravaRegistro0175(IList<Registro0175> IListaRegistro0175)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistro0175.Count; i++)
            {
                registro += u.preenche("0175")
                        + u.preenche(IListaRegistro0175[i].dtAlt)
                        + u.preenche(IListaRegistro0175[i].nrCampo)
                        + u.preenche(IListaRegistro0175[i].contAnt)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 = 1;
                numeroRegistro0175 += 1;
            }
            return registro;
        }

        public string gravaRegistro0190()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistro0190.Count; i++)
            {
                registro += u.preenche("0190")
                        + u.preenche(IListaRegistro0190[i].unid)
                        + u.preenche(IListaRegistro0190[i].descr)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 = 1;
            }
            return registro;
        }

        public string gravaRegistro0200()
        {
            string registro = "";
            for (int i = 0; i < IListaRegistro0200.Count; i++)
            {
                registro += u.preenche("0200")
                        + u.preenche(IListaRegistro0200[i].codItem)
                        + u.preenche(IListaRegistro0200[i].descrItem)
                        + u.preenche(IListaRegistro0200[i].codBarra)
                        + u.preenche(IListaRegistro0200[i].codAntItem)
                        + u.preenche(IListaRegistro0200[i].unidInv)
                        + u.preenche(IListaRegistro0200[i].tipoItem)
                        + u.preenche(IListaRegistro0200[i].codNcm)
                        + u.preenche(IListaRegistro0200[i].exIpi)
                        + u.preenche(IListaRegistro0200[i].codGen)
                        + u.preenche(IListaRegistro0200[i].codLst)
                        + u.preenche(IListaRegistro0200[i].aliqIcms)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 = 1;
                registro += gravaRegistro0205(IListaRegistro0200[i].registro0205IList);
                registro += gravaRegistro0220(IListaRegistro0200[i].registro0220IList);
            }
            return registro;
        }

        public string gravaRegistro0205(IList<Registro0205> IListaRegistro0205)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistro0205.Count; i++)
            {
                registro += u.preenche("0205")
                        + u.preenche(IListaRegistro0205[i].descrAntItem)
                        + u.preenche(IListaRegistro0205[i].dtIni)
                        + u.preenche(IListaRegistro0205[i].dtFin)
                        + u.preenche(IListaRegistro0205[i].codAntItem)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 = 1;
                numeroRegistro0205 += 1;
            }
            return registro;
        }

        public string gravaRegistro0220(IList<Registro0220> IListaRegistro0220)
        {
            string registro = "";
            for (int i = 0; i < IListaRegistro0220.Count; i++)
            {
                registro += u.preenche("0220")
                        + u.preenche(IListaRegistro0220[i].unidConv)
                        + u.preenche(IListaRegistro0220[i].fatConv)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 = 1;
                numeroRegistro0220 += 1;
            }
            return registro;
        }

        public string gravaRegistro0990()
        {
            registro0990.qtdLin0 = registro0990.qtdLin0 = 1;

            return u.preenche("0990")
                    + u.preenche(registro0990.qtdLin0)
                    + u.delimitador;
                    //+ u.crlf;
        }
    }
}
