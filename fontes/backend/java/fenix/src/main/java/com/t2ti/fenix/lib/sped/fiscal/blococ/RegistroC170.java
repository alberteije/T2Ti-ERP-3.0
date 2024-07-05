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

public class RegistroC170 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String numItem; // Número seqüencial do item no documento fiscal
    private String codItem; // Código do item (campo 02 do Registro 0200)
    private String descrCompl; // Descrição complementar do item como adotado no documento fiscal
    private BigDecimal qtd; // Quantidade do item
    private String unid; // Unidade do item(Campo 02 do registro 0190)
    private BigDecimal vlItem; // Valor total do item
    private BigDecimal vlDesc; // Valor do desconto comercial
    private Integer indMov; // Movimentação física do ITEM/PRODUTO: 0 - SIM; 1- NÃO
    private String cstIcms; // Código da Situação Tributária referente ao ICMS, conforme a Tabela indicada no item 4.3.1
    private String cfop; // Código Fiscal de Operação e Prestação
    private String codNat; // Código da natureza da operação (campo 02 do Registro 0400)
    private BigDecimal vlBcIcms; // Valor da base de cálculo do ICMS
    private BigDecimal aliqIcms; // Alíquota do ICMS
    private BigDecimal vlIcms; // Valor do ICMS creditado/debitado
    private BigDecimal vlBcIcmsSt; // Valor da base de cálculo referente à substituição tributária
    private BigDecimal aliqSt; // Alíquota do ICMS da substituição tributária na unidade da federação de destino
    private BigDecimal vlIcmsSt; // Valor do ICMS referente à substituição tributária
    private Integer indApur; // Indicador de período de apuração do IPI: 0 - Mensal; 1 - Decendial
    private String cstIpi; // Código da Situação Tributária referente ao IPI, conforme a Tabela indicada no item 4.3.2.
    private String codEnq; // Código de enquadramento legal do IPI, conforme tabela indicada no item 4.5.3.
    private BigDecimal vlBcIpi; // Valor da base de cálculo do IPI
    private BigDecimal aliqIpi; // Alíquota do IPI
    private BigDecimal vlIpi; // Valor do IPI creditado/debitado
    private String cstPis; // Código da Situação Tributária referente ao PIS.
    private BigDecimal vlBcPis; // Valor da base de cálculo do PIS
    private BigDecimal aliqPisPerc; // Alíquota do PIS (em percentual)
    private BigDecimal quantBcPis; // Quantidade - Base de cálculo PIS
    private BigDecimal aliqPisR; // Alíquota do PIS (em reais)
    private BigDecimal vlPis; // Valor do PIS
    private String cstCofins; // Código da Situação Tributária referente ao COFINS.
    private BigDecimal vlBcCofins; // Valor da base de cálculo da COFINS
    private BigDecimal aliqCofinsPerc; // Alíquota do COFINS (em percentual)
    private BigDecimal quantBcCofins; // Quantidade - Base de cálculo COFINS
    private BigDecimal aliqCofinsR; // Alíquota da COFINS (em reais)
    private BigDecimal vlCofins; // Valor da COFINS
    private String codCta; // Código da conta analítica contábil debitada/creditada

    public String getNumItem() {
        return numItem;
    }

    public void setNumItem(String numItem) {
        this.numItem = numItem;
    }

    public String getCodItem() {
        return codItem;
    }

    public void setCodItem(String codItem) {
        this.codItem = codItem;
    }

    public String getDescrCompl() {
        return descrCompl;
    }

    public void setDescrCompl(String descrCompl) {
        this.descrCompl = descrCompl;
    }

    public BigDecimal getQtd() {
        return qtd;
    }

    public void setQtd(BigDecimal qtd) {
        this.qtd = qtd;
    }

    public String getUnid() {
        return unid;
    }

    public void setUnid(String unid) {
        this.unid = unid;
    }

    public BigDecimal getVlItem() {
        return vlItem;
    }

    public void setVlItem(BigDecimal vlItem) {
        this.vlItem = vlItem;
    }

    public BigDecimal getVlDesc() {
        return vlDesc;
    }

    public void setVlDesc(BigDecimal vlDesc) {
        this.vlDesc = vlDesc;
    }

    public Integer getIndMov() {
        return indMov;
    }

    public void setIndMov(Integer indMov) {
        this.indMov = indMov;
    }

    public String getCstIcms() {
        return cstIcms;
    }

    public void setCstIcms(String cstIcms) {
        this.cstIcms = cstIcms;
    }

    public String getCfop() {
        return cfop;
    }

    public void setCfop(String cfop) {
        this.cfop = cfop;
    }

    public String getCodNat() {
        return codNat;
    }

    public void setCodNat(String codNat) {
        this.codNat = codNat;
    }

    public BigDecimal getVlBcIcms() {
        return vlBcIcms;
    }

    public void setVlBcIcms(BigDecimal vlBcIcms) {
        this.vlBcIcms = vlBcIcms;
    }

    public BigDecimal getAliqIcms() {
        return aliqIcms;
    }

    public void setAliqIcms(BigDecimal aliqIcms) {
        this.aliqIcms = aliqIcms;
    }

    public BigDecimal getVlIcms() {
        return vlIcms;
    }

    public void setVlIcms(BigDecimal vlIcms) {
        this.vlIcms = vlIcms;
    }

    public BigDecimal getVlBcIcmsSt() {
        return vlBcIcmsSt;
    }

    public void setVlBcIcmsSt(BigDecimal vlBcIcmsSt) {
        this.vlBcIcmsSt = vlBcIcmsSt;
    }

    public BigDecimal getAliqSt() {
        return aliqSt;
    }

    public void setAliqSt(BigDecimal aliqSt) {
        this.aliqSt = aliqSt;
    }

    public BigDecimal getVlIcmsSt() {
        return vlIcmsSt;
    }

    public void setVlIcmsSt(BigDecimal vlIcmsSt) {
        this.vlIcmsSt = vlIcmsSt;
    }

    public Integer getIndApur() {
        return indApur;
    }

    public void setIndApur(Integer indApur) {
        this.indApur = indApur;
    }

    public String getCstIpi() {
        return cstIpi;
    }

    public void setCstIpi(String cstIpi) {
        this.cstIpi = cstIpi;
    }

    public String getCodEnq() {
        return codEnq;
    }

    public void setCodEnq(String codEnq) {
        this.codEnq = codEnq;
    }

    public BigDecimal getVlBcIpi() {
        return vlBcIpi;
    }

    public void setVlBcIpi(BigDecimal vlBcIpi) {
        this.vlBcIpi = vlBcIpi;
    }

    public BigDecimal getAliqIpi() {
        return aliqIpi;
    }

    public void setAliqIpi(BigDecimal aliqIpi) {
        this.aliqIpi = aliqIpi;
    }

    public BigDecimal getVlIpi() {
        return vlIpi;
    }

    public void setVlIpi(BigDecimal vlIpi) {
        this.vlIpi = vlIpi;
    }

    public String getCstPis() {
        return cstPis;
    }

    public void setCstPis(String cstPis) {
        this.cstPis = cstPis;
    }

    public BigDecimal getVlBcPis() {
        return vlBcPis;
    }

    public void setVlBcPis(BigDecimal vlBcPis) {
        this.vlBcPis = vlBcPis;
    }

    public BigDecimal getAliqPisPerc() {
        return aliqPisPerc;
    }

    public void setAliqPisPerc(BigDecimal aliqPisPerc) {
        this.aliqPisPerc = aliqPisPerc;
    }

    public BigDecimal getQuantBcPis() {
        return quantBcPis;
    }

    public void setQuantBcPis(BigDecimal quantBcPis) {
        this.quantBcPis = quantBcPis;
    }

    public BigDecimal getAliqPisR() {
        return aliqPisR;
    }

    public void setAliqPisR(BigDecimal aliqPisR) {
        this.aliqPisR = aliqPisR;
    }

    public BigDecimal getVlPis() {
        return vlPis;
    }

    public void setVlPis(BigDecimal vlPis) {
        this.vlPis = vlPis;
    }

    public String getCstCofins() {
        return cstCofins;
    }

    public void setCstCofins(String cstCofins) {
        this.cstCofins = cstCofins;
    }

    public BigDecimal getVlBcCofins() {
        return vlBcCofins;
    }

    public void setVlBcCofins(BigDecimal vlBcCofins) {
        this.vlBcCofins = vlBcCofins;
    }

    public BigDecimal getAliqCofinsPerc() {
        return aliqCofinsPerc;
    }

    public void setAliqCofinsPerc(BigDecimal aliqCofinsPerc) {
        this.aliqCofinsPerc = aliqCofinsPerc;
    }

    public BigDecimal getQuantBcCofins() {
        return quantBcCofins;
    }

    public void setQuantBcCofins(BigDecimal quantBcCofins) {
        this.quantBcCofins = quantBcCofins;
    }

    public BigDecimal getAliqCofinsR() {
        return aliqCofinsR;
    }

    public void setAliqCofinsR(BigDecimal aliqCofinsR) {
        this.aliqCofinsR = aliqCofinsR;
    }

    public BigDecimal getVlCofins() {
        return vlCofins;
    }

    public void setVlCofins(BigDecimal vlCofins) {
        this.vlCofins = vlCofins;
    }

    public String getCodCta() {
        return codCta;
    }

    public void setCodCta(String codCta) {
        this.codCta = codCta;
    }
}
