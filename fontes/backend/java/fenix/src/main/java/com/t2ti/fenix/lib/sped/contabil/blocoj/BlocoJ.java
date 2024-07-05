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
package com.t2ti.fenix.lib.sped.contabil.blocoj;

import com.t2ti.fenix.lib.sped.SpedUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BlocoJ implements Serializable {

    private static final long serialVersionUID = 1L;
    private RegistroJ001 registroJ001;
    private List<RegistroJ005> listaRegistroJ005;
    private List<RegistroJ800> listaRegistroJ800;
    private RegistroJ900 registroJ900;
    private List<RegistroJ930> listaRegistroJ930;
    private RegistroJ990 registroJ990;
    private Integer numeroRegistrosJ100;
    private Integer numeroRegistrosJ150;
    private SpedUtil u;

    public BlocoJ(SpedUtil spedUtil) {
        registroJ001 = new RegistroJ001();
        registroJ001.setIndDad(1);
        listaRegistroJ005 = new ArrayList<RegistroJ005>();
        listaRegistroJ800 = new ArrayList<RegistroJ800>();
        listaRegistroJ930 = new ArrayList<RegistroJ930>();
        registroJ900 = new RegistroJ900();

        registroJ990 = new RegistroJ990();
        registroJ990.setQtdLinJ(0);

        numeroRegistrosJ100 = 0;
        numeroRegistrosJ150 = 0;

        this.u = spedUtil;
    }

    public void limpaRegistros() {
        listaRegistroJ005.clear();
        listaRegistroJ800.clear();
        listaRegistroJ930.clear();

        registroJ990.setQtdLinJ(0);
    }

    public String gravaRegistroJ001() {
        registroJ990.setQtdLinJ(registroJ990.getQtdLinJ() + 1);

        return u.preenche("J001")
                + u.preenche(registroJ001.getIndDad())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistroJ005() {
        String registro = "";
        for (int i = 0; i < listaRegistroJ005.size(); i++) {
            registro += u.preenche("J005")
                    + u.preenche(listaRegistroJ005.get(i).getDtIni())
                    + u.preenche(listaRegistroJ005.get(i).getDtFin())
                    + u.preenche(listaRegistroJ005.get(i).getIdDem())
                    + u.preenche(listaRegistroJ005.get(i).getCabDem())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro += gravaRegistroJ100(listaRegistroJ005.get(i).getRegistroJ100List());
            registro += gravaRegistroJ150(listaRegistroJ005.get(i).getRegistroJ150List());

            registroJ990.setQtdLinJ(registroJ990.getQtdLinJ() + 1);
        }
        return registro;
    }

    private String gravaRegistroJ100(List<RegistroJ100> listaRegistroJ100) {
        String registro = "";
        for (int i = 0; i < listaRegistroJ100.size(); i++) {
            registro += u.preenche("J100")
                    + u.preenche(listaRegistroJ100.get(i).getCodAgl())
                    + u.preenche(listaRegistroJ100.get(i).getNivelAgl())
                    + u.preenche(listaRegistroJ100.get(i).getIndGrpBal())
                    + u.preenche(listaRegistroJ100.get(i).getDescrCodAgl())
                    + u.preenche(listaRegistroJ100.get(i).getVlCta())
                    + u.preenche(listaRegistroJ100.get(i).getIndDcBal())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroJ990.setQtdLinJ(registroJ990.getQtdLinJ() + 1);
            numeroRegistrosJ100 += 1;
        }
        return registro;
    }

    private String gravaRegistroJ150(List<RegistroJ150> listaRegistroJ150) {
        String registro = "";
        for (int i = 0; i < listaRegistroJ150.size(); i++) {
            registro += u.preenche("J150")
                    + u.preenche(listaRegistroJ150.get(i).getCodAgl())
                    + u.preenche(listaRegistroJ150.get(i).getNivelAgl())
                    + u.preenche(listaRegistroJ150.get(i).getDescrCodAgl())
                    + u.preenche(listaRegistroJ150.get(i).getVlCta())
                    + u.preenche(listaRegistroJ150.get(i).getIndVl())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroJ990.setQtdLinJ(registroJ990.getQtdLinJ() + 1);
            numeroRegistrosJ150 += 1;
        }
        return registro;
    }

    public String gravaRegistroJ800() {
        String registro = "";
        for (int i = 0; i < listaRegistroJ800.size(); i++) {
            registro += u.preenche("J800")
                    + u.preenche(listaRegistroJ800.get(i).getArqRtf())
                    + u.preenche("J800FIM")
                    + u.getDelimitador()
                    + u.getCrlf();

            registroJ990.setQtdLinJ(registroJ990.getQtdLinJ() + 1);
        }
        return registro;
    }

    public String gravaRegistroJ900() {
        registroJ990.setQtdLinJ(registroJ990.getQtdLinJ() + 1);

        return u.preenche("J900")
                + u.preenche("TERMO DE ENCERRAMENTO")
                + u.preenche(registroJ900.getNumOrd())
                + u.preenche(registroJ900.getNatLivro())
                + u.preenche(registroJ900.getNome())
                + u.preenche(registroJ900.getQtdLin())
                + u.preenche(registroJ900.getDtIniEscr())
                + u.preenche(registroJ900.getDtFinEscr())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistroJ930() {
        String registro = "";
        for (int i = 0; i < listaRegistroJ800.size(); i++) {
            registro += u.preenche("J930")
                    + u.preenche(listaRegistroJ930.get(i).getIdentNom())
                    + u.preenche(listaRegistroJ930.get(i).getIdentCpf())
                    + u.preenche(listaRegistroJ930.get(i).getIdentQualif())
                    + u.preenche(listaRegistroJ930.get(i).getCodAssin())
                    + u.preenche(listaRegistroJ930.get(i).getIndCrc())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroJ990.setQtdLinJ(registroJ990.getQtdLinJ() + 1);
        }
        return registro;
    }

    public String gravaRegistroJ990() {
        registroJ990.setQtdLinJ(registroJ990.getQtdLinJ() + 1);

        return u.preenche("J990")
                + u.preenche(registroJ990.getQtdLinJ())
                + u.getDelimitador()
                + u.getCrlf();
    }

    /**
     * @return the registroJ001
     */
    public RegistroJ001 getRegistroJ001() {
        return registroJ001;
    }

    /**
     * @param registroJ001 the registroJ001 to set
     */
    public void setRegistroJ001(RegistroJ001 registroJ001) {
        this.registroJ001 = registroJ001;
    }

    /**
     * @return the listaRegistroJ005
     */
    public List<RegistroJ005> getListaRegistroJ005() {
        return listaRegistroJ005;
    }

    /**
     * @param listaRegistroJ005 the listaRegistroJ005 to set
     */
    public void setListaRegistroJ005(List<RegistroJ005> listaRegistroJ005) {
        this.listaRegistroJ005 = listaRegistroJ005;
    }

    /**
     * @return the listaRegistroJ800
     */
    public List<RegistroJ800> getListaRegistroJ800() {
        return listaRegistroJ800;
    }

    /**
     * @param listaRegistroJ800 the listaRegistroJ800 to set
     */
    public void setListaRegistroJ800(List<RegistroJ800> listaRegistroJ800) {
        this.listaRegistroJ800 = listaRegistroJ800;
    }

    /**
     * @return the registroJ900
     */
    public RegistroJ900 getRegistroJ900() {
        return registroJ900;
    }

    /**
     * @param registroJ900 the registroJ900 to set
     */
    public void setRegistroJ900(RegistroJ900 registroJ900) {
        this.registroJ900 = registroJ900;
    }

    /**
     * @return the listaRegistroJ930
     */
    public List<RegistroJ930> getListaRegistroJ930() {
        return listaRegistroJ930;
    }

    /**
     * @param listaRegistroJ930 the listaRegistroJ930 to set
     */
    public void setListaRegistroJ930(List<RegistroJ930> listaRegistroJ930) {
        this.listaRegistroJ930 = listaRegistroJ930;
    }

    /**
     * @return the registroJ990
     */
    public RegistroJ990 getRegistroJ990() {
        return registroJ990;
    }

    /**
     * @param registroJ990 the registroJ990 to set
     */
    public void setRegistroJ990(RegistroJ990 registroJ990) {
        this.registroJ990 = registroJ990;
    }

    /**
     * @return the numeroRegistrosJ100
     */
    public Integer getNumeroRegistrosJ100() {
        return numeroRegistrosJ100;
    }

    /**
     * @param numeroRegistrosJ100 the numeroRegistrosJ100 to set
     */
    public void setNumeroRegistrosJ100(Integer numeroRegistrosJ100) {
        this.numeroRegistrosJ100 = numeroRegistrosJ100;
    }

    /**
     * @return the numeroRegistrosJ150
     */
    public Integer getNumeroRegistrosJ150() {
        return numeroRegistrosJ150;
    }

    /**
     * @param numeroRegistrosJ150 the numeroRegistrosJ150 to set
     */
    public void setNumeroRegistrosJ150(Integer numeroRegistrosJ150) {
        this.numeroRegistrosJ150 = numeroRegistrosJ150;
    }
}
