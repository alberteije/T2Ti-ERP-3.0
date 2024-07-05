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
import java.util.ArrayList;
import java.util.List;

import com.t2ti.fenix.lib.sped.SpedUtil;

public class Bloco0 implements Serializable {

    private static final long serialVersionUID = 1L;
    private Registro0000 registro0000;
    private Registro0001 registro0001;
    private Registro0005 registro0005;
    private Registro0100 registro0100;
    private List<Registro0150> listaRegistro0150;
    private List<Registro0190> listaRegistro0190;
    private List<Registro0200> listaRegistro0200;

    private Registro0990 registro0990;
    private Integer numeroRegistro0175;
    private Integer numeroRegistro0205;
    private Integer numeroRegistro0220;

    private SpedUtil u;

    public Bloco0(SpedUtil spedUtil) {
        registro0000 = new Registro0000();
        registro0001 = new Registro0001();
        registro0001.setIndMov(1);
        registro0005 = new Registro0005();
        registro0100 = new Registro0100();
        listaRegistro0150 = new ArrayList<>();
        listaRegistro0190 = new ArrayList<>();
        listaRegistro0200 = new ArrayList<>();

        registro0990 = new Registro0990();
        registro0990.setQtdLin0(0);

        numeroRegistro0175 = 0;
        numeroRegistro0205 = 0;
        numeroRegistro0220 = 0;

        this.u = spedUtil;
    }

    public String gravaRegistro0000() {
        registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);

        return u.preenche("0000")
                + u.preenche(registro0000.getCodVer())
                + u.preenche(registro0000.getCodFin())
                + u.preenche(registro0000.getDtIni())
                + u.preenche(registro0000.getDtFin())
                + u.preenche(registro0000.getNome())
                + u.preenche(registro0000.getCnpj())
                + u.preenche(registro0000.getCpf())
                + u.preenche(registro0000.getUf())
                + u.preenche(registro0000.getIe())
                + u.preenche(registro0000.getCodMun())
                + u.preenche(registro0000.getIm())
                + u.preenche(registro0000.getSuframa())
                + u.preenche(registro0000.getIndPerfil())
                + u.preenche(registro0000.getIndAtiv())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistro0001() {
        registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);

        return u.preenche("0001")
                + u.preenche(registro0001.getIndMov())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistro0005() {
        registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);

        return u.preenche("0005")
                + u.preenche(registro0005.getFantasia())
                + u.preenche(registro0005.getCep())
                + u.preenche(registro0005.getEndereco())
                + u.preenche(registro0005.getNum())
                + u.preenche(registro0005.getCompl())
                + u.preenche(registro0005.getBairro())
                + u.preenche(registro0005.getFone())
                + u.preenche(registro0005.getFax())
                + u.preenche(registro0005.getEmail())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistro0100() {
        registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);

        return u.preenche("0100")
                + u.preenche(registro0100.getNome())
                + u.preenche(registro0100.getCpf())
                + u.preenche(registro0100.getCrc())
                + u.preenche(registro0100.getCnpj())
                + u.preenche(registro0100.getCep())
                + u.preenche(registro0100.getEndereco())
                + u.preenche(registro0100.getNum())
                + u.preenche(registro0100.getCompl())
                + u.preenche(registro0100.getBairro())
                + u.preenche(registro0100.getFone())
                + u.preenche(registro0100.getFax())
                + u.preenche(registro0100.getEmail())
                + u.preenche(registro0100.getCodMun())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistro0150() {
        String registro = "";
        for (int i = 0; i < listaRegistro0150.size(); i++) {
            registro += u.preenche("0150")
                    + u.preenche(listaRegistro0150.get(i).getCodPart())
                    + u.preenche(listaRegistro0150.get(i).getNome())
                    + u.preenche(listaRegistro0150.get(i).getCodPais())
                    + u.preenche(listaRegistro0150.get(i).getCnpj())
                    + u.preenche(listaRegistro0150.get(i).getCpf())
                    + u.preenche(listaRegistro0150.get(i).getIe())
                    + u.preenche(listaRegistro0150.get(i).getCodMun())
                    + u.preenche(listaRegistro0150.get(i).getSuframa())
                    + u.preenche(listaRegistro0150.get(i).getEndereco())
                    + u.preenche(listaRegistro0150.get(i).getNum())
                    + u.preenche(listaRegistro0150.get(i).getCompl())
                    + u.preenche(listaRegistro0150.get(i).getBairro())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
            registro += gravaRegistro0175(listaRegistro0150.get(i).getRegistro0175List());
        }
        return registro;
    }

