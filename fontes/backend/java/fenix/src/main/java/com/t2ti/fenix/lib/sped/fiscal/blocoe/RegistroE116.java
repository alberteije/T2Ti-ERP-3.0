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
import java.util.Date;

public class RegistroE116 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codOr; // Código da obrigação a recolher, conforme a Tabela 5.4
    private BigDecimal vlOr; // Valor da obrigação a recolher
    private Date dtVcto; // Data de vencimento da obrigação
    private String codRec; // Código de receita referente à obrigação, próprio da unidade da federação, conforme legislação estadual,
    private String numProc; // Número do processo ou auto de infração ao qual a obrigação está vinculada, se houver.
    private String indProc; // Indicador da origem do processo
    private String proc; // Descrição resumida do processo que embasou o lançamento
    private String txtCompl; // Descrição complementar das obrigações a recolher.
    private String mesRef; // VERSÃO 103

    /**
     * @return the codOr
     */
    public String getCodOr() {
        return codOr;
    }

    /**
     * @param codOr the codOr to set
     */
    public void setCodOr(String codOr) {
        this.codOr = codOr;
    }

    /**
     * @return the vlOr
     */
    public BigDecimal getVlOr() {
        return vlOr;
    }

    /**
     * @param vlOr the vlOr to set
     */
    public void setVlOr(BigDecimal vlOr) {
        this.vlOr = vlOr;
    }

    /**
     * @return the dtVcto
     */
    public Date getDtVcto() {
        return dtVcto;
    }

    /**
     * @param dtVcto the dtVcto to set
     */
    public void setDtVcto(Date dtVcto) {
        this.dtVcto = dtVcto;
    }

    /**
     * @return the codRec
     */
    public String getCodRec() {
        return codRec;
    }

    /**
     * @param codRec the codRec to set
     */
    public void setCodRec(String codRec) {
        this.codRec = codRec;
    }

    /**
     * @return the numProc
     */
    public String getNumProc() {
        return numProc;
    }

    /**
     * @param numProc the numProc to set
     */
    public void setNumProc(String numProc) {
        this.numProc = numProc;
    }

    /**
     * @return the indProc
     */
    public String getIndProc() {
        return indProc;
    }

    /**
     * @param indProc the indProc to set
     */
    public void setIndProc(String indProc) {
        this.indProc = indProc;
    }

    /**
     * @return the proc
     */
    public String getProc() {
        return proc;
    }

    /**
     * @param proc the proc to set
     */
    public void setProc(String proc) {
        this.proc = proc;
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
     * @return the mesRef
     */
    public String getMesRef() {
        return mesRef;
    }

    /**
     * @param mesRef the mesRef to set
     */
    public void setMesRef(String mesRef) {
        this.mesRef = mesRef;
    }
}
