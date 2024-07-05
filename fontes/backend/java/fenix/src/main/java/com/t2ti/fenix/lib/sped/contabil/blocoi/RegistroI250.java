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
import java.math.BigDecimal;

public class RegistroI250 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codCta;
    private String codCcus;
    private BigDecimal vlDc;
    private String indDc;
    private String numArq;
    private String codHistPad;
    private String hist;
    private String codPart;

    /**
     * @return the codCta
     */
    public String getCodCta() {
        return codCta;
    }

    /**
     * @param codCta the codCta to set
     */
    public void setCodCta(String codCta) {
        this.codCta = codCta;
    }

    /**
     * @return the codCcus
     */
    public String getCodCcus() {
        return codCcus;
    }

    /**
     * @param codCcus the codCcus to set
     */
    public void setCodCcus(String codCcus) {
        this.codCcus = codCcus;
    }

    /**
     * @return the vlDc
     */
    public BigDecimal getVlDc() {
        return vlDc;
    }

    /**
     * @param vlDc the vlDc to set
     */
    public void setVlDc(BigDecimal vlDc) {
        this.vlDc = vlDc;
    }

    /**
     * @return the indDc
     */
    public String getIndDc() {
        return indDc;
    }

    /**
     * @param indDc the indDc to set
     */
    public void setIndDc(String indDc) {
        this.indDc = indDc;
    }

    /**
     * @return the numArq
     */
    public String getNumArq() {
        return numArq;
    }

    /**
     * @param numArq the numArq to set
     */
    public void setNumArq(String numArq) {
        this.numArq = numArq;
    }

    /**
     * @return the codHistPad
     */
    public String getCodHistPad() {
        return codHistPad;
    }

    /**
     * @param codHistPad the codHistPad to set
     */
    public void setCodHistPad(String codHistPad) {
        this.codHistPad = codHistPad;
    }

    /**
     * @return the hist
     */
    public String getHist() {
        return hist;
    }

    /**
     * @param hist the hist to set
     */
    public void setHist(String hist) {
        this.hist = hist;
    }

    /**
     * @return the codPart
     */
    public String getCodPart() {
        return codPart;
    }

    /**
     * @param codPart the codPart to set
     */
    public void setCodPart(String codPart) {
        this.codPart = codPart;
    }
}
