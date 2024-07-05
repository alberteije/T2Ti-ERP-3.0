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
furnished to do so, subject to the following conditions:
 
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

class EFDBloco0  {
    
    private $registro0000;
    private $registro0001;
    private $registro0005;
    private $registro0100;
    private $listaRegistro0150;
    private $listaRegistro0175;
    private $listaRegistro0190;
    private $listaRegistro0200;
			
    private $registro0990;
    private $numeroRegistro0175;
    private $numeroRegistro0205;
    private $numeroRegistro0220;
			
    private $spedUtil;

    public function __construct()
    {
        $this->registro0000 = new EFDRegistro0000();
        $this->registro0001 = new EFDRegistro0001();
        $this->registro0001->setIndMov(1);
        $this->registro0005 = new EFDRegistro0005();
        $this->registro0100 = new EFDRegistro0100();
        $this->listaRegistro0150 = array();
        $this->listaRegistro0175 = array();
        $this->listaRegistro0190 = array();
        $this->listaRegistro0200 = array();

        $this->registro0990 = new EFDRegistro0990();
        $this->registro0990->setQtdLin0(0);

        $this->numeroRegistro0175 = 0;
        $this->numeroRegistro0205 = 0;
        $this->numeroRegistro0220 = 0;
		
        $this->numeroRegistro0175 = 0;
        $this->numeroRegistro0205 = 0;
        $this->numeroRegistro0220 = 0;

        $this->spedUtil = new SpedUtil;
    }

    public function gravaregistro0000() {
        $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);

        return $this->spedUtil->preencheTexto("0000")
                . $this->spedUtil->preencheTexto($this->registro0000->getCodVer())
                . $this->spedUtil->preencheTexto($this->registro0000->getCodFin())
                . $this->spedUtil->preencheData($this->registro0000->getDtIni())
                . $this->spedUtil->preencheData($this->registro0000->getDtFin())
                . $this->spedUtil->preencheTexto($this->registro0000->getNome())
                . $this->spedUtil->preencheTexto($this->registro0000->getCnpj())
                . $this->spedUtil->preencheTexto($this->registro0000->getCpf())
                . $this->spedUtil->preencheTexto($this->registro0000->getUf())
                . $this->spedUtil->preencheTexto($this->registro0000->getIe())
                . $this->spedUtil->preencheTexto($this->registro0000->getCodMun())
                . $this->spedUtil->preencheTexto($this->registro0000->getIm())
                . $this->spedUtil->preencheTexto($this->registro0000->getSuframa())
                . $this->spedUtil->preencheTexto($this->registro0000->getIndPerfil())
                . $this->spedUtil->preencheTexto($this->registro0000->getIndAtiv())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistro0001() {
        $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);

        return $this->spedUtil->preencheTexto("0001")
                . $this->spedUtil->preencheValorInteiro($this->registro0001->getIndMov())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistro0005() {
        $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);

        return $this->spedUtil->preencheTexto("0005")
                . $this->spedUtil->preencheTexto($this->registro0005->getFantasia())
                . $this->spedUtil->preencheTexto($this->registro0005->getCep())
                . $this->spedUtil->preencheTexto($this->registro0005->getEndereco())
                . $this->spedUtil->preencheTexto($this->registro0005->getNum())
                . $this->spedUtil->preencheTexto($this->registro0005->getCompl())
                . $this->spedUtil->preencheTexto($this->registro0005->getBairro())
                . $this->spedUtil->preencheTexto($this->registro0005->getFone())
                . $this->spedUtil->preencheTexto($this->registro0005->getFax())
                . $this->spedUtil->preencheTexto($this->registro0005->getEmail())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistro0100() {
        $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);

        return $this->spedUtil->preencheTexto("0100")
                . $this->spedUtil->preencheTexto($this->registro0100->getNome())
                . $this->spedUtil->preencheTexto($this->registro0100->getCpf())
                . $this->spedUtil->preencheTexto($this->registro0100->getCrc())
                . $this->spedUtil->preencheTexto($this->registro0100->getCnpj())
                . $this->spedUtil->preencheTexto($this->registro0100->getCep())
                . $this->spedUtil->preencheTexto($this->registro0100->getEndereco())
                . $this->spedUtil->preencheTexto($this->registro0100->getNum())
                . $this->spedUtil->preencheTexto($this->registro0100->getCompl())
                . $this->spedUtil->preencheTexto($this->registro0100->getBairro())
                . $this->spedUtil->preencheTexto($this->registro0100->getFone())
                . $this->spedUtil->preencheTexto($this->registro0100->getFax())
                . $this->spedUtil->preencheTexto($this->registro0100->getEmail())
                . $this->spedUtil->preencheTexto($this->registro0100->getCodMun())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistro0150() {
        $registro = "";
        foreach($this->listaRegistro0150 as $registro0150) {
            $registro .= $this->spedUtil->preencheTexto("0150")
                    . $this->spedUtil->preencheTexto($registro0150->getCodPart())
                    . $this->spedUtil->preencheTexto($registro0150->getNome())
                    . $this->spedUtil->preencheTexto($registro0150->getCodPais())
                    . $this->spedUtil->preencheTexto($registro0150->getCnpj())
                    . $this->spedUtil->preencheTexto($registro0150->getCpf())
                    . $this->spedUtil->preencheTexto($registro0150->getIe())
                    . $this->spedUtil->preencheTexto($registro0150->getCodMun())
                    . $this->spedUtil->preencheTexto($registro0150->getSuframa())
                    . $this->spedUtil->preencheTexto($registro0150->getEndereco())
                    . $this->spedUtil->preencheTexto($registro0150->getNum())
                    . $this->spedUtil->preencheTexto($registro0150->getCompl())
                    . $this->spedUtil->preencheTexto($registro0150->getBairro())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
            $registro .= $this->gravaRegistro0175($registro0150->getRegistro0175List());
        }
        return $registro;
    }

