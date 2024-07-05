/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: T2Ti Sped Fiscal
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Claudio de Barros (T2Ti.com)
@author Albert Eije (alberteije@gmail.com)                    
@version 3.0.0
*******************************************************************************/
package com.t2ti.fenix.lib.sped;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.t2ti.fenix.lib.sped.fiscal.bloco0.Bloco0;
import com.t2ti.fenix.lib.sped.fiscal.bloco1.Bloco1;
import com.t2ti.fenix.lib.sped.fiscal.bloco9.Bloco9;
import com.t2ti.fenix.lib.sped.fiscal.bloco9.Registro9900;
import com.t2ti.fenix.lib.sped.fiscal.blococ.BlocoC;
import com.t2ti.fenix.lib.sped.fiscal.blocoe.BlocoE;
import com.t2ti.fenix.lib.sped.fiscal.blocoh.BlocoH;

public class T2TiSpedFiscal {

    private Bloco0 bloco0;
    private BlocoC blocoC;
    private BlocoE blocoE;
    private BlocoH blocoH;
    private Bloco1 bloco1;
    private Bloco9 bloco9;
    private SpedUtil spedUtil;
    private List<String> linhasArquivo;

    public T2TiSpedFiscal() {
        spedUtil = new SpedUtil();

        bloco0 = new Bloco0(spedUtil);
        blocoC = new BlocoC(spedUtil);
        blocoE = new BlocoE(spedUtil);
        blocoH = new BlocoH(spedUtil);
        bloco1 = new Bloco1(spedUtil);
        bloco9 = new Bloco9(spedUtil);
        linhasArquivo = new ArrayList<>();
    }

    public void geraArquivoTxt(File arquivo) throws Exception {
        //bloco 0
        linhasArquivo.add(bloco0.gravaRegistro0000());
        incluiRegistro9900("0000", 1);
        linhasArquivo.add(bloco0.gravaRegistro0001());
        incluiRegistro9900("0001", 1);
        linhasArquivo.add(bloco0.gravaRegistro0005());
        incluiRegistro9900("0005", 1);
        linhasArquivo.add(bloco0.gravaRegistro0100());
        incluiRegistro9900("0100", 1);
        if (bloco0.getListaRegistro0150().size() > 0) {
            linhasArquivo.add(bloco0.gravaRegistro0150());
            incluiRegistro9900("0150", bloco0.getListaRegistro0150().size());
            if (bloco0.getNumeroRegistro0175() > 0) {
                incluiRegistro9900("0175", bloco0.getNumeroRegistro0175());
            }
        }
        if (bloco0.getListaRegistro0190().size() > 0) {
            linhasArquivo.add(bloco0.gravaRegistro0190());
            incluiRegistro9900("0190", bloco0.getListaRegistro0190().size());
        }
        if (bloco0.getListaRegistro0200().size() > 0) {
            linhasArquivo.add(bloco0.gravaRegistro0200());
            incluiRegistro9900("0200", bloco0.getListaRegistro0200().size());
            if (bloco0.getNumeroRegistro0205() > 0) {
                incluiRegistro9900("0205", bloco0.getNumeroRegistro0205());
            }
            if (bloco0.getNumeroRegistro0220() > 0) {
                incluiRegistro9900("0220", bloco0.getNumeroRegistro0220());
            }
        }
        linhasArquivo.add(bloco0.gravaRegistro0990());
        incluiRegistro9900("0990", 1);

        //bloco C
        linhasArquivo.add(blocoC.gravaRegistroC001());
        incluiRegistro9900("C001", 1);
        if (blocoC.getListaRegistroC100().size() > 0) {
            linhasArquivo.add(blocoC.gravaRegistroC100());
            incluiRegistro9900("C100", blocoC.getListaRegistroC100().size());
            if (blocoC.getNumeroRegistroC170() > 0) {
                incluiRegistro9900("C170", blocoC.getNumeroRegistroC170());
            }
            if (blocoC.getNumeroRegistroC190() > 0) {
                incluiRegistro9900("C190", blocoC.getNumeroRegistroC190());
            }
        }
        if (blocoC.getListaRegistroC114().size() > 0) {
            linhasArquivo.add(blocoC.gravaRegistroC114());
            incluiRegistro9900("C114", blocoC.getListaRegistroC114().size());
        }
        if (blocoC.getListaRegistroC300().size() > 0) {
            linhasArquivo.add(blocoC.gravaRegistroC300());
            incluiRegistro9900("C300", blocoC.getListaRegistroC300().size());
            if (blocoC.getNumeroRegistroC310() > 0) {
                incluiRegistro9900("C310", blocoC.getNumeroRegistroC310());
            }
            if (blocoC.getNumeroRegistroC320() > 0) {
                incluiRegistro9900("C320", blocoC.getNumeroRegistroC320());
                if (blocoC.getNumeroRegistroC321() > 0) {
                    incluiRegistro9900("C321", blocoC.getNumeroRegistroC321());
                }
            }
        }
        if (blocoC.getListaRegistroC350().size() > 0) {
            linhasArquivo.add(blocoC.gravaRegistroC350());
            incluiRegistro9900("C350", blocoC.getListaRegistroC350().size());
            if (blocoC.getNumeroRegistroC370() > 0) {
                incluiRegistro9900("C370", blocoC.getNumeroRegistroC370());
            }
            if (blocoC.getNumeroRegistroC390() > 0) {
                incluiRegistro9900("C390", blocoC.getNumeroRegistroC390());
            }
        }
        if (blocoC.getListaRegistroC400().size() > 0) {
            linhasArquivo.add(blocoC.gravaRegistroC400());
            incluiRegistro9900("C400", blocoC.getListaRegistroC400().size());
            if (blocoC.getNumeroRegistroC405() > 0) {
                incluiRegistro9900("C405", blocoC.getNumeroRegistroC405());
                if (blocoC.getNumeroRegistroC420() > 0) {
                    incluiRegistro9900("C420", blocoC.getNumeroRegistroC420());
                }
                if (blocoC.getNumeroRegistroC460() > 0) {
                    incluiRegistro9900("C460", blocoC.getNumeroRegistroC460());
                    if (blocoC.getNumeroRegistroC470() > 0) {
                        incluiRegistro9900("C470", blocoC.getNumeroRegistroC470());
                    }
                }
                if (blocoC.getNumeroRegistroC490() > 0) {
                    incluiRegistro9900("C490", blocoC.getNumeroRegistroC490());
                }
            }
        }
        if (blocoC.getListaRegistroC425().size() > 0) {
            linhasArquivo.add(blocoC.gravaRegistroC425());
            incluiRegistro9900("C425", blocoC.getListaRegistroC425().size());
        }
        linhasArquivo.add(blocoC.gravaRegistroC990());
        incluiRegistro9900("C990", 1);

        //bloco E
        linhasArquivo.add(blocoE.gravaRegistroE001());
        incluiRegistro9900("E001", 1);
        if (blocoE.getListaRegistroE100().size() > 0) {
            linhasArquivo.add(blocoE.gravaRegistroE100(bloco0.getRegistro0000().getCodVer()));
            incluiRegistro9900("E100", blocoE.getListaRegistroE100().size());
            if (blocoE.getNumeroRegistroE110() > 0) {
                incluiRegistro9900("E110", blocoE.getNumeroRegistroE110());
                if (blocoE.getNumeroRegistroE116() > 0) {
                    incluiRegistro9900("E116", blocoE.getNumeroRegistroE116());
                }
            }
        }
        linhasArquivo.add(blocoE.gravaRegistroE990());
        incluiRegistro9900("E990", 1);

        //bloco H
        linhasArquivo.add(blocoH.gravaRegistroH001());
        incluiRegistro9900("H001", 1);
        if (blocoH.getListaRegistroH005().size() > 0) {
            linhasArquivo.add(blocoH.gravaRegistroH005());
            incluiRegistro9900("H005", blocoH.getNumeroRegistroH005());
            if (blocoH.getNumeroRegistroH010() > 0) {
                incluiRegistro9900("H010", blocoH.getNumeroRegistroH010());
            }
        }
        linhasArquivo.add(blocoH.gravaRegistroH990());
        incluiRegistro9900("H990", 1);

        //bloco 1
        linhasArquivo.add(bloco1.gravaRegistro1001());
        incluiRegistro9900("1001", 1);
        if (bloco1.getListaRegistro1010().size() > 0) {
            linhasArquivo.add(bloco1.gravaRegistro1010());
            incluiRegistro9900("1010", bloco1.getNumeroRegistro1010());
        }
        linhasArquivo.add(bloco1.gravaRegistro1990());
        incluiRegistro9900("1990", 1);

        //bloco 9
        linhasArquivo.add(bloco9.gravaRegistro9001());
        incluiRegistro9900("9001", 1);

        incluiRegistro9900("9900", bloco9.getListaRegistro9900().size() + 2);
        incluiRegistro9900("9990", 1);
        incluiRegistro9900("9999", 1);
        linhasArquivo.add(bloco9.gravaRegistro9900());
        linhasArquivo.add(bloco9.gravaRegistro9990());

        bloco9.getRegistro9999().setQtdLin(
                bloco0.getRegistro0990().getQtdLin0()
                + blocoC.getRegistroC990().getQtdLinC()
                + blocoE.getRegistroE990().getQtdLinE()
                + blocoH.getRegistroH990().getQtdLinH()
                + bloco1.getRegistro1990().getQtdLin1()
                + bloco9.getRegistro9990().getQtdLin9());
        linhasArquivo.add(bloco9.gravaRegistro9999());

        FileUtils.writeLines(arquivo, linhasArquivo, "");        
    }

