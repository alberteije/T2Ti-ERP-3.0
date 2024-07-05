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
package com.t2ti.fenix.lib.sped.contabil.bloco9;

import com.t2ti.fenix.lib.sped.SpedUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Bloco9 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Registro9001 registro9001;
    private List<Registro9900> listaRegistro9900;
    private Registro9990 registro9990;
    private Registro9999 registro9999;
    private SpedUtil u;

    public Bloco9(SpedUtil spedUtil) {
        registro9001 = new Registro9001();
        registro9001.setIndDad(1);
        listaRegistro9900 = new ArrayList<Registro9900>();
        registro9990 = new Registro9990();
        registro9999 = new Registro9999();

        registro9990.setQtdLin9(0);

        this.u = spedUtil;
    }

    public void limpaRegistros(){
        listaRegistro9900.clear();

        registro9990.setQtdLin9(0);
    }

    public String gravaRegistro9001(){
        getRegistro9990().setQtdLin9(getRegistro9990().getQtdLin9() + 1);
        
        return u.preenche("9001") +
                u.preenche(getRegistro9001().getIndDad()) +
                u.getDelimitador() +
                u.getCrlf();
    }

    public String gravaRegistro9900(){
        String registro = "";
        for (int i = 0; i < getListaRegistro9900().size(); i++){
            registro += u.preenche("9900") +
                    u.preenche(getListaRegistro9900().get(i).getRegBlc()) +
                    u.preenche(getListaRegistro9900().get(i).getQtdRegBlc()) +
                    u.getDelimitador() +
                    u.getCrlf();
        }
        getRegistro9990().setQtdLin9(getRegistro9990().getQtdLin9() + getListaRegistro9900().size() + 2);
        return registro;
    }

    public String gravaRegistro9990(){
        return u.preenche("9990") +
                u.preenche(getRegistro9990().getQtdLin9()) +
                u.getDelimitador() +
                u.getCrlf();
    }

    public String gravaRegistro9999(){
        return u.preenche("9999") +
                u.preenche(getRegistro9999().getQtdLin()) +
                u.getDelimitador() +
                u.getCrlf();
    }

    /**
     * @return the registro9001
     */
    public Registro9001 getRegistro9001() {
        return registro9001;
    }

    /**
     * @return the listaRegistro9900
     */
    public List<Registro9900> getListaRegistro9900() {
        return listaRegistro9900;
    }

    /**
     * @return the registro9990
     */
    public Registro9990 getRegistro9990() {
        return registro9990;
    }

    /**
     * @return the registro9999
     */
    public Registro9999 getRegistro9999() {
        return registro9999;
    }
}