    private String gravaRegistro0175(List<Registro0175> listaRegistro0175) {
        String registro = "";
        for (int i = 0; i < listaRegistro0175.size(); i++) {
            registro += u.preenche("0175")
                    + u.preenche(listaRegistro0175.get(i).getDtAlt())
                    + u.preenche(listaRegistro0175.get(i).getNrCampo())
                    + u.preenche(listaRegistro0175.get(i).getContAnt())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
            numeroRegistro0175 += 1;
        }
        return registro;
    }

    public String gravaRegistro0190() {
        String registro = "";
        for (int i = 0; i < listaRegistro0190.size(); i++) {
            registro += u.preenche("0190")
                    + u.preenche(listaRegistro0190.get(i).getUnid())
                    + u.preenche(listaRegistro0190.get(i).getDescr())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
        }
        return registro;
    }

    public String gravaRegistro0200() {
        String registro = "";
        for (int i = 0; i < listaRegistro0200.size(); i++) {
            registro += u.preenche("0200")
                    + u.preenche(listaRegistro0200.get(i).getCodItem())
                    + u.preenche(listaRegistro0200.get(i).getDescrItem())
                    + u.preenche(listaRegistro0200.get(i).getCodBarra())
                    + u.preenche(listaRegistro0200.get(i).getCodAntItem())
                    + u.preenche(listaRegistro0200.get(i).getUnidInv())
                    + u.preenche(listaRegistro0200.get(i).getTipoItem())
                    + u.preenche(listaRegistro0200.get(i).getCodNcm())
                    + u.preenche(listaRegistro0200.get(i).getExIpi())
                    + u.preenche(listaRegistro0200.get(i).getCodGen())
                    + u.preenche(listaRegistro0200.get(i).getCodLst())
                    + u.preenche(listaRegistro0200.get(i).getAliqIcms())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
            registro += gravaRegistro0205(listaRegistro0200.get(i).getRegistro0205List());
            registro += gravaRegistro0220(listaRegistro0200.get(i).getRegistro0220List());
        }
        return registro;
    }

    private String gravaRegistro0205(List<Registro0205> listaRegistro0205) {
        String registro = "";
        for (int i = 0; i < listaRegistro0205.size(); i++) {
            registro += u.preenche("0205")
                    + u.preenche(listaRegistro0205.get(i).getDescrAntItem())
                    + u.preenche(listaRegistro0205.get(i).getDtIni())
                    + u.preenche(listaRegistro0205.get(i).getDtFin())
                    + u.preenche(listaRegistro0205.get(i).getCodAntItem())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
            numeroRegistro0205 += 1;
        }
        return registro;
    }

    private String gravaRegistro0220(List<Registro0220> listaRegistro0220) {
        String registro = "";
        for (int i = 0; i < listaRegistro0220.size(); i++) {
            registro += u.preenche("0220")
                    + u.preenche(listaRegistro0220.get(i).getUnidConv())
                    + u.preenche(listaRegistro0220.get(i).getFatConv())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);
            numeroRegistro0220 += 1;
        }
        return registro;
    }

    public String gravaRegistro0990() {
        registro0990.setQtdLin0(registro0990.getQtdLin0() + 1);

        return u.preenche("0990")
                + u.preenche(registro0990.getQtdLin0())
                + u.getDelimitador()
                + u.getCrlf();
    }

    /**
     * @return the registro0000
     */
    public Registro0000 getRegistro0000() {
        return registro0000;
    }

    /**
     * @return the registro0001
     */
    public Registro0001 getRegistro0001() {
        return registro0001;
    }

    /**
     * @return the registro0005
     */
    public Registro0005 getRegistro0005() {
        return registro0005;
    }

    /**
     * @return the registro0100
     */
    public Registro0100 getRegistro0100() {
        return registro0100;
    }

    /**
     * @return the listaRegistro0150
     */
    public List<Registro0150> getListaRegistro0150() {
        return listaRegistro0150;
    }

    /**
     * @return the listaRegistro0190
     */
    public List<Registro0190> getListaRegistro0190() {
        return listaRegistro0190;
    }

    /**
     * @return the listaRegistro0200
     */
    public List<Registro0200> getListaRegistro0200() {
        return listaRegistro0200;
    }

    /**
     * @return the registro0990
     */
    public Registro0990 getRegistro0990() {
        return registro0990;
    }

    /**
     * @return the numeroRegistro0175
     */
    public Integer getNumeroRegistro0175() {
        return numeroRegistro0175;
    }

    /**
     * @return the numeroRegistro0205
     */
    public Integer getNumeroRegistro0205() {
        return numeroRegistro0205;
    }

    /**
     * @return the numeroRegistro0220
     */
    public Integer getNumeroRegistro0220() {
        return numeroRegistro0220;
    }

}
