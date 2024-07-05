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
package com.t2ti.fenix.lib.sped.fiscal.blocoe;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class RegistroE110 implements Serializable {

    private static final long serialVersionUID = 1L;
    private BigDecimal vlTotDebitos; // Valor total dos débitos por "Saídas e prestações com débito do imposto"
    private BigDecimal vlAjDebitos; // Valor total dos ajustes a débito decorrentes do documento fiscal.
    private BigDecimal vlTotAjDebitos; // Valor total de "Ajustes a débito"
    private BigDecimal vlEstornosCred; // Valor total de Ajustes “Estornos de créditos”
    private BigDecimal vlTotCreditos; // Valor total dos créditos por "Entradas e aquisições com crédito do imposto"
    private BigDecimal vlAjCreditos; // Valor total dos ajustes a crédito decorrentes do documento fiscal.
    private BigDecimal vlTotAjCreditos; // Valor total de "Ajustes a crédito"
    private BigDecimal vlEstornosDeb; // Valor total de Ajustes “Estornos de Débitos”
    private BigDecimal vlSldCredorAnt; // Valor total de "Saldo credor do período anterior"
    private BigDecimal vlSldApurado; // Valor total de "Saldo devedor (02+03+04+05-06-07-08-09-10) antes das deduções"
    private BigDecimal vlTotDed; // Valor total de "Deduções"
    private BigDecimal vlIcmsRecolher; // Valor total de "ICMS a recolher (11-12)
    private BigDecimal vlSldCredorTransportar; // Valor total de "Saldo credor a transportar para o período seguinte”
    private BigDecimal debEsp; // Valores recolhidos ou a recolher, extra-apuração.
    private List<RegistroE116> registroE116List;

    public RegistroE110() {
        registroE116List = new ArrayList<RegistroE116>();
    }

    /**
     * @return the vlTotDebitos
     */
    public BigDecimal getVlTotDebitos() {
        return vlTotDebitos;
    }

    /**
     * @param vlTotDebitos the vlTotDebitos to set
     */
    public void setVlTotDebitos(BigDecimal vlTotDebitos) {
        this.vlTotDebitos = vlTotDebitos;
    }

    /**
     * @return the vlAjDebitos
     */
    public BigDecimal getVlAjDebitos() {
        return vlAjDebitos;
    }

    /**
     * @param vlAjDebitos the vlAjDebitos to set
     */
    public void setVlAjDebitos(BigDecimal vlAjDebitos) {
        this.vlAjDebitos = vlAjDebitos;
    }

    /**
     * @return the vlTotAjDebitos
     */
    public BigDecimal getVlTotAjDebitos() {
        return vlTotAjDebitos;
    }

    /**
     * @param vlTotAjDebitos the vlTotAjDebitos to set
     */
    public void setVlTotAjDebitos(BigDecimal vlTotAjDebitos) {
        this.vlTotAjDebitos = vlTotAjDebitos;
    }

    /**
     * @return the vlEstornosCred
     */
    public BigDecimal getVlEstornosCred() {
        return vlEstornosCred;
    }

    /**
     * @param vlEstornosCred the vlEstornosCred to set
     */
    public void setVlEstornosCred(BigDecimal vlEstornosCred) {
        this.vlEstornosCred = vlEstornosCred;
    }

    /**
     * @return the vlTotCreditos
     */
    public BigDecimal getVlTotCreditos() {
        return vlTotCreditos;
    }

    /**
     * @param vlTotCreditos the vlTotCreditos to set
     */
    public void setVlTotCreditos(BigDecimal vlTotCreditos) {
        this.vlTotCreditos = vlTotCreditos;
    }

    /**
     * @return the vlAjCreditos
     */
    public BigDecimal getVlAjCreditos() {
        return vlAjCreditos;
    }

    /**
     * @param vlAjCreditos the vlAjCreditos to set
     */
    public void setVlAjCreditos(BigDecimal vlAjCreditos) {
        this.vlAjCreditos = vlAjCreditos;
    }

    /**
     * @return the vlTotAjCreditos
     */
    public BigDecimal getVlTotAjCreditos() {
        return vlTotAjCreditos;
    }

    /**
     * @param vlTotAjCreditos the vlTotAjCreditos to set
     */
    public void setVlTotAjCreditos(BigDecimal vlTotAjCreditos) {
        this.vlTotAjCreditos = vlTotAjCreditos;
    }

    /**
     * @return the vlEstornosDeb
     */
    public BigDecimal getVlEstornosDeb() {
        return vlEstornosDeb;
    }

    /**
     * @param vlEstornosDeb the vlEstornosDeb to set
     */
    public void setVlEstornosDeb(BigDecimal vlEstornosDeb) {
        this.vlEstornosDeb = vlEstornosDeb;
    }

    /**
     * @return the vlSldCredorAnt
     */
    public BigDecimal getVlSldCredorAnt() {
        return vlSldCredorAnt;
    }

    /**
     * @param vlSldCredorAnt the vlSldCredorAnt to set
     */
    public void setVlSldCredorAnt(BigDecimal vlSldCredorAnt) {
        this.vlSldCredorAnt = vlSldCredorAnt;
    }

    /**
     * @return the vlSldApurado
     */
    public BigDecimal getVlSldApurado() {
        return vlSldApurado;
    }

    /**
     * @param vlSldApurado the vlSldApurado to set
     */
    public void setVlSldApurado(BigDecimal vlSldApurado) {
        this.vlSldApurado = vlSldApurado;
    }

    /**
     * @return the vlTotDed
     */
    public BigDecimal getVlTotDed() {
        return vlTotDed;
    }

    /**
     * @param vlTotDed the vlTotDed to set
     */
    public void setVlTotDed(BigDecimal vlTotDed) {
        this.vlTotDed = vlTotDed;
    }

    /**
     * @return the vlIcmsRecolher
     */
    public BigDecimal getVlIcmsRecolher() {
        return vlIcmsRecolher;
    }

    /**
     * @param vlIcmsRecolher the vlIcmsRecolher to set
     */
    public void setVlIcmsRecolher(BigDecimal vlIcmsRecolher) {
        this.vlIcmsRecolher = vlIcmsRecolher;
    }

    /**
     * @return the vlSldCredorTransportar
     */
    public BigDecimal getVlSldCredorTransportar() {
        return vlSldCredorTransportar;
    }

    /**
     * @param vlSldCredorTransportar the vlSldCredorTransportar to set
     */
    public void setVlSldCredorTransportar(BigDecimal vlSldCredorTransportar) {
        this.vlSldCredorTransportar = vlSldCredorTransportar;
    }

    /**
     * @return the debEsp
     */
    public BigDecimal getDebEsp() {
        return debEsp;
    }

    /**
     * @param debEsp the debEsp to set
     */
    public void setDebEsp(BigDecimal debEsp) {
        this.debEsp = debEsp;
    }

    /**
     * @return the registroE116List
     */
    public List<RegistroE116> getRegistroE116List() {
        return registroE116List;
    }

    /**
     * @param registroE116List the registroE116List to set
     */
    public void setRegistroE116List(List<RegistroE116> registroE116List) {
        this.registroE116List = registroE116List;
    }

}
