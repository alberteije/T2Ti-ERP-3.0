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
package com.t2ti.fenix.lib.sped.fiscal.blocoh;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class RegistroH005 implements Serializable{

    private static final long serialVersionUID = 1L;
    private Date dtInv;    // Data do inventario
    private BigDecimal vlInv; // Valor total do estoque
    private String motInv; // Motivo do Inventario
    private List<RegistroH010> registroH010List;  /// BLOCO C - Lista de RegistroH010 (FILHO)

    public Date getDtInv() {
        return dtInv;
    }

    public void setDtInv(Date dtInv) {
        this.dtInv = dtInv;
    }

    public BigDecimal getVlInv() {
        return vlInv;
    }

    public void setVlInv(BigDecimal vlInv) {
        this.vlInv = vlInv;
    }

    public List<RegistroH010> getRegistroH010List() {
        return registroH010List;
    }

    public void setRegistroH010List(List<RegistroH010> registroH010List) {
        this.registroH010List = registroH010List;
    }

    public String getMotInv() {
        return motInv;
    }

    public void setMotInv(String motInv) {
        this.motInv = motInv;
    }

}
