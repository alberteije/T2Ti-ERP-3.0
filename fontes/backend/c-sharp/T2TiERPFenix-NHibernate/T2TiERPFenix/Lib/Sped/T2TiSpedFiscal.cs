/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Lib T2Ti Sped Fiscal - EFD

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
    public class T2TiSpedFiscal
    {

        public Bloco0 bloco0 { get; set; }
        public BlocoC blocoC { get; set; }
        public BlocoE blocoE { get; set; }
        public BlocoH blocoH { get; set; }
        public Bloco1 bloco1 { get; set; }
        public Bloco9 bloco9 { get; set; }
        public IList<string> linhasArquivo;

        public T2TiSpedFiscal()
        {
            bloco0 = new Bloco0();
            blocoC = new BlocoC();
            blocoE = new BlocoE();
            blocoH = new BlocoH();
            bloco1 = new Bloco1();
            bloco9 = new Bloco9();
            linhasArquivo = new List<string>();
        }

        public void geraArquivoTxt(string nomeArquivo)
        {
            try
            {
                //bloco 0
                linhasArquivo.Add(bloco0.gravaRegistro0000());
                incluiRegistro9900("0000", 1);
                linhasArquivo.Add(bloco0.gravaRegistro0001());
                incluiRegistro9900("0001", 1);
                linhasArquivo.Add(bloco0.gravaRegistro0005());
                incluiRegistro9900("0005", 1);
                linhasArquivo.Add(bloco0.gravaRegistro0100());
                incluiRegistro9900("0100", 1);
                if (bloco0.IListaRegistro0150.Count > 0)
                {
                    linhasArquivo.Add(bloco0.gravaRegistro0150());
                    incluiRegistro9900("0150", bloco0.IListaRegistro0150.Count);
                    if (bloco0.numeroRegistro0175 > 0)
                    {
                        incluiRegistro9900("0175", bloco0.numeroRegistro0175);
                    }
                }
                if (bloco0.IListaRegistro0190.Count > 0)
                {
                    linhasArquivo.Add(bloco0.gravaRegistro0190());
                    incluiRegistro9900("0190", bloco0.IListaRegistro0190.Count);
                }
                if (bloco0.IListaRegistro0200.Count > 0)
                {
                    linhasArquivo.Add(bloco0.gravaRegistro0200());
                    incluiRegistro9900("0200", bloco0.IListaRegistro0200.Count);
                    if (bloco0.numeroRegistro0205 > 0)
                    {
                        incluiRegistro9900("0205", bloco0.numeroRegistro0205);
                    }
                    if (bloco0.numeroRegistro0220 > 0)
                    {
                        incluiRegistro9900("0220", bloco0.numeroRegistro0220);
                    }
                }
                linhasArquivo.Add(bloco0.gravaRegistro0990());
                incluiRegistro9900("0990", 1);

                //bloco C
                linhasArquivo.Add(blocoC.gravaRegistroC001());
                incluiRegistro9900("C001", 1);
                if (blocoC.IListaRegistroC100.Count > 0)
                {
                    linhasArquivo.Add(blocoC.gravaRegistroC100());
                    incluiRegistro9900("C100", blocoC.IListaRegistroC100.Count);
                    if (blocoC.numeroRegistroC170 > 0)
                    {
                        incluiRegistro9900("C170", blocoC.numeroRegistroC170);
                    }
                    if (blocoC.numeroRegistroC190 > 0)
                    {
                        incluiRegistro9900("C190", blocoC.numeroRegistroC190);
                    }
                }
                if (blocoC.IListaRegistroC114.Count > 0)
                {
                    linhasArquivo.Add(blocoC.gravaRegistroC114());
                    incluiRegistro9900("C114", blocoC.IListaRegistroC114.Count);
                }
                if (blocoC.IListaRegistroC300.Count > 0)
                {
                    linhasArquivo.Add(blocoC.gravaRegistroC300());
                    incluiRegistro9900("C300", blocoC.IListaRegistroC300.Count);
                    if (blocoC.numeroRegistroC310 > 0)
                    {
                        incluiRegistro9900("C310", blocoC.numeroRegistroC310);
                    }
                    if (blocoC.numeroRegistroC320 > 0)
                    {
                        incluiRegistro9900("C320", blocoC.numeroRegistroC320);
                        if (blocoC.numeroRegistroC321 > 0)
                        {
                            incluiRegistro9900("C321", blocoC.numeroRegistroC321);
                        }
                    }
                }
                if (blocoC.IListaRegistroC350.Count > 0)
                {
                    linhasArquivo.Add(blocoC.gravaRegistroC350());
                    incluiRegistro9900("C350", blocoC.IListaRegistroC350.Count);
                    if (blocoC.numeroRegistroC370 > 0)
                    {
                        incluiRegistro9900("C370", blocoC.numeroRegistroC370);
                    }
                    if (blocoC.numeroRegistroC390 > 0)
                    {
                        incluiRegistro9900("C390", blocoC.numeroRegistroC390);
                    }
                }
                if (blocoC.IListaRegistroC400.Count > 0)
                {
                    linhasArquivo.Add(blocoC.gravaRegistroC400());
                    incluiRegistro9900("C400", blocoC.IListaRegistroC400.Count);
                    if (blocoC.numeroRegistroC405 > 0)
                    {
                        incluiRegistro9900("C405", blocoC.numeroRegistroC405);
                        if (blocoC.numeroRegistroC420 > 0)
                        {
                            incluiRegistro9900("C420", blocoC.numeroRegistroC420);
                        }
                        if (blocoC.numeroRegistroC460 > 0)
                        {
                            incluiRegistro9900("C460", blocoC.numeroRegistroC460);
                            if (blocoC.numeroRegistroC470 > 0)
                            {
                                incluiRegistro9900("C470", blocoC.numeroRegistroC470);
                            }
                        }
                        if (blocoC.numeroRegistroC490 > 0)
                        {
                            incluiRegistro9900("C490", blocoC.numeroRegistroC490);
                        }
                    }
                }
                if (blocoC.IListaRegistroC425.Count > 0)
                {
                    linhasArquivo.Add(blocoC.gravaRegistroC425());
                    incluiRegistro9900("C425", blocoC.IListaRegistroC425.Count);
                }
                linhasArquivo.Add(blocoC.gravaRegistroC990());
                incluiRegistro9900("C990", 1);

                //bloco E
                linhasArquivo.Add(blocoE.gravaRegistroE001());
                incluiRegistro9900("E001", 1);
                if (blocoE.IListaRegistroE100.Count > 0)
                {
                    linhasArquivo.Add(blocoE.gravaRegistroE100(bloco0.registro0000.codVer));
                    incluiRegistro9900("E100", blocoE.IListaRegistroE100.Count);
                    if (blocoE.numeroRegistroE110 > 0)
                    {
                        incluiRegistro9900("E110", blocoE.numeroRegistroE110);
                        if (blocoE.numeroRegistroE116 > 0)
                        {
                            incluiRegistro9900("E116", blocoE.numeroRegistroE116);
                        }
                    }
                }
                linhasArquivo.Add(blocoE.gravaRegistroE990());
                incluiRegistro9900("E990", 1);

                //bloco H
                linhasArquivo.Add(blocoH.gravaRegistroH001());
                incluiRegistro9900("H001", 1);
                if (blocoH.IListaRegistroH005.Count > 0)
                {
                    linhasArquivo.Add(blocoH.gravaRegistroH005());
                    incluiRegistro9900("H005", blocoH.numeroRegistroH005);
                    if (blocoH.numeroRegistroH010 > 0)
                    {
                        incluiRegistro9900("H010", blocoH.numeroRegistroH010);
                    }
                }
                linhasArquivo.Add(blocoH.gravaRegistroH990());
                incluiRegistro9900("H990", 1);

                //bloco 1
                linhasArquivo.Add(bloco1.gravaRegistro1001());
                incluiRegistro9900("1001", 1);
                if (bloco1.IListaRegistro1010.Count > 0)
                {
                    linhasArquivo.Add(bloco1.gravaRegistro1010());
                    incluiRegistro9900("1010", bloco1.numeroRegistro1010);
                }
                linhasArquivo.Add(bloco1.gravaRegistro1990());
                incluiRegistro9900("1990", 1);

                //bloco 9
                linhasArquivo.Add(bloco9.gravaRegistro9001());
                incluiRegistro9900("9001", 1);

                incluiRegistro9900("9900", bloco9.IListaRegistro9900.Count + 2);
                incluiRegistro9900("9990", 1);
                incluiRegistro9900("9999", 1);
                linhasArquivo.Add(bloco9.gravaRegistro9900());
                linhasArquivo.Add(bloco9.gravaRegistro9990());

                bloco9.registro9999.qtdLin =
                        bloco0.registro0990.qtdLin0
                        + blocoC.registroC990.qtdLinC
                        + blocoE.registroE990.qtdLinE
                        + blocoH.registroH990.qtdLinH
                        + bloco1.registro1990.qtdLin1
                        + bloco9.registro9990.qtdLin9;
                linhasArquivo.Add(bloco9.gravaRegistro9999());

                System.IO.File.WriteAllLines(nomeArquivo, linhasArquivo);
            }
            catch (System.Exception e)
            {
                System.Console.Write(e.Message);
            }
        }

        private void incluiRegistro9900(string registro, int quantidade)
        {
            Registro9900 registro9900 = new Registro9900();
            registro9900.regBlc = registro;
            registro9900.qtdRegBlc = quantidade;

            bloco9.IListaRegistro9900.Add(registro9900);
        }

    }
}
