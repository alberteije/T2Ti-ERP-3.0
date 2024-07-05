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

public class RegistroC100 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String indOper; // Indicador do tipo de operação
    private String indEmit; // Indicador do emitente do documento fiscal
    private String codPart; // Código do participante (campo 02 do Registro 0150)
    private String codMod; // Código do modelo do documento fiscal, conforme a Tabela 4.1.1
    private String codSit; // Código da situação do documento fiscal, conforme a Tabela 4.1.2
    private String ser; // Série do documento fiscal
    private String numDoc; // Número do documento fiscal
    private String chvNfe; // Chave da Nota Fiscal Eletrônica
    private Date dtDoc; // Data da emissão do documento fiscal
    private Date dtES; // Data da entrada ou da saída
    private BigDecimal vlDoc; // Valor total do documento fiscal
    private String indPgto; // Indicador do tipo de pagamento
    private BigDecimal vlDesc; // Valor total do desconto // Prates
    private BigDecimal vlAbatNt; // Abatimento não tributado e não comercial Ex. desconto ICMS nas remessas para ZFM
    private BigDecimal vlMerc; // Valor das mercadorias constantes no documento fiscal
    private String indFrt; // Indicador do tipo do frete
    private BigDecimal vlFrt; // Valor do frete indicado no documento fiscal
    private BigDecimal vlSeg; // Valor do seguro indicado no documento fiscal
    private BigDecimal vlOutDa; // Valor de outras despesas acessórias
    private BigDecimal vlBcIcms; // Valor da base de cálculo do ICMS
    private BigDecimal vlIcms; // Valor do ICMS
    private BigDecimal vlBcIcmsSt; // Valor da base de cálculo do ICMS substituição tributária
    private BigDecimal vlIcmsSt; // Valor do ICMS retido por substituição tributária
    private BigDecimal vlIpi; // Valor total do IPI
    private BigDecimal vlPis; // Valor total do PIS
    private BigDecimal vlCofins; // Valor total da COFINS
    private BigDecimal vlPisSt; // Valor total do PIS retido por substituição tributária
    private BigDecimal vlCofinsSt; // Valor total da COFINS retido por substituição tributária
    private List<RegistroC170> registroC170List; // BLOCO C - Lista de RegistroC170 (FILHO)
    private List<RegistroC190> registroC190List; // BLOCO C - Lista de RegistroC190 (FILHO)

    public RegistroC100() {
        registroC170List = new ArrayList<RegistroC170>();
        registroC190List = new ArrayList<RegistroC190>();
    }

    /**
     * @return the indOper
     */
    public String getIndOper() {
        return indOper;
    }

    /**
     * @param indOper the indOper to set
     */
    public void setIndOper(String indOper) {
        this.indOper = indOper;
    }

    /**
     * @return the indEmit
     */
    public String getIndEmit() {
        return indEmit;
    }

    /**
     * @param indEmit the indEmit to set
     */
    public void setIndEmit(String indEmit) {
        this.indEmit = indEmit;
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
     * @return the codSit
     */
    public String getCodSit() {
        return codSit;
    }

    /**
     * @param codSit the codSit to set
     */
    public void setCodSit(String codSit) {
        this.codSit = codSit;
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
     * @return the chvNfe
     */
    public String getChvNfe() {
        return chvNfe;
    }

    /**
     * @param chvNfe the chvNfe to set
     */
    public void setChvNfe(String chvNfe) {
        this.chvNfe = chvNfe;
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
     * @return the dtES
     */
    public Date getDtES() {
        return dtES;
    }

    /**
     * @param dtES the dtES to set
     */
    public void setDtES(Date dtES) {
        this.dtES = dtES;
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
     * @return the indPgto
     */
    public String getIndPgto() {
        return indPgto;
    }

    /**
     * @param indPgto the indPgto to set
     */
    public void setIndPgto(String indPgto) {
        this.indPgto = indPgto;
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
     * @return the vlAbatNt
     */
    public BigDecimal getVlAbatNt() {
        return vlAbatNt;
    }

    /**
     * @param vlAbatNt the vlAbatNt to set
     */
    public void setVlAbatNt(BigDecimal vlAbatNt) {
        this.vlAbatNt = vlAbatNt;
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
     * @return the indFrt
     */
    public String getIndFrt() {
        return indFrt;
    }

    /**
     * @param indFrt the indFrt to set
     */
    public void setIndFrt(String indFrt) {
        this.indFrt = indFrt;
    }

    /**
     * @return the vlFrt
     */
    public BigDecimal getVlFrt() {
        return vlFrt;
    }

    /**
     * @param vlFrt the vlFrt to set
     */
    public void setVlFrt(BigDecimal vlFrt) {
        this.vlFrt = vlFrt;
    }

    /**
     * @return the vlSeg
     */
    public BigDecimal getVlSeg() {
        return vlSeg;
    }

    /**
     * @param vlSeg the vlSeg to set
     */
    public void setVlSeg(BigDecimal vlSeg) {
        this.vlSeg = vlSeg;
    }

    /**
     * @return the vlOutDa
     */
    public BigDecimal getVlOutDa() {
        return vlOutDa;
    }

    /**
     * @param vlOutDa the vlOutDa to set
     */
    public void setVlOutDa(BigDecimal vlOutDa) {
        this.vlOutDa = vlOutDa;
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
     * @return the vlBcIcmsSt
     */
    public BigDecimal getVlBcIcmsSt() {
        return vlBcIcmsSt;
    }

    /**
     * @param vlBcIcmsSt the vlBcIcmsSt to set
     */
    public void setVlBcIcmsSt(BigDecimal vlBcIcmsSt) {
        this.vlBcIcmsSt = vlBcIcmsSt;
    }

    /**
     * @return the vlIcmsSt
     */
    public BigDecimal getVlIcmsSt() {
        return vlIcmsSt;
    }

    /**
     * @param vlIcmsSt the vlIcmsSt to set
     */
    public void setVlIcmsSt(BigDecimal vlIcmsSt) {
        this.vlIcmsSt = vlIcmsSt;
    }

    /**
     * @return the vlIpi
     */
    public BigDecimal getVlIpi() {
        return vlIpi;
    }

    /**
     * @param vlIpi the vlIpi to set
     */
    public void setVlIpi(BigDecimal vlIpi) {
        this.vlIpi = vlIpi;
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
     * @return the vlPisSt
     */
    public BigDecimal getVlPisSt() {
        return vlPisSt;
    }

    /**
     * @param vlPisSt the vlPisSt to set
     */
    public void setVlPisSt(BigDecimal vlPisSt) {
        this.vlPisSt = vlPisSt;
    }

    /**
     * @return the vlCofinsSt
     */
    public BigDecimal getVlCofinsSt() {
        return vlCofinsSt;
    }

    /**
     * @param vlCofinsSt the vlCofinsSt to set
     */
    public void setVlCofinsSt(BigDecimal vlCofinsSt) {
        this.vlCofinsSt = vlCofinsSt;
    }

    /**
     * @return the registroc190List
     */
    public List<RegistroC190> getRegistroC190List() {
        return registroC190List;
    }

    /**
     * @param registroC190List the registroc190List to set
     */
    public void setRegistroC190List(List<RegistroC190> registroC190List) {
        this.registroC190List = registroC190List;
    }

    public List<RegistroC170> getRegistroC170List() {
        return registroC170List;
    }

    public void setRegistroC170List(List<RegistroC170> registroC170List) {
        this.registroC170List = registroC170List;
    }


}
