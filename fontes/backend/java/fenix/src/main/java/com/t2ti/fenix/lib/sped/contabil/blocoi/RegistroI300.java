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
import java.util.Date;
import java.util.List;

public class RegistroI300 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Date dtBcte; /// Data do Balancete.
    private List<RegistroI310> registroi310List; /// BLOCO I - Lista de RegistroI310 (FILHO)

    /**
     * @return the dtBcte
     */
    public Date getDtBcte() {
        return dtBcte;
    }

    /**
     * @param dtBcte the dtBcte to set
     */
    public void setDtBcte(Date dtBcte) {
        this.dtBcte = dtBcte;
    }

    /**
     * @return the registroi310List
     */
    public List<RegistroI310> getRegistroi310List() {
        return registroi310List;
    }

    /**
     * @param registroi310List the registroi310List to set
     */
    public void setRegistroi310List(List<RegistroI310> registroi310List) {
        this.registroi310List = registroi310List;
    }
}
