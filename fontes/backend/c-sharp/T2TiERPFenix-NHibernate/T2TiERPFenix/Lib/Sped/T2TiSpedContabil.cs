/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Lib T2Ti Sped Fiscal - EFD
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
using System.Collections.Generic;

namespace T2Ti.Lib.Sped.Contabil
{
    public class T2TiSpedContabil
    {
        public Bloco0 bloco0 { get; set; }
        public BlocoI blocoI { get; set; }
        public BlocoJ blocoJ { get; set; }
        public Bloco9 bloco9 { get; set; }
        private IList<string> linhasArquivo;
        private int indexI030;
        private int indexJ900;

        public T2TiSpedContabil()
        {
            bloco0 = new Bloco0();
            blocoI = new BlocoI();
            blocoJ = new BlocoJ();
            bloco9 = new Bloco9();
            linhasArquivo = new List<string>();
        }

        public void limpaRegistros()
        {
            bloco0.limpaRegistros();
            blocoI.limpaRegistros();
            blocoJ.limpaRegistros();
            bloco9.limpaRegistros();
        }

        public void geraArquivoTxt(string nomeArquivo)
        {
            try
            {
                bloco9.listaRegistro9900.Clear();

                //bloco 0
                linhasArquivo.Add(bloco0.gravaRegistro0000());
                incluiRegistro9900("0000", 1);
                linhasArquivo.Add(bloco0.gravaRegistro0001());
                incluiRegistro9900("0001", 1);
                if (bloco0.listaRegistro0007.Count > 0)
                {
                    linhasArquivo.Add(bloco0.gravaRegistro0007());
                    incluiRegistro9900("0007", bloco0.listaRegistro0007.Count);
                }
                if (bloco0.listaRegistro0020.Count > 0)
                {
                    linhasArquivo.Add(bloco0.gravaRegistro0020());
                    incluiRegistro9900("0020", bloco0.listaRegistro0020.Count);
                }
                if (bloco0.listaRegistro0150.Count > 0)
                {
                    linhasArquivo.Add(bloco0.gravaRegistro0150());
                    incluiRegistro9900("0150", bloco0.listaRegistro0150.Count);
                }
                if (bloco0.listaRegistro0180.Count > 0)
                {
                    linhasArquivo.Add(bloco0.gravaRegistro0180());
                    incluiRegistro9900("0180", bloco0.listaRegistro0180.Count);
                }
                linhasArquivo.Add(bloco0.gravaRegistro0990());
                incluiRegistro9900("0990", 1);

                //bloco I
                linhasArquivo.Add(blocoI.gravaRegistroI001());
                incluiRegistro9900("I001", 1);
                linhasArquivo.Add(blocoI.gravaRegistroI010());
                incluiRegistro9900("I010", 1);
                if (blocoI.listaRegistroI012.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI012());
                    incluiRegistro9900("I012", blocoI.listaRegistroI012.Count);
                    if (blocoI.numeroRegistrosI015 > 0)
                    {
                        incluiRegistro9900("I015", blocoI.numeroRegistrosI015);
                    }
                }
                if (blocoI.listaRegistroI020.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI020());
                    incluiRegistro9900("I020", blocoI.listaRegistroI020.Count);
                }

                linhasArquivo.Add(blocoI.gravaRegistroI030());
                incluiRegistro9900("I030", 1);
                indexI030 = linhasArquivo.Count - 1;

