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

class EFDRegistroC100  {

    private $indOper; // Indicador do tipo de operação
    private $indEmit; // Indicador do emitente do documento fiscal
    private $codPart; // Código do participante (campo 02 do Registro 0150)
    private $codMod; // Código do modelo do documento fiscal, conforme a Tabela 4.1.1
    private $codSit; // Código da situação do documento fiscal, conforme a Tabela 4.1.2
    private $ser; // Série do documento fiscal
    private $numDoc; // Número do documento fiscal
    private $chvNfe; // Chave da Nota Fiscal Eletrônica
    private $dtDoc; // Data da emissão do documento fiscal
    private $dtES; // Data da entrada ou da saída
    private $vlDoc; // Valor total do documento fiscal
    private $indPgto; // Indicador do tipo de pagamento
    private $vlDesc; // Valor total do desconto // Prates
    private $vlAbatNt; // Abatimento não tributado e não comercial Ex. desconto ICMS nas remessas para ZFM
    private $vlMerc; // Valor das mercadorias constantes no documento fiscal
    private $indFrt; // Indicador do tipo do frete
    private $vlFrt; // Valor do frete indicado no documento fiscal
    private $vlSeg; // Valor do seguro indicado no documento fiscal
    private $vlOutDa; // Valor de outras despesas acessórias
    private $vlBcIcms; // Valor da base de cálculo do ICMS
    private $vlIcms; // Valor do ICMS
    private $vlBcIcmsSt; // Valor da base de cálculo do ICMS substituição tributária
    private $vlIcmsSt; // Valor do ICMS retido por substituição tributária
    private $vlIpi; // Valor total do IPI
    private $vlPis; // Valor total do PIS
    private $vlCofins; // Valor total da COFINS
    private $vlPisSt; // Valor total do PIS retido por substituição tributária
    private $vlCofinsSt; // Valor total da COFINS retido por substituição tributária
    private $registroC170List; // BLOCO C - Lista de RegistroC170 (FILHO)
    private $registroC190List; // BLOCO C - Lista de RegistroC190 (FILHO)

    public function __construct()
    {
        $this->registroC170List = array();
        $this->registroC190List = array();
    }

    /**
     * @return the indOper
     */
    public function getIndOper() {
        return $this->indOper;
    }

    /**
     * @param indOper the indOper to set
     */
    public function setIndOper($indOper) {
        $this->indOper = $indOper;
    }

    /**
     * @return the indEmit
     */
    public function getIndEmit() {
        return $this->indEmit;
    }

    /**
     * @param indEmit the indEmit to set
     */
    public function setIndEmit($indEmit) {
        $this->indEmit = $indEmit;
    }

    /**
     * @return the codPart
     */
    public function getCodPart() {
        return $this->codPart;
    }

    /**
     * @param codPart the codPart to set
     */
    public function setCodPart($codPart) {
        $this->codPart = $codPart;
    }

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
     * @return the chvNfe
     */
    public function getChvNfe() {
        return $this->chvNfe;
    }

