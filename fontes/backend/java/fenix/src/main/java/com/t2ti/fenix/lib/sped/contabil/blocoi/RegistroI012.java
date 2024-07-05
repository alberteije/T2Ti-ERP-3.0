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
package com.t2ti.fenix.lib.sped.contabil.blocoi;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class RegistroI012 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String numOrd; /// Número de ordem do instrumento associado.
    private String natLivr; /// Natureza do livro associado
    private String tipo; /// Tipo de escrituração do livro associado
    private String codHashAux; /// Código Hash do arquivo correspondente ao livro auxiliar utilizado na assinatura digital.
    private List<RegistroI015> registroI015List; /// BLOCO I - Lista de RegistroI051 (FILHO)

    public RegistroI012() {
        registroI015List = new ArrayList<RegistroI015>();
    }

    /**
     * @return the numOrd
     */
    public String getNumOrd() {
        return numOrd;
    }

    /**
     * @param numOrd the numOrd to set
     */
    public void setNumOrd(String numOrd) {
        this.numOrd = numOrd;
    }

    /**
     * @return the natLivr
     */
    public String getNatLivr() {
        return natLivr;
    }

    /**
     * @param natLivr the natLivr to set
     */
    public void setNatLivr(String natLivr) {
        this.natLivr = natLivr;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the codHashAux
     */
    public String getCodHashAux() {
        return codHashAux;
    }

    /**
     * @param codHashAux the codHashAux to set
     */
    public void setCodHashAux(String codHashAux) {
        this.codHashAux = codHashAux;
    }

    /**
     * @return the registroI015List
     */
    public List<RegistroI015> getRegistroI015List() {
        return registroI015List;
    }

    /**
     * @param registroI015List the registroI015List to set
     */
    public void setRegistroI015List(List<RegistroI015> registroI015List) {
        this.registroI015List = registroI015List;
    }

}
