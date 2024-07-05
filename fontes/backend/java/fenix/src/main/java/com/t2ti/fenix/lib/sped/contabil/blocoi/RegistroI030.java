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
import java.util.Date;

public class RegistroI030 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String numOrd; /// Número de ordem do instrumento de escrituração.
    private String natLivr; /// Natureza do livro
    private Integer qtdLin; /// Quantidade total de linhas do arquivo digital.
    private String nome; /// Nome empresarial.
    private String nire; /// Número de Identificação do Registro de Empresas da Junta Comercial.
    private String cnpj; /// Número de inscrição no CNPJ .
    private Date dtArq; /// Data do arquivamento dos atos constitutivos.
    private Date dtArqConv; /// Data de arquivamento do ato de conversão de sociedade simples em sociedade empresária.
    private String descMun; /// Município.

    /**
     * @return the numOrd
     */
    public String getNumOrd() {
        return numOrd;
    }

    /**
     * @param numOrd the numOrd to set
     */
    public void setNumOrd(String numOrd) {
        this.numOrd = numOrd;
    }

    /**
     * @return the natLivr
     */
    public String getNatLivr() {
        return natLivr;
    }

    /**
     * @param natLivr the natLivr to set
     */
    public void setNatLivr(String natLivr) {
        this.natLivr = natLivr;
    }

    /**
     * @return the qtdLin
     */
    public Integer getQtdLin() {
        return qtdLin;
    }

    /**
     * @param qtdLin the qtdLin to set
     */
    public void setQtdLin(Integer qtdLin) {
        this.qtdLin = qtdLin;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the nire
     */
    public String getNire() {
        return nire;
    }

    /**
     * @param nire the nire to set
     */
    public void setNire(String nire) {
        this.nire = nire;
    }

    /**
     * @return the cnpj
     */
    public String getCnpj() {
        return cnpj;
    }

    /**
     * @param cnpj the cnpj to set
     */
    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    /**
     * @return the dtArq
     */
    public Date getDtArq() {
        return dtArq;
    }

    /**
     * @param dtArq the dtArq to set
     */
    public void setDtArq(Date dtArq) {
        this.dtArq = dtArq;
    }

    /**
     * @return the dtArqConv
     */
    public Date getDtArqConv() {
        return dtArqConv;
    }

    /**
     * @param dtArqConv the dtArqConv to set
     */
    public void setDtArqConv(Date dtArqConv) {
        this.dtArqConv = dtArqConv;
    }

    /**
     * @return the descMun
     */
    public String getDescMun() {
        return descMun;
    }

    /**
     * @param descMun the descMun to set
     */
    public void setDescMun(String descMun) {
        this.descMun = descMun;
    }
}
