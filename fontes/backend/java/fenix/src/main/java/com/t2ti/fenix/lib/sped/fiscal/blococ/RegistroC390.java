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
import java.math.BigDecimal;

public class RegistroC390 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String cstIcms; // Código da Situação Tributária, conforme a Tabela indicada no item 4.3.1
    private String cfop; // Código Fiscal de Operação e Prestação
    private BigDecimal aliqIcms; // Alíquota do ICMS
    private BigDecimal vlOpr; // Valor total acumulado das operações correspondentes à combinação de CST_ICMS, CFOP e alíquota do ICMS, incluídas as despesas acessórias e acréscimos.
    private BigDecimal vlBcIcms; // Valor acumulado da base de cálculo do ICMS, referente à combinação de CST_ICMS, CFOP, e alíquota do ICMS.
    private BigDecimal vlIcms; // Valor acumulado do ICMS, referente à combinação de CST_ICMS, CFOP e alíquota do ICMS.
    private BigDecimal vlRedBc; // Valor não tributado em função da redução da base de cálculo do ICMS, referente à combinação de CST_ICMS, CFOP, e alíquota do ICMS.
    private String codObs; // Código da observação do lançamento fiscal (campo 02 do Registro 0460)

    /**
     * @return the cstIcms
     */
    public String getCstIcms() {
        return cstIcms;
    }

    /**
     * @param cstIcms the cstIcms to set
     */
    public void setCstIcms(String cstIcms) {
        this.cstIcms = cstIcms;
    }

    /**
     * @return the cfop
     */
    public String getCfop() {
        return cfop;
    }

    /**
     * @param cfop the cfop to set
     */
    public void setCfop(String cfop) {
        this.cfop = cfop;
    }

    /**
     * @return the aliqIcms
     */
    public BigDecimal getAliqIcms() {
        return aliqIcms;
    }

    /**
     * @param aliqIcms the aliqIcms to set
     */
    public void setAliqIcms(BigDecimal aliqIcms) {
        this.aliqIcms = aliqIcms;
    }

    /**
     * @return the vlOpr
     */
    public BigDecimal getVlOpr() {
        return vlOpr;
    }

    /**
     * @param vlOpr the vlOpr to set
     */
    public void setVlOpr(BigDecimal vlOpr) {
        this.vlOpr = vlOpr;
    }

    /**
     * @return the vlBcIcms
     */
    public BigDecimal getVlBcIcms() {
        return vlBcIcms;
    }

    /**
     * @param vlBcIcms the vlBcIcms to set
     */
    public void setVlBcIcms(BigDecimal vlBcIcms) {
        this.vlBcIcms = vlBcIcms;
    }

    /**
     * @return the vlIcms
     */
    public BigDecimal getVlIcms() {
        return vlIcms;
    }

    /**
     * @param vlIcms the vlIcms to set
     */
    public void setVlIcms(BigDecimal vlIcms) {
        this.vlIcms = vlIcms;
    }

    /**
     * @return the vlRedBc
     */
    public BigDecimal getVlRedBc() {
        return vlRedBc;
    }

    /**
     * @param vlRedBc the vlRedBc to set
     */
    public void setVlRedBc(BigDecimal vlRedBc) {
        this.vlRedBc = vlRedBc;
    }

    /**
     * @return the codObs
     */
    public String getCodObs() {
        return codObs;
    }

    /**
     * @param codObs the codObs to set
     */
    public void setCodObs(String codObs) {
        this.codObs = codObs;
    }
}
