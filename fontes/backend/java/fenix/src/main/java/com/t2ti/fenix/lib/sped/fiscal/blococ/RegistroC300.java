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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RegistroC300 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codMod; // Código do modelo do documento fiscal, conforme a Tabela 4.1.1
    private String ser; // Série do documento fiscal
    private String sub; // Subsérie do documento fiscal
    private String numDocIni; // Número do documento fiscal inicial
    private String numDocFin; // Número do documento fiscal final
    private Date dtDoc; // Data da emissão dos documentos fiscais
    private BigDecimal vlDoc; // Valor total dos documentos
    private BigDecimal vlPis; // Valor total do PIS
    private BigDecimal vlCofins; // Valor total da COFINS
    private String codCta; // Código da conta analítica contábil debitada/creditada
    private List<RegistroC310> registroC310List;
    private List<RegistroC320> registroC320List;

    public RegistroC300() {
        registroC310List = new ArrayList<RegistroC310>();
        registroC320List = new ArrayList<RegistroC320>();
    }

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
     * @return the ser
     */
    public String getSer() {
        return ser;
    }

    /**
     * @param ser the ser to set
     */
    public void setSer(String ser) {
        this.ser = ser;
    }

    /**
     * @return the sub
     */
    public String getSub() {
        return sub;
    }

    /**
     * @param sub the sub to set
     */
    public void setSub(String sub) {
        this.sub = sub;
    }

    /**
     * @return the numDocIni
     */
    public String getNumDocIni() {
        return numDocIni;
    }

    /**
     * @param numDocIni the numDocIni to set
     */
    public void setNumDocIni(String numDocIni) {
        this.numDocIni = numDocIni;
    }

    /**
     * @return the numDocFin
     */
    public String getNumDocFin() {
        return numDocFin;
    }

    /**
     * @param numDocFin the numDocFin to set
     */
    public void setNumDocFin(String numDocFin) {
        this.numDocFin = numDocFin;
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

    /**
     * @return the vlDoc
     */
    public BigDecimal getVlDoc() {
        return vlDoc;
    }

    /**
     * @param vlDoc the vlDoc to set
     */
    public void setVlDoc(BigDecimal vlDoc) {
        this.vlDoc = vlDoc;
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
     * @return the registroC310List
     */
    public List<RegistroC310> getRegistroC310List() {
        return registroC310List;
    }

    /**
     * @param registroC310List the registroC310List to set
     */
    public void setRegistroC310List(List<RegistroC310> registroC310List) {
        this.registroC310List = registroC310List;
    }

    /**
     * @return the registroC320List
     */
    public List<RegistroC320> getRegistroC320List() {
        return registroC320List;
    }

    /**
     * @param registroC320List the registroC320List to set
     */
    public void setRegistroC320List(List<RegistroC320> registroC320List) {
        this.registroC320List = registroC320List;
    }

}
