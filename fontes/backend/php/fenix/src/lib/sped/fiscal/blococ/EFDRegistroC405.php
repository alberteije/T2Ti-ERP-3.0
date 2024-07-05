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

class EFDRegistroC405  {
    
    private $dtDoc; // Data do movimento a que se refere a Redução Z
    private $cro; // Posição do Contador de Reinício de Operação
    private $crz; // Posição do Contador de Redução Z
    private $numCooFin; // Número do Contador de Ordem de Operação do último documento emitido no dia. (Número do COO na Redução Z)
    private $gtFin; // Valor do Grande Total final
    private $vlBrt; // Valor da venda bruta
    private $registroC420List; // BLOCO C - Lista de RegistroC420 (FILHO)
    private $registroC460List; // BLOCO C - Lista de RegistroC460 (FILHO)
    private $registroC490List; // BLOCO C - Lista de RegistroC490 (FILHO)

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
     * @return the cro
     */
    public function getCro() {
        return $this->cro;
    }

    /**
     * @param cro the cro to set
     */
    public function setCro($cro) {
        $this->cro = $cro;
    }

    /**
     * @return the crz
     */
    public function getCrz() {
        return $this->crz;
    }

    /**
     * @param crz the crz to set
     */
    public function setCrz($crz) {
        $this->crz = $crz;
    }

    /**
     * @return the numCooFin
     */
    public function getNumCooFin() {
        return $this->numCooFin;
    }

    /**
     * @param numCooFin the numCooFin to set
     */
    public function setNumCooFin($numCooFin) {
        $this->numCooFin = $numCooFin;
    }

    /**
     * @return the gtFin
     */
    public function  getGtFin() {
        return $this->gtFin;
    }

    /**
     * @param gtFin the gtFin to set
     */
    public function setGtFin($gtFin) {
        $this->gtFin = $gtFin;
    }

    /**
     * @return the vlBrt
     */
    public function  getVlBrt() {
        return $this->vlBrt;
    }

    /**
     * @param vlBrt the vlBrt to set
     */
    public function setVlBrt($vlBrt) {
        $this->vlBrt = $vlBrt;
    }

    /**
     * @return the registroC420List
     */
    public function getRegistroC420List() {
        return $this->registroC420List;
    }

    /**
     * @param registroC420List the registroC420List to set
     */
    public function setRegistroC420List(array $registroC420List) {
        $this->registroC420List = $registroC420List;
    }

    /**
     * @return the registroC460List
     */
    public function getRegistroC460List() {
        return $this->registroC460List;
    }

    /**
     * @param registroC460List the registroC460List to set
     */
    public function setRegistroC460List(array $registroC460List) {
        $this->registroC460List = $registroC460List;
    }

    /**
     * @return the registroC490List
     */
    public function getRegistroC490List() {
        return $this->registroC490List;
    }

    /**
     * @param registroC490List the registroC490List to set
     */
    public function setRegistroC490List(array $registroC490List) {
        $this->registroC490List = $registroC490List;
    }

}