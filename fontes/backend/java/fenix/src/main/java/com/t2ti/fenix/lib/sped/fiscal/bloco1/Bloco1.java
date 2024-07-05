/*
* The MIT License
* 
* Copyright: Copyright (C) 2014 T2Ti.COM
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
* @author Claudio de Barros (T2Ti.com)
* @version 2.0
*/
package com.t2ti.fenix.lib.sped.fiscal.bloco1;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.t2ti.fenix.lib.sped.SpedUtil;

public class Bloco1 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Registro1001 registro1001;
    private List<Registro1010> listaRegistro1010;
    private Registro1990 registro1990;
    private Integer numeroRegistro1010;
    private SpedUtil u;

    public Bloco1(SpedUtil spedUtil) {
        registro1001 = new Registro1001();
        registro1001.setIndMov(1);

        listaRegistro1010 = new ArrayList<Registro1010>();

        registro1990 = new Registro1990();
        registro1990.setQtdLin1(0);

        numeroRegistro1010 = 0;

        this.u = spedUtil;
    }

    public String gravaRegistro1001() {
        registro1990.setQtdLin1(registro1990.getQtdLin1() + 1);

        return u.preenche("1001")
                + u.preenche(registro1001.getIndMov())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistro1010() {
        String registro = "";
        for (int i = 0; i < listaRegistro1010.size(); i++) {
            registro += u.preenche("1010")
                    + u.preenche(listaRegistro1010.get(i).getIndExp())
                    + u.preenche(listaRegistro1010.get(i).getIndCcrf())
                    + u.preenche(listaRegistro1010.get(i).getIndComb())
                    + u.preenche(listaRegistro1010.get(i).getIndUsina())
                    + u.preenche(listaRegistro1010.get(i).getIndVa())
                    + u.preenche(listaRegistro1010.get(i).getIndEe())
                    + u.preenche(listaRegistro1010.get(i).getIndCart())
                    + u.preenche(listaRegistro1010.get(i).getIndForm())
                    + u.preenche(listaRegistro1010.get(i).getIndAer())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro1990.setQtdLin1(registro1990.getQtdLin1() + 1);
            numeroRegistro1010 += 1;
        }
        return registro;
    }

    public String gravaRegistro1990() {
        registro1990.setQtdLin1(registro1990.getQtdLin1() + 1);

        return u.preenche("1990")
                + u.preenche(registro1990.getQtdLin1())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public Registro1001 getRegistro1001() {
        return registro1001;
    }

    public Registro1990 getRegistro1990() {
        return registro1990;
    }

    public List<Registro1010> getListaRegistro1010() {
        return listaRegistro1010;
    }

    public Integer getNumeroRegistro1010() {
        return numeroRegistro1010;
    }
}
