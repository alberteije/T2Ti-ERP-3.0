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

class EFDRegistro0200  {
   
    private $codItem; // Código do item
    private $descrItem; // Descrição do item
    private $codBarra; // Código de barra do produto, se houver
    private $codAntItem; // Código anterior do item (ultima apresentado)
    private $unidInv; // Unidade de medida do estoque
    private $tipoItem; // Tipo do item - Atividades Industriais, Comerciais e Serviços
    private $codNcm; // Código da Nomenclatura Comum do Mercosul
    private $exIpi; // Código EX, conforme a TIPI
    private $codGen; // Código gênero item, tabela indicada item 4.2.1
    private $codLst; // Código serviço Anexo I - Lei nº116/03
    private $aliqIcms; // Alíquota ICMS aplicável (operações internas)
    private $registro0205List; // BLOCO C - Lista de Registro0205 (FILHO)
    private $registro0206List; // BLOCO C - Lista de Registro0206 (FILHO)
    private $registro0220List; // BLOCO C - Lista de Registro0220 (FILHO)

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
     * @return the descrItem
     */
    public function getDescrItem() {
        return $this->descrItem;
    }

    /**
     * @param descrItem the descrItem to set
     */
    public function setDescrItem($descrItem) {
        $this->descrItem = $descrItem;
    }

    /**
     * @return the codBarra
     */
    public function getCodBarra() {
        return $this->codBarra;
    }

    /**
     * @param codBarra the codBarra to set
     */
    public function setCodBarra($codBarra) {
        $this->codBarra = $codBarra;
    }

    /**
     * @return the codAntItem
     */
    public function getCodAntItem() {
        return $this->codAntItem;
    }

    /**
     * @param codAntItem the codAntItem to set
     */
    public function setCodAntItem($codAntItem) {
        $this->codAntItem = $codAntItem;
    }

    /**
     * @return the unidInv
     */
    public function getUnidInv() {
        return $this->unidInv;
    }

    /**
     * @param unidInv the unidInv to set
     */
    public function setUnidInv($unidInv) {
        $this->unidInv = $unidInv;
    }

    /**
     * @return the tipoItem
     */
    public function getTipoItem() {
        return $this->tipoItem;
    }

    /**
     * @param tipoItem the tipoItem to set
     */
    public function setTipoItem($tipoItem) {
        $this->tipoItem = $tipoItem;
    }

    /**
     * @return the codNcm
     */
    public function getCodNcm() {
        return $this->codNcm;
    }

    /**
     * @param codNcm the codNcm to set
     */
    public function setCodNcm($codNcm) {
        $this->codNcm = $codNcm;
    }

    /**
     * @return the exIpi
     */
    public function getExIpi() {
        return $this->exIpi;
    }

    /**
     * @param exIpi the exIpi to set
     */
    public function setExIpi($exIpi) {
        $this->exIpi = $exIpi;
    }

    /**
     * @return the codGen
     */
    public function getCodGen() {
        return $this->codGen;
    }

    /**
     * @param codGen the codGen to set
     */
    public function setCodGen($codGen) {
        $this->codGen = $codGen;
    }

    /**
     * @return the codLst
     */
    public function getCodLst() {
        return $this->codLst;
    }

    /**
     * @param codLst the codLst to set
     */
    public function setCodLst($codLst) {
        $this->codLst = $codLst;
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
     * @return the registro0205List
     */
    public function getRegistro0205List() {
        return $this->registro0205List;
    }

    /**
     * @param registro0205List the registro0205List to set
     */
    public function setRegistro0205List(array $registro0205List) {
        $this->registro0205List = $registro0205List;
    }

    /**
     * @return the registro0206List
     */
    public function getRegistro0206List() {
        return $this->registro0206List;
    }

    /**
     * @param registro0206List the registro0206List to set
     */
    public function setRegistro0206List(array $registro0206List) {
        $this->registro0206List = $registro0206List;
    }

    /**
     * @return the registro0220List
     */
    public function getRegistro0220List() {
        return $this->registro0220List;
    }

    /**
     * @param registro0220List the registro0220List to set
     */
    public function setRegistro0220List(array $registro0220List) {
        $this->registro0220List = $registro0220List;
    }

}
