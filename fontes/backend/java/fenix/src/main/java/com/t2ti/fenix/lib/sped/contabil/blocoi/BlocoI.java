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

import com.t2ti.fenix.lib.sped.SpedUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BlocoI implements Serializable {

    private static final long serialVersionUID = 1L;
    private RegistroI001 registroI001;
    private RegistroI010 registroI010;
    private List<RegistroI012> listaRegistroI012;
    private List<RegistroI020> listaRegistroI020;
    private RegistroI030 registroI030;
    private List<RegistroI050> listaRegistroI050;
    private List<RegistroI075> listaRegistroI075;
    private List<RegistroI100> listaRegistroI100;
    private List<RegistroI150> listaRegistroI150;
    private List<RegistroI200> listaRegistroI200;
    private List<RegistroI300> listaRegistroI300;
    private List<RegistroI350> listaRegistroI350;
    private List<RegistroI500> listaRegistroI500;
    private List<RegistroI510> listaRegistroI510;
    private List<RegistroI550> listaRegistroI550;
    private RegistroI990 registroI990;
    private Integer numeroRegistrosI015;
    private Integer numeroRegistrosI051;
    private Integer numeroRegistrosI052;
    private Integer numeroRegistrosI151;
    private Integer numeroRegistrosI155;
    private Integer numeroRegistrosI250;
    private Integer numeroRegistrosI310;
    private Integer numeroRegistrosI355;
    private Integer numeroRegistrosI555;
    private SpedUtil u;

    public BlocoI(SpedUtil spedUtil) {
        registroI001 = new RegistroI001();
        registroI001.setIndDad(1);
        registroI010 = new RegistroI010();
        listaRegistroI012 = new ArrayList<RegistroI012>();
        listaRegistroI020 = new ArrayList<RegistroI020>();
        registroI030 = new RegistroI030();
        listaRegistroI050 = new ArrayList<RegistroI050>();
        listaRegistroI075 = new ArrayList<RegistroI075>();
        listaRegistroI100 = new ArrayList<RegistroI100>();
        listaRegistroI150 = new ArrayList<RegistroI150>();
        listaRegistroI200 = new ArrayList<RegistroI200>();
        listaRegistroI300 = new ArrayList<RegistroI300>();
        listaRegistroI350 = new ArrayList<RegistroI350>();
        listaRegistroI500 = new ArrayList<RegistroI500>();
        listaRegistroI510 = new ArrayList<RegistroI510>();
        listaRegistroI550 = new ArrayList<RegistroI550>();

        registroI990 = new RegistroI990();
        registroI990.setQtdLinI(0);

        numeroRegistrosI015 = 0;
        numeroRegistrosI051 = 0;
        numeroRegistrosI052 = 0;
        numeroRegistrosI151 = 0;
        numeroRegistrosI155 = 0;
        numeroRegistrosI250 = 0;
        numeroRegistrosI310 = 0;
        numeroRegistrosI355 = 0;
        numeroRegistrosI555 = 0;

        this.u = spedUtil;
    }

    public void limpaRegistros() {
        listaRegistroI012.clear();
        listaRegistroI020.clear();
        listaRegistroI050.clear();
        listaRegistroI075.clear();
        listaRegistroI100.clear();
        listaRegistroI150.clear();
        listaRegistroI200.clear();
        listaRegistroI300.clear();
        listaRegistroI350.clear();
        listaRegistroI500.clear();
        listaRegistroI510.clear();
        listaRegistroI550.clear();

        registroI990.setQtdLinI(0);

        numeroRegistrosI015 = 0;
        numeroRegistrosI051 = 0;
        numeroRegistrosI052 = 0;
        numeroRegistrosI151 = 0;
        numeroRegistrosI155 = 0;
        numeroRegistrosI250 = 0;
        numeroRegistrosI310 = 0;
        numeroRegistrosI355 = 0;
        numeroRegistrosI555 = 0;
    }

    public String gravaRegistroI001() {
        registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);

        return u.preenche("I001")
                + u.preenche(registroI001.getIndDad())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistroI010() {
        registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);

        return u.preenche("I010")
                + u.preenche(registroI010.getIndEsc())
                + u.preenche(registroI010.getCodVerLc())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistroI012() {
        String registro = "";
        for (int i = 0; i < listaRegistroI012.size(); i++) {
            registro += u.preenche("I012")
                    + u.preenche(listaRegistroI012.get(i).getNumOrd())
                    + u.preenche(listaRegistroI012.get(i).getNatLivr())
                    + u.preenche(listaRegistroI012.get(i).getTipo())
                    + u.preenche(listaRegistroI012.get(i).getCodHashAux())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro += gravaRegistroI015(listaRegistroI012.get(i).getRegistroI015List());

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }

        return registro;
    }

    private String gravaRegistroI015(List<RegistroI015> listaRegistroI015) {
        String registro = "";
        for (int i = 0; i < listaRegistroI015.size(); i++) {
            registro += u.preenche("I015")
                    + u.preenche(listaRegistroI015.get(i).getCodCtaRes())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
            numeroRegistrosI015 += 1;
        }
        return registro;
    }

    public String gravaRegistroI020() {
        String registro = "";
        for (int i = 0; i < listaRegistroI020.size(); i++) {
            registro += u.preenche("I020")
                    + u.preenche(listaRegistroI020.get(i).getRegCod())
                    + u.preenche(listaRegistroI020.get(i).getNumAd())
                    + u.preenche(listaRegistroI020.get(i).getCampo())
                    + u.preenche(listaRegistroI020.get(i).getDescricao())
                    + u.preenche(listaRegistroI020.get(i).getTipoDado())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }

        return registro;
    }

    public String gravaRegistroI030() {
        registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);

        return u.preenche("I030")
                + u.preenche("TERMO DE ABERTURA")
                + u.preenche(registroI030.getNumOrd())
                + u.preenche(registroI030.getNatLivr())
                + u.preenche(registroI030.getQtdLin())
                + u.preenche(registroI030.getNome())
                + u.preenche(registroI030.getNire())
                + u.preenche(registroI030.getCnpj())
                + u.preenche(registroI030.getDtArq())
                + u.preenche(registroI030.getDtArqConv())
                + u.preenche(registroI030.getDescMun())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistroI050() {
        String registro = "";
        for (int i = 0; i < listaRegistroI050.size(); i++) {
            registro += u.preenche("I050")
                    + u.preenche(listaRegistroI050.get(i).getDtAlt())
                    + u.preenche(listaRegistroI050.get(i).getCodNat())
                    + u.preenche(listaRegistroI050.get(i).getIndCta())
                    + u.preenche(listaRegistroI050.get(i).getNivel())
                    + u.preenche(listaRegistroI050.get(i).getCodCta())
                    + u.preenche(listaRegistroI050.get(i).getCodCtaSup())
                    + u.preenche(listaRegistroI050.get(i).getCta())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro += gravaRegistroI051(listaRegistroI050.get(i).getRegistroi051List());
            registro += gravaRegistroI052(listaRegistroI050.get(i).getRegistroi052List());

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }

        return registro;
    }

    private String gravaRegistroI051(List<RegistroI051> listaRegistroI051) {
        String registro = "";
        for (int i = 0; i < listaRegistroI051.size(); i++) {
            registro += u.preenche("I051")
                    + u.preenche(listaRegistroI051.get(i).getCodEntRef())
                    + u.preenche(listaRegistroI051.get(i).getCodCcus())
                    + u.preenche(listaRegistroI051.get(i).getCodCtaRef())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
            numeroRegistrosI051 += 1;
        }
        return registro;
    }

    private String gravaRegistroI052(List<RegistroI052> listaRegistroI052) {
        String registro = "";
        for (int i = 0; i < listaRegistroI052.size(); i++) {
            registro += u.preenche("I052")
                    + u.preenche(listaRegistroI052.get(i).getCodCcus())
                    + u.preenche(listaRegistroI052.get(i).getCodAgl())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
            numeroRegistrosI052 += 1;
        }
        return registro;
    }

    public String gravaRegistroI075() {
        String registro = "";
        for (int i = 0; i < listaRegistroI075.size(); i++) {
            registro += u.preenche("I075")
                    + u.preenche(listaRegistroI075.get(i).getCodHist())
                    + u.preenche(listaRegistroI075.get(i).getDescrHist())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }
        return registro;
    }

    public String gravaRegistroI100() {
        String registro = "";
        for (int i = 0; i < listaRegistroI100.size(); i++) {
            registro += u.preenche("I100")
                    + u.preenche(listaRegistroI100.get(i).getDtAlt())
                    + u.preenche(listaRegistroI100.get(i).getCodCcus())
                    + u.preenche(listaRegistroI100.get(i).getCcus())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }
        return registro;
    }

    public String gravaRegistroI150() {
        String registro = "";
        for (int i = 0; i < listaRegistroI150.size(); i++) {
            registro += u.preenche("I150")
                    + u.preenche(listaRegistroI150.get(i).getDtIni())
                    + u.preenche(listaRegistroI150.get(i).getDtFin())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro += gravaRegistroI151(listaRegistroI150.get(i).getRegistroi151List());
            registro += gravaRegistroI155(listaRegistroI150.get(i).getRegistroi155List());

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }

        return registro;
    }

    private String gravaRegistroI151(List<RegistroI151> listaRegistroI151) {
        String registro = "";
        for (int i = 0; i < listaRegistroI151.size(); i++) {
            registro += u.preenche("I151")
                    + u.preenche(listaRegistroI151.get(i).getAssinDig())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
            numeroRegistrosI151 += 1;
        }
        return registro;
    }

    private String gravaRegistroI155(List<RegistroI155> listaRegistroI155) {
        String registro = "";
        for (int i = 0; i < listaRegistroI155.size(); i++) {
            registro += u.preenche("I155")
                    + u.preenche(listaRegistroI155.get(i).getCodCta())
                    + u.preenche(listaRegistroI155.get(i).getCodCcus())
                    + u.preenche(listaRegistroI155.get(i).getVlSldIni())
                    + u.preenche(listaRegistroI155.get(i).getIndDcIni())
                    + u.preenche(listaRegistroI155.get(i).getVlDeb())
                    + u.preenche(listaRegistroI155.get(i).getVlCred())
                    + u.preenche(listaRegistroI155.get(i).getVlSldFin())
                    + u.preenche(listaRegistroI155.get(i).getIndDcFin())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
            numeroRegistrosI155 += 1;
        }
        return registro;
    }

    public String gravaRegistroI200() {
        String registro = "";
        for (int i = 0; i < listaRegistroI200.size(); i++) {
            registro += u.preenche("I200")
                    + u.preenche(listaRegistroI200.get(i).getNumLcto())
                    + u.preenche(listaRegistroI200.get(i).getDtLcto())
                    + u.preenche(listaRegistroI200.get(i).getVlLcto())
                    + u.preenche(listaRegistroI200.get(i).getIndLcto())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro += gravaRegistroI250(listaRegistroI200.get(i).getRegistroi250List());

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }

        return registro;
    }

    private String gravaRegistroI250(List<RegistroI250> listaRegistroI250) {
        String registro = "";
        for (int i = 0; i < listaRegistroI250.size(); i++) {
            registro += u.preenche("I250")
                    + u.preenche(listaRegistroI250.get(i).getCodCta())
                    + u.preenche(listaRegistroI250.get(i).getCodCcus())
                    + u.preenche(listaRegistroI250.get(i).getVlDc())
                    + u.preenche(listaRegistroI250.get(i).getIndDc())
                    + u.preenche(listaRegistroI250.get(i).getNumArq())
                    + u.preenche(listaRegistroI250.get(i).getCodHistPad())
                    + u.preenche(listaRegistroI250.get(i).getHist())
                    + u.preenche(listaRegistroI250.get(i).getCodPart())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
            numeroRegistrosI250 += 1;
        }
        return registro;
    }

    public String gravaRegistroI300() {
        String registro = "";
        for (int i = 0; i < listaRegistroI300.size(); i++) {
            registro += u.preenche("I300")
                    + u.preenche(listaRegistroI300.get(i).getDtBcte())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro += gravaRegistroI310(listaRegistroI300.get(i).getRegistroi310List());

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }

        return registro;
    }

    private String gravaRegistroI310(List<RegistroI310> listaRegistroI310) {
        String registro = "";
        for (int i = 0; i < listaRegistroI310.size(); i++) {
            registro += u.preenche("I310")
                    + u.preenche(listaRegistroI310.get(i).getCodCta())
                    + u.preenche(listaRegistroI310.get(i).getCodCcus())
                    + u.preenche(listaRegistroI310.get(i).getValDebd())
                    + u.preenche(listaRegistroI310.get(i).getValCred())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
            numeroRegistrosI310 += 1;
        }
        return registro;
    }

    public String gravaRegistroI350() {
        String registro = "";
        for (int i = 0; i < listaRegistroI350.size(); i++) {
            registro += u.preenche("I350")
                    + u.preenche(listaRegistroI350.get(i).getDtRes())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro += gravaRegistroI355(listaRegistroI350.get(i).getRegistroi355List());

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }

        return registro;
    }

    private String gravaRegistroI355(List<RegistroI355> listaRegistroI355) {
        String registro = "";
        for (int i = 0; i < listaRegistroI355.size(); i++) {
            registro += u.preenche("I355")
                    + u.preenche(listaRegistroI355.get(i).getCodCta())
                    + u.preenche(listaRegistroI355.get(i).getCodCcus())
                    + u.preenche(listaRegistroI355.get(i).getVlCta())
                    + u.preenche(listaRegistroI355.get(i).getIndDc())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
            numeroRegistrosI355 += 1;
        }
        return registro;
    }

    public String gravaRegistroI500() {
        String registro = "";
        for (int i = 0; i < listaRegistroI500.size(); i++) {
            registro += u.preenche("I500")
                    + u.preenche(listaRegistroI500.get(i).getTamFonte())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }
        return registro;
    }

    public String gravaRegistroI510() {
        String registro = "";
        for (int i = 0; i < listaRegistroI510.size(); i++) {
            registro += u.preenche("I510")
                    + u.preenche(listaRegistroI510.get(i).getNmCampo())
                    + u.preenche(listaRegistroI510.get(i).getDescCampo())
                    + u.preenche(listaRegistroI510.get(i).getTipoCampo())
                    + u.preenche(listaRegistroI510.get(i).getTamCampo())
                    + u.preenche(listaRegistroI510.get(i).getDecCampo())
                    + u.preenche(listaRegistroI510.get(i).getColCampo())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }
        return registro;
    }

    public String gravaRegistroI550() {
        String registro = "";
        for (int i = 0; i < listaRegistroI550.size(); i++) {
            registro += u.preenche("I550")
                    + u.preenche(listaRegistroI550.get(i).getRzCont())
                    + u.getDelimitador()
                    + u.getCrlf();

            registro += gravaRegistroI555(listaRegistroI550.get(i).getRegistroi555List());

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
        }

        return registro;
    }

    private String gravaRegistroI555(List<RegistroI555> listaRegistroI555) {
        String registro = "";
        for (int i = 0; i < listaRegistroI555.size(); i++) {
            registro += u.preenche("I555")
                    + u.preenche(listaRegistroI555.get(i).getRzContTot())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);
            numeroRegistrosI555 += 1;
        }
        return registro;
    }

    public String gravaRegistroI990() {
        registroI990.setQtdLinI(registroI990.getQtdLinI() + 1);

        return u.preenche("I990")
                + u.preenche(registroI990.getQtdLinI())
                + u.getDelimitador()
                + u.getCrlf();
    }

    /**
     * @return the registroI001
     */
    public RegistroI001 getRegistroI001() {
        return registroI001;
    }

    /**
     * @param registroI001 the registroI001 to set
     */
    public void setRegistroI001(RegistroI001 registroI001) {
        this.registroI001 = registroI001;
    }

    /**
     * @return the registroI010
     */
    public RegistroI010 getRegistroI010() {
        return registroI010;
    }

    /**
     * @param registroI010 the registroI010 to set
     */
    public void setRegistroI010(RegistroI010 registroI010) {
        this.registroI010 = registroI010;
    }

    /**
     * @return the listaRegistroI012
     */
    public List<RegistroI012> getListaRegistroI012() {
        return listaRegistroI012;
    }

    /**
     * @param listaRegistroI012 the listaRegistroI012 to set
     */
    public void setListaRegistroI012(List<RegistroI012> listaRegistroI012) {
        this.listaRegistroI012 = listaRegistroI012;
    }

    /**
     * @return the listaRegistroI020
     */
    public List<RegistroI020> getListaRegistroI020() {
        return listaRegistroI020;
    }

    /**
     * @param listaRegistroI020 the listaRegistroI020 to set
     */
    public void setListaRegistroI020(List<RegistroI020> listaRegistroI020) {
        this.listaRegistroI020 = listaRegistroI020;
    }

    /**
     * @return the registroI030
     */
    public RegistroI030 getRegistroI030() {
        return registroI030;
    }

    /**
     * @param registroI030 the registroI030 to set
     */
    public void setRegistroI030(RegistroI030 registroI030) {
        this.registroI030 = registroI030;
    }

    /**
     * @return the listaRegistroI050
     */
    public List<RegistroI050> getListaRegistroI050() {
        return listaRegistroI050;
    }

    /**
     * @param listaRegistroI050 the listaRegistroI050 to set
     */
    public void setListaRegistroI050(List<RegistroI050> listaRegistroI050) {
        this.listaRegistroI050 = listaRegistroI050;
    }

    /**
     * @return the listaRegistroI075
     */
    public List<RegistroI075> getListaRegistroI075() {
        return listaRegistroI075;
    }

    /**
     * @param listaRegistroI075 the listaRegistroI075 to set
     */
    public void setListaRegistroI075(List<RegistroI075> listaRegistroI075) {
        this.listaRegistroI075 = listaRegistroI075;
    }

    /**
     * @return the listaRegistroI100
     */
    public List<RegistroI100> getListaRegistroI100() {
        return listaRegistroI100;
    }

    /**
     * @param listaRegistroI100 the listaRegistroI100 to set
     */
    public void setListaRegistroI100(List<RegistroI100> listaRegistroI100) {
        this.listaRegistroI100 = listaRegistroI100;
    }

    /**
     * @return the listaRegistroI150
     */
    public List<RegistroI150> getListaRegistroI150() {
        return listaRegistroI150;
    }

    /**
     * @param listaRegistroI150 the listaRegistroI150 to set
     */
    public void setListaRegistroI150(List<RegistroI150> listaRegistroI150) {
        this.listaRegistroI150 = listaRegistroI150;
    }

    /**
     * @return the listaRegistroI200
     */
    public List<RegistroI200> getListaRegistroI200() {
        return listaRegistroI200;
    }

    /**
     * @param listaRegistroI200 the listaRegistroI200 to set
     */
    public void setListaRegistroI200(List<RegistroI200> listaRegistroI200) {
        this.listaRegistroI200 = listaRegistroI200;
    }

    /**
     * @return the listaRegistroI300
     */
    public List<RegistroI300> getListaRegistroI300() {
        return listaRegistroI300;
    }

    /**
     * @param listaRegistroI300 the listaRegistroI300 to set
     */
    public void setListaRegistroI300(List<RegistroI300> listaRegistroI300) {
        this.listaRegistroI300 = listaRegistroI300;
    }

    /**
     * @return the listaRegistroI350
     */
    public List<RegistroI350> getListaRegistroI350() {
        return listaRegistroI350;
    }

    /**
     * @param listaRegistroI350 the listaRegistroI350 to set
     */
    public void setListaRegistroI350(List<RegistroI350> listaRegistroI350) {
        this.listaRegistroI350 = listaRegistroI350;
    }

    /**
     * @return the listaRegistroI500
     */
    public List<RegistroI500> getListaRegistroI500() {
        return listaRegistroI500;
    }

    /**
     * @param listaRegistroI500 the listaRegistroI500 to set
     */
    public void setListaRegistroI500(List<RegistroI500> listaRegistroI500) {
        this.listaRegistroI500 = listaRegistroI500;
    }

    /**
     * @return the listaRegistroI510
     */
    public List<RegistroI510> getListaRegistroI510() {
        return listaRegistroI510;
    }

    /**
     * @param listaRegistroI510 the listaRegistroI510 to set
     */
    public void setListaRegistroI510(List<RegistroI510> listaRegistroI510) {
        this.listaRegistroI510 = listaRegistroI510;
    }

    /**
     * @return the listaRegistroI550
     */
    public List<RegistroI550> getListaRegistroI550() {
        return listaRegistroI550;
    }

    /**
     * @param listaRegistroI550 the listaRegistroI550 to set
     */
    public void setListaRegistroI550(List<RegistroI550> listaRegistroI550) {
        this.listaRegistroI550 = listaRegistroI550;
    }

    /**
     * @return the registroI990
     */
    public RegistroI990 getRegistroI990() {
        return registroI990;
    }

    /**
     * @param registroI990 the registroI990 to set
     */
    public void setRegistroI990(RegistroI990 registroI990) {
        this.registroI990 = registroI990;
    }

    /**
     * @return the numeroRegistrosI015
     */
    public Integer getNumeroRegistrosI015() {
        return numeroRegistrosI015;
    }

    /**
     * @param numeroRegistrosI015 the numeroRegistrosI015 to set
     */
    public void setNumeroRegistrosI015(Integer numeroRegistrosI015) {
        this.numeroRegistrosI015 = numeroRegistrosI015;
    }

    /**
     * @return the numeroRegistrosI051
     */
    public Integer getNumeroRegistrosI051() {
        return numeroRegistrosI051;
    }

    /**
     * @param numeroRegistrosI051 the numeroRegistrosI051 to set
     */
    public void setNumeroRegistrosI051(Integer numeroRegistrosI051) {
        this.numeroRegistrosI051 = numeroRegistrosI051;
    }

    /**
     * @return the numeroRegistrosI052
     */
    public Integer getNumeroRegistrosI052() {
        return numeroRegistrosI052;
    }

    /**
     * @param numeroRegistrosI052 the numeroRegistrosI052 to set
     */
    public void setNumeroRegistrosI052(Integer numeroRegistrosI052) {
        this.numeroRegistrosI052 = numeroRegistrosI052;
    }

    /**
     * @return the numeroRegistrosI151
     */
    public Integer getNumeroRegistrosI151() {
        return numeroRegistrosI151;
    }

    /**
     * @param numeroRegistrosI151 the numeroRegistrosI151 to set
     */
    public void setNumeroRegistrosI151(Integer numeroRegistrosI151) {
        this.numeroRegistrosI151 = numeroRegistrosI151;
    }

    /**
     * @return the numeroRegistrosI155
     */
    public Integer getNumeroRegistrosI155() {
        return numeroRegistrosI155;
    }

    /**
     * @param numeroRegistrosI155 the numeroRegistrosI155 to set
     */
    public void setNumeroRegistrosI155(Integer numeroRegistrosI155) {
        this.numeroRegistrosI155 = numeroRegistrosI155;
    }

    /**
     * @return the numeroRegistrosI250
     */
    public Integer getNumeroRegistrosI250() {
        return numeroRegistrosI250;
    }

    /**
     * @param numeroRegistrosI250 the numeroRegistrosI250 to set
     */
    public void setNumeroRegistrosI250(Integer numeroRegistrosI250) {
        this.numeroRegistrosI250 = numeroRegistrosI250;
    }

    /**
     * @return the numeroRegistrosI310
     */
    public Integer getNumeroRegistrosI310() {
        return numeroRegistrosI310;
    }

    /**
     * @param numeroRegistrosI310 the numeroRegistrosI310 to set
     */
    public void setNumeroRegistrosI310(Integer numeroRegistrosI310) {
        this.numeroRegistrosI310 = numeroRegistrosI310;
    }

    /**
     * @return the numeroRegistrosI355
     */
    public Integer getNumeroRegistrosI355() {
        return numeroRegistrosI355;
    }

    /**
     * @param numeroRegistrosI355 the numeroRegistrosI355 to set
     */
    public void setNumeroRegistrosI355(Integer numeroRegistrosI355) {
        this.numeroRegistrosI355 = numeroRegistrosI355;
    }

    /**
     * @return the numeroRegistrosI555
     */
    public Integer getNumeroRegistrosI555() {
        return numeroRegistrosI555;
    }

    /**
     * @param numeroRegistrosI555 the numeroRegistrosI555 to set
     */
    public void setNumeroRegistrosI555(Integer numeroRegistrosI555) {
        this.numeroRegistrosI555 = numeroRegistrosI555;
    }
}
