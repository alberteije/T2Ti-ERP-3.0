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
package com.t2ti.fenix.lib.sped.contabil.bloco0;

import java.io.Serializable;

public class Registro0150 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codPart; /// Código de identificação do participante
    private String nome; /// Nome pessoal ou empresarial
    private Integer codPais; /// Código do país do participante
    private String cnpj; /// CNPJ do participante
    private String cpf; /// CPF do participante na unidade da federação do destinatário
    private String nit; /// Número de Identificação do Trabalhador, Pis, Pasep, SUS.
    private String uf; /// Sigla da unidade da federação do participante.
    private String ie; /// Inscrição Estadual do participante
    private String ieSt; /// Inscrição Estadual do participante na unidade da federação do destinatário, na condição de contribuinte substituto
    private Integer codMun; /// Código do município
    private String im; /// Inscrição Municipal do participante.
    private String suframa; /// Número de inscrição na Suframa

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
     * @return the codPais
     */
    public Integer getCodPais() {
        return codPais;
    }

    /**
     * @param codPais the codPais to set
     */
    public void setCodPais(Integer codPais) {
        this.codPais = codPais;
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
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @return the nit
     */
    public String getNit() {
        return nit;
    }

    /**
     * @param nit the nit to set
     */
    public void setNit(String nit) {
        this.nit = nit;
    }

    /**
     * @return the uf
     */
    public String getUf() {
        return uf;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(String uf) {
        this.uf = uf;
    }

    /**
     * @return the ie
     */
    public String getIe() {
        return ie;
    }

    /**
     * @param ie the ie to set
     */
    public void setIe(String ie) {
        this.ie = ie;
    }

    /**
     * @return the ieSt
     */
    public String getIeSt() {
        return ieSt;
    }

    /**
     * @param ieSt the ieSt to set
     */
    public void setIeSt(String ieSt) {
        this.ieSt = ieSt;
    }

    /**
     * @return the codMun
     */
    public Integer getCodMun() {
        return codMun;
    }

    /**
     * @param codMun the codMun to set
     */
    public void setCodMun(Integer codMun) {
        this.codMun = codMun;
    }

    /**
     * @return the im
     */
    public String getIm() {
        return im;
    }

    /**
     * @param im the im to set
     */
    public void setIm(String im) {
        this.im = im;
    }

    /**
     * @return the suframa
     */
    public String getSuframa() {
        return suframa;
    }

    /**
     * @param suframa the suframa to set
     */
    public void setSuframa(String suframa) {
        this.suframa = suframa;
    }
}
