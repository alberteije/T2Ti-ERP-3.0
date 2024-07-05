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

public class RegistroC405 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Date dtDoc; // Data do movimento a que se refere a Redução Z
    private Integer cro; // Posição do Contador de Reinício de Operação
    private Integer crz; // Posição do Contador de Redução Z
    private Integer numCooFin; // Número do Contador de Ordem de Operação do último documento emitido no dia. (Número do COO na Redução Z)
    private BigDecimal gtFin; // Valor do Grande Total final
    private BigDecimal vlBrt; // Valor da venda bruta
    private List<RegistroC420> registroC420List; // BLOCO C - Lista de RegistroC420 (FILHO)
    private List<RegistroC460> registroC460List; // BLOCO C - Lista de RegistroC460 (FILHO)
    private List<RegistroC490> registroC490List; // BLOCO C - Lista de RegistroC490 (FILHO)

    public RegistroC405() {
        registroC420List = new ArrayList<RegistroC420>();
        registroC460List = new ArrayList<RegistroC460>();
        registroC490List = new ArrayList<RegistroC490>();
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
     * @return the cro
     */
    public Integer getCro() {
        return cro;
    }

    /**
     * @param cro the cro to set
     */
    public void setCro(Integer cro) {
        this.cro = cro;
    }

    /**
     * @return the crz
     */
    public Integer getCrz() {
        return crz;
    }

    /**
     * @param crz the crz to set
     */
    public void setCrz(Integer crz) {
        this.crz = crz;
    }

    /**
     * @return the numCooFin
     */
    public Integer getNumCooFin() {
        return numCooFin;
    }

    /**
     * @param numCooFin the numCooFin to set
     */
    public void setNumCooFin(Integer numCooFin) {
        this.numCooFin = numCooFin;
    }

    /**
     * @return the gtFin
     */
    public BigDecimal getGtFin() {
        return gtFin;
    }

    /**
     * @param gtFin the gtFin to set
     */
    public void setGtFin(BigDecimal gtFin) {
        this.gtFin = gtFin;
    }

    /**
     * @return the vlBrt
     */
    public BigDecimal getVlBrt() {
        return vlBrt;
    }

    /**
     * @param vlBrt the vlBrt to set
     */
    public void setVlBrt(BigDecimal vlBrt) {
        this.vlBrt = vlBrt;
    }

    /**
     * @return the registroC420List
     */
    public List<RegistroC420> getRegistroC420List() {
        return registroC420List;
    }

    /**
     * @param registroC420List the registroC420List to set
     */
    public void setRegistroC420List(List<RegistroC420> registroC420List) {
        this.registroC420List = registroC420List;
    }

    /**
     * @return the registroC460List
     */
    public List<RegistroC460> getRegistroC460List() {
        return registroC460List;
    }

    /**
     * @param registroC460List the registroC460List to set
     */
    public void setRegistroC460List(List<RegistroC460> registroC460List) {
        this.registroC460List = registroC460List;
    }

    /**
     * @return the registroC490List
     */
    public List<RegistroC490> getRegistroC490List() {
        return registroC490List;
    }

    /**
     * @param registroC490List the registroC490List to set
     */
    public void setRegistroC490List(List<RegistroC490> registroC490List) {
        this.registroC490List = registroC490List;
    }

}