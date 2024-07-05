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
package com.t2ti.fenix.lib.sped.contabil.bloco0;

import com.t2ti.fenix.lib.sped.SpedUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Bloco0 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Registro0000 registro0000;
    private Registro0001 registro0001;
    private List<Registro0007> listaRegistro0007;
    private List<Registro0020> listaRegistro0020;
    private List<Registro0150> listaRegistro0150;
    private List<Registro0180> listaRegistro0180;
    private Registro0990 registro0990;
    private SpedUtil u;

    public Bloco0(SpedUtil spedUtil) {
        registro0000 = new Registro0000();
        registro0001 = new Registro0001();
        registro0001.setIndDad(1);
        listaRegistro0007 = new ArrayList<Registro0007>();
        listaRegistro0020 = new ArrayList<Registro0020>();
        listaRegistro0150 = new ArrayList<Registro0150>();
        listaRegistro0180 = new ArrayList<Registro0180>();
        registro0990 = new Registro0990();
        registro0990.setQtdLin0(0);

        this.u = spedUtil;
    }

    public void limpaRegistros() {
        listaRegistro0007.clear();
        listaRegistro0020.clear();
        listaRegistro0150.clear();
        listaRegistro0180.clear();
        registro0990.setQtdLin0(0);
    }

    public String gravaRegistro0000() {
        registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);

        return u.preenche("0000")
                + u.preenche("LECD")
                + u.preenche(registro0000.getDtIni())
                + u.preenche(registro0000.getDtFin())
                + u.preenche(registro0000.getNome())
                + u.preenche(registro0000.getCnpj())
                + u.preenche(registro0000.getUf())
                + u.preenche(registro0000.getIe())
                + u.preenche(registro0000.getCodMun())
                + u.preenche(registro0000.getIm())
                + u.preenche(registro0000.getIndSitEsp())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistro0001() {
        registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);

        return u.preenche("0001")
                + u.preenche(registro0001.getIndDad())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistro0007() {
        String registro = "";
        for (int i = 0; i < listaRegistro0007.size(); i++) {
            registro += u.preenche("0007")
                    + u.preenche(listaRegistro0007.get(i).getCodEntRef())
                    + u.preenche(listaRegistro0007.get(i).getCodInscr())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
        }
        return registro;
    }

    public String gravaRegistro0020() {
        String registro = "";
        for (int i = 0; i < listaRegistro0020.size(); i++) {
            registro += u.preenche("0020")
                    + u.preenche(listaRegistro0020.get(i).getIndDec())
                    + u.preenche(listaRegistro0020.get(i).getCnpj())
                    + u.preenche(listaRegistro0020.get(i).getUf())
                    + u.preenche(listaRegistro0020.get(i).getIe())
                    + u.preenche(listaRegistro0020.get(i).getCodMun())
                    + u.preenche(listaRegistro0020.get(i).getIm())
                    + u.preenche(listaRegistro0020.get(i).getNire())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
        }
        return registro;
    }

    public String gravaRegistro0150() {
        String registro = "";
        for (int i = 0; i < listaRegistro0150.size(); i++) {
            registro += u.preenche("0150")
                    + u.preenche(listaRegistro0150.get(i).getCodPart())
                    + u.preenche(listaRegistro0150.get(i).getNome())
                    + u.preenche(listaRegistro0150.get(i).getCodPais())
                    + u.preenche(listaRegistro0150.get(i).getCnpj())
                    + u.preenche(listaRegistro0150.get(i).getCpf())
                    + u.preenche(listaRegistro0150.get(i).getNit())
                    + u.preenche(listaRegistro0150.get(i).getUf())
                    + u.preenche(listaRegistro0150.get(i).getIe())
                    + u.preenche(listaRegistro0150.get(i).getIeSt())
                    + u.preenche(listaRegistro0150.get(i).getCodMun())
                    + u.preenche(listaRegistro0150.get(i).getIm())
                    + u.preenche(listaRegistro0150.get(i).getSuframa())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
        }
        return registro;
    }

    public String gravaRegistro0180() {
        String registro = "";
        for (int i = 0; i < listaRegistro0180.size(); i++) {
            registro += u.preenche("0180")
                    + u.preenche(listaRegistro0180.get(i).getCodRel())
                    + u.preenche(listaRegistro0180.get(i).getDtIniRel())
                    + u.preenche(listaRegistro0180.get(i).getDtFinRel())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
        }
        return registro;
    }

    public String gravaRegistro0990() {
        registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);

        return u.preenche("0990")
                + u.preenche(registro0990.getQtdLin0())
                + u.getDelimitador()
                + u.getCrlf();
    }

    /**
     * @return the registro0000
     */
    public Registro0000 getRegistro0000() {
        return registro0000;
    }

    /**
     * @return the registro0001
     */
    public Registro0001 getRegistro0001() {
        return registro0001;
    }

    /**
     * @return the listaRegistro0007
     */
    public List<Registro0007> getListaRegistro0007() {
        return listaRegistro0007;
    }

    /**
     * @return the listaRegistro0020
     */
    public List<Registro0020> getListaRegistro0020() {
        return listaRegistro0020;
    }

    /**
     * @return the listaRegistro0150
     */
    public List<Registro0150> getListaRegistro0150() {
        return listaRegistro0150;
    }

    /**
     * @return the listaRegistro0180
     */
    public List<Registro0180> getListaRegistro0180() {
        return listaRegistro0180;
    }

    /**
     * @return the registro0990
     */
    public Registro0990 getRegistro0990() {
        return registro0990;
    }
}
