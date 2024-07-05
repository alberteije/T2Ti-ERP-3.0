<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado ao SPED Contábil - ECD
                                                                                
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
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
declare(strict_types=1);

class ECDBlocoI
{
    private $registroI001;
    private $registroI010;
    private $listaRegistroI012;
    private $listaRegistroI020;
    private $registroI030;
    private $listaRegistroI050;
    private $listaRegistroI075;
    private $listaRegistroI100;
    private $listaRegistroI150;
    private $listaRegistroI200;
    private $listaRegistroI300;
    private $listaRegistroI350;
    private $listaRegistroI500;
    private $listaRegistroI510;
    private $listaRegistroI550;
    private $registroI990;
    private $numeroRegistrosI015;
    private $numeroRegistrosI051;
    private $numeroRegistrosI052;
    private $numeroRegistrosI151;
    private $numeroRegistrosI155;
    private $numeroRegistrosI250;
    private $numeroRegistrosI310;
    private $numeroRegistrosI355;
    private $numeroRegistrosI555;
    private $spedUtil;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->registroI001 = new ECDRegistroI001();
        $this->registroI001->setIndDad(1);
        $this->registroI010 = new ECDRegistroI010();
        $this->listaRegistroI012 = array();
        $this->listaRegistroI020 = array();
        $this->registroI030 = new ECDRegistroI030();
        $this->listaRegistroI050 = array();
        $this->listaRegistroI075 = array();
        $this->listaRegistroI100 = array();
        $this->listaRegistroI150 = array();
        $this->listaRegistroI200 = array();
        $this->listaRegistroI300 = array();
        $this->listaRegistroI350 = array();
        $this->listaRegistroI500 = array();
        $this->listaRegistroI510 = array();
        $this->listaRegistroI550 = array();
		
        $this->registroI990 = new ECDRegistroI990();
        $this->registroI990->setQtdLinI(0);
		
        $this->numeroRegistrosI015 = 0;
        $this->numeroRegistrosI051 = 0;
        $this->numeroRegistrosI052 = 0;
        $this->numeroRegistrosI151 = 0;
        $this->numeroRegistrosI155 = 0;
        $this->numeroRegistrosI250 = 0;
        $this->numeroRegistrosI310 = 0;
        $this->numeroRegistrosI355 = 0;
        $this->numeroRegistrosI555 = 0;

