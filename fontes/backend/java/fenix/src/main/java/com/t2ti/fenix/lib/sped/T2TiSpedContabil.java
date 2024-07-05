/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: T2Ti Sped Contábil
                                                                                
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

import com.t2ti.fenix.lib.sped.contabil.bloco0.Bloco0;
import com.t2ti.fenix.lib.sped.contabil.bloco9.Bloco9;
import com.t2ti.fenix.lib.sped.contabil.bloco9.Registro9900;
import com.t2ti.fenix.lib.sped.contabil.blocoi.BlocoI;
import com.t2ti.fenix.lib.sped.contabil.blocoj.BlocoJ;
import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.io.FileUtils;

public class T2TiSpedContabil {

    private Bloco0 bloco0;
    private BlocoI blocoI;
    private BlocoJ blocoJ;
    private Bloco9 bloco9;
    private SpedUtil spedUtil;
    private List<String> linhasArquivo;
    private Integer indexI030;
    private Integer indexJ900;

    public T2TiSpedContabil() {
        spedUtil = new SpedUtil();

        bloco0 = new Bloco0(spedUtil);
        blocoI = new BlocoI(spedUtil);
        blocoJ = new BlocoJ(spedUtil);
        bloco9 = new Bloco9(spedUtil);
        linhasArquivo = new ArrayList<String>();
    }

    public void limpaRegistros() {
        bloco0.limpaRegistros();
        blocoI.limpaRegistros();
        blocoJ.limpaRegistros();
        bloco9.limpaRegistros();
    }

