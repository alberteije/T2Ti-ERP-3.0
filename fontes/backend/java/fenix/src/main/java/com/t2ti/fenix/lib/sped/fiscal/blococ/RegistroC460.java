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

public class RegistroC460 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codMod; // Código do modelo do documento fiscal, conforme a Tabela 4.1.1
    private String codSit; // Código da situação do documento fiscal, conforme a Tabela 4.1.2
    private String numDoc; // Número do documento fiscal (COO)
    private Date dtDoc; // Data da emissão do documento fiscal
    private BigDecimal vlDoc; // Valor total do documento fiscal
    private BigDecimal vlPis; // Valor do PIS
    private BigDecimal vlCofins; // Valor da COFINS
    private String cpfCnpj; // CPF ou CNPJ do adquirente
    private String nomAdq; // Nome do adquirente
    private List<RegistroC470> registroC470List; // BLOCO C - Lista de RegistroC110 (FILHO)

    public RegistroC460() {
        registroC470List = new ArrayList<RegistroC470>();
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
     * @return the cpfCnpj
     */
    public String getCpfCnpj() {
        return cpfCnpj;
    }

    /**
     * @param cpfCnpj the cpfCnpj to set
     */
    public void setCpfCnpj(String cpfCnpj) {
        this.cpfCnpj = cpfCnpj;
    }

    /**
     * @return the nomAdq
     */
    public String getNomAdq() {
        return nomAdq;
    }

    /**
     * @param nomAdq the nomAdq to set
     */
    public void setNomAdq(String nomAdq) {
        this.nomAdq = nomAdq;
    }

    /**
     * @return the registroC470List
     */
    public List<RegistroC470> getRegistroC470List() {
        return registroC470List;
    }

    /**
     * @param registroC470List the registroC470List to set
     */
    public void setRegistroC470List(List<RegistroC470> registroC470List) {
        this.registroC470List = registroC470List;
    }


}
