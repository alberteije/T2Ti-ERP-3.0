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

class EFDRegistroC470  {
    
    private $codItem; // Código do item (campo 02 do Registro 0200)
    private $qtd; // Quantidade do item
    private $qtdCanc; // Quantidade cancelada, no caso de cancelamento parcial de item
    private $unid; // Unidade do item (Campo 02 do registro 0190)
    private $vlItem; // Valor do item
    private $cstIcms; // Código da Situação Tributária, conforme a Tabela indicada no item 4.3.1.
    private $cfop; // Código Fiscal de Operação e Prestação
    private $aliqIcms; // Alíquota do ICMS - Carga tributária efetiva em percentual
    private $vlPis; // Valor do PIS
    private $vlCofins; // Valor da COFINS

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
     * @return the qtdCanc
     */
    public function  getQtdCanc() {
        return $this->qtdCanc;
    }

    /**
     * @param qtdCanc the qtdCanc to set
     */
    public function setQtdCanc($qtdCanc) {
        $this->qtdCanc = $qtdCanc;
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
     * @return the cstIcms
     */
    public function getCstIcms() {
        return $this->cstIcms;
    }

    /**
     * @param cstIcms the cstIcms to set
     */
    public function setCstIcms($cstIcms) {
        $this->cstIcms = $cstIcms;
    }

    /**
     * @return the cfop
     */
    public function getCfop() {
        return $this->cfop;
    }

    /**
     * @param cfop the cfop to set
     */
    public function setCfop($cfop) {
        $this->cfop = $cfop;
    }

    /**
     * @return the aliqIcms
     */
    public function  getAliqIcms() {
        return $this->aliqIcms;
    }

    /**
     * @param aliqIcms the aliqIcms to set
     */
    public function setAliqIcms($aliqIcms) {
        $this->aliqIcms = $aliqIcms;
    }

    /**
     * @return the vlPis
     */
    public function  getVlPis() {
        return $this->vlPis;
    }

    /**
     * @param vlPis the vlPis to set
     */
    public function setVlPis($vlPis) {
        $this->vlPis = $vlPis;
    }

    /**
     * @return the vlCofins
     */
    public function  getVlCofins() {
        return $this->vlCofins;
    }

    /**
     * @param vlCofins the vlCofins to set
     */
    public function setVlCofins($vlCofins) {
        $this->vlCofins = $vlCofins;
    }
}