    public void geraArquivoTxt(File arquivo) throws Exception {
        bloco9.getListaRegistro9900().clear();

        //bloco 0
        linhasArquivo.add(bloco0.gravaRegistro0000());
        incluiRegistro9900("0000", 1);
        linhasArquivo.add(bloco0.gravaRegistro0001());
        incluiRegistro9900("0001", 1);
        if (bloco0.getListaRegistro0007().size() > 0) {
            linhasArquivo.add(bloco0.gravaRegistro0007());
            incluiRegistro9900("0007", bloco0.getListaRegistro0007().size());
        }
        if (bloco0.getListaRegistro0020().size() > 0) {
            linhasArquivo.add(bloco0.gravaRegistro0020());
            incluiRegistro9900("0020", bloco0.getListaRegistro0020().size());
        }
        if (bloco0.getListaRegistro0150().size() > 0) {
            linhasArquivo.add(bloco0.gravaRegistro0150());
            incluiRegistro9900("0150", bloco0.getListaRegistro0150().size());
        }
        if (bloco0.getListaRegistro0180().size() > 0) {
            linhasArquivo.add(bloco0.gravaRegistro0180());
            incluiRegistro9900("0180", bloco0.getListaRegistro0180().size());
        }
        linhasArquivo.add(bloco0.gravaRegistro0990());
        incluiRegistro9900("0990", 1);

        //bloco I
        linhasArquivo.add(blocoI.gravaRegistroI001());
        incluiRegistro9900("I001", 1);
        linhasArquivo.add(blocoI.gravaRegistroI010());
        incluiRegistro9900("I010", 1);
        if (blocoI.getListaRegistroI012().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI012());
            incluiRegistro9900("I012", blocoI.getListaRegistroI012().size());
            if (blocoI.getNumeroRegistrosI015() > 0) {
                incluiRegistro9900("I015", blocoI.getNumeroRegistrosI015());
            }
        }
        if (blocoI.getListaRegistroI020().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI020());
            incluiRegistro9900("I020", blocoI.getListaRegistroI020().size());
        }

        linhasArquivo.add(blocoI.gravaRegistroI030());
        incluiRegistro9900("I030", 1);
        indexI030 = linhasArquivo.size() - 1;

        if (blocoI.getListaRegistroI050().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI050());
            incluiRegistro9900("I050", blocoI.getListaRegistroI050().size());
            if (blocoI.getNumeroRegistrosI051() > 0) {
                incluiRegistro9900("I051", blocoI.getNumeroRegistrosI051());
            }
            if (blocoI.getNumeroRegistrosI052() > 0) {
                incluiRegistro9900("I052", blocoI.getNumeroRegistrosI052());
            }
        }
        if (blocoI.getListaRegistroI075().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI075());
            incluiRegistro9900("I075", blocoI.getListaRegistroI075().size());
        }
        if (blocoI.getListaRegistroI100().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI100());
            incluiRegistro9900("I100", blocoI.getListaRegistroI100().size());
        }
        if (blocoI.getListaRegistroI150().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI150());
            incluiRegistro9900("I150", blocoI.getListaRegistroI150().size());
            if (blocoI.getNumeroRegistrosI151() > 0) {
                incluiRegistro9900("I151", blocoI.getNumeroRegistrosI151());
            }
            if (blocoI.getNumeroRegistrosI155() > 0) {
                incluiRegistro9900("I155", blocoI.getNumeroRegistrosI155());
            }
        }
        if (blocoI.getListaRegistroI200().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI200());
            incluiRegistro9900("I200", blocoI.getListaRegistroI200().size());
            if (blocoI.getNumeroRegistrosI250() > 0) {
                incluiRegistro9900("I250", blocoI.getNumeroRegistrosI250());
            }
        }
        if (blocoI.getListaRegistroI300().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI300());
            incluiRegistro9900("I300", blocoI.getListaRegistroI300().size());
            if (blocoI.getNumeroRegistrosI310() > 0) {
                incluiRegistro9900("I310", blocoI.getNumeroRegistrosI310());
            }
        }
        if (blocoI.getListaRegistroI350().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI350());
            incluiRegistro9900("I350", blocoI.getListaRegistroI350().size());
            if (blocoI.getNumeroRegistrosI355() > 0) {
                incluiRegistro9900("I355", blocoI.getNumeroRegistrosI355());
            }
        }
        if (blocoI.getListaRegistroI500().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI500());
            incluiRegistro9900("I500", blocoI.getListaRegistroI500().size());
        }
        if (blocoI.getListaRegistroI510().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI510());
            incluiRegistro9900("I510", blocoI.getListaRegistroI510().size());
        }
        if (blocoI.getListaRegistroI550().size() > 0) {
            linhasArquivo.add(blocoI.gravaRegistroI550());
            incluiRegistro9900("I550", blocoI.getListaRegistroI550().size());
            if (blocoI.getNumeroRegistrosI555() > 0) {
                incluiRegistro9900("I555", blocoI.getNumeroRegistrosI555());
            }
        }
        linhasArquivo.add(blocoI.gravaRegistroI990());
        incluiRegistro9900("I990", 1);

        //bloco J
        linhasArquivo.add(blocoJ.gravaRegistroJ001());
        incluiRegistro9900("J001", 1);
        if (blocoJ.getListaRegistroJ005().size() > 0) {
            linhasArquivo.add(blocoJ.gravaRegistroJ005());
            incluiRegistro9900("J005", blocoJ.getListaRegistroJ005().size());
            if (blocoJ.getNumeroRegistrosJ100() > 0) {
                incluiRegistro9900("J100", blocoJ.getNumeroRegistrosJ100());
            }
            if (blocoJ.getNumeroRegistrosJ150() > 0) {
                incluiRegistro9900("J150", blocoJ.getNumeroRegistrosJ150());
            }
        }
        if (blocoJ.getListaRegistroJ800().size() > 0) {
            linhasArquivo.add(blocoJ.gravaRegistroJ800());
            incluiRegistro9900("J800", blocoJ.getListaRegistroJ800().size());
        }
        linhasArquivo.add(blocoJ.gravaRegistroJ900());
        incluiRegistro9900("J900", 1);
        indexJ900 = linhasArquivo.size() - 1;

        if (blocoJ.getListaRegistroJ930().size() > 0) {
            linhasArquivo.add(blocoJ.gravaRegistroJ930());
            incluiRegistro9900("J930", blocoJ.getListaRegistroJ930().size());
        }
        linhasArquivo.add(blocoJ.gravaRegistroJ990());
        incluiRegistro9900("J990", 1);

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
                + blocoI.getRegistroI990().getQtdLinI()
                + blocoJ.getRegistroJ990().getQtdLinJ()
                + bloco9.getRegistro9990().getQtdLin9());
        linhasArquivo.add(bloco9.gravaRegistro9999());

        blocoI.getRegistroI030().setQtdLin(bloco9.getRegistro9999().getQtdLin());
        linhasArquivo.set(indexI030, blocoI.gravaRegistroI030());

        blocoJ.getRegistroJ900().setQtdLin(bloco9.getRegistro9999().getQtdLin());
        linhasArquivo.set(indexJ900, blocoJ.gravaRegistroJ900());

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
     * @return the blocoI
     */
    public BlocoI getBlocoI() {
        return blocoI;
    }

    /**
     * @return the blocoJ
     */
    public BlocoJ getBlocoJ() {
        return blocoJ;
    }

    /**
     * @return the bloco9
     */
    public Bloco9 getBloco9() {
        return bloco9;
    }
}
