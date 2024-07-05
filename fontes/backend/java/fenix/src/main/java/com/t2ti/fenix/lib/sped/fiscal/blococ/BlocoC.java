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
package com.t2ti.fenix.lib.sped.fiscal.blococ;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.t2ti.fenix.lib.sped.SpedUtil;

public class BlocoC implements Serializable {

    private static final long serialVersionUID = 1L;
    private RegistroC001 registroC001;
    private List<RegistroC100> listaRegistroC100;
    private List<RegistroC114> listaRegistroC114;
    private List<RegistroC300> listaRegistroC300;
    private List<RegistroC350> listaRegistroC350;
    private List<RegistroC400> listaRegistroC400;
    private List<RegistroC425> listaRegistroC425;
    private RegistroC990 registroC990;
    private Integer numeroRegistroC170;
    private Integer numeroRegistroC190;
    private Integer numeroRegistroC310;
    private Integer numeroRegistroC320;
    private Integer numeroRegistroC321;
    private Integer numeroRegistroC370;
    private Integer numeroRegistroC390;
    private Integer numeroRegistroC405;
    private Integer numeroRegistroC420;
    private Integer numeroRegistroC460;
    private Integer numeroRegistroC470;
    private Integer numeroRegistroC490;
    private SpedUtil u;

    public BlocoC(SpedUtil spedUtil) {
        registroC001 = new RegistroC001();
        registroC001.setIndMov(1);

        listaRegistroC100 = new ArrayList<RegistroC100>();
        listaRegistroC114 = new ArrayList<RegistroC114>();
        listaRegistroC300 = new ArrayList<RegistroC300>();
        listaRegistroC350 = new ArrayList<RegistroC350>();
        listaRegistroC400 = new ArrayList<RegistroC400>();
        listaRegistroC425 = new ArrayList<RegistroC425>();

        registroC990 = new RegistroC990();
        registroC990.setQtdLinC(0);

        numeroRegistroC170 = 0;
        numeroRegistroC190 = 0;
        numeroRegistroC310 = 0;
        numeroRegistroC320 = 0;
        numeroRegistroC321 = 0;
        numeroRegistroC370 = 0;
        numeroRegistroC390 = 0;
        numeroRegistroC405 = 0;
        numeroRegistroC420 = 0;
        numeroRegistroC460 = 0;
        numeroRegistroC470 = 0;
        numeroRegistroC490 = 0;

        this.u = spedUtil;
    }

    public String gravaRegistroC001() {
        registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);

