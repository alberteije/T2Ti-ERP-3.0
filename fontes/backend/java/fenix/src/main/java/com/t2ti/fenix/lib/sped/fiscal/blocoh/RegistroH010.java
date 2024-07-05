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
package com.t2ti.fenix.lib.sped.fiscal.blocoh;

import java.io.Serializable;
import java.math.BigDecimal;

public class RegistroH010 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codItem; // Código do item (campo 02 do Registro 0200)
    private String unid; // Unidade do item
    private BigDecimal qtd; // Quantidade do item
    private BigDecimal vlUnit; // Valor unitário do item
    private BigDecimal vlItem; // Valor do item
    private String indProp; // Indicador de propriedade/posse do item
    private String codPart; // Código do participante (campo 02 do Registro 0150)
    private String txtCompl; // Descrição complementar
    private String codCta; // Código da conta analítica contábil debitada/creditada

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
     * @return the vlUnit
     */
    public BigDecimal getVlUnit() {
        return vlUnit;
    }

    /**
     * @param vlUnit the vlUnit to set
     */
    public void setVlUnit(BigDecimal vlUnit) {
        this.vlUnit = vlUnit;
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
     * @return the indProp
     */
    public String getIndProp() {
        return indProp;
    }

    /**
     * @param indProp the indProp to set
     */
    public void setIndProp(String indProp) {
        this.indProp = indProp;
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

    /**
     * @return the txtCompl
     */
    public String getTxtCompl() {
        return txtCompl;
    }

    /**
     * @param txtCompl the txtCompl to set
     */
    public void setTxtCompl(String txtCompl) {
        this.txtCompl = txtCompl;
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
}
