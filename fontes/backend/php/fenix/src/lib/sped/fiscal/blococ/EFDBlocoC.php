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

class EFDBlocoC  {
    
    private $registroC001;
    private $listaRegistroC100;
    private $listaRegistroC114;
    private $listaRegistroC300;
    private $listaRegistroC350;
    private $listaRegistroC400;
    private $listaRegistroC425;
    private $registroC990;
    private $numeroRegistroC170;
    private $numeroRegistroC190;
    private $numeroRegistroC310;
    private $numeroRegistroC320;
    private $numeroRegistroC321;
    private $numeroRegistroC370;
    private $numeroRegistroC390;
    private $numeroRegistroC405;
    private $numeroRegistroC420;
    private $numeroRegistroC460;
    private $numeroRegistroC470;
    private $numeroRegistroC490;
    private $spedUtil;

    public function __construct()
    {
        $this->registroC001 = new EFDRegistroC001();
        $this->registroC001->setIndMov(1);

        $this->listaRegistroC100 = array();
        $this->listaRegistroC114 = array();
        $this->listaRegistroC300 = array();
        $this->listaRegistroC350 = array();
        $this->listaRegistroC400 = array();
        $this->listaRegistroC425 = array();

        $this->registroC990 = new EFDRegistroC990();
        $this->registroC990->setQtdLinC(0);

        $this->numeroRegistroC170 = 0;
        $this->numeroRegistroC190 = 0;
        $this->numeroRegistroC310 = 0;
        $this->numeroRegistroC320 = 0;
        $this->numeroRegistroC321 = 0;
        $this->numeroRegistroC370 = 0;
        $this->numeroRegistroC390 = 0;
        $this->numeroRegistroC405 = 0;
        $this->numeroRegistroC420 = 0;
        $this->numeroRegistroC460 = 0;
        $this->numeroRegistroC470 = 0;
        $this->numeroRegistroC490 = 0;

        $this->spedUtil = new SpedUtil();
    }

    public function gravaRegistroC001() {
        $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);

