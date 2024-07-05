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
package com.t2ti.fenix.lib.sped.fiscal.bloco0;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Registro0200 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codItem; // Código do item
    private String descrItem; // Descrição do item
    private String codBarra; // Código de barra do produto, se houver
    private String codAntItem; // Código anterior do item (ultima apresentado)
    private String unidInv; // Unidade de medida do estoque
    private String tipoItem; // Tipo do item - Atividades Industriais, Comerciais e Serviços
    private String codNcm; // Código da Nomenclatura Comum do Mercosul
    private String exIpi; // Código EX, conforme a TIPI
    private String codGen; // Código gênero item, tabela indicada item 4.2.1
    private String codLst; // Código serviço Anexo I - Lei nº116/03
    private BigDecimal aliqIcms; // Alíquota ICMS aplicável (operações internas)
    private List<Registro0205> registro0205List; // BLOCO C - Lista de Registro0205 (FILHO)
    private List<Registro0206> registro0206List; // BLOCO C - Lista de Registro0206 (FILHO)
    private List<Registro0220> registro0220List; // BLOCO C - Lista de Registro0220 (FILHO)

    public Registro0200() {
        registro0205List = new ArrayList<Registro0205>();
        registro0206List = new ArrayList<Registro0206>();
        registro0220List = new ArrayList<Registro0220>();
    }

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
     * @return the descrItem
     */
    public String getDescrItem() {
        return descrItem;
    }

    /**
     * @param descrItem the descrItem to set
     */
    public void setDescrItem(String descrItem) {
        this.descrItem = descrItem;
    }

    /**
     * @return the codBarra
     */
    public String getCodBarra() {
        return codBarra;
    }

    /**
     * @param codBarra the codBarra to set
     */
    public void setCodBarra(String codBarra) {
        this.codBarra = codBarra;
    }

    /**
     * @return the codAntItem
     */
    public String getCodAntItem() {
        return codAntItem;
    }

    /**
     * @param codAntItem the codAntItem to set
     */
    public void setCodAntItem(String codAntItem) {
        this.codAntItem = codAntItem;
    }

    /**
     * @return the unidInv
     */
    public String getUnidInv() {
        return unidInv;
    }

    /**
     * @param unidInv the unidInv to set
     */
    public void setUnidInv(String unidInv) {
        this.unidInv = unidInv;
    }

    /**
     * @return the tipoItem
     */
    public String getTipoItem() {
        return tipoItem;
    }

    /**
     * @param tipoItem the tipoItem to set
     */
    public void setTipoItem(String tipoItem) {
        this.tipoItem = tipoItem;
    }

    /**
     * @return the codNcm
     */
    public String getCodNcm() {
        return codNcm;
    }

    /**
     * @param codNcm the codNcm to set
     */
    public void setCodNcm(String codNcm) {
        this.codNcm = codNcm;
    }

    /**
     * @return the exIpi
     */
    public String getExIpi() {
        return exIpi;
    }

    /**
     * @param exIpi the exIpi to set
     */
    public void setExIpi(String exIpi) {
        this.exIpi = exIpi;
    }

    /**
     * @return the codGen
     */
    public String getCodGen() {
        return codGen;
    }

    /**
     * @param codGen the codGen to set
     */
    public void setCodGen(String codGen) {
        this.codGen = codGen;
    }

    /**
     * @return the codLst
     */
    public String getCodLst() {
        return codLst;
    }

    /**
     * @param codLst the codLst to set
     */
    public void setCodLst(String codLst) {
        this.codLst = codLst;
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
     * @return the registro0205List
     */
    public List<Registro0205> getRegistro0205List() {
        return registro0205List;
    }

    /**
     * @param registro0205List the registro0205List to set
     */
    public void setRegistro0205List(List<Registro0205> registro0205List) {
        this.registro0205List = registro0205List;
    }

    /**
     * @return the registro0206List
     */
    public List<Registro0206> getRegistro0206List() {
        return registro0206List;
    }

    /**
     * @param registro0206List the registro0206List to set
     */
    public void setRegistro0206List(List<Registro0206> registro0206List) {
        this.registro0206List = registro0206List;
    }

    /**
     * @return the registro0220List
     */
    public List<Registro0220> getRegistro0220List() {
        return registro0220List;
    }

    /**
     * @param registro0220List the registro0220List to set
     */
    public void setRegistro0220List(List<Registro0220> registro0220List) {
        this.registro0220List = registro0220List;
    }

}
