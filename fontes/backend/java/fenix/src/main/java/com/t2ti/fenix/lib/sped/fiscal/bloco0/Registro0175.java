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
package com.t2ti.fenix.lib.sped.fiscal.bloco0;

import java.io.Serializable;
import java.util.Date;

public class Registro0175 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Date dtAlt; // Data de alteração do cadastro
    private String nrCampo; // Número do campo alterado (Somente campos 03 a 13)
    private String contAnt; // Conteúdo anterior do campo

    /**
     * @return the dtAlt
     */
    public Date getDtAlt() {
        return dtAlt;
    }

    /**
     * @param dtAlt the dtAlt to set
     */
    public void setDtAlt(Date dtAlt) {
        this.dtAlt = dtAlt;
    }

    /**
     * @return the nrCampo
     */
    public String getNrCampo() {
        return nrCampo;
    }

    /**
     * @param nrCampo the nrCampo to set
     */
    public void setNrCampo(String nrCampo) {
        this.nrCampo = nrCampo;
    }

    /**
     * @return the contAnt
     */
    public String getContAnt() {
        return contAnt;
    }

    /**
     * @param contAnt the contAnt to set
     */
    public void setContAnt(String contAnt) {
        this.contAnt = contAnt;
    }
}
