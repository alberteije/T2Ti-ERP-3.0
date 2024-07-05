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

class EFDBloco9  {

    private $registro9001;
    private $listaRegistro9900;
    private $registro9990;
    private $registro9999;
    private $spedUtil;

    public function __construct()
    {
        $this->registro9001 = new EFDRegistro9001();
        $this->registro9001->setIndMov(1);
        $this->listaRegistro9900 = array();
        $this->registro9990 = new EFDRegistro9990();
        $this->registro9999 = new EFDRegistro9999();

        $this->registro9990->setQtdLin9(0);

        $this->spedUtil = new SpedUtil();
    }

    public function limpaRegistros(){
        $this->listaRegistro9900 = array();

        $this->registro9990->setQtdLin9(0);
    }

    public function gravaRegistro9001(){
        $this->registro9990->setQtdLin9($this->registro9990->getQtdLin9() + 1);
        
        return $this->spedUtil->preencheTexto("9001") .
                $this->spedUtil->preencheValorInteiro($this->registro9001->getIndMov()) .
                $this->spedUtil->getDelimitador() .
                $this->spedUtil->getCrlf();
    }

    public function gravaRegistro9900(){
        $registro = "";
        foreach ($this->listaRegistro9900 as $registro9900){
            $registro .= $this->spedUtil->preencheTexto("9900") .
                    $this->spedUtil->preencheTexto($registro9900->getRegBlc()) .
                    $this->spedUtil->preencheValorInteiro($registro9900->getQtdRegBlc()) .
                    $this->spedUtil->getDelimitador() .
                    $this->spedUtil->getCrlf();
        }
        $this->registro9990->setQtdLin9($this->registro9990->getQtdLin9() + count($this->listaRegistro9900) + 2);
        return $registro;
    }

    public function gravaRegistro9990(){
        return $this->spedUtil->preencheTexto("9990") .
                $this->spedUtil->preencheValorInteiro($this->registro9990->getQtdLin9()) .
                $this->spedUtil->getDelimitador() .
                $this->spedUtil->getCrlf();
    }

    public function gravaRegistro9999(){
        return $this->spedUtil->preencheTexto("9999") .
                $this->spedUtil->preencheValorInteiro($this->registro9999->getQtdLin()) .
                $this->spedUtil->getDelimitador() .
                $this->spedUtil->getCrlf();
    }

    public function adicionaRegistro9900($registro9900) {
        $this->listaRegistro9900[] = $registro9900;
    }
        
    /**
     * @return the registro9001
     */
    public function getRegistro9001() {
        return $this->registro9001;
    }

    /**
     * @return the listaRegistro9900
     */
    public function getListaRegistro9900() {
        return $this->listaRegistro9900;
    }

    /**
     * @return the registro9990
     */
    public function getRegistro9990() {
        return $this->registro9990;
    }

    /**
     * @return the registro9999
     */
    public function getRegistro9999() {
        return $this->registro9999;
    }
}
