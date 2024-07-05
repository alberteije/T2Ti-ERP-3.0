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

class EFDRegistroC370  {
    
    private $numItem; // Número seqüencial do item no documento fiscal
    private $codItem; // Código do Item (campo 02 do registro 0200)
    private $qtd; // Quantidade do item
    private $unid; // Unidade do item (campo 02 do registro 0190)
    private $vlItem; // Valor total do item
    private $vlDesc; // Valor total do desconto no item

    /**
     * @return the numItem
     */
    public function getNumItem() {
        return $this->numItem;
    }

    /**
     * @param numItem the numItem to set
     */
    public function setNumItem($numItem) {
        $this->numItem = $numItem;
    }

    /**
     * @return the codItem
     */
    public function getCodItem() {
        return $this->codItem;
    }

    /**
     * @param codItem the codItem to set
     */
    public function setCodItem($codItem) {
        $this->codItem = $codItem;
    }

    /**
     * @return the qtd
     */
    public function  getQtd() {
        return $this->qtd;
    }

    /**
     * @param qtd the qtd to set
     */
    public function setQtd($qtd) {
        $this->qtd = $qtd;
    }

    /**
     * @return the unid
     */
    public function getUnid() {
        return $this->unid;
    }

    /**
     * @param unid the unid to set
     */
    public function setUnid($unid) {
        $this->unid = $unid;
    }

    /**
     * @return the vlItem
     */
    public function  getVlItem() {
        return $this->vlItem;
    }

    /**
     * @param vlItem the vlItem to set
     */
    public function setVlItem($vlItem) {
        $this->vlItem = $vlItem;
    }

    /**
     * @return the vlDesc
     */
    public function  getVlDesc() {
        return $this->vlDesc;
    }

    /**
     * @param vlDesc the vlDesc to set
     */
    public function setVlDesc($vlDesc) {
        $this->vlDesc = $vlDesc;
    }
}
