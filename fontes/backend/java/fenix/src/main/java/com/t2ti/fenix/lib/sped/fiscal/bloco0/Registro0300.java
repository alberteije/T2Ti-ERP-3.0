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

public class Registro0300 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String codIndBem; // Código individualizado do bem ou componente adotado no controle patrimonial do estabelecimento informante
    private Integer identMerc; // Identificação do tipo de mercadoria
    private String descrItem; // Descrição do bem ou componente (modelo, marca e outras características necessárias a sua individualização)
    private String codPrnc; // Código de cadastro do bem principal nos casos em que o bem ou componente ( campo 02) esteja vinculado a um bem principal.
    private String codCta; // Código da conta analítica de contabilização do bem ou componente (campo 06 do Registro 0500)
    private Double nrParc; // Número total de parcelas a serem apropriadas, segundo a legislação de cada unidade federada
    private Registro0305 registro0305; // BLOCO 0 - Registro0305 (FILHO)

    /**
     * @return the codIndBem
     */
    public String getCodIndBem() {
        return codIndBem;
    }

    /**
     * @param codIndBem the codIndBem to set
     */
    public void setCodIndBem(String codIndBem) {
        this.codIndBem = codIndBem;
    }

    /**
     * @return the identMerc
     */
    public Integer getIdentMerc() {
        return identMerc;
    }

    /**
     * @param identMerc the identMerc to set
     */
    public void setIdentMerc(Integer identMerc) {
        this.identMerc = identMerc;
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
     * @return the codPrnc
     */
    public String getCodPrnc() {
        return codPrnc;
    }

    /**
     * @param codPrnc the codPrnc to set
     */
    public void setCodPrnc(String codPrnc) {
        this.codPrnc = codPrnc;
    }

    /**
     * @return the codCta
     */
    public String getCodCta() {
        return codCta;
    }

    /**
     * @param codCta the codCta to set
     */
    public void setCodCta(String codCta) {
        this.codCta = codCta;
    }

    /**
     * @return the nrParc
     */
    public Double getNrParc() {
        return nrParc;
    }

    /**
     * @param nrParc the nrParc to set
     */
    public void setNrParc(Double nrParc) {
        this.nrParc = nrParc;
    }

    /**
     * @return the registro0305
     */
    public Registro0305 getRegistro0305() {
        return registro0305;
    }

    /**
     * @param registro0305 the registro0305 to set
     */
    public void setRegistro0305(Registro0305 registro0305) {
        this.registro0305 = registro0305;
    }
}
