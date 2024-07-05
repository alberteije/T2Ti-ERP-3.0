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

public class RegistroC350 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String ser; // Série do documento fiscal
    private String subSer; // Subsérie do documento fiscal
    private String numDoc; // Número do documento fiscal
    private Date dtDoc; // Data da emissão do documento fiscal
    private String cnpjCpf; // CNPJ ou CPF do destinatário
    private BigDecimal vlMerc; // Valor das mercadorias constantes no documento fiscal
    private BigDecimal vlDoc; // Valor total do documento fiscal
    private BigDecimal vlDesc; // Valor total do desconto
    private BigDecimal vlPis; // Valor total do PIS
    private BigDecimal vlCofins; // Valor total da COFINS
    private String codCta; // Código da conta analítica contábil debitada/creditada
    private List<RegistroC370> registroC370List; // BLOCO C - Lista de RegistroC370 (FILHO)
    private List<RegistroC390> registroC390List; // BLOCO C - Lista de RegistroC390 (FILHO)

    public RegistroC350() {
        registroC370List = new ArrayList<RegistroC370>();
        registroC390List = new ArrayList<RegistroC390>();
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
     * @return the subSer
     */
    public String getSubSer() {
        return subSer;
    }

    /**
     * @param subSer the subSer to set
     */
    public void setSubSer(String subSer) {
        this.subSer = subSer;
    }

    /**
     * @return the numDoc
     */
    public String getNumDoc() {
        return numDoc;
    }

    /**
     * @param numDoc the numDoc to set
     */
    public void setNumDoc(String numDoc) {
        this.numDoc = numDoc;
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
     * @return the cnpjCpf
     */
    public String getCnpjCpf() {
        return cnpjCpf;
    }

    /**
     * @param cnpjCpf the cnpjCpf to set
     */
    public void setCnpjCpf(String cnpjCpf) {
        this.cnpjCpf = cnpjCpf;
    }

    /**
     * @return the vlMerc
     */
    public BigDecimal getVlMerc() {
        return vlMerc;
    }

    /**
     * @param vlMerc the vlMerc to set
     */
    public void setVlMerc(BigDecimal vlMerc) {
        this.vlMerc = vlMerc;
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
     * @return the registroC390List
     */
    public List<RegistroC390> getRegistroC390List() {
        return registroC390List;
    }

    /**
     * @param registroC390List the registroC390List to set
     */
    public void setRegistroC390List(List<RegistroC390> registroC390List) {
        this.registroC390List = registroC390List;
    }

    /**
     * @return the registroC370List
     */
    public List<RegistroC370> getRegistroC370List() {
        return registroC370List;
    }

    /**
     * @param registroC370List the registroC370List to set
     */
    public void setRegistroC370List(List<RegistroC370> registroC370List) {
        this.registroC370List = registroC370List;
    }


}
