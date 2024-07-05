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
package com.t2ti.fenix.lib.sped.fiscal.blocoe;

import java.io.Serializable;
import java.util.Date;

public class RegistroE100 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Date dtIni; // Data inicial a que a apuração se refere
    private Date dtFin; // Data final a que a apuração se refere
    private RegistroE110 registroE110;

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
     * @return the registroe110
     */
    public RegistroE110 getRegistroE110() {
        return registroE110;
    }

    /**
     * @param registroe110 the registroe110 to set
     */
    public void setRegistroE110(RegistroE110 registroE110) {
        this.registroE110 = registroE110;
    }
}