                if (blocoI.listaRegistroI050.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI050());
                    incluiRegistro9900("I050", blocoI.listaRegistroI050.Count);
                    if (blocoI.numeroRegistrosI051 > 0)
                    {
                        incluiRegistro9900("I051", blocoI.numeroRegistrosI051);
                    }
                    if (blocoI.numeroRegistrosI052 > 0)
                    {
                        incluiRegistro9900("I052", blocoI.numeroRegistrosI052);
                    }
                }
                if (blocoI.listaRegistroI075.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI075());
                    incluiRegistro9900("I075", blocoI.listaRegistroI075.Count);
                }
                if (blocoI.listaRegistroI100.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI100());
                    incluiRegistro9900("I100", blocoI.listaRegistroI100.Count);
                }
                if (blocoI.listaRegistroI150.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI150());
                    incluiRegistro9900("I150", blocoI.listaRegistroI150.Count);
                    if (blocoI.numeroRegistrosI151 > 0)
                    {
                        incluiRegistro9900("I151", blocoI.numeroRegistrosI151);
                    }
                    if (blocoI.numeroRegistrosI155 > 0)
                    {
                        incluiRegistro9900("I155", blocoI.numeroRegistrosI155);
                    }
                }
                if (blocoI.listaRegistroI200.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI200());
                    incluiRegistro9900("I200", blocoI.listaRegistroI200.Count);
                    if (blocoI.numeroRegistrosI250 > 0)
                    {
                        incluiRegistro9900("I250", blocoI.numeroRegistrosI250);
                    }
                }
                if (blocoI.listaRegistroI300.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI300());
                    incluiRegistro9900("I300", blocoI.listaRegistroI300.Count);
                    if (blocoI.numeroRegistrosI310 > 0)
                    {
                        incluiRegistro9900("I310", blocoI.numeroRegistrosI310);
                    }
                }
                if (blocoI.listaRegistroI350.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI350());
                    incluiRegistro9900("I350", blocoI.listaRegistroI350.Count);
                    if (blocoI.numeroRegistrosI355 > 0)
                    {
                        incluiRegistro9900("I355", blocoI.numeroRegistrosI355);
                    }
                }
                if (blocoI.listaRegistroI500.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI500());
                    incluiRegistro9900("I500", blocoI.listaRegistroI500.Count);
                }
                if (blocoI.listaRegistroI510.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI510());
                    incluiRegistro9900("I510", blocoI.listaRegistroI510.Count);
                }
                if (blocoI.listaRegistroI550.Count > 0)
                {
                    linhasArquivo.Add(blocoI.gravaRegistroI550());
                    incluiRegistro9900("I550", blocoI.listaRegistroI550.Count);
                    if (blocoI.numeroRegistrosI555 > 0)
                    {
                        incluiRegistro9900("I555", blocoI.numeroRegistrosI555);
                    }
                }
                linhasArquivo.Add(blocoI.gravaRegistroI990());
                incluiRegistro9900("I990", 1);

                //bloco J
                linhasArquivo.Add(blocoJ.gravaRegistroJ001());
                incluiRegistro9900("J001", 1);
                if (blocoJ.listaRegistroJ005.Count > 0)
                {
                    linhasArquivo.Add(blocoJ.gravaRegistroJ005());
                    incluiRegistro9900("J005", blocoJ.listaRegistroJ005.Count);
                    if (blocoJ.numeroRegistrosJ100 > 0)
                    {
                        incluiRegistro9900("J100", blocoJ.numeroRegistrosJ100);
                    }
                    if (blocoJ.numeroRegistrosJ150 > 0)
                    {
                        incluiRegistro9900("J150", blocoJ.numeroRegistrosJ150);
                    }
                }
                if (blocoJ.listaRegistroJ800.Count > 0)
                {
                    linhasArquivo.Add(blocoJ.gravaRegistroJ800());
                    incluiRegistro9900("J800", blocoJ.listaRegistroJ800.Count);
                }
                linhasArquivo.Add(blocoJ.gravaRegistroJ900());
                incluiRegistro9900("J900", 1);
                indexJ900 = linhasArquivo.Count - 1;

                if (blocoJ.listaRegistroJ930.Count > 0)
                {
                    linhasArquivo.Add(blocoJ.gravaRegistroJ930());
                    incluiRegistro9900("J930", blocoJ.listaRegistroJ930.Count);
                }
                linhasArquivo.Add(blocoJ.gravaRegistroJ990());
                incluiRegistro9900("J990", 1);

                //bloco 9
                linhasArquivo.Add(bloco9.gravaRegistro9001());
                incluiRegistro9900("9001", 1);

                incluiRegistro9900("9900", bloco9.listaRegistro9900.Count + 2);
                incluiRegistro9900("9990", 1);
                incluiRegistro9900("9999", 1);
                linhasArquivo.Add(bloco9.gravaRegistro9900());
                linhasArquivo.Add(bloco9.gravaRegistro9990());

                bloco9.registro9999.qtdLin =
                        bloco0.registro0990.qtdLin0
                        + blocoI.registroI990.qtdLinI
                        + blocoJ.registroJ990.qtdLinJ
                        + bloco9.registro9990.qtdLin9;
                linhasArquivo.Add(bloco9.gravaRegistro9999());

                blocoI.registroI030.qtdLin = bloco9.registro9999.qtdLin;
                linhasArquivo[indexI030] = blocoI.gravaRegistroI030();

                blocoJ.registroJ900.qtdLin = bloco9.registro9999.qtdLin;
                linhasArquivo[indexJ900] = blocoJ.gravaRegistroJ900();

                System.IO.File.WriteAllLines(nomeArquivo, linhasArquivo);
            }
            catch (System.Exception e)
            {
                System.Console.Write(e.Message);
            }
        }

        public void incluiRegistro9900(string registro, int quantidade)
        {
            Registro9900 registro9900 = new Registro9900();
            registro9900.regBlc = registro;
            registro9900.qtdRegBlc = quantidade;

            bloco9.listaRegistro9900.Add(registro9900);
        }
    }
}
