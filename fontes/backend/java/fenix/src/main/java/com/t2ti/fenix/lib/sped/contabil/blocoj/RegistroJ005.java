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
package com.t2ti.fenix.lib.sped.contabil.blocoj;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class RegistroJ005 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Date dtIni; /// Data inicial das demonstrações contábeis.
    private Date dtFin; /// Data final das demonstrações contábeis.
    private Integer idDem; /// Identificação das demonstrações
    private String cabDem; /// Cabeçalho das demonstrações.
    private List<RegistroJ100> registroJ100List; /// BLOCO J - Lista de RegistroJ100 (FILHO)
    private List<RegistroJ150> registroJ150List; /// BLOCO J - Lista de RegistroJ150 (FILHO)

    /**
     * @return the dtIni
     */
    public Date getDtIni() {
        return dtIni;
    }

    /**
     * @param dtIni the dtIni to set
     */
    public void setDtIni(Date dtIni) {
        this.dtIni = dtIni;
    }

    /**
     * @return the dtFin
     */
    public Date getDtFin() {
        return dtFin;
    }

    /**
     * @param dtFin the dtFin to set
     */
    public void setDtFin(Date dtFin) {
        this.dtFin = dtFin;
    }

    /**
     * @return the idDem
     */
    public Integer getIdDem() {
        return idDem;
    }

    /**
     * @param idDem the idDem to set
     */
    public void setIdDem(Integer idDem) {
        this.idDem = idDem;
    }

    /**
     * @return the cabDem
     */
    public String getCabDem() {
        return cabDem;
    }

    /**
     * @param cabDem the cabDem to set
     */
    public void setCabDem(String cabDem) {
        this.cabDem = cabDem;
    }

    /**
     * @return the registroJ100List
     */
    public List<RegistroJ100> getRegistroJ100List() {
        return registroJ100List;
    }

    /**
     * @param registroJ100List the registroJ100List to set
     */
    public void setRegistroJ100List(List<RegistroJ100> registroJ100List) {
        this.registroJ100List = registroJ100List;
    }

    /**
     * @return the registroJ150List
     */
    public List<RegistroJ150> getRegistroJ150List() {
        return registroJ150List;
    }

    /**
     * @param registroJ150List the registroJ150List to set
     */
    public void setRegistroJ150List(List<RegistroJ150> registroJ150List) {
        this.registroJ150List = registroJ150List;
    }
}
