<?php
/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Model relacionado ao SPED Fiscal

The MIT License

Copyright: Copyright (C) 2020 T2Ti.COM


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
copies of the to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

The author may be contacted at: t2ti.com@gmail.com


@author Albert Eije (alberteije@gmail.com)
@version 1.0.0
*******************************************************************************/
declare(strict_types=1);

class EFDBlocoE  {

    private $registroE001;
    private $listaRegistroE100;
    private $registroE990;
    private $numeroRegistroE110;
    private $numeroRegistroE116;
    private $spedUtil;

    public function __construct()
    {
        $this->registroE001 = new EFDRegistroE001();
        $this->registroE001->setIndMov(1);

        $this->listaRegistroE100 = array();

        $this->registroE990 = new EFDRegistroE990();
        $this->registroE990->setQtdLinE(0);

        $this->numeroRegistroE110 = 0;
        $this->numeroRegistroE116 = 0;

        $this->spedUtil = new SpedUtil();
    }

    public function gravaRegistroE001() {
        $this->registroE990->setQtdLinE($this->registroE990->getQtdLinE() + 1);

        return $this->spedUtil->preencheTexto("E001")
                . $this->spedUtil->preencheValorInteiro($this->registroE001->getIndMov())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistroE100($codVer) {
        $registro = "";
        foreach ($this->listaRegistroE100 as $registroE100) {
            $registro .= $this->spedUtil->preencheTexto("E100")
                    . $this->spedUtil->preencheData($registroE100->getDtIni())
                    . $this->spedUtil->preencheData($registroE100->getDtFin())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroE990->setQtdLinE($this->registroE990->getQtdLinE() + 1);
            $this->gravaRegistroE110($registroE100->getRegistroE110(), $codVer);
        }
        return $registro;
    }

    private function gravaRegistroE110($registroE110, $codVer) {
        if ($registroE110 == null){
            return "";
        }
        $registro = "";

        $registro .= $this->spedUtil->preencheTexto("E110")
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlTotDebitos())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlAjDebitos())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlTotAjDebitos())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlEstornosCred())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlTotCreditos())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlAjCreditos())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlTotAjCreditos())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlEstornosDeb())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlSldCredorAnt())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlSldApurado())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlTotDed())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlIcmsRecolher())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getVlSldCredorTransportar())
                . $this->spedUtil->preencheValorDecimal($this->registroE110->getDebEsp())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();

        $this->registroE990->setQtdLinE($this->registroE990->getQtdLinE() + 1);
        $this->numeroRegistroE110 += 1;

        $registro .= $this->gravaRegistroE116($this->registroE110->getRegistroE116List(), $codVer);

        return $registro;
    }

    private function gravaRegistroE116($listaRegistroE116, $codVer) {
        if ($codVer == "002") {// versao 1.01
            return "";
        }
        $registro = "";
        foreach ($this->listaRegistroE116 as $registroE116) {
            if ($codVer == "003") {//versao 1.02
                $registro .= $this->spedUtil->preencheTexto("E116")
                        . $this->spedUtil->preencheTexto($registroE116->getCodOr())
                        . $this->spedUtil->preencheValorDecimal($registroE116->getVlOr())
                        . $this->spedUtil->preencheData($registroE116->getDtVcto())
                        . $this->spedUtil->preencheTexto($registroE116->getCodRec())
                        . $this->spedUtil->preencheTexto($registroE116->getNumProc())
                        . $this->spedUtil->preencheTexto($registroE116->getIndProc())
                        . $this->spedUtil->preencheTexto($registroE116->getProc())
                        . $this->spedUtil->preencheTexto($registroE116->getTxtCompl())
                        . $this->spedUtil->getDelimitador()
                        . $this->spedUtil->getCrlf();
            } else {
                $registro .= $this->spedUtil->preencheTexto("E116")
                        . $this->spedUtil->preencheTexto($registroE116->getCodOr())
                        . $this->spedUtil->preencheValorDecimal($registroE116->getVlOr())
                        . $this->spedUtil->preencheData($registroE116->getDtVcto())
                        . $this->spedUtil->preencheTexto($registroE116->getCodRec())
                        . $this->spedUtil->preencheTexto($registroE116->getNumProc())
                        . $this->spedUtil->preencheTexto($registroE116->getIndProc())
                        . $this->spedUtil->preencheTexto($registroE116->getProc())
                        . $this->spedUtil->preencheTexto($registroE116->getTxtCompl())
                        . $this->spedUtil->preencheTexto($registroE116->getMesRef())
                        . $this->spedUtil->getDelimitador()
                        . $this->spedUtil->getCrlf();
            }
            $this->registroE990->setQtdLinE($this->registroE990->getQtdLinE() + 1);
            $this->numeroRegistroE116 += 1;
        }
        return $registro;
    }

    public function gravaRegistroE990() {
        $this->registroE990->setQtdLinE($this->registroE990->getQtdLinE() + 1);

        return $this->spedUtil->preencheTexto("E990")
                . $this->spedUtil->preencheValorInteiro($this->registroE990->getQtdLinE())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    /**
     * @return the registroE001
     */
    public function getRegistroE001() {
        return $this->registroE001;
    }

    /**
     * @return the listaRegistroE100
     */
    public function getListaRegistroE100() {
        return $this->listaRegistroE100;
    }

    /**
     * @return the registroE990
     */
    public function getRegistroE990() {
        return $this->registroE990;
    }

    /**
     * @return the numeroRegistroE110
     */
    public function getNumeroRegistroE110() {
        return $this->numeroRegistroE110;
    }

    /**
     * @return the numeroRegistroE116
     */
    public function getNumeroRegistroE116() {
        return $this->numeroRegistroE116;
    }
}
