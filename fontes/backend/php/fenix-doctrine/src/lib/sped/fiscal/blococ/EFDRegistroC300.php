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

class EFDRegistroC300  {
    
    private $codMod; // Código do modelo do documento fiscal, conforme a Tabela 4.1.1
    private $ser; // Série do documento fiscal
    private $sub; // Subsérie do documento fiscal
    private $numDocIni; // Número do documento fiscal inicial
    private $numDocFin; // Número do documento fiscal final
    private $dtDoc; // Data da emissão dos documentos fiscais
    private $vlDoc; // Valor total dos documentos
    private $vlPis; // Valor total do PIS
    private $vlCofins; // Valor total da COFINS
    private $codCta; // Código da conta analítica contábil debitada/creditada
    private $registroC310List;
    private $registroC320List;

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
     * @return the ser
     */
    public function getSer() {
        return $this->ser;
    }

    /**
     * @param ser the ser to set
     */
    public function setSer($ser) {
        $this->ser = $ser;
    }

    /**
     * @return the sub
     */
    public function getSub() {
        return $this->sub;
    }

    /**
     * @param sub the sub to set
     */
    public function setSub($sub) {
        $this->sub = $sub;
    }

    /**
     * @return the numDocIni
     */
    public function getNumDocIni() {
        return $this->numDocIni;
    }

    /**
     * @param numDocIni the numDocIni to set
     */
    public function setNumDocIni($numDocIni) {
        $this->numDocIni = $numDocIni;
    }

    /**
     * @return the numDocFin
     */
    public function getNumDocFin() {
        return $this->numDocFin;
    }

    /**
     * @param numDocFin the numDocFin to set
     */
    public function setNumDocFin($numDocFin) {
        $this->numDocFin = $numDocFin;
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

    /**
     * @return the vlDoc
     */
    public function  getVlDoc() {
        return $this->vlDoc;
    }

    /**
     * @param vlDoc the vlDoc to set
     */
    public function setVlDoc($vlDoc) {
        $this->vlDoc = $vlDoc;
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

    /**
     * @return the codCta
     */
    public function getCodCta() {
        return $this->codCta;
    }

    /**
     * @param codCta the codCta to set
     */
    public function setCodCta($codCta) {
        $this->codCta = $codCta;
    }

    /**
     * @return the registroC310List
     */
    public function getRegistroC310List() {
        return $this->registroC310List;
    }

    /**
     * @param registroC310List the registroC310List to set
     */
    public function setRegistroC310List(array $registroC310List) {
        $this->registroC310List = $registroC310List;
    }

    /**
     * @return the registroC320List
     */
    public function getRegistroC320List() {
        return $this->registroC320List;
    }

    /**
     * @param registroC320List the registroC320List to set
     */
    public function setRegistroC320List(array $registroC320List) {
        $this->registroC320List = $registroC320List;
    }

}
