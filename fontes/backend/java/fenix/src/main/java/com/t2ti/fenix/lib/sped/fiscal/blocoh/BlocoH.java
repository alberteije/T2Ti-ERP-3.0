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
import java.util.ArrayList;
import java.util.List;

import com.t2ti.fenix.lib.sped.SpedUtil;

public class BlocoH implements Serializable {

    private static final long serialVersionUID = 1L;
    private RegistroH001 registroH001;
    private List<RegistroH005> listaRegistroH005;
    private RegistroH990 registroH990;
    private Integer numeroRegistroH005;
    private Integer numeroRegistroH010;
    private SpedUtil u;

    public BlocoH(SpedUtil spedUtil) {
        registroH001 = new RegistroH001();
        registroH001.setIndMov(1);

        listaRegistroH005 = new ArrayList<RegistroH005>();

        registroH990 = new RegistroH990();
        registroH990.setQtdLinH(0);

        numeroRegistroH005 = 0;
        numeroRegistroH010 = 0;

        this.u = spedUtil;
    }

    public String gravaRegistroH001() {
        registroH990.setQtdLinH(registroH990.getQtdLinH() + 1);

        return u.preenche("H001")
                + u.preenche(registroH001.getIndMov())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistroH005() {
        String registro = "";
        for (int i = 0; i < listaRegistroH005.size(); i++) {
            registro += u.preenche("H005")
                    + u.preenche(listaRegistroH005.get(i).getDtInv())
                    + u.preenche(listaRegistroH005.get(i).getVlInv())
                    + u.preenche(listaRegistroH005.get(i).getMotInv())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroH990.setQtdLinH(registroH990.getQtdLinH() + 1);
            numeroRegistroH005 += 1;
            gravaRegistroH010(listaRegistroH005.get(i).getRegistroH010List());
        }
        return registro;
    }

    private String gravaRegistroH010(List<RegistroH010> listaRegistroH010) {
        String registro = "";
        for (int i = 0; i < listaRegistroH010.size(); i++) {
            registro += u.preenche("H010")
                    + u.preenche(listaRegistroH010.get(i).getCodItem())
                    + u.preenche(listaRegistroH010.get(i).getUnid())
                    + u.preenche(listaRegistroH010.get(i).getQtd())
                    + u.preenche(listaRegistroH010.get(i).getVlUnit())
                    + u.preenche(listaRegistroH010.get(i).getVlItem())
                    + u.preenche(listaRegistroH010.get(i).getIndProp())
                    + u.preenche(listaRegistroH010.get(i).getCodPart())
                    + u.preenche(listaRegistroH010.get(i).getTxtCompl())
                    + u.preenche(listaRegistroH010.get(i).getCodCta())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroH990.setQtdLinH(registroH990.getQtdLinH() + 1);
            numeroRegistroH010 += 1;
        }
        return registro;
    }

    public String gravaRegistroH990() {
        registroH990.setQtdLinH(registroH990.getQtdLinH() + 1);

        return u.preenche("H990")
                + u.preenche(registroH990.getQtdLinH())
                + u.getDelimitador()
                + u.getCrlf();
    }

    /**
     * @return the registroH001
     */
    public RegistroH001 getRegistroH001() {
        return registroH001;
    }

    /**
     * @return the registroH990
     */
    public RegistroH990 getRegistroH990() {
        return registroH990;
    }

    public List<RegistroH005> getListaRegistroH005() {
        return listaRegistroH005;
    }

    public Integer getNumeroRegistroH005() {
        return numeroRegistroH005;
    }

    public Integer getNumeroRegistroH010() {
        return numeroRegistroH010;
    }

}
