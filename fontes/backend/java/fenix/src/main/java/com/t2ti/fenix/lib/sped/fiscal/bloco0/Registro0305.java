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

public class Registro0305 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codCcus; // Código do centro de custo onde o bem está sendo ou será utilizado (campo 03 do Registro 0600)
    private String func; // Descrição sucinta da função do bem na atividade do estabelecimento
    private Integer vidaUtil; // Vida útil estimada do bem, em número de meses

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
     * @return the func
     */
    public String getFunc() {
        return func;
    }

    /**
     * @param func the func to set
     */
    public void setFunc(String func) {
        this.func = func;
    }

    /**
     * @return the vidaUtil
     */
    public Integer getVidaUtil() {
        return vidaUtil;
    }

    /**
     * @param vidaUtil the vidaUtil to set
     */
    public void setVidaUtil(Integer vidaUtil) {
        this.vidaUtil = vidaUtil;
    }
}