    private void incluiRegistro9900(String registro, Integer quantidade) {
        Registro9900 registro9900 = new Registro9900();
        registro9900.setRegBlc(registro);
        registro9900.setQtdRegBlc(quantidade);

        bloco9.getListaRegistro9900().add(registro9900);
    }

    public String getDelimitador() {
        return spedUtil.getDelimitador();
    }

    public void setDelimitador(String delimitador) {
        spedUtil.setDelimitador(delimitador);
    }

    public DecimalFormat getFormatoDecimal() {
        return spedUtil.getFormatoDecimal();
    }

    public void setFormatoDecimal(DecimalFormat formatoDecimal) {
        spedUtil.setFormatoDecimal(formatoDecimal);
    }

    public SimpleDateFormat getFormatoData() {
        return spedUtil.getFormatoData();
    }

    public void setFormatoData(SimpleDateFormat formatoData) {
        spedUtil.setFormatoData(formatoData);
    }

    /**
     * @return the bloco0
     */
    public Bloco0 getBloco0() {
        return bloco0;
    }

    /**
     * @return the blocoC
     */
    public BlocoC getBlocoC() {
        return blocoC;
    }

    /**
     * @return the blocoE
     */
    public BlocoE getBlocoE() {
        return blocoE;
    }

    /**
     * @return the blocoH
     */
    public BlocoH getBlocoH() {
        return blocoH;
    }

    /**
     * @return the bloco1
     */
    public Bloco1 getBloco1() {
        return bloco1;
    }

    /**
     * @return the bloco9
     */
    public Bloco9 getBloco9() {
        return bloco9;
    }

    /**
     * @return the spedUtil
     */
    public SpedUtil getSpedUtil() {
        return spedUtil;
    }
}
