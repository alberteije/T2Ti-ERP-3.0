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
import java.util.ArrayList;
import java.util.List;

import com.t2ti.fenix.lib.sped.SpedUtil;

public class BlocoE implements Serializable {

    private static final long serialVersionUID = 1L;
    private RegistroE001 registroE001;
    private List<RegistroE100> listaRegistroE100;
    private RegistroE990 registroE990;
    private Integer numeroRegistroE110;
    private Integer numeroRegistroE116;
    private SpedUtil u;

    public BlocoE(SpedUtil spedUtil) {
        registroE001 = new RegistroE001();
        registroE001.setIndMov(1);

        listaRegistroE100 = new ArrayList<RegistroE100>();

        registroE990 = new RegistroE990();
        registroE990.setQtdLinE(0);

        numeroRegistroE110 = 0;
        numeroRegistroE116 = 0;

        this.u = spedUtil;
    }

    public String gravaRegistroE001() {
        registroE990.setQtdLinE(registroE990.getQtdLinE() + 1);

        return u.preenche("E001")
                + u.preenche(registroE001.getIndMov())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistroE100(String codVer) {
        String registro = "";
        for (int i = 0; i < listaRegistroE100.size(); i++) {
            registro += u.preenche("E100")
                    + u.preenche(listaRegistroE100.get(i).getDtIni())
                    + u.preenche(listaRegistroE100.get(i).getDtFin())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroE990.setQtdLinE(registroE990.getQtdLinE() + 1);
            gravaRegistroE110(listaRegistroE100.get(i).getRegistroE110(), codVer);
        }
        return registro;
    }

    private String gravaRegistroE110(RegistroE110 registroE110, String codVer) {
        if (registroE110 == null){
            return "";
        }
        String registro = "";

        registro += u.preenche("E110")
                + u.preenche(registroE110.getVlTotDebitos())
                + u.preenche(registroE110.getVlAjDebitos())
                + u.preenche(registroE110.getVlTotAjDebitos())
                + u.preenche(registroE110.getVlEstornosCred())
                + u.preenche(registroE110.getVlTotCreditos())
                + u.preenche(registroE110.getVlAjCreditos())
                + u.preenche(registroE110.getVlTotAjCreditos())
                + u.preenche(registroE110.getVlEstornosDeb())
                + u.preenche(registroE110.getVlSldCredorAnt())
                + u.preenche(registroE110.getVlSldApurado())
                + u.preenche(registroE110.getVlTotDed())
                + u.preenche(registroE110.getVlIcmsRecolher())
                + u.preenche(registroE110.getVlSldCredorTransportar())
                + u.preenche(registroE110.getDebEsp())
                + u.getDelimitador()
                + u.getCrlf();

        registroE990.setQtdLinE(registroE990.getQtdLinE() + 1);
        numeroRegistroE110 += 1;

        registro += gravaRegistroE116(registroE110.getRegistroE116List(), codVer);

        return registro;

    }

    private String gravaRegistroE116(List<RegistroE116> listaRegistroE116, String codVer) {
        if (codVer.equals("002")) {// versao 1.01
            return "";
        }
        String registro = "";
        for (int i = 0; i < listaRegistroE116.size(); i++) {
            if (codVer.equals("003")) {//versao 1.02
                registro += u.preenche("E116")
                        + u.preenche(listaRegistroE116.get(i).getCodOr())
                        + u.preenche(listaRegistroE116.get(i).getVlOr())
                        + u.preenche(listaRegistroE116.get(i).getDtVcto())
                        + u.preenche(listaRegistroE116.get(i).getCodRec())
                        + u.preenche(listaRegistroE116.get(i).getNumProc())
                        + u.preenche(listaRegistroE116.get(i).getIndProc())
                        + u.preenche(listaRegistroE116.get(i).getProc())
                        + u.preenche(listaRegistroE116.get(i).getTxtCompl())
                        + u.getDelimitador()
                        + u.getCrlf();
            } else {
                registro += u.preenche("E116")
                        + u.preenche(listaRegistroE116.get(i).getCodOr())
                        + u.preenche(listaRegistroE116.get(i).getVlOr())
                        + u.preenche(listaRegistroE116.get(i).getDtVcto())
                        + u.preenche(listaRegistroE116.get(i).getCodRec())
                        + u.preenche(listaRegistroE116.get(i).getNumProc())
                        + u.preenche(listaRegistroE116.get(i).getIndProc())
                        + u.preenche(listaRegistroE116.get(i).getProc())
                        + u.preenche(listaRegistroE116.get(i).getTxtCompl())
                        + u.preenche(listaRegistroE116.get(i).getMesRef())
                        + u.getDelimitador()
                        + u.getCrlf();
            }
            registroE990.setQtdLinE(registroE990.getQtdLinE() + 1);
            numeroRegistroE116 += 1;
        }
        return registro;
    }

    public String gravaRegistroE990() {
        registroE990.setQtdLinE(registroE990.getQtdLinE() + 1);

        return u.preenche("E990")
                + u.preenche(registroE990.getQtdLinE())
                + u.getDelimitador()
                + u.getCrlf();
    }

    /**
     * @return the registroE001
     */
    public RegistroE001 getRegistroE001() {
        return registroE001;
    }

    /**
     * @return the listaRegistroE100
     */
    public List<RegistroE100> getListaRegistroE100() {
        return listaRegistroE100;
    }

    /**
     * @return the registroE990
     */
    public RegistroE990 getRegistroE990() {
        return registroE990;
    }

    /**
     * @return the numeroRegistroE110
     */
    public Integer getNumeroRegistroE110() {
        return numeroRegistroE110;
    }

    /**
     * @return the numeroRegistroE116
     */
    public Integer getNumeroRegistroE116() {
        return numeroRegistroE116;
    }
}
