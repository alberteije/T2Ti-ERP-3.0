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
package com.t2ti.fenix.lib.sped;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SpedUtil {

    private String delimitador;
    private SimpleDateFormat formatoData;
    private DecimalFormat formatoDecimal;
    private String crlf;

    public SpedUtil() {
        delimitador = "|";
        formatoData = new SimpleDateFormat("ddMMyyyy");
        formatoDecimal = new DecimalFormat("0.00");
        crlf = System.getProperty("line.separator");
    }

    public String preenche(String valor) {
        return valor == null ? delimitador : delimitador + valor.trim();
    }

    public String preenche(Date valor) {
        return valor == null ? delimitador : delimitador + formatoData.format(valor);
    }

    public String preenche(Integer valor) {
        return valor == null ? delimitador : delimitador + valor;
    }

    public String preenche(BigDecimal valor) {
        return valor == null ? delimitador : delimitador + formatoDecimal.format(valor);
    }

    /**
     * @return the delimitador
     */
    public String getDelimitador() {
        return delimitador;
    }

    /**
     * @param delimitador the delimitador to set
     */
    public void setDelimitador(String delimitador) {
        this.delimitador = delimitador;
    }

    /**
     * @return the formatoData
     */
    public SimpleDateFormat getFormatoData() {
        return formatoData;
    }

    /**
     * @param formatoData the formatoData to set
     */
    public void setFormatoData(SimpleDateFormat formatoData) {
        this.formatoData = formatoData;
    }

    /**
     * @return the crlf
     */
    public String getCrlf() {
        return crlf;
    }

    /**
     * @param crlf the crlf to set
     */
    public void setCrlf(String crlf) {
        this.crlf = crlf;
    }

    /**
     * @return the formatoDecimal
     */
    public DecimalFormat getFormatoDecimal() {
        return formatoDecimal;
    }

    /**
     * @param formatoDecimal the formatoDecimal to set
     */
    public void setFormatoDecimal(DecimalFormat formatoDecimal) {
        this.formatoDecimal = formatoDecimal;
    }
}
