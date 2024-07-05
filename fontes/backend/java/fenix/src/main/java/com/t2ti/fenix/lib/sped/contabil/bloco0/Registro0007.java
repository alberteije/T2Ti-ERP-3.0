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

public class Registro0007 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codEntRef; /// Código da instituição responsável pela administração do cadastro (conforme tabela publicada pelo Sped).
    private String codInscr; /// Código cadastral do empresário ou sociedade empresária na instituição identificada no campo 02.

    /**
     * @return the codEntRef
     */
    public String getCodEntRef() {
        return codEntRef;
    }

    /**
     * @param codEntRef the codEntRef to set
     */
    public void setCodEntRef(String codEntRef) {
        this.codEntRef = codEntRef;
    }

    /**
     * @return the codInscr
     */
    public String getCodInscr() {
        return codInscr;
    }

    /**
     * @param codInscr the codInscr to set
     */
    public void setCodInscr(String codInscr) {
        this.codInscr = codInscr;
    }
}
