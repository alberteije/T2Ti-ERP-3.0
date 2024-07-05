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

class EFDBloco1  {

    private $registro1001;
    private $listaRegistro1010;
    private $registro1990;
    private $numeroRegistro1010;
    private $spedUtil;

    public function __construct()
    {
        $this->registro1001 = new EFDRegistro1001();
        $this->registro1001->setIndMov(1);

        $this->listaRegistro1010 = array();

        $this->registro1990 = new EFDRegistro1990();
        $this->registro1990->setQtdLin1(0);

        $this->numeroRegistro1010 = 0;

        $this->spedUtil = new SpedUtil();
    }

    public function gravaRegistro1001() {
        $this->registro1990->setQtdLin1($this->registro1990->getQtdLin1() + 1);

        return $this->spedUtil->preencheTexto("1001")
                . $this->spedUtil->preencheValorInteiro($this->registro1001->getIndMov())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistro1010() {
        $registro = "";
        foreach($this->listaRegistro1010 as $registro1010) {
            $registro .= $this->spedUtil->preencheTexto("1010")
                    . $this->spedUtil->preencheTexto($registro1010->getIndExp())
                    . $this->spedUtil->preencheTexto($registro1010->getIndCcrf())
                    . $this->spedUtil->preencheTexto($registro1010->getIndComb())
                    . $this->spedUtil->preencheTexto($registro1010->getIndUsina())
                    . $this->spedUtil->preencheTexto($registro1010->getIndVa())
                    . $this->spedUtil->preencheTexto($registro1010->getIndEe())
                    . $this->spedUtil->preencheTexto($registro1010->getIndCart())
                    . $this->spedUtil->preencheTexto($registro1010->getIndForm())
                    . $this->spedUtil->preencheTexto($registro1010->getIndAer())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registro1990->setQtdLin1($this->registro1990->getQtdLin1() + 1);
            $this->numeroRegistro1010 += 1;
        }
        return $registro;
    }

    public function gravaRegistro1990() {
        $this->registro1990->setQtdLin1($this->registro1990->getQtdLin1() + 1);

        return $this->spedUtil->preencheTexto("1990")
                . $this->spedUtil->preencheValorInteiro($this->registro1990->getQtdLin1())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function getRegistro1001() {
        return $this->registro1001;
    }

    public function getRegistro1990() {
        return $this->registro1990;
    }

    /**
     * adiciona registro na listaRegistro1010
     */
    public function addRegistroLista1010($registro1010) {
        $this->listaRegistro1010[] = $registro1010;
    }

    public function getListaRegistro1010() {
        return $this->listaRegistro1010;
    }

    public function getNumeroRegistro1010() {
        return $this->numeroRegistro1010;
    }
}
