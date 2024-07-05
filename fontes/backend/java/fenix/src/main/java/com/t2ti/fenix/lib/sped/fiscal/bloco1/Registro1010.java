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
package com.t2ti.fenix.lib.sped.fiscal.bloco1;

import java.io.Serializable;

public class Registro1010 implements Serializable {

    private static final long serialVersionUID = 1L;
    private String indExp; // Reg. 1100 - Ocorreu averbação (conclusão) de exportação no período
    private String indCcrf; // Reg. 1200 – Existem informações acerca de créditos de ICMS a serem controlados, definidos pela Sefaz
    private String indComb; // Reg. 1300 – É comercio varejista de combustíveis
    private String indUsina; // Reg. 1390 – Usinas de açúcar e/álcool – O estabelecimento é produtor de açúcar e/ou álcool carburante
    private String indVa; // Reg. 1400 – Existem informações a serem prestadas neste registro e o registro é obrigatório em sua Unidade da Federação
    private String indEe; // Reg. 1500 - A empresa é distribuidora de energia e ocorreu fornecimento de energia elétrica para consumidores de outra UF
    private String indCart; // Reg. 1600 - Realizou vendas com Cartão de Crédito ou de débito
    private String indForm; // Reg. 1700 - É obrigatório em sua unidade da federação o controle de utilização de documentos fiscais em papel
    private String indAer; // Reg. 1800 – A empresa prestou serviços de transporte aéreo de cargas e de passageiros

    public String getIndExp() {
        return indExp;
    }

    public void setIndExp(String indExp) {
        this.indExp = indExp;
    }

    public String getIndCcrf() {
        return indCcrf;
    }

    public void setIndCcrf(String indCcrf) {
        this.indCcrf = indCcrf;
    }

    public String getIndComb() {
        return indComb;
    }

    public void setIndComb(String indComb) {
        this.indComb = indComb;
    }

    public String getIndUsina() {
        return indUsina;
    }

    public void setIndUsina(String indUsina) {
        this.indUsina = indUsina;
    }

    public String getIndVa() {
        return indVa;
    }

    public void setIndVa(String indVa) {
        this.indVa = indVa;
    }

    public String getIndEe() {
        return indEe;
    }

    public void setIndEe(String indEe) {
        this.indEe = indEe;
    }

    public String getIndCart() {
        return indCart;
    }

    public void setIndCart(String indCart) {
        this.indCart = indCart;
    }

    public String getIndForm() {
        return indForm;
    }

    public void setIndForm(String indForm) {
        this.indForm = indForm;
    }

    public String getIndAer() {
        return indAer;
    }

    public void setIndAer(String indAer) {
        this.indAer = indAer;
    }
}
