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
package com.t2ti.fenix.lib.sped.fiscal.blococ;

import java.io.Serializable;
import java.util.Date;

public class RegistroC114 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codMod; // Código do modelo do documento fiscal, conforme a tabela indicada no item 4.1.1
    private String ecfFab; // Número de série de fabricação do ECF
    private String ecfCx; // Número do caixa atribuído ao ECF
    private String numDoc; // Número do documento fiscal
    private Date dtDoc; // Data da emissão do documento fiscal

    /**
     * @return the codMod
     */
    public String getCodMod() {
        return codMod;
    }

    /**
     * @param codMod the codMod to set
     */
    public void setCodMod(String codMod) {
        this.codMod = codMod;
    }

    /**
     * @return the ecfFab
     */
    public String getEcfFab() {
        return ecfFab;
    }

    /**
     * @param ecfFab the ecfFab to set
     */
    public void setEcfFab(String ecfFab) {
        this.ecfFab = ecfFab;
    }

    /**
     * @return the ecfCx
     */
    public String getEcfCx() {
        return ecfCx;
    }

    /**
     * @param ecfCx the ecfCx to set
     */
    public void setEcfCx(String ecfCx) {
        this.ecfCx = ecfCx;
    }

    /**
     * @return the numDoc
     */
    public String getNumDoc() {
        return numDoc;
    }

    /**
     * @param numDoc the numDoc to set
     */
    public void setNumDoc(String numDoc) {
        this.numDoc = numDoc;
    }

    /**
     * @return the dtDoc
     */
    public Date getDtDoc() {
        return dtDoc;
    }

    /**
     * @param dtDoc the dtDoc to set
     */
    public void setDtDoc(Date dtDoc) {
        this.dtDoc = dtDoc;
    }

}
