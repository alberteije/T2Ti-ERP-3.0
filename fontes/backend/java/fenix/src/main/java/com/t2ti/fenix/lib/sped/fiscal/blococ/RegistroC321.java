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

public class RegistroC321 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codItem; // Código do item (campo 02 do Registro 0200)
    private BigDecimal qtd; // Quantidade acumulada do item
    private String unid; // Unidade do item (Campo 02 do registro 0190)
    private BigDecimal vlItem; // Valor acumulado do item
    private BigDecimal vlDesc; // Valor do desconto acumulado
    private BigDecimal vlBcIcms; // Valor acumulado da base de cálculo do ICMS
    private BigDecimal vlIcms; // Valor acumulado do ICMS debitado
    private BigDecimal vlPis; // Valor acumulado do PIS
    private BigDecimal vlCofins; // Valor acumulado da COFINS

    /**
     * @return the codItem
     */
    public String getCodItem() {
        return codItem;
    }

    /**
     * @param codItem the codItem to set
     */
    public void setCodItem(String codItem) {
        this.codItem = codItem;
    }

    /**
     * @return the qtd
     */
    public BigDecimal getQtd() {
        return qtd;
    }

    /**
     * @param qtd the qtd to set
     */
    public void setQtd(BigDecimal qtd) {
        this.qtd = qtd;
    }

    /**
     * @return the unid
     */
    public String getUnid() {
        return unid;
    }

    /**
     * @param unid the unid to set
     */
    public void setUnid(String unid) {
        this.unid = unid;
    }

    /**
     * @return the vlItem
     */
    public BigDecimal getVlItem() {
        return vlItem;
    }

    /**
     * @param vlItem the vlItem to set
     */
    public void setVlItem(BigDecimal vlItem) {
        this.vlItem = vlItem;
    }

    /**
     * @return the vlDesc
     */
    public BigDecimal getVlDesc() {
        return vlDesc;
    }

    /**
     * @param vlDesc the vlDesc to set
     */
    public void setVlDesc(BigDecimal vlDesc) {
        this.vlDesc = vlDesc;
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
     * @return the vlPis
     */
    public BigDecimal getVlPis() {
        return vlPis;
    }

    /**
     * @param vlPis the vlPis to set
     */
    public void setVlPis(BigDecimal vlPis) {
        this.vlPis = vlPis;
    }

    /**
     * @return the vlCofins
     */
    public BigDecimal getVlCofins() {
        return vlCofins;
    }

    /**
     * @param vlCofins the vlCofins to set
     */
    public void setVlCofins(BigDecimal vlCofins) {
        this.vlCofins = vlCofins;
    }
}