    private function gravaRegistro0175($listaRegistro0175) {
        $registro = "";
        foreach($this->listaRegistro0175 as $registro0175) {
            $registro .= $this->spedUtil->preencheTexto("0175")
                    . $this->spedUtil->preencheData($registro0175->getDtAlt())
                    . $this->spedUtil->preencheTexto($registro0175->getNrCampo())
                    . $this->spedUtil->preencheTexto($registro0175->getContAnt())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
            $this->numeroRegistro0175 += 1;
        }
        return $registro;
    }

    public function gravaRegistro0190() {
        $registro = "";
        foreach($this->listaRegistro0190 as $registro0190) {
            $registro .= $this->spedUtil->preencheTexto("0190")
                    . $this->spedUtil->preencheTexto($registro0190->getUnid())
                    . $this->spedUtil->preencheTexto($registro0190->getDescr())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
        }
        return $registro;
    }

    public function gravaRegistro0200() {
        $registro = "";
        foreach($this->listaRegistro0200 as $registro0200) {
            $registro .= $this->spedUtil->preencheTexto("0200")
                    . $this->spedUtil->preencheTexto($registro0200->getCodItem())
                    . $this->spedUtil->preencheTexto($registro0200->getDescrItem())
                    . $this->spedUtil->preencheTexto($registro0200->getCodBarra())
                    . $this->spedUtil->preencheTexto($registro0200->getCodAntItem())
                    . $this->spedUtil->preencheTexto($registro0200->getUnidInv())
                    . $this->spedUtil->preencheTexto($registro0200->getTipoItem())
                    . $this->spedUtil->preencheTexto($registro0200->getCodNcm())
                    . $this->spedUtil->preencheTexto($registro0200->getExIpi())
                    . $this->spedUtil->preencheTexto($registro0200->getCodGen())
                    . $this->spedUtil->preencheTexto($registro0200->getCodLst())
                    . $this->spedUtil->preencheTexto($registro0200->getAliqIcms())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
            $registro .= $this->gravaRegistro0205($registro0200->getRegistro0205List());
            $registro .= $this->gravaRegistro0220($registro0200->getRegistro0220List());
        }
        return $registro;
    }

    private function gravaRegistro0205($listaRegistro0205) {
        $registro = "";
        foreach($this->listaRegistro0205 as $registro0205) {
            $registro .= $this->spedUtil->preencheTexto("0205")
                    . $this->spedUtil->preencheTexto($registro0205->getDescrAntItem())
                    . $this->spedUtil->preencheData($registro0205->getDtIni())
                    . $this->spedUtil->preencheData($registro0205->getDtFin())
                    . $this->spedUtil->preencheTexto($registro0205->getCodAntItem())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
            $this->numeroRegistro0205 += 1;
        }
        return $registro;
    }

    private function gravaRegistro0220($listaRegistro0220) {
        $registro = "";
        foreach($this->listaRegistro0220 as $registro0220) {
            $registro .= $this->spedUtil->preencheTexto("0220")
                    . $this->spedUtil->preencheTexto($registro0220->getUnidConv())
                    . $this->spedUtil->preencheValorDecimal($registro0220->getFatConv())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
            $this->numeroRegistro0220 += 1;
        }
        return $registro;
    }

    public function gravaregistro0990() {
        $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);

        return $this->spedUtil->preencheTexto("0990")
                . $this->spedUtil->preencheValorInteiro($this->registro0990->getQtdLin0())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    /**
     * @return the  registro0000
     */
    public  function getRegistro0000() {
        return $this->registro0000;
    }

    /**
     * @return the registro0001
     */
    public function getRegistro0001() {
        return $this->registro0001;
    }

    /**
     * @return the registro0005
     */
    public function getRegistro0005() {
        return $this->registro0005;
    }

    /**
     * @return the registro0100
     */
    public function getRegistro0100() {
        return $this->registro0100;
    }

    /**
     * @return the listaRegistro0150
     */
    public function getListaRegistro0150() {
        return $this->listaRegistro0150;
    }

    /**
     * adiciona registro na listaRegistro0150
     */
    public function addRegistroLista0150($registro0150) {
        $this->listaRegistro0150[] = $registro0150;
    }

    /**
     * @return the listaRegistro0190
     */
    public function getListaRegistro0190() {
        return $this->listaRegistro0190;
    }

    /**
     * @return the listaRegistro0200
     */
    public function getListaRegistro0200() {
        return $this->listaRegistro0200;
    }

    /**
     * @return the $this->registro0990
     */
    public function getRegistro0990() {
        return $this->registro0990;
    }

    /**
     * @return the numeroRegistro0175
     */
    public function getNumeroRegistro0175() {
        return $this->numeroRegistro0175;
    }

    /**
     * @return the numeroRegistro0205
     */
    public function getNumeroRegistro0205() {
        return $this->numeroRegistro0205;
    }

    /**
     * @return the numeroRegistro0220
     */
    public function getNumeroRegistro0220() {
        return $this->numeroRegistro0220;
    }

}
