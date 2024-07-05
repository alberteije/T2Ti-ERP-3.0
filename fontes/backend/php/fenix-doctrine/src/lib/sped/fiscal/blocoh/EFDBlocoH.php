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

class EFDBlocoH  {

    private $registroH001;
    private $listaRegistroH005;
    private $registroH990;
    private $numeroRegistroH005;
    private $numeroRegistroH010;
    private $spedUtil;

    public function __construct()
    {
        $this->registroH001 = new EFDRegistroH001();
        $this->registroH001->setIndMov(1);

        $this->listaRegistroH005 = array();

        $this->registroH990 = new EFDRegistroH990();
        $this->registroH990->setQtdLinH(0);

        $this->numeroRegistroH005 = 0;
        $this->numeroRegistroH010 = 0;

        $this->spedUtil = new SpedUtil();
    }

    public function gravaRegistroH001() {
        $this->registroH990->setQtdLinH($this->registroH990->getQtdLinH() + 1);

        return $this->spedUtil->preencheTexto("H001")
                . $this->spedUtil->preencheValorInteiro($this->registroH001->getIndMov())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistroH005() {
        $registro = "";
        foreach ($this->listaRegistroH005 as $registroH005) {
            $registro .= $this->spedUtil->preencheTexto("H005")
                    . $this->spedUtil->preencheData($registroH005->getDtInv())
                    . $this->spedUtil->preencheValorDecimal($registroH005->getVlInv())
                    . $this->spedUtil->preencheTexto($registroH005->getMotInv())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroH990->setQtdLinH($this->registroH990->getQtdLinH() + 1);
            $this->numeroRegistroH005 += 1;
            $this->gravaRegistroH010($registroH005->getRegistroH010List());
        }
        return $registro;
    }

    private function gravaRegistroH010($listaRegistroH010) {
        $registro = "";
        foreach ($this->listaRegistroH010 as $registroH010) {
            $registro .= $this->spedUtil->preencheTexto("H010")
                    . $this->spedUtil->preencheTexto($registroH010->getCodItem())
                    . $this->spedUtil->preencheTexto($registroH010->getUnid())
                    . $this->spedUtil->preencheValorDecimal($registroH010->getQtd())
                    . $this->spedUtil->preencheValorDecimal($registroH010->getVlUnit())
                    . $this->spedUtil->preencheValorDecimal($registroH010->getVlItem())
                    . $this->spedUtil->preencheTexto($registroH010->getIndProp())
                    . $this->spedUtil->preencheTexto($registroH010->getCodPart())
                    . $this->spedUtil->preencheTexto($registroH010->getTxtCompl())
                    . $this->spedUtil->preencheTexto($registroH010->getCodCta())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroH990->setQtdLinH($this->registroH990->getQtdLinH() + 1);
            $this->numeroRegistroH010 += 1;
        }
        return $registro;
    }

    public function gravaRegistroH990() {
        $this->registroH990->setQtdLinH($this->registroH990->getQtdLinH() + 1);

        return $this->spedUtil->preencheTexto("H990")
                . $this->spedUtil->preencheValorInteiro($this->registroH990->getQtdLinH())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    /**
     * @return the registroH001
     */
    public function getRegistroH001() {
        return $this->registroH001;
    }

    /**
     * @return the registroH990
     */
    public function getRegistroH990() {
        return $this->registroH990;
    }

    public function getListaRegistroH005() {
        return $this->listaRegistroH005;
    }

    public function getNumeroRegistroH005() {
        return $this->numeroRegistroH005;
    }

    public function getNumeroRegistroH010() {
        return $this->numeroRegistroH010;
    }

}