        return $this->spedUtil->preencheTexto("C001")
                . $this->spedUtil->preencheValorInteiro($this->registroC001->getIndMov())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistroC100() {
        $registro = "";
        foreach ($this->listaRegistroC100 as $registroC100) {
            $registro .= $this->spedUtil->preencheTexto("C100")
                    . $this->spedUtil->preencheTexto($registroC100->getIndOper())
                    . $this->spedUtil->preencheTexto($registroC100->getIndEmit())
                    . $this->spedUtil->preencheTexto($registroC100->getCodPart())
                    . $this->spedUtil->preencheTexto($registroC100->getCodMod())
                    . $this->spedUtil->preencheTexto($registroC100->getCodSit())
                    . $this->spedUtil->preencheTexto($registroC100->getSer())
                    . $this->spedUtil->preencheTexto($registroC100->getNumDoc())
                    . $this->spedUtil->preencheTexto($registroC100->getChvNfe())
                    . $this->spedUtil->preencheData($registroC100->getDtDoc())
                    . $this->spedUtil->preencheData($registroC100->getDtES())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlDoc())
                    . $this->spedUtil->preencheTexto($registroC100->getIndPgto())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlDesc())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlAbatNt())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlMerc())
                    . $this->spedUtil->preencheTexto($registroC100->getIndFrt())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlFrt())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlSeg())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlOutDa())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlBcIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlBcIcmsSt())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlIcmsSt())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlIpi())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlPis())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlCofins())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlPisSt())
                    . $this->spedUtil->preencheValorDecimal($registroC100->getVlCofinsSt())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $registro .= $this->gravaRegistroC170($registroC100->getRegistroC170List());
            $registro .= $this->gravaRegistroC190($registroC100->getRegistroC190List());
        }
        return $registro;
    }

    public function gravaRegistroC114() {
        $registro = "";
        foreach ($this->listaRegistroC114 as $registroC114) {
            $registro .= $this->spedUtil->preencheTexto("C114")
                    . $this->spedUtil->preencheTexto($registroC114->getCodMod())
                    . $this->spedUtil->preencheTexto($registroC114->getEcfFab())
                    . $this->spedUtil->preencheTexto($registroC114->getEcfCx())
                    . $this->spedUtil->preencheTexto($registroC114->getNumDoc())
                    . $this->spedUtil->preencheData($registroC114->getDtDoc())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
        }
        return $registro;
    }

    private function gravaRegistroC170($listaRegistroC170) {
        $registro = "";
        foreach ($this->listaRegistroC170 as $registroC170) {
            $registro .= $this->spedUtil->preencheTexto("C170")
                    . $this->spedUtil->preencheTexto($registroC170->getNumItem())
                    . $this->spedUtil->preencheTexto($registroC170->getCodItem())
                    . $this->spedUtil->preencheTexto($registroC170->getDescrCompl())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getQtd())
                    . $this->spedUtil->preencheTexto($registroC170->getUnid())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlItem())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlDesc())
                    . $this->spedUtil->preencheValorInteiro($registroC170->getIndMov())
                    . $this->spedUtil->preencheTexto($registroC170->getCstIcms())
                    . $this->spedUtil->preencheTexto($registroC170->getCfop())
                    . $this->spedUtil->preencheTexto($registroC170->getCodNat())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlBcIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getAliqIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlBcIcmsSt())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getAliqSt())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlIcmsSt())
                    . $this->spedUtil->preencheValorInteiro($registroC170->getIndApur())
                    . $this->spedUtil->preencheTexto($registroC170->getCstIpi())
                    . $this->spedUtil->preencheTexto($registroC170->getCodEnq())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlBcIpi())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getAliqIpi())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlIpi())
                    . $this->spedUtil->preencheTexto($registroC170->getCstPis())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlBcPis())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getAliqPisPerc())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getQuantBcPis())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getAliqPisR())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlPis())
                    . $this->spedUtil->preencheTexto($registroC170->getCstCofins())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlBcCofins())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getAliqCofinsPerc())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getQuantBcCofins())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getAliqCofinsR())
                    . $this->spedUtil->preencheValorDecimal($registroC170->getVlCofins())
                    . $this->spedUtil->preencheTexto($registroC170->getCodCta())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC170 += 1;
        }
        return $registro;
    }

    private function gravaRegistroC190($listaRegistroC190) {
        $registro = "";
        foreach ($this->listaRegistroC190 as $registroC190) {
            $registro .= $this->spedUtil->preencheTexto("C190")
                    . $this->spedUtil->preencheTexto($registroC190->getCstIcms())
                    . $this->spedUtil->preencheValorInteiro($registroC190->getCfop())
                    . $this->spedUtil->preencheValorDecimal($registroC190->getAliqIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC190->getVlOpr())
                    . $this->spedUtil->preencheValorDecimal($registroC190->getVlBcIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC190->getVlIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC190->getVlBcIcmsSt())
                    . $this->spedUtil->preencheValorDecimal($registroC190->getVlIcmsSt())
                    . $this->spedUtil->preencheValorDecimal($registroC190->getVlRedBc())
                    . $this->spedUtil->preencheValorDecimal($registroC190->getVlIpi())
                    . $this->spedUtil->preencheTexto($registroC190->getCodObs())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC190 += 1;
        }
        return $registro;
    }

    public function gravaRegistroC300() {
        $registro = "";
        foreach ($this->listaRegistroC300 as $registroC300) {
            $registro .= $this->spedUtil->preencheTexto("C300")
                    . $this->spedUtil->preencheTexto($registroC300->getCodMod())
                    . $this->spedUtil->preencheTexto($registroC300->getSer())
                    . $this->spedUtil->preencheTexto($registroC300->getSub())
                    . $this->spedUtil->preencheTexto($registroC300->getNumDocIni())
                    . $this->spedUtil->preencheTexto($registroC300->getNumDocFin())
                    . $this->spedUtil->preencheData($registroC300->getDtDoc())
                    . $this->spedUtil->preencheValorDecimal($registroC300->getVlDoc())
                    . $this->spedUtil->preencheValorDecimal($registroC300->getVlPis())
                    . $this->spedUtil->preencheValorDecimal($registroC300->getVlCofins())
                    . $this->spedUtil->preencheTexto($registroC300->getCodCta())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $registro .= $this->gravaRegistroC310($registroC300->getRegistroC310List());
            $registro .= $this->gravaRegistroC320($registroC300->getRegistroC320List());
        }
        return $registro;
    }

    private function gravaRegistroC310($listaRegistroC310) {
        $registro = "";
        foreach ($this->listaRegistroC310 as $registroC310) {
            $registro .= $this->spedUtil->preencheTexto("C310")
                    . $this->spedUtil->preencheTexto($registroC310->getNumDocCanc())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC310 += 1;
        }
        return $registro;
    }

    private function gravaRegistroC320($listaRegistroC320) {
        $registro = "";
        foreach ($this->listaRegistroC320 as $registroC320) {
            $registro .= $this->spedUtil->preencheTexto("C320")
                    . $this->spedUtil->preencheTexto($registroC320->getCstIcms())
                    . $this->spedUtil->preencheTexto($registroC320->getCfop())
                    . $this->spedUtil->preencheValorDecimal($registroC320->getAliqIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC320->getVlOpr())
                    . $this->spedUtil->preencheValorDecimal($registroC320->getVlBcIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC320->getVlIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC320->getVlRedBc())
                    . $this->spedUtil->preencheTexto($registroC320->getCodObs())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC320 += 1;
            $registro .= $this->gravaRegistroC321($registroC320->getRegistroC321List());
        }
        return $registro;
    }

    private function gravaRegistroC321($listaRegistroC321) {
        $registro = "";
        foreach ($this->listaRegistroC321 as $registroC321) {
            $registro .= $this->spedUtil->preencheTexto("C321")
                    . $this->spedUtil->preencheTexto($registroC321->getCodItem())
                    . $this->spedUtil->preencheValorDecimal($registroC321->getQtd())
                    . $this->spedUtil->preencheTexto($registroC321->getUnid())
                    . $this->spedUtil->preencheValorDecimal($registroC321->getVlItem())
                    . $this->spedUtil->preencheValorDecimal($registroC321->getVlDesc())
                    . $this->spedUtil->preencheValorDecimal($registroC321->getVlBcIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC321->getVlIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC321->getVlPis())
                    . $this->spedUtil->preencheValorDecimal($registroC321->getVlCofins())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC321 += 1;
        }
        return $registro;
    }

    public function gravaRegistroC350() {
        $registro = "";
        foreach ($this->listaRegistroC350 as $registroC350) {
            $registro .= $this->spedUtil->preencheTexto("C350")
                    . $this->spedUtil->preencheTexto($registroC350->getSer())
                    . $this->spedUtil->preencheTexto($registroC350->getSubSer())
                    . $this->spedUtil->preencheTexto($registroC350->getNumDoc())
                    . $this->spedUtil->preencheData($registroC350->getDtDoc())
                    . $this->spedUtil->preencheTexto($registroC350->getCnpjCpf())
                    . $this->spedUtil->preencheValorDecimal($registroC350->getVlMerc())
                    . $this->spedUtil->preencheValorDecimal($registroC350->getVlDoc())
                    . $this->spedUtil->preencheValorDecimal($registroC350->getVlDesc())
                    . $this->spedUtil->preencheValorDecimal($registroC350->getVlPis())
                    . $this->spedUtil->preencheTexto($registroC350->getCodCta())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $registro .= $this->gravaRegistroC370($registroC350->getRegistroC370List());
            $registro .= $this->gravaRegistroC390($registroC350->getRegistroC390List());
        }
        return $registro;
    }

    private function gravaRegistroC370($listaRegistroC370) {
        $registro = "";
        foreach ($this->listaRegistroC370 as $registroC370) {
            $registro .= $this->spedUtil->preencheTexto("C370")
                    . $this->spedUtil->preencheTexto($registroC370->getNumItem())
                    . $this->spedUtil->preencheTexto($registroC370->getCodItem())
                    . $this->spedUtil->preencheValorDecimal($registroC370->getQtd())
                    . $this->spedUtil->preencheTexto($registroC370->getUnid())
                    . $this->spedUtil->preencheValorDecimal($registroC370->getVlItem())
                    . $this->spedUtil->preencheValorDecimal($registroC370->getVlDesc())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC370 += 1;
        }
        return $registro;
    }

    private function gravaRegistroC390($listaRegistroC390) {
        $registro = "";
        foreach ($this->listaRegistroC390 as $registroC390) {
            $registro .= $this->spedUtil->preencheTexto("C390")
                    . $this->spedUtil->preencheTexto($registroC390->getCstIcms())
                    . $this->spedUtil->preencheTexto($registroC390->getCfop())
                    . $this->spedUtil->preencheValorDecimal($registroC390->getAliqIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC390->getVlOpr())
                    . $this->spedUtil->preencheValorDecimal($registroC390->getVlBcIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC390->getVlIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC390->getVlRedBc())
                    . $this->spedUtil->preencheTexto($registroC390->getCodObs())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC390 += 1;
        }
        return $registro;
    }

    public function gravaRegistroC400() {
        $registro = "";
        foreach ($this->listaRegistroC400 as $registroC400) {
            $registro .= $this->spedUtil->preencheTexto("C400")
                    . $this->spedUtil->preencheTexto($registroC400->getCodMod())
                    . $this->spedUtil->preencheTexto($registroC400->getEcfMod())
                    . $this->spedUtil->preencheTexto($registroC400->getEcfFab())
                    . $this->spedUtil->preencheTexto($registroC400->getEcfCx())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $registro .= $this->gravaRegistroC405($registroC400->getRegistroC405List());
        }
        return $registro;
    }

    private function gravaRegistroC405($listaRegistroC405) {
        $registro = "";
        foreach ($this->listaRegistroC405 as $registroC405) {
            $registro .= $this->spedUtil->preencheTexto("C405")
                    . $this->spedUtil->preencheData($registroC405->getDtDoc())
                    . $this->spedUtil->preencheValorInteiro($registroC405->getCro())
                    . $this->spedUtil->preencheValorInteiro($registroC405->getCrz())
                    . $this->spedUtil->preencheValorInteiro($registroC405->getNumCooFin())
                    . $this->spedUtil->preencheValorDecimal($registroC405->getGtFin())
                    . $this->spedUtil->preencheValorDecimal($registroC405->getVlBrt())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC405 += 1;
            $registro .= $this->gravaRegistroC420($registroC405->getRegistroC420List());
            $registro .= $this->gravaRegistroC460($registroC405->getRegistroC460List());
            $registro .= $this->gravaRegistroC490($registroC405->getRegistroC490List());
        }
        return $registro;
    }

    private function gravaRegistroC420($listaRegistroC420) {
        $registro = "";
        foreach ($this->listaRegistroC420 as $registroC420) {
            $registro .= $this->spedUtil->preencheTexto("C420")
                    . $this->spedUtil->preencheTexto($registroC420->getCodTotPar())
                    . $this->spedUtil->preencheValorDecimal($registroC420->getVlrAcumTot())
                    . $this->spedUtil->preencheValorInteiro($registroC420->getNrTot())
                    . $this->spedUtil->preencheTexto($registroC420->getDescrNrTot())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC420 += 1;
        }
        return $registro;
    }

    public function gravaRegistroC425() {
        $registro = "";
        foreach ($this->listaRegistroC425 as $registroC425) {
            $registro .= $this->spedUtil->preencheTexto("C425")
                    . $this->spedUtil->preencheTexto($registroC425->getCodItem())
                    . $this->spedUtil->preencheValorDecimal($registroC425->getQtd())
                    . $this->spedUtil->preencheTexto($registroC425->getUnid())
                    . $this->spedUtil->preencheValorDecimal($registroC425->getVlItem())
                    . $this->spedUtil->preencheValorDecimal($registroC425->getVlPis())
                    . $this->spedUtil->preencheValorDecimal($registroC425->getVlCofins())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
        }
        return $registro;
    }

    private function gravaRegistroC460($listaRegistroC460) {
        $registro = "";
        foreach ($this->listaRegistroC460 as $registroC460) {
            $registro .= $this->spedUtil->preencheTexto("C460")
                    . $this->spedUtil->preencheTexto($registroC460->getCodMod())
                    . $this->spedUtil->preencheTexto($registroC460->getCodSit())
                    . $this->spedUtil->preencheTexto($registroC460->getNumDoc())
                    . $this->spedUtil->preencheData($registroC460->getDtDoc())
                    . $this->spedUtil->preencheValorDecimal($registroC460->getVlDoc())
                    . $this->spedUtil->preencheValorDecimal($registroC460->getVlPis())
                    . $this->spedUtil->preencheValorDecimal($registroC460->getVlCofins())
                    . $this->spedUtil->preencheTexto($registroC460->getCpfCnpj())
                    . $this->spedUtil->preencheTexto($registroC460->getNomAdq())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC460 += 1;
            $this->gravaRegistroC470($registroC460->getRegistroC470List());
        }
        return $registro;
    }

    private function gravaRegistroC470($listaRegistroC470) {
        $registro = "";
        foreach ($this->listaRegistroC470 as $registroC470) {
            $registro .= $this->spedUtil->preencheTexto("C470")
                    . $this->spedUtil->preencheTexto($registroC470->getCodItem())
                    . $this->spedUtil->preencheValorDecimal($registroC470->getQtd())
                    . $this->spedUtil->preencheValorDecimal($registroC470->getQtdCanc())
                    . $this->spedUtil->preencheTexto($registroC470->getUnid())
                    . $this->spedUtil->preencheValorDecimal($registroC470->getVlItem())
                    . $this->spedUtil->preencheTexto($registroC470->getCstIcms())
                    . $this->spedUtil->preencheTexto($registroC470->getCfop())
                    . $this->spedUtil->preencheValorDecimal($registroC470->getAliqIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC470->getVlPis())
                    . $this->spedUtil->preencheValorDecimal($registroC470->getVlCofins())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC470 += 1;
        }
        return $registro;
    }

    private function gravaRegistroC490($listaRegistroC490) {
        $registro = "";
        foreach ($this->listaRegistroC490 as $registroC490) {
            $registro .= $this->spedUtil->preencheTexto("C490")
                    . $this->spedUtil->preencheTexto($registroC490->getCstIcms())
                    . $this->spedUtil->preencheTexto($registroC490->getCfop())
                    . $this->spedUtil->preencheValorDecimal($registroC490->getAliqIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC490->getVlOpr())
                    . $this->spedUtil->preencheValorDecimal($registroC490->getVlBcIcms())
                    . $this->spedUtil->preencheValorDecimal($registroC490->getVlIcms())
                    . $this->spedUtil->preencheTexto($registroC490->getCodObs())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);
            $this->numeroRegistroC490 += 1;
        }
        return $registro;
    }

    public function gravaRegistroC990() {
        $this->registroC990->setQtdLinC($this->registroC990->getQtdLinC() + 1);

        return $this->spedUtil->preencheTexto("C990")
                . $this->spedUtil->preencheValorInteiro($this->registroC990->getQtdLinC())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    /**
     * @return the registroC001
     */
    public function getRegistroC001() {
        return $this->registroC001;
    }

    /**
     * @return the listaRegistroC100
     */
    public function getListaRegistroC100() {
        return $this->listaRegistroC100;
    }

    /**
     * adiciona registro na listaRegistroC114
     */
    public function addRegistroListaC114($registroC114) {
        $this->listaRegistroC114[] = $registroC114;
    }

    /**
     * @return the listaRegistroC114
     */
    public function getListaRegistroC114() {
        return $this->listaRegistroC114;
    }

    /**
     * @return the listaRegistroC300
     */
    public function getListaRegistroC300() {
        return $this->listaRegistroC300;
    }

    /**
     * @return the listaRegistroC350
     */
    public function getListaRegistroC350() {
        return $this->listaRegistroC350;
    }

    /**
     * @return the listaRegistroC400
     */
    public function getListaRegistroC400() {
        return $this->listaRegistroC400;
    }

    /**
     * @return the listaRegistroC425
     */
    public function getListaRegistroC425() {
        return $this->listaRegistroC425;
    }

    /**
     * @return the registroC990
     */
    public function getRegistroC990() {
        return $this->registroC990;
    }

    /**
     * adiciona registro na listaRegistroC170
     */
    public function addRegistroListaC170($registroC170) {
        $this->listaRegistroC170[] = $registroC170;
    }

    /**
     * @return the numeroRegistroC170
     */
    public function getNumeroRegistroC170() {
        return $this->numeroRegistroC170;
    }

    /**
     * @return the numeroRegistroC190
     */
    public function getNumeroRegistroC190() {
        return $this->numeroRegistroC190;
    }

    /**
     * @return the numeroRegistroC310
     */
    public function getNumeroRegistroC310() {
        return $this->numeroRegistroC310;
    }

    /**
     * @return the numeroRegistroC320
     */
    public function getNumeroRegistroC320() {
        return $this->numeroRegistroC320;
    }

    /**
     * @return the numeroRegistroC321
     */
    public function getNumeroRegistroC321() {
        return $this->numeroRegistroC321;
    }

    /**
     * @return the numeroRegistroC370
     */
    public function getNumeroRegistroC370() {
        return $this->numeroRegistroC370;
    }

    /**
     * @return the numeroRegistroC390
     */
    public function getNumeroRegistroC390() {
        return $this->numeroRegistroC390;
    }

    /**
     * @return the numeroRegistroC405
     */
    public function getNumeroRegistroC405() {
        return $this->numeroRegistroC405;
    }

    /**
     * @return the numeroRegistroC420
     */
    public function getNumeroRegistroC420() {
        return $this->numeroRegistroC420;
    }

    /**
     * @return the numeroRegistroC460
     */
    public function getNumeroRegistroC460() {
        return $this->numeroRegistroC460;
    }

    /**
     * @return the numeroRegistroC470
     */
    public function getNumeroRegistroC470() {
        return $this->numeroRegistroC470;
    }

    /**
     * @return the numeroRegistroC490
     */
    public function getNumeroRegistroC490() {
        return $this->numeroRegistroC490;
    }
}
