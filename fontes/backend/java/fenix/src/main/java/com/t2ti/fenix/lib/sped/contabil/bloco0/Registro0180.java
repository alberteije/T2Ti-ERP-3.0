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

import java.io.Serializable;
import java.util.Date;

public class Registro0180 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codRel; /// Código do relacionamento conforme tabela publicada pelo Sped.
    private Date dtIniRel; /// Data do início do relacionamento.
    private Date dtFinRel; /// Data do término do relacionamento.

    /**
     * @return the codRel
     */
    public String getCodRel() {
        return codRel;
    }

    /**
     * @param codRel the codRel to set
     */
    public void setCodRel(String codRel) {
        this.codRel = codRel;
    }

    /**
     * @return the dtIniRel
     */
    public Date getDtIniRel() {
        return dtIniRel;
    }

    /**
     * @param dtIniRel the dtIniRel to set
     */
    public void setDtIniRel(Date dtIniRel) {
        this.dtIniRel = dtIniRel;
    }

    /**
     * @return the dtFinRel
     */
    public Date getDtFinRel() {
        return dtFinRel;
    }

    /**
     * @param dtFinRel the dtFinRel to set
     */
    public void setDtFinRel(Date dtFinRel) {
        this.dtFinRel = dtFinRel;
    }
}
