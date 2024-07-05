/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [BANCO] 
                                                                                
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
    public class Bloco0
    {
        public Registro0000 registro0000 { get; set; }
        public Registro0001 registro0001 { get; set; }
        public IList<Registro0007> listaRegistro0007 { get; set; }
        public IList<Registro0020> listaRegistro0020 { get; set; }
        public IList<Registro0150> listaRegistro0150 { get; set; }
        public IList<Registro0180> listaRegistro0180 { get; set; }
        public Registro0990 registro0990 { get; set; }
        private SpedUtil u;

        public Bloco0()
        {
            this.registro0000 = new Registro0000();
            this.registro0001 = new Registro0001();
            this.registro0001.indDad = 1;
            this.listaRegistro0007 = new List<Registro0007>();
            this.listaRegistro0020 = new List<Registro0020>();
            this.listaRegistro0150 = new List<Registro0150>();
            this.listaRegistro0180 = new List<Registro0180>();
            this.registro0990 = new Registro0990();
            this.registro0990.qtdLin0 = 0;

            this.u = new SpedUtil();
        }

        public void limpaRegistros()
        {
            this.listaRegistro0007.Clear();
            this.listaRegistro0020.Clear();
            this.listaRegistro0150.Clear();
            this.listaRegistro0180.Clear();
            this.registro0990.qtdLin0 = 0;
        }

        public string gravaRegistro0000()
        {
            this.registro0990.qtdLin0 = registro0990.qtdLin0 + 1;

            return u.preenche("0000")
                    + u.preenche("LECD")
                    + u.preenche(registro0000.dtIni)
                    + u.preenche(registro0000.dtFin)
                    + u.preenche(registro0000.nome)
                    + u.preenche(registro0000.cnpj)
                    + u.preenche(registro0000.uf)
                    + u.preenche(registro0000.ie)
                    + u.preenche(registro0000.codMun)
                    + u.preenche(registro0000.im)
                    + u.preenche(registro0000.indSitEsp)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistro0001()
        {
            registro0990.qtdLin0 = registro0990.qtdLin0 + 1;

            return u.preenche("0001")
                    + u.preenche(registro0001.indDad)
                    + u.delimitador;
                    //+ u.crlf;
        }

        public string gravaRegistro0007()
        {
            string registro = "";
            for (int i = 0; i < listaRegistro0007.Count; i++)
            {
                registro += u.preenche("0007")
                        + u.preenche(listaRegistro0007[i].codEntRef)
                        + u.preenche(listaRegistro0007[i].codInscr)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 + 1;
            }
            return registro;
        }

        public string gravaRegistro0020()
        {
            string registro = "";
            for (int i = 0; i < listaRegistro0020.Count; i++)
            {
                registro += u.preenche("0020")
                        + u.preenche(listaRegistro0020[i].indDec)
                        + u.preenche(listaRegistro0020[i].cnpj)
                        + u.preenche(listaRegistro0020[i].uf)
                        + u.preenche(listaRegistro0020[i].ie)
                        + u.preenche(listaRegistro0020[i].codMun)
                        + u.preenche(listaRegistro0020[i].im)
                        + u.preenche(listaRegistro0020[i].nire)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 + 1;
            }
            return registro;
        }

        public string gravaRegistro0150()
        {
            string registro = "";
            for (int i = 0; i < listaRegistro0150.Count; i++)
            {
                registro += u.preenche("0150")
                        + u.preenche(listaRegistro0150[i].codPart)
                        + u.preenche(listaRegistro0150[i].nome)
                        + u.preenche(listaRegistro0150[i].codPais)
                        + u.preenche(listaRegistro0150[i].cnpj)
                        + u.preenche(listaRegistro0150[i].cpf)
                        + u.preenche(listaRegistro0150[i].nit)
                        + u.preenche(listaRegistro0150[i].uf)
                        + u.preenche(listaRegistro0150[i].ie)
                        + u.preenche(listaRegistro0150[i].ieSt)
                        + u.preenche(listaRegistro0150[i].codMun)
                        + u.preenche(listaRegistro0150[i].im)
                        + u.preenche(listaRegistro0150[i].suframa)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 + 1;
            }
            return registro;
        }

        public string gravaRegistro0180()
        {
            string registro = "";
            for (int i = 0; i < listaRegistro0180.Count; i++)
            {
                registro += u.preenche("0180")
                        + u.preenche(listaRegistro0180[i].codRel)
                        + u.preenche(listaRegistro0180[i].dtIniRel)
                        + u.preenche(listaRegistro0180[i].dtFinRel)
                        + u.delimitador;
                        //+ u.crlf;

                registro0990.qtdLin0 = registro0990.qtdLin0 + 1;
            }
            return registro;
        }

        public string gravaRegistro0990()
        {
            registro0990.qtdLin0 = registro0990.qtdLin0 + 1;

            return u.preenche("0990")
                    + u.preenche(registro0990.qtdLin0)
                    + u.delimitador;
                    //+ u.crlf;
        }
    }
}
