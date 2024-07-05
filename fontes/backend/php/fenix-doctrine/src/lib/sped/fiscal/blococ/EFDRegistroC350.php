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

class EFDRegistroC350  {
    
    private $ser; // Série do documento fiscal
    private $subSer; // Subsérie do documento fiscal
    private $numDoc; // Número do documento fiscal
    private $dtDoc; // Data da emissão do documento fiscal
    private $cnpjCpf; // CNPJ ou CPF do destinatário
    private $vlMerc; // Valor das mercadorias constantes no documento fiscal
    private $vlDoc; // Valor total do documento fiscal
    private $vlDesc; // Valor total do desconto
    private $vlPis; // Valor total do PIS
    private $vlCofins; // Valor total da COFINS
    private $codCta; // Código da conta analítica contábil debitada/creditada
    private $registroC370List; // BLOCO C - Lista de RegistroC370 (FILHO)
    private $registroC390List; // BLOCO C - Lista de RegistroC390 (FILHO)

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
     * @return the subSer
     */
    public function getSubSer() {
        return $this->subSer;
    }

    /**
     * @param subSer the subSer to set
     */
    public function setSubSer($subSer) {
        $this->subSer = $subSer;
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

    /**
     * @return the cnpjCpf
     */
    public function getCnpjCpf() {
        return $this->cnpjCpf;
    }

    /**
     * @param cnpjCpf the cnpjCpf to set
     */
    public function setCnpjCpf($cnpjCpf) {
        $this->cnpjCpf = $cnpjCpf;
    }

    /**
     * @return the vlMerc
     */
    public function  getVlMerc() {
        return $this->vlMerc;
    }

    /**
     * @param vlMerc the vlMerc to set
     */
    public function setVlMerc($vlMerc) {
        $this->vlMerc = $vlMerc;
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
     * @return the registroC390List
     */
    public function getRegistroC390List() {
        return $this->registroC390List;
    }

    /**
     * @param registroC390List the registroC390List to set
     */
    public function setRegistroC390List(array $registroC390List) {
        $this->registroC390List = $registroC390List;
    }

    /**
     * @return the registroC370List
     */
    public function getRegistroC370List() {
        return $this->registroC370List;
    }

    /**
     * @param registroC370List the registroC370List to set
     */
    public function setRegistroC370List(array $registroC370List) {
        $this->registroC370List = $registroC370List;
    }


}
