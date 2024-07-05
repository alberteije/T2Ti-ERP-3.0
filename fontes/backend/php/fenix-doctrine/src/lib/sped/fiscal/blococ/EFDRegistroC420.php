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

class EFDRegistroC420  {
    
    private $codTotPar; // Código do totalizador, conforme Tabela 4.4.6
    private $vlrAcumTot; // Valor acumulado no totalizador, relativo à respectiva Redução Z.
    private $nrTot; // Número do totalizador quando ocorrer mais de uma situação com a mesma carga tributária efetiva.
    private $descrNrTot; // Descrição da situação tributária relativa ao totalizador parcial, quando houver mais de um com a mesma carga tributária efetiva.
    private $registroc425List; // BLOCO C - Lista de RegistroC425 (FILHO)

    /**
     * @return the codTotPar
     */
    public function getCodTotPar() {
        return $this->codTotPar;
    }

    /**
     * @param codTotPar the codTotPar to set
     */
    public function setCodTotPar($codTotPar) {
        $this->codTotPar = $codTotPar;
    }

    /**
     * @return the vlrAcumTot
     */
    public function  getVlrAcumTot() {
        return $this->vlrAcumTot;
    }

    /**
     * @param vlrAcumTot the vlrAcumTot to set
     */
    public function setVlrAcumTot($vlrAcumTot) {
        $this->vlrAcumTot = $vlrAcumTot;
    }

    /**
     * @return the nrTot
     */
    public function getNrTot() {
        return $this->nrTot;
    }

    /**
     * @param nrTot the nrTot to set
     */
    public function setNrTot($nrTot) {
        $this->nrTot = $nrTot;
    }

    /**
     * @return the descrNrTot
     */
    public function getDescrNrTot() {
        return $this->descrNrTot;
    }

    /**
     * @param descrNrTot the descrNrTot to set
     */
    public function setDescrNrTot($descrNrTot) {
        $this->descrNrTot = $descrNrTot;
    }

    /**
     * @return the registroc425List
     */
    public function getRegistroc425List() {
        return $this->registroc425List;
    }

    /**
     * @param registroc425List the registroc425List to set
     */
    public function setRegistroc425List(array $registroc425List) {
        $this->registroc425List = $registroc425List;
    }


}
