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

public class RegistroI350 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Date dtRes; /// Data da apuração do resultado.
    private List<RegistroI355> registroi355List; /// BLOCO I - Lista de RegistroI355 (FILHO)

    /**
     * @return the dtRes
     */
    public Date getDtRes() {
        return dtRes;
    }

    /**
     * @param dtRes the dtRes to set
     */
    public void setDtRes(Date dtRes) {
        this.dtRes = dtRes;
    }

    /**
     * @return the registroi355List
     */
    public List<RegistroI355> getRegistroi355List() {
        return registroi355List;
    }

    /**
     * @param registroi355List the registroi355List to set
     */
    public void setRegistroi355List(List<RegistroI355> registroi355List) {
        this.registroi355List = registroi355List;
    }
}
