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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RegistroI050 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Date dtAlt; /// Data da inclusão/alteração.
    private String codNat; /// Código da natureza da conta/grupo de contas, conforme tabela publicada pelo Sped.
    private String indCta; /// Indicador do tipo de conta
    private String nivel; /// Nível da conta analítica/grupo de contas.
    private String codCta; /// Código da conta analítica/grupo de contas.
    private String codCtaSup; /// Código da conta sintética /grupo de contas de nível imediatamente superior.
    private String cta; /// Nome da conta analítica/grupo de contas.
    private List<RegistroI051> registroi051List; /// BLOCO I - Lista de RegistroI051 (FILHO)
    private List<RegistroI052> registroi052List; /// BLOCO I - Lista de RegistroI052 (FILHO)

    public RegistroI050() {
        registroi051List = new ArrayList<RegistroI051>();
        registroi052List = new ArrayList<RegistroI052>();
    }

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
     * @return the codNat
     */
    public String getCodNat() {
        return codNat;
    }

    /**
     * @param codNat the codNat to set
     */
    public void setCodNat(String codNat) {
        this.codNat = codNat;
    }

    /**
     * @return the indCta
     */
    public String getIndCta() {
        return indCta;
    }

    /**
     * @param indCta the indCta to set
     */
    public void setIndCta(String indCta) {
        this.indCta = indCta;
    }

    /**
     * @return the nivel
     */
    public String getNivel() {
        return nivel;
    }

    /**
     * @param nivel the nivel to set
     */
    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

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
     * @return the codCtaSup
     */
    public String getCodCtaSup() {
        return codCtaSup;
    }

    /**
     * @param codCtaSup the codCtaSup to set
     */
    public void setCodCtaSup(String codCtaSup) {
        this.codCtaSup = codCtaSup;
    }

    /**
     * @return the cta
     */
    public String getCta() {
        return cta;
    }

    /**
     * @param cta the cta to set
     */
    public void setCta(String cta) {
        this.cta = cta;
    }

    /**
     * @return the registroi051List
     */
    public List<RegistroI051> getRegistroi051List() {
        return registroi051List;
    }

    /**
     * @param registroi051List the registroi051List to set
     */
    public void setRegistroi051List(List<RegistroI051> registroi051List) {
        this.registroi051List = registroi051List;
    }

    /**
     * @return the registroi052List
     */
    public List<RegistroI052> getRegistroi052List() {
        return registroi052List;
    }

    /**
     * @param registroi052List the registroi052List to set
     */
    public void setRegistroi052List(List<RegistroI052> registroi052List) {
        this.registroi052List = registroi052List;
    }
}