        return u.preenche("C001")
                + u.preenche(registroC001.getIndMov())
                + u.getDelimitador()
                + u.getCrlf();
    }

    public String gravaRegistroC100() {
        String registro = "";
        for (int i = 0; i < listaRegistroC100.size(); i++) {
            registro += u.preenche("C100")
                    + u.preenche(listaRegistroC100.get(i).getIndOper())
                    + u.preenche(listaRegistroC100.get(i).getIndEmit())
                    + u.preenche(listaRegistroC100.get(i).getCodPart())
                    + u.preenche(listaRegistroC100.get(i).getCodMod())
                    + u.preenche(listaRegistroC100.get(i).getCodSit())
                    + u.preenche(listaRegistroC100.get(i).getSer())
                    + u.preenche(listaRegistroC100.get(i).getNumDoc())
                    + u.preenche(listaRegistroC100.get(i).getChvNfe())
                    + u.preenche(listaRegistroC100.get(i).getDtDoc())
                    + u.preenche(listaRegistroC100.get(i).getDtES())
                    + u.preenche(listaRegistroC100.get(i).getVlDoc())
                    + u.preenche(listaRegistroC100.get(i).getIndPgto())
                    + u.preenche(listaRegistroC100.get(i).getVlDesc())
                    + u.preenche(listaRegistroC100.get(i).getVlAbatNt())
                    + u.preenche(listaRegistroC100.get(i).getVlMerc())
                    + u.preenche(listaRegistroC100.get(i).getIndFrt())
                    + u.preenche(listaRegistroC100.get(i).getVlFrt())
                    + u.preenche(listaRegistroC100.get(i).getVlSeg())
                    + u.preenche(listaRegistroC100.get(i).getVlOutDa())
                    + u.preenche(listaRegistroC100.get(i).getVlBcIcms())
                    + u.preenche(listaRegistroC100.get(i).getVlIcms())
                    + u.preenche(listaRegistroC100.get(i).getVlBcIcmsSt())
                    + u.preenche(listaRegistroC100.get(i).getVlIcmsSt())
                    + u.preenche(listaRegistroC100.get(i).getVlIpi())
                    + u.preenche(listaRegistroC100.get(i).getVlPis())
                    + u.preenche(listaRegistroC100.get(i).getVlCofins())
                    + u.preenche(listaRegistroC100.get(i).getVlPisSt())
                    + u.preenche(listaRegistroC100.get(i).getVlCofinsSt())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            registro += gravaRegistroC170(listaRegistroC100.get(i).getRegistroC170List());
            registro += gravaRegistroC190(listaRegistroC100.get(i).getRegistroC190List());
        }
        return registro;
    }

    public String gravaRegistroC114() {
        String registro = "";
        for (int i = 0; i < listaRegistroC114.size(); i++) {
            registro += u.preenche("C114")
                    + u.preenche(listaRegistroC114.get(i).getCodMod())
                    + u.preenche(listaRegistroC114.get(i).getEcfFab())
                    + u.preenche(listaRegistroC114.get(i).getEcfCx())
                    + u.preenche(listaRegistroC114.get(i).getNumDoc())
                    + u.preenche(listaRegistroC114.get(i).getDtDoc())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
        }
        return registro;
    }

    private String gravaRegistroC170(List<RegistroC170> listaRegistroC170) {
        String registro = "";
        for (int i = 0; i < listaRegistroC170.size(); i++) {
            registro += u.preenche("C170")
                    + u.preenche(listaRegistroC170.get(i).getNumItem())
                    + u.preenche(listaRegistroC170.get(i).getCodItem())
                    + u.preenche(listaRegistroC170.get(i).getDescrCompl())
                    + u.preenche(listaRegistroC170.get(i).getQtd())
                    + u.preenche(listaRegistroC170.get(i).getUnid())
                    + u.preenche(listaRegistroC170.get(i).getVlItem())
                    + u.preenche(listaRegistroC170.get(i).getVlDesc())
                    + u.preenche(listaRegistroC170.get(i).getIndMov())
                    + u.preenche(listaRegistroC170.get(i).getCstIcms())
                    + u.preenche(listaRegistroC170.get(i).getCfop())
                    + u.preenche(listaRegistroC170.get(i).getCodNat())
                    + u.preenche(listaRegistroC170.get(i).getVlBcIcms())
                    + u.preenche(listaRegistroC170.get(i).getAliqIcms())
                    + u.preenche(listaRegistroC170.get(i).getVlIcms())
                    + u.preenche(listaRegistroC170.get(i).getVlBcIcmsSt())
                    + u.preenche(listaRegistroC170.get(i).getAliqSt())
                    + u.preenche(listaRegistroC170.get(i).getVlIcmsSt())
                    + u.preenche(listaRegistroC170.get(i).getIndApur())
                    + u.preenche(listaRegistroC170.get(i).getCstIpi())
                    + u.preenche(listaRegistroC170.get(i).getCodEnq())
                    + u.preenche(listaRegistroC170.get(i).getVlBcIpi())
                    + u.preenche(listaRegistroC170.get(i).getAliqIpi())
                    + u.preenche(listaRegistroC170.get(i).getVlIpi())
                    + u.preenche(listaRegistroC170.get(i).getCstPis())
                    + u.preenche(listaRegistroC170.get(i).getVlBcPis())
                    + u.preenche(listaRegistroC170.get(i).getAliqPisPerc())
                    + u.preenche(listaRegistroC170.get(i).getQuantBcPis())
                    + u.preenche(listaRegistroC170.get(i).getAliqPisR())
                    + u.preenche(listaRegistroC170.get(i).getVlPis())
                    + u.preenche(listaRegistroC170.get(i).getCstCofins())
                    + u.preenche(listaRegistroC170.get(i).getVlBcCofins())
                    + u.preenche(listaRegistroC170.get(i).getAliqCofinsPerc())
                    + u.preenche(listaRegistroC170.get(i).getQuantBcCofins())
                    + u.preenche(listaRegistroC170.get(i).getAliqCofinsR())
                    + u.preenche(listaRegistroC170.get(i).getVlCofins())
                    + u.preenche(listaRegistroC170.get(i).getCodCta())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC170 += 1;
        }
        return registro;
    }

    private String gravaRegistroC190(List<RegistroC190> listaRegistroC190) {
        String registro = "";
        for (int i = 0; i < listaRegistroC190.size(); i++) {
            registro += u.preenche("C190")
                    + u.preenche(listaRegistroC190.get(i).getCstIcms())
                    + u.preenche(listaRegistroC190.get(i).getCfop())
                    + u.preenche(listaRegistroC190.get(i).getAliqIcms())
                    + u.preenche(listaRegistroC190.get(i).getVlOpr())
                    + u.preenche(listaRegistroC190.get(i).getVlBcIcms())
                    + u.preenche(listaRegistroC190.get(i).getVlIcms())
                    + u.preenche(listaRegistroC190.get(i).getVlBcIcmsSt())
                    + u.preenche(listaRegistroC190.get(i).getVlIcmsSt())
                    + u.preenche(listaRegistroC190.get(i).getVlRedBc())
                    + u.preenche(listaRegistroC190.get(i).getVlIpi())
                    + u.preenche(listaRegistroC190.get(i).getCodObs())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC190 += 1;
        }
        return registro;
    }

    public String gravaRegistroC300() {
        String registro = "";
        for (int i = 0; i < listaRegistroC300.size(); i++) {
            registro += u.preenche("C300")
                    + u.preenche(listaRegistroC300.get(i).getCodMod())
                    + u.preenche(listaRegistroC300.get(i).getSer())
                    + u.preenche(listaRegistroC300.get(i).getSub())
                    + u.preenche(listaRegistroC300.get(i).getNumDocIni())
                    + u.preenche(listaRegistroC300.get(i).getNumDocFin())
                    + u.preenche(listaRegistroC300.get(i).getDtDoc())
                    + u.preenche(listaRegistroC300.get(i).getVlDoc())
                    + u.preenche(listaRegistroC300.get(i).getVlPis())
                    + u.preenche(listaRegistroC300.get(i).getVlCofins())
                    + u.preenche(listaRegistroC300.get(i).getCodCta())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            registro += gravaRegistroC310(listaRegistroC300.get(i).getRegistroC310List());
            registro += gravaRegistroC320(listaRegistroC300.get(i).getRegistroC320List());
        }
        return registro;
    }

    private String gravaRegistroC310(List<RegistroC310> listaRegistroC310) {
        String registro = "";
        for (int i = 0; i < listaRegistroC310.size(); i++) {
            registro += u.preenche("C310")
                    + u.preenche(listaRegistroC310.get(i).getNumDocCanc())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC310 += 1;
        }
        return registro;
    }

    private String gravaRegistroC320(List<RegistroC320> listaRegistroC320) {
        String registro = "";
        for (int i = 0; i < listaRegistroC320.size(); i++) {
            registro += u.preenche("C320")
                    + u.preenche(listaRegistroC320.get(i).getCstIcms())
                    + u.preenche(listaRegistroC320.get(i).getCfop())
                    + u.preenche(listaRegistroC320.get(i).getAliqIcms())
                    + u.preenche(listaRegistroC320.get(i).getVlOpr())
                    + u.preenche(listaRegistroC320.get(i).getVlBcIcms())
                    + u.preenche(listaRegistroC320.get(i).getVlIcms())
                    + u.preenche(listaRegistroC320.get(i).getVlRedBc())
                    + u.preenche(listaRegistroC320.get(i).getCodObs())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC320 += 1;
            registro += gravaRegistroC321(listaRegistroC320.get(i).getRegistroC321List());
        }
        return registro;
    }

    private String gravaRegistroC321(List<RegistroC321> listaRegistroC321) {
        String registro = "";
        for (int i = 0; i < listaRegistroC321.size(); i++) {
            registro += u.preenche("C321")
                    + u.preenche(listaRegistroC321.get(i).getCodItem())
                    + u.preenche(listaRegistroC321.get(i).getQtd())
                    + u.preenche(listaRegistroC321.get(i).getUnid())
                    + u.preenche(listaRegistroC321.get(i).getVlItem())
                    + u.preenche(listaRegistroC321.get(i).getVlDesc())
                    + u.preenche(listaRegistroC321.get(i).getVlBcIcms())
                    + u.preenche(listaRegistroC321.get(i).getVlIcms())
                    + u.preenche(listaRegistroC321.get(i).getVlPis())
                    + u.preenche(listaRegistroC321.get(i).getVlCofins())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC321 += 1;
        }
        return registro;
    }

    public String gravaRegistroC350() {
        String registro = "";
        for (int i = 0; i < listaRegistroC350.size(); i++) {
            registro += u.preenche("C350")
                    + u.preenche(listaRegistroC350.get(i).getSer())
                    + u.preenche(listaRegistroC350.get(i).getSubSer())
                    + u.preenche(listaRegistroC350.get(i).getNumDoc())
                    + u.preenche(listaRegistroC350.get(i).getDtDoc())
                    + u.preenche(listaRegistroC350.get(i).getCnpjCpf())
                    + u.preenche(listaRegistroC350.get(i).getVlMerc())
                    + u.preenche(listaRegistroC350.get(i).getVlDoc())
                    + u.preenche(listaRegistroC350.get(i).getVlDesc())
                    + u.preenche(listaRegistroC350.get(i).getVlPis())
                    + u.preenche(listaRegistroC350.get(i).getCodCta())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            registro += gravaRegistroC370(listaRegistroC350.get(i).getRegistroC370List());
            registro += gravaRegistroC390(listaRegistroC350.get(i).getRegistroC390List());
        }
        return registro;
    }

    private String gravaRegistroC370(List<RegistroC370> listaRegistroC370) {
        String registro = "";
        for (int i = 0; i < listaRegistroC370.size(); i++) {
            registro += u.preenche("C370")
                    + u.preenche(listaRegistroC370.get(i).getNumItem())
                    + u.preenche(listaRegistroC370.get(i).getCodItem())
                    + u.preenche(listaRegistroC370.get(i).getQtd())
                    + u.preenche(listaRegistroC370.get(i).getUnid())
                    + u.preenche(listaRegistroC370.get(i).getVlItem())
                    + u.preenche(listaRegistroC370.get(i).getVlDesc())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC370 += 1;
        }
        return registro;
    }

    private String gravaRegistroC390(List<RegistroC390> listaRegistroC390) {
        String registro = "";
        for (int i = 0; i < listaRegistroC390.size(); i++) {
            registro += u.preenche("C390")
                    + u.preenche(listaRegistroC390.get(i).getCstIcms())
                    + u.preenche(listaRegistroC390.get(i).getCfop())
                    + u.preenche(listaRegistroC390.get(i).getAliqIcms())
                    + u.preenche(listaRegistroC390.get(i).getVlOpr())
                    + u.preenche(listaRegistroC390.get(i).getVlBcIcms())
                    + u.preenche(listaRegistroC390.get(i).getVlIcms())
                    + u.preenche(listaRegistroC390.get(i).getVlRedBc())
                    + u.preenche(listaRegistroC390.get(i).getCodObs())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC390 += 1;
        }
        return registro;
    }

    public String gravaRegistroC400() {
        String registro = "";
        for (int i = 0; i < listaRegistroC400.size(); i++) {
            registro += u.preenche("C400")
                    + u.preenche(listaRegistroC400.get(i).getCodMod())
                    + u.preenche(listaRegistroC400.get(i).getEcfMod())
                    + u.preenche(listaRegistroC400.get(i).getEcfFab())
                    + u.preenche(listaRegistroC400.get(i).getEcfCx())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            registro += gravaRegistroC405(listaRegistroC400.get(i).getRegistroC405List());
        }
        return registro;
    }

    private String gravaRegistroC405(List<RegistroC405> listaRegistroC405) {
        String registro = "";
        for (int i = 0; i < listaRegistroC405.size(); i++) {
            registro += u.preenche("C405")
                    + u.preenche(listaRegistroC405.get(i).getDtDoc())
                    + u.preenche(listaRegistroC405.get(i).getCro())
                    + u.preenche(listaRegistroC405.get(i).getCrz())
                    + u.preenche(listaRegistroC405.get(i).getNumCooFin())
                    + u.preenche(listaRegistroC405.get(i).getGtFin())
                    + u.preenche(listaRegistroC405.get(i).getVlBrt())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC405 += 1;
            registro += gravaRegistroC420(listaRegistroC405.get(i).getRegistroC420List());
            registro += gravaRegistroC460(listaRegistroC405.get(i).getRegistroC460List());
            registro += gravaRegistroC490(listaRegistroC405.get(i).getRegistroC490List());
        }
        return registro;
    }

    private String gravaRegistroC420(List<RegistroC420> listaRegistroC420) {
        String registro = "";
        for (int i = 0; i < listaRegistroC420.size(); i++) {
            registro += u.preenche("C420")
                    + u.preenche(listaRegistroC420.get(i).getCodTotPar())
                    + u.preenche(listaRegistroC420.get(i).getVlrAcumTot())
                    + u.preenche(listaRegistroC420.get(i).getNrTot())
                    + u.preenche(listaRegistroC420.get(i).getDescrNrTot())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC420 += 1;
        }
        return registro;
    }

    public String gravaRegistroC425() {
        String registro = "";
        for (int i = 0; i < listaRegistroC425.size(); i++) {
            registro += u.preenche("C425")
                    + u.preenche(listaRegistroC425.get(i).getCodItem())
                    + u.preenche(listaRegistroC425.get(i).getQtd())
                    + u.preenche(listaRegistroC425.get(i).getUnid())
                    + u.preenche(listaRegistroC425.get(i).getVlItem())
                    + u.preenche(listaRegistroC425.get(i).getVlPis())
                    + u.preenche(listaRegistroC425.get(i).getVlCofins())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
        }
        return registro;
    }

    private String gravaRegistroC460(List<RegistroC460> listaRegistroC460) {
        String registro = "";
        for (int i = 0; i < listaRegistroC460.size(); i++) {
            registro += u.preenche("C460")
                    + u.preenche(listaRegistroC460.get(i).getCodMod())
                    + u.preenche(listaRegistroC460.get(i).getCodSit())
                    + u.preenche(listaRegistroC460.get(i).getNumDoc())
                    + u.preenche(listaRegistroC460.get(i).getDtDoc())
                    + u.preenche(listaRegistroC460.get(i).getVlDoc())
                    + u.preenche(listaRegistroC460.get(i).getVlPis())
                    + u.preenche(listaRegistroC460.get(i).getVlCofins())
                    + u.preenche(listaRegistroC460.get(i).getCpfCnpj())
                    + u.preenche(listaRegistroC460.get(i).getNomAdq())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC460 += 1;
            gravaRegistroC470(listaRegistroC460.get(i).getRegistroC470List());
        }
        return registro;
    }

    private String gravaRegistroC470(List<RegistroC470> listaRegistroC470) {
        String registro = "";
        for (int i = 0; i < listaRegistroC470.size(); i++) {
            registro += u.preenche("C470")
                    + u.preenche(listaRegistroC470.get(i).getCodItem())
                    + u.preenche(listaRegistroC470.get(i).getQtd())
                    + u.preenche(listaRegistroC470.get(i).getQtdCanc())
                    + u.preenche(listaRegistroC470.get(i).getUnid())
                    + u.preenche(listaRegistroC470.get(i).getVlItem())
                    + u.preenche(listaRegistroC470.get(i).getCstIcms())
                    + u.preenche(listaRegistroC470.get(i).getCfop())
                    + u.preenche(listaRegistroC470.get(i).getAliqIcms())
                    + u.preenche(listaRegistroC470.get(i).getVlPis())
                    + u.preenche(listaRegistroC470.get(i).getVlCofins())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC470 += 1;
        }
        return registro;
    }

    private String gravaRegistroC490(List<RegistroC490> listaRegistroC490) {
        String registro = "";
        for (int i = 0; i < listaRegistroC490.size(); i++) {
            registro += u.preenche("C490")
                    + u.preenche(listaRegistroC490.get(i).getCstIcms())
                    + u.preenche(listaRegistroC490.get(i).getCfop())
                    + u.preenche(listaRegistroC490.get(i).getAliqIcms())
                    + u.preenche(listaRegistroC490.get(i).getVlOpr())
                    + u.preenche(listaRegistroC490.get(i).getVlBcIcms())
                    + u.preenche(listaRegistroC490.get(i).getVlIcms())
                    + u.preenche(listaRegistroC490.get(i).getCodObs())
                    + u.getDelimitador()
                    + u.getCrlf();

            registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);
            numeroRegistroC490 += 1;
        }
        return registro;
    }

    public String gravaRegistroC990() {
        registroC990.setQtdLinC(registroC990.getQtdLinC() + 1);

        return u.preenche("C990")
                + u.preenche(registroC990.getQtdLinC())
                + u.getDelimitador()
                + u.getCrlf();
    }

    /**
     * @return the registroC001
     */
    public RegistroC001 getRegistroC001() {
        return registroC001;
    }

    /**
     * @return the listaRegistroC100
     */
    public List<RegistroC100> getListaRegistroC100() {
        return listaRegistroC100;
    }

    /**
     * @return the listaRegistroC114
     */
    public List<RegistroC114> getListaRegistroC114() {
        return listaRegistroC114;
    }

    /**
     * @return the listaRegistroC300
     */
    public List<RegistroC300> getListaRegistroC300() {
        return listaRegistroC300;
    }

    /**
     * @return the listaRegistroC350
     */
    public List<RegistroC350> getListaRegistroC350() {
        return listaRegistroC350;
    }

    /**
     * @return the listaRegistroC400
     */
    public List<RegistroC400> getListaRegistroC400() {
        return listaRegistroC400;
    }

    /**
     * @return the listaRegistroC425
     */
    public List<RegistroC425> getListaRegistroC425() {
        return listaRegistroC425;
    }

    /**
     * @return the registroC990
     */
    public RegistroC990 getRegistroC990() {
        return registroC990;
    }

    /**
     * @return the numeroRegistroC170
     */
    public Integer getNumeroRegistroC170() {
        return numeroRegistroC170;
    }

    /**
     * @return the numeroRegistroC190
     */
    public Integer getNumeroRegistroC190() {
        return numeroRegistroC190;
    }

    /**
     * @return the numeroRegistroC310
     */
    public Integer getNumeroRegistroC310() {
        return numeroRegistroC310;
    }

    /**
     * @return the numeroRegistroC320
     */
    public Integer getNumeroRegistroC320() {
        return numeroRegistroC320;
    }

    /**
     * @return the numeroRegistroC321
     */
    public Integer getNumeroRegistroC321() {
        return numeroRegistroC321;
    }

    /**
     * @return the numeroRegistroC370
     */
    public Integer getNumeroRegistroC370() {
        return numeroRegistroC370;
    }

    /**
     * @return the numeroRegistroC390
     */
    public Integer getNumeroRegistroC390() {
        return numeroRegistroC390;
    }

    /**
     * @return the numeroRegistroC405
     */
    public Integer getNumeroRegistroC405() {
        return numeroRegistroC405;
    }

    /**
     * @return the numeroRegistroC420
     */
    public Integer getNumeroRegistroC420() {
        return numeroRegistroC420;
    }

    /**
     * @return the numeroRegistroC460
     */
    public Integer getNumeroRegistroC460() {
        return numeroRegistroC460;
    }

    /**
     * @return the numeroRegistroC470
     */
    public Integer getNumeroRegistroC470() {
        return numeroRegistroC470;
    }

    /**
     * @return the numeroRegistroC490
     */
    public Integer getNumeroRegistroC490() {
        return numeroRegistroC490;
    }
}
