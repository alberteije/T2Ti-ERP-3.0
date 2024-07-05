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
package com.t2ti.fenix.lib.sped.contabil.blocoi;

import java.io.Serializable;

public class RegistroI020 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String regCod; /// Código do registro que recepciona o campo adicional.
    private String numAd; /// Número seqüencial do campo adicional.
    private String campo; /// Nome do campo adicional.
    private String descricao; /// Descrição do campo adicional.
    private String tipoDado; /// Indicação do tipo de dado (N

    /**
     * @return the regCod
     */
    public String getRegCod() {
        return regCod;
    }

    /**
     * @param regCod the regCod to set
     */
    public void setRegCod(String regCod) {
        this.regCod = regCod;
    }

    /**
     * @return the numAd
     */
    public String getNumAd() {
        return numAd;
    }

    /**
     * @param numAd the numAd to set
     */
    public void setNumAd(String numAd) {
        this.numAd = numAd;
    }

    /**
     * @return the campo
     */
    public String getCampo() {
        return campo;
    }

    /**
     * @param campo the campo to set
     */
    public void setCampo(String campo) {
        this.campo = campo;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the tipoDado
     */
    public String getTipoDado() {
        return tipoDado;
    }

    /**
     * @param tipoDado the tipoDado to set
     */
    public void setTipoDado(String tipoDado) {
        this.tipoDado = tipoDado;
    }
}