    /**
     * @param chvNfe the chvNfe to set
     */
    public function setChvNfe($chvNfe) {
        $this->chvNfe = $chvNfe;
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
     * @return the dtES
     */
    public function getDtES() {
        return $this->dtES;
    }

    /**
     * @param dtES the dtES to set
     */
    public function setDtES($dtES) {
        $this->dtES = $dtES;
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
     * @return the indPgto
     */
    public function getIndPgto() {
        return $this->indPgto;
    }

    /**
     * @param indPgto the indPgto to set
     */
    public function setIndPgto($indPgto) {
        $this->indPgto = $indPgto;
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
     * @return the vlAbatNt
     */
    public function  getVlAbatNt() {
        return $this->vlAbatNt;
    }

    /**
     * @param vlAbatNt the vlAbatNt to set
     */
    public function setVlAbatNt($vlAbatNt) {
        $this->vlAbatNt = $vlAbatNt;
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
     * @return the indFrt
     */
    public function getIndFrt() {
        return $this->indFrt;
    }

    /**
     * @param indFrt the indFrt to set
     */
    public function setIndFrt($indFrt) {
        $this->indFrt = $indFrt;
    }

    /**
     * @return the vlFrt
     */
    public function  getVlFrt() {
        return $this->vlFrt;
    }

    /**
     * @param vlFrt the vlFrt to set
     */
    public function setVlFrt($vlFrt) {
        $this->vlFrt = $vlFrt;
    }

    /**
     * @return the vlSeg
     */
    public function  getVlSeg() {
        return $this->vlSeg;
    }

    /**
     * @param vlSeg the vlSeg to set
     */
    public function setVlSeg($vlSeg) {
        $this->vlSeg = $vlSeg;
    }

    /**
     * @return the vlOutDa
     */
    public function  getVlOutDa() {
        return $this->vlOutDa;
    }

    /**
     * @param vlOutDa the vlOutDa to set
     */
    public function setVlOutDa($vlOutDa) {
        $this->vlOutDa = $vlOutDa;
    }

    /**
     * @return the vlBcIcms
     */
    public function  getVlBcIcms() {
        return $this->vlBcIcms;
    }

    /**
     * @param vlBcIcms the vlBcIcms to set
     */
    public function setVlBcIcms($vlBcIcms) {
        $this->vlBcIcms = $vlBcIcms;
    }

    /**
     * @return the vlIcms
     */
    public function  getVlIcms() {
        return $this->vlIcms;
    }

    /**
     * @param vlIcms the vlIcms to set
     */
    public function setVlIcms($vlIcms) {
        $this->vlIcms = $vlIcms;
    }

    /**
     * @return the vlBcIcmsSt
     */
    public function  getVlBcIcmsSt() {
        return $this->vlBcIcmsSt;
    }

    /**
     * @param vlBcIcmsSt the vlBcIcmsSt to set
     */
    public function setVlBcIcmsSt($vlBcIcmsSt) {
        $this->vlBcIcmsSt = $vlBcIcmsSt;
    }

    /**
     * @return the vlIcmsSt
     */
    public function  getVlIcmsSt() {
        return $this->vlIcmsSt;
    }

    /**
     * @param vlIcmsSt the vlIcmsSt to set
     */
    public function setVlIcmsSt($vlIcmsSt) {
        $this->vlIcmsSt = $vlIcmsSt;
    }

    /**
     * @return the vlIpi
     */
    public function  getVlIpi() {
        return $this->vlIpi;
    }

    /**
     * @param vlIpi the vlIpi to set
     */
    public function setVlIpi($vlIpi) {
        $this->vlIpi = $vlIpi;
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
     * @return the vlPisSt
     */
    public function  getVlPisSt() {
        return $this->vlPisSt;
    }

    /**
     * @param vlPisSt the vlPisSt to set
     */
    public function setVlPisSt($vlPisSt) {
        $this->vlPisSt = $vlPisSt;
    }

    /**
     * @return the vlCofinsSt
     */
    public function  getVlCofinsSt() {
        return $this->vlCofinsSt;
    }

    /**
     * @param vlCofinsSt the vlCofinsSt to set
     */
    public function setVlCofinsSt($vlCofinsSt) {
        $this->vlCofinsSt = $vlCofinsSt;
    }

    /**
     * @return the registroc190List
     */
    public function getRegistroC190List() {
        return $this->registroC190List;
    }

    /**
     * @param registroC190List the registroc190List to set
     */
    public function setRegistroC190List(array $registroC190List) {
        $this->registroC190List = $registroC190List;
    }

    public function getRegistroC170List() {
        return $this->registroC170List;
    }

    public function setRegistroC170List(array $registroC170List) {
        $this->registroC170List = $registroC170List;
    }


}
