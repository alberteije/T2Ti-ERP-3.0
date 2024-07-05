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

public class RegistroJ930 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String identNom; /// Nome do signatário.
    private String identCpf; /// CPF.
    private String identQualif; /// Qualificação do assinante, conforme tabela do Departamento Nacional de Registro do Comércio - DNRC.
    private String codAssin; /// Código de qualificação do assinante, conforme tabela do Departamento Nacional de Registro do Comércio - DNRC.
    private String indCrc; /// Número de inscrição do contabilista no Conselho Regional de Contabilidade.

    /**
     * @return the identNom
     */
    public String getIdentNom() {
        return identNom;
    }

    /**
     * @param identNom the identNom to set
     */
    public void setIdentNom(String identNom) {
        this.identNom = identNom;
    }

    /**
     * @return the identCpf
     */
    public String getIdentCpf() {
        return identCpf;
    }

    /**
     * @param identCpf the identCpf to set
     */
    public void setIdentCpf(String identCpf) {
        this.identCpf = identCpf;
    }

    /**
     * @return the identQualif
     */
    public String getIdentQualif() {
        return identQualif;
    }

    /**
     * @param identQualif the identQualif to set
     */
    public void setIdentQualif(String identQualif) {
        this.identQualif = identQualif;
    }

    /**
     * @return the codAssin
     */
    public String getCodAssin() {
        return codAssin;
    }

    /**
     * @param codAssin the codAssin to set
     */
    public void setCodAssin(String codAssin) {
        this.codAssin = codAssin;
    }

    /**
     * @return the indCrc
     */
    public String getIndCrc() {
        return indCrc;
    }

    /**
     * @param indCrc the indCrc to set
     */
    public void setIndCrc(String indCrc) {
        this.indCrc = indCrc;
    }
}