        $this->spedUtil = new SpedUtil();
    }

    public function limpaRegistros() {
        $this->listaRegistroI012 = array();
        $this->listaRegistroI020 = array();
        $this->listaRegistroI050 = array();
        $this->listaRegistroI075 = array();
        $this->listaRegistroI100 = array();
        $this->listaRegistroI150 = array();
        $this->listaRegistroI200 = array();
        $this->listaRegistroI300 = array();
        $this->listaRegistroI350 = array();
        $this->listaRegistroI500 = array();
        $this->listaRegistroI510 = array();
        $this->listaRegistroI550 = array();
		
        $this->registroI990->setQtdLinI(0);
		
        $this->numeroRegistrosI015 = 0;
        $this->numeroRegistrosI051 = 0;
        $this->numeroRegistrosI052 = 0;
        $this->numeroRegistrosI151 = 0;
        $this->numeroRegistrosI155 = 0;
        $this->numeroRegistrosI250 = 0;
        $this->numeroRegistrosI310 = 0;
        $this->numeroRegistrosI355 = 0;
        $this->numeroRegistrosI555 = 0;
    } 

    public function gravaRegistroI001() {
        $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);

        return $this->spedUtil->preencheTexto("I001")
                . $this->spedUtil->preencheTexto($this->registroI001->getIndDad())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistroI010() {
        $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);

        return $this->spedUtil->preencheTexto("I010")
                . $this->spedUtil->preencheValorInteiro($this->registroI010->getIndEsc())
                . $this->spedUtil->preencheTexto($this->registroI010->getCodVerLc())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistroI012() {
        $registro = "";
        foreach ($this->listaRegistroI012 as $registroI012) {
            $registro .= $this->spedUtil->preencheTexto("I012")
                    . $this->spedUtil->preencheTexto($registroI012->getNumOrd())
                    . $this->spedUtil->preencheTexto($registroI012->getNatLivr())
                    . $this->spedUtil->preencheTexto($registroI012->getTipo())
                    . $this->spedUtil->preencheTexto($registroI012->getCodHashAux())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $registro .= $this->gravaRegistroI015($registroI012->getRegistroI015List());

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }

        return $registro;
    }

    private function gravaRegistroI015($listaRegistroI015) {
        $registro = "";
        foreach ($this->listaRegistroI015 as $registroI015) {
            $registro .= $this->spedUtil->preencheTexto("I015")
                    . $this->spedUtil->preencheTexto($registroI015->getCodCtaRes())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
            $this->numeroRegistrosI015 += 1;
        }
        return $registro;
    }

    public function gravaRegistroI020() {
        $registro = "";
        foreach ($this->listaRegistroI020 as $registroI020) {
            $registro .= $this->spedUtil->preencheTexto("I020")
                    . $this->spedUtil->preencheTexto($registroI020->getRegCod())
                    . $this->spedUtil->preencheTexto($registroI020->getNumAd())
                    . $this->spedUtil->preencheTexto($registroI020->getCampo())
                    . $this->spedUtil->preencheTexto($registroI020->getDescricao())
                    . $this->spedUtil->preencheTexto($registroI020->getTipoDado())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }

        return $registro;
    }

    public function gravaRegistroI030() {
        $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);

        return $this->spedUtil->preencheTexto("I030")
                . $this->spedUtil->preencheTexto("TERMO DE ABERTURA")
                . $this->spedUtil->preencheTexto($this->registroI030->getNumOrd())
                . $this->spedUtil->preencheTexto($this->registroI030->getNatLivr())
                . $this->spedUtil->preencheValorInteiro($this->registroI030->getQtdLin())
                . $this->spedUtil->preencheTexto($this->registroI030->getNome())
                . $this->spedUtil->preencheTexto($this->registroI030->getNire())
                . $this->spedUtil->preencheTexto($this->registroI030->getCnpj())
                . $this->spedUtil->preencheData($this->registroI030->getDtArq())
                . $this->spedUtil->preencheData($this->registroI030->getDtArqConv())
                . $this->spedUtil->preencheTexto($this->registroI030->getDescMun())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistroI050() {
        $registro = "";
        foreach ($this->listaRegistroI050 as $registroI050) {
            $registro .= $this->spedUtil->preencheTexto("I050")
                    . $this->spedUtil->preencheData($registroI050->getDtAlt())
                    . $this->spedUtil->preencheTexto($registroI050->getCodNat())
                    . $this->spedUtil->preencheTexto($registroI050->getIndCta())
                    . $this->spedUtil->preencheTexto($registroI050->getNivel())
                    . $this->spedUtil->preencheTexto($registroI050->getCodCta())
                    . $this->spedUtil->preencheTexto($registroI050->getCodCtaSup())
                    . $this->spedUtil->preencheTexto($registroI050->getCta())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $registro .= $this->gravaRegistroI051($this->$registroI050->getRegistroi051List());
            $registro .= $this->gravaRegistroI052($this->$registroI050->getRegistroi052List());

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }

        return $registro;
    }

    private function gravaRegistroI051($listaRegistroI051) {
        $registro = "";
        foreach ($this->listaRegistroI051 as $registroI051) {
            $registro .= $this->spedUtil->preencheTexto("I051")
                    . $this->spedUtil->preencheTexto($registroI051->getCodEntRef())
                    . $this->spedUtil->preencheTexto($registroI051->getCodCcus())
                    . $this->spedUtil->preencheTexto($registroI051->getCodCtaRef())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
            $this->numeroRegistrosI051 += 1;
        }
        return $registro;
    }

    private function gravaRegistroI052($listaRegistroI052) {
        $registro = "";
        foreach ($this->listaRegistroI052 as $registroI052) {
            $registro .= $this->spedUtil->preencheTexto("I052")
                    . $this->spedUtil->preencheTexto($registroI052->getCodCcus())
                    . $this->spedUtil->preencheTexto($registroI052->getCodAgl())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
            $this->numeroRegistrosI052 += 1;
        }
        return $registro;
    }

    public function gravaRegistroI075() {
        $registro = "";
        foreach ($this->listaRegistroI075 as $registroI075) {
            $registro .= $this->spedUtil->preencheTexto("I075")
                    . $this->spedUtil->preencheTexto($registroI075->getCodHist())
                    . $this->spedUtil->preencheTexto($registroI075->getDescrHist())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }
        return $registro;
    }

    public function gravaRegistroI100() {
        $registro = "";
        foreach ($this->listaRegistroI100 as $registroI100) {
            $registro .= $this->spedUtil->preencheTexto("I100")
                    . $this->spedUtil->preencheData($registroI100->getDtAlt())
                    . $this->spedUtil->preencheTexto($registroI100->getCodCcus())
                    . $this->spedUtil->preencheTexto($registroI100->getCcus())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }
        return $registro;
    }

    public function gravaRegistroI150() {
        $registro = "";
        foreach ($this->listaRegistroI150 as $registroI150) {
            $registro .= $this->spedUtil->preencheTexto("I150")
                    . $this->spedUtil->preencheData($registroI150->getDtIni())
                    . $this->spedUtil->preencheData($registroI150->getDtFin())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $registro .= $this->gravaRegistroI151($registroI150->getRegistroi151List());
            $registro .= $this->gravaRegistroI155($registroI150->getRegistroi155List());

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }

        return $registro;
    }

    private function gravaRegistroI151($listaRegistroI151) {
        $registro = "";
        foreach ($this->listaRegistroI151 as $registroI151) {
            $registro .= $this->spedUtil->preencheTexto("I151")
                    . $this->spedUtil->preencheTexto($registroI151->getAssinDig())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
            $this->numeroRegistrosI151 += 1;
        }
        return $registro;
    }

    private function gravaRegistroI155($listaRegistroI155) {
        $registro = "";
        foreach ($this->listaRegistroI155 as $registroI155) {
            $registro .= $this->spedUtil->preencheTexto("I155")
                    . $this->spedUtil->preencheTexto($registroI155->getCodCta())
                    . $this->spedUtil->preencheTexto($registroI155->getCodCcus())
                    . $this->spedUtil->preencheValorDecimal($registroI155->getVlSldIni())
                    . $this->spedUtil->preencheTexto($registroI155->getIndDcIni())
                    . $this->spedUtil->preencheValorDecimal($registroI155->getVlDeb())
                    . $this->spedUtil->preencheValorDecimal($registroI155->getVlCred())
                    . $this->spedUtil->preencheValorDecimal($registroI155->getVlSldFin())
                    . $this->spedUtil->preencheTexto($registroI155->getIndDcFin())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
            $this->numeroRegistrosI155 += 1;
        }
        return $registro;
    }

    public function gravaRegistroI200() {
        $registro = "";
        foreach ($this->listaRegistroI200 as $registroI200) {
            $registro .= $this->spedUtil->preencheTexto("I200")
                    . $this->spedUtil->preencheTexto($registroI200->getNumLcto())
                    . $this->spedUtil->preencheData($registroI200->getDtLcto())
                    . $this->spedUtil->preencheValorDecimal($registroI200->getVlLcto())
                    . $this->spedUtil->preencheTexto($registroI200->getIndLcto())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $registro .= $this->gravaRegistroI250($registroI200->getRegistroi250List());

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }

        return $registro;
    }

    private function gravaRegistroI250($listaRegistroI250) {
        $registro = "";
        foreach ($this->listaRegistroI250 as $registroI250) {
            $registro .= $this->spedUtil->preencheTexto("I250")
                    . $this->spedUtil->preencheTexto($registroI250->getCodCta())
                    . $this->spedUtil->preencheTexto($registroI250->getCodCcus())
                    . $this->spedUtil->preencheValorDecimal($registroI250->getVlDc())
                    . $this->spedUtil->preencheTexto($registroI250->getIndDc())
                    . $this->spedUtil->preencheTexto($registroI250->getNumArq())
                    . $this->spedUtil->preencheTexto($registroI250->getCodHistPad())
                    . $this->spedUtil->preencheTexto($registroI250->getHist())
                    . $this->spedUtil->preencheTexto($registroI250->getCodPart())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
            $this->numeroRegistrosI250 += 1;
        }
        return $registro;
    }

    public function gravaRegistroI300() {
        $registro = "";
        foreach ($this->listaRegistroI300 as $registroI300) {
            $registro .= $this->spedUtil->preencheTexto("I300")
                    . $this->spedUtil->preencheData($registroI300->getDtBcte())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $registro .= $this->gravaRegistroI310($registroI300->getRegistroi310List());

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }

        return $registro;
    }

    private function gravaRegistroI310($listaRegistroI310) {
        $registro = "";
        foreach ($this->listaRegistroI310 as $registroI310) {
            $registro .= $this->spedUtil->preencheTexto("I310")
                    . $this->spedUtil->preencheTexto($registroI310->getCodCta())
                    . $this->spedUtil->preencheTexto($registroI310->getCodCcus())
                    . $this->spedUtil->preencheValorDecimal($registroI310->getValDebd())
                    . $this->spedUtil->preencheValorDecimal($registroI310->getValCred())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
            $this->numeroRegistrosI310 += 1;
        }
        return $registro;
    }

    public function gravaRegistroI350() {
        $registro = "";
        foreach ($this->listaRegistroI350 as $registroI350) {
            $registro .= $this->spedUtil->preencheTexto("I350")
                    . $this->spedUtil->preencheData($registroI350->getDtRes())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $registro .= $this->gravaRegistroI355($registroI350->getRegistroi355List());

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }

        return $registro;
    }

    private function gravaRegistroI355($listaRegistroI355) {
        $registro = "";
        foreach ($this->listaRegistroI355 as $registroI355) {
            $registro .= $this->spedUtil->preencheTexto("I355")
                    . $this->spedUtil->preencheTexto($registroI355->getCodCta())
                    . $this->spedUtil->preencheTexto($registroI355->getCodCcus())
                    . $this->spedUtil->preencheValorDecimal($registroI355->getVlCta())
                    . $this->spedUtil->preencheTexto($registroI355->getIndDc())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
            $this->numeroRegistrosI355 += 1;
        }
        return $registro;
    }

    public function gravaRegistroI500() {
        $registro = "";
        foreach ($this->listaRegistroI500 as $registroI500) {
            $registro .= $this->spedUtil->preencheTexto("I500")
                    . $this->spedUtil->preencheValorInteiro($registroI500->getTamFonte())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }
        return $registro;
    }

    public function gravaRegistroI510() {
        $registro = "";
        foreach ($this->listaRegistroI510 as $registroI510) {
            $registro .= $this->spedUtil->preencheTexto("I510")
                    . $this->spedUtil->preencheTexto($registroI510->getNmCampo())
                    . $this->spedUtil->preencheTexto($registroI510->getDescCampo())
                    . $this->spedUtil->preencheTexto($registroI510->getTipoCampo())
                    . $this->spedUtil->preencheValorInteiro($registroI510->getTamCampo())
                    . $this->spedUtil->preencheValorInteiro($registroI510->getDecCampo())
                    . $this->spedUtil->preencheValorInteiro($registroI510->getColCampo())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }
        return $registro;
    }

    public function gravaRegistroI550() {
        $registro = "";
        foreach ($this->listaRegistroI550 as $registroI550) {
            $registro .= $this->spedUtil->preencheTexto("I550")
                    . $this->spedUtil->preencheTexto($registroI550->getRzCont())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $registro .= $this->gravaRegistroI555($registroI550->getRegistroi555List());

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
        }

        return $registro;
    }

    private function gravaRegistroI555($listaRegistroI555) {
        $registro = "";
        foreach ($this->listaRegistroI555 as $registroI555) {
            $registro .= $this->spedUtil->preencheTexto("I555")
                    . $this->spedUtil->preencheTexto($registroI555->getRzContTot())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);
            $this->numeroRegistrosI555 += 1;
        }
        return $registro;
    }

    public function gravaregistroI990() {
        $this->registroI990->setQtdLinI($this->registroI990->getQtdLinI() + 1);

        return $this->spedUtil->preencheTexto("I990")
                . $this->spedUtil->preencheValorInteiro($this->registroI990->getQtdLinI())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    /**
     * @return the registroI001
     */
    public function getRegistroI001() {
        return $this->registroI001;
    }

    /**
     * @param registroI001 the registroI001 to set
     */
    public function setRegistroI001($registroI001) {
        $this->registroI001 = $registroI001;
    }

    /**
     * @return the registroI010
     */
    public function getRegistroI010() {
        return $this->registroI010;
    }

    /**
     * @param registroI010 the registroI010 to set
     */
    public function setRegistroI010($registroI010) {
        $this->registroI010 = $registroI010;
    }

    /**
     * @return the listaRegistroI012
     */
    public function getListaRegistroI012() {
        return $this->listaRegistroI012;
    }

    /**
     * @param listaRegistroI012 the listaRegistroI012 to set
     */
    public function setListaRegistroI012($listaRegistroI012) {
        $this->listaRegistroI012 = $listaRegistroI012;
    }

    /**
     * @return the listaRegistroI020
     */
    public function getListaRegistroI020() {
        return $this->listaRegistroI020;
    }

    /**
     * @param listaRegistroI020 the listaRegistroI020 to set
     */
    public function setListaRegistroI020($listaRegistroI020) {
        $this->listaRegistroI020 = $listaRegistroI020;
    }

    /**
     * @return the registroI030
     */
    public function getRegistroI030() {
        return $this->registroI030;
    }

    /**
     * @param registroI030 the registroI030 to set
     */
    public function setRegistroI030($registroI030) {
        $this->registroI030 = $registroI030;
    }

    /**
     * @return the listaRegistroI050
     */
    public function getListaRegistroI050() {
        return $this->listaRegistroI050;
    }

    /**
     * @param listaRegistroI050 the listaRegistroI050 to set
     */
    public function setListaRegistroI050($listaRegistroI050) {
        $this->listaRegistroI050 = $listaRegistroI050;
    }

    /**
     * @return the listaRegistroI075
     */
    public function getListaRegistroI075() {
        return $this->listaRegistroI075;
    }

    /**
     * @param listaRegistroI075 the listaRegistroI075 to set
     */
    public function setListaRegistroI075($listaRegistroI075) {
        $this->listaRegistroI075 = $listaRegistroI075;
    }

    /**
     * @return the listaRegistroI100
     */
    public function getListaRegistroI100() {
        return $this->listaRegistroI100;
    }

    /**
     * @param listaRegistroI100 the listaRegistroI100 to set
     */
    public function setListaRegistroI100($listaRegistroI100) {
        $this->listaRegistroI100 = $listaRegistroI100;
    }

    /**
     * @return the listaRegistroI150
     */
    public function getListaRegistroI150() {
        return $this->listaRegistroI150;
    }

    /**
     * @param listaRegistroI150 the listaRegistroI150 to set
     */
    public function setListaRegistroI150($listaRegistroI150) {
        $this->listaRegistroI150 = $listaRegistroI150;
    }

    /**
     * @return the listaRegistroI200
     */
    public function getListaRegistroI200() {
        return $this->listaRegistroI200;
    }

    /**
     * @param listaRegistroI200 the listaRegistroI200 to set
     */
    public function setListaRegistroI200($listaRegistroI200) {
        $this->listaRegistroI200 = $listaRegistroI200;
    }

    /**
     * @return the listaRegistroI300
     */
    public function getListaRegistroI300() {
        return $this->listaRegistroI300;
    }

    /**
     * @param listaRegistroI300 the listaRegistroI300 to set
     */
    public function setListaRegistroI300($listaRegistroI300) {
        $this->listaRegistroI300 = $listaRegistroI300;
    }

    /**
     * @return the listaRegistroI350
     */
    public function getListaRegistroI350() {
        return $this->listaRegistroI350;
    }

    /**
     * @param listaRegistroI350 the listaRegistroI350 to set
     */
    public function setListaRegistroI350($listaRegistroI350) {
        $this->listaRegistroI350 = $listaRegistroI350;
    }

    /**
     * @return the listaRegistroI500
     */
    public function getListaRegistroI500() {
        return $this->listaRegistroI500;
    }

    /**
     * @param listaRegistroI500 the listaRegistroI500 to set
     */
    public function setListaRegistroI500($listaRegistroI500) {
        $this->listaRegistroI500 = $listaRegistroI500;
    }

    /**
     * @return the listaRegistroI510
     */
    public function getListaRegistroI510() {
        return $this->listaRegistroI510;
    }

    /**
     * @param listaRegistroI510 the listaRegistroI510 to set
     */
    public function setListaRegistroI510($listaRegistroI510) {
        $this->listaRegistroI510 = $listaRegistroI510;
    }

    /**
     * @return the listaRegistroI550
     */
    public function getListaRegistroI550() {
        return $this->listaRegistroI550;
    }

    /**
     * @param listaRegistroI550 the listaRegistroI550 to set
     */
    public function setListaRegistroI550($listaRegistroI550) {
        $this->listaRegistroI550 = $listaRegistroI550;
    }

    /**
     * @return the registroI990
     */
    public function getRegistroI990() {
        return $this->registroI990;
    }

    /**
     * @param registroI990 the registroI990 to set
     */
    public function setRegistroI990($registroI990) {
        $this->registroI990 = $registroI990;
    }

    /**
     * @return the numeroRegistrosI015
     */
    public function getNumeroRegistrosI015() {
        return $this->numeroRegistrosI015;
    }

    /**
     * @param numeroRegistrosI015 the numeroRegistrosI015 to set
     */
    public function setNumeroRegistrosI015($numeroRegistrosI015) {
        $this->numeroRegistrosI015 = $numeroRegistrosI015;
    }

    /**
     * @return the numeroRegistrosI051
     */
    public function getNumeroRegistrosI051() {
        return $this->numeroRegistrosI051;
    }

    /**
     * @param numeroRegistrosI051 the numeroRegistrosI051 to set
     */
    public function setNumeroRegistrosI051($numeroRegistrosI051) {
        $this->numeroRegistrosI051 = $numeroRegistrosI051;
    }

    /**
     * @return the numeroRegistrosI052
     */
    public function getNumeroRegistrosI052() {
        return $this->numeroRegistrosI052;
    }

    /**
     * @param numeroRegistrosI052 the numeroRegistrosI052 to set
     */
    public function setNumeroRegistrosI052($numeroRegistrosI052) {
        $this->numeroRegistrosI052 = $numeroRegistrosI052;
    }

    /**
     * @return the numeroRegistrosI151
     */
    public function getNumeroRegistrosI151() {
        return $this->numeroRegistrosI151;
    }

    /**
     * @param numeroRegistrosI151 the numeroRegistrosI151 to set
     */
    public function setNumeroRegistrosI151($numeroRegistrosI151) {
        $this->numeroRegistrosI151 = $numeroRegistrosI151;
    }

    /**
     * @return the numeroRegistrosI155
     */
    public function getNumeroRegistrosI155() {
        return $this->numeroRegistrosI155;
    }

    /**
     * @param numeroRegistrosI155 the numeroRegistrosI155 to set
     */
    public function setNumeroRegistrosI155($numeroRegistrosI155) {
        $this->numeroRegistrosI155 = $numeroRegistrosI155;
    }

    /**
     * @return the numeroRegistrosI250
     */
    public function getNumeroRegistrosI250() {
        return $this->numeroRegistrosI250;
    }

    /**
     * @param numeroRegistrosI250 the numeroRegistrosI250 to set
     */
    public function setNumeroRegistrosI250($numeroRegistrosI250) {
        $this->numeroRegistrosI250 = $numeroRegistrosI250;
    }

    /**
     * @return the numeroRegistrosI310
     */
    public function getNumeroRegistrosI310() {
        return $this->numeroRegistrosI310;
    }

    /**
     * @param numeroRegistrosI310 the numeroRegistrosI310 to set
     */
    public function setNumeroRegistrosI310($numeroRegistrosI310) {
        $this->numeroRegistrosI310 = $numeroRegistrosI310;
    }

    /**
     * @return the numeroRegistrosI355
     */
    public function getNumeroRegistrosI355() {
        return $this->numeroRegistrosI355;
    }

    /**
     * @param numeroRegistrosI355 the numeroRegistrosI355 to set
     */
    public function setNumeroRegistrosI355($numeroRegistrosI355) {
        $this->numeroRegistrosI355 = $numeroRegistrosI355;
    }

    /**
     * @return the numeroRegistrosI555
     */
    public function getNumeroRegistrosI555() {
        return $this->numeroRegistrosI555;
    }

    /**
     * @param numeroRegistrosI555 the numeroRegistrosI555 to set
     */
    public function setNumeroRegistrosI555($numeroRegistrosI555) {
        $this->numeroRegistrosI555 = $numeroRegistrosI555;
    }
    
}
