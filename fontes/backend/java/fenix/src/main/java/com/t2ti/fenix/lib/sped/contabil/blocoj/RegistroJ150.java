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
import java.math.BigDecimal;

public class RegistroJ150 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codAgl; /// Código de aglutinação das contas, atribuído pelo empresário ou sociedade empresária.
    private String nivelAgl; /// Nível do Código de aglutinação (mesmo conceito do plano de contas - Registro I050).
    private String descrCodAgl; /// Descrição do Código de aglutinação.
    private BigDecimal vlCta; /// Valor total do Código de aglutinação na Demonstração do Resultado do Exercício no período informado.
    private String indVl; /// Indicador da situação do valor informado no campo anterior

    /**
     * @return the codAgl
     */
    public String getCodAgl() {
        return codAgl;
    }

    /**
     * @param codAgl the codAgl to set
     */
    public void setCodAgl(String codAgl) {
        this.codAgl = codAgl;
    }

    /**
     * @return the nivelAgl
     */
    public String getNivelAgl() {
        return nivelAgl;
    }

    /**
     * @param nivelAgl the nivelAgl to set
     */
    public void setNivelAgl(String nivelAgl) {
        this.nivelAgl = nivelAgl;
    }

    /**
     * @return the descrCodAgl
     */
    public String getDescrCodAgl() {
        return descrCodAgl;
    }

    /**
     * @param descrCodAgl the descrCodAgl to set
     */
    public void setDescrCodAgl(String descrCodAgl) {
        this.descrCodAgl = descrCodAgl;
    }

    /**
     * @return the vlCta
     */
    public BigDecimal getVlCta() {
        return vlCta;
    }

    /**
     * @param vlCta the vlCta to set
     */
    public void setVlCta(BigDecimal vlCta) {
        this.vlCta = vlCta;
    }

    /**
     * @return the indVl
     */
    public String getIndVl() {
        return indVl;
    }

    /**
     * @param indVl the indVl to set
     */
    public void setIndVl(String indVl) {
        this.indVl = indVl;
    }
}
