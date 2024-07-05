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

class EFDRegistroC114  {
    
    private $codMod; // Código do modelo do documento fiscal, conforme a tabela indicada no item 4.1.1
    private $ecfFab; // Número de série de fabricação do ECF
    private $ecfCx; // Número do caixa atribuído ao ECF
    private $numDoc; // Número do documento fiscal
    private $dtDoc; // Data da emissão do documento fiscal

    /**
     * @return the codMod
     */
    public function getCodMod() {
        return $this->codMod;
    }

    /**
     * @param codMod the codMod to set
     */
    public function setCodMod($codMod) {
        $this->codMod = $codMod;
    }

    /**
     * @return the ecfFab
     */
    public function getEcfFab() {
        return $this->ecfFab;
    }

    /**
     * @param ecfFab the ecfFab to set
     */
    public function setEcfFab($ecfFab) {
        $this->ecfFab = $ecfFab;
    }

    /**
     * @return the ecfCx
     */
    public function getEcfCx() {
        return $this->ecfCx;
    }

    /**
     * @param ecfCx the ecfCx to set
     */
    public function setEcfCx($ecfCx) {
        $this->ecfCx = $ecfCx;
    }

    /**
     * @return the numDoc
     */
    public function getNumDoc() {
        return $this->numDoc;
    }

    /**
     * @param numDoc the numDoc to set
     */
    public function setNumDoc($numDoc) {
        $this->numDoc = $numDoc;
    }

    /**
     * @return the dtDoc
     */
    public function getDtDoc() {
        return $this->dtDoc;
    }

    /**
     * @param dtDoc the dtDoc to set
     */
    public function setDtDoc($dtDoc) {
        $this->dtDoc = $dtDoc;
    }

}
