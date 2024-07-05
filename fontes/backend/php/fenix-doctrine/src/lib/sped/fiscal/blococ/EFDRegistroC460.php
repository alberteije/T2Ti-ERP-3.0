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

class EFDRegistroC460  {
    
    private $codMod; // Código do modelo do documento fiscal, conforme a Tabela 4.1.1
    private $codSit; // Código da situação do documento fiscal, conforme a Tabela 4.1.2
    private $numDoc; // Número do documento fiscal (COO)
    private $dtDoc; // Data da emissão do documento fiscal
    private $vlDoc; // Valor total do documento fiscal
    private $vlPis; // Valor do PIS
    private $vlCofins; // Valor da COFINS
    private $cpfCnpj; // CPF ou CNPJ do adquirente
    private $nomAdq; // Nome do adquirente
    private $registroC470List; // BLOCO C - Lista de RegistroC110 (FILHO)

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
     * @return the codSit
     */
    public function getCodSit() {
        return $this->codSit;
    }

    /**
     * @param codSit the codSit to set
     */
    public function setCodSit($codSit) {
        $this->codSit = $codSit;
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
     * @return the cpfCnpj
     */
    public function getCpfCnpj() {
        return $this->cpfCnpj;
    }

    /**
     * @param cpfCnpj the cpfCnpj to set
     */
    public function setCpfCnpj($cpfCnpj) {
        $this->cpfCnpj = $cpfCnpj;
    }

    /**
     * @return the nomAdq
     */
    public function getNomAdq() {
        return $this->nomAdq;
    }

    /**
     * @param nomAdq the nomAdq to set
     */
    public function setNomAdq($nomAdq) {
        $this->nomAdq = $nomAdq;
    }

    /**
     * @return the registroC470List
     */
    public function getRegistroC470List() {
        return $this->registroC470List;
    }

    /**
     * @param registroC470List the registroC470List to set
     */
    public function setRegistroC470List(array $registroC470List) {
        $this->registroC470List = $registroC470List;
    }


}
