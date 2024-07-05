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

class EFDRegistroE116  {
    
    private $codOr; // Código da obrigação a recolher, conforme a Tabela 5.4
    private $vlOr; // Valor da obrigação a recolher
    private $dtVcto; // Data de vencimento da obrigação
    private $codRec; // Código de receita referente à obrigação, próprio da unidade da federação, conforme legislação estadual,
    private $numProc; // Número do processo ou auto de infração ao qual a obrigação está vinculada, se houver.
    private $indProc; // Indicador da origem do processo
    private $proc; // Descrição resumida do processo que embasou o lançamento
    private $txtCompl; // Descrição complementar das obrigações a recolher.
    private $mesRef; // VERSÃO 103

    /**
     * @return the codOr
     */
    public function getCodOr() {
        return $this->codOr;
    }

    /**
     * @param codOr the codOr to set
     */
    public function setCodOr($codOr) {
        $this->codOr = $codOr;
    }

    /**
     * @return the vlOr
     */
    public function  getVlOr() {
        return $this->vlOr;
    }

    /**
     * @param vlOr the vlOr to set
     */
    public function setVlOr($vlOr) {
        $this->vlOr = $vlOr;
    }

    /**
     * @return the dtVcto
     */
    public function getDtVcto() {
        return $this->dtVcto;
    }

    /**
     * @param dtVcto the dtVcto to set
     */
    public function setDtVcto($dtVcto) {
        $this->dtVcto = $dtVcto;
    }

    /**
     * @return the codRec
     */
    public function getCodRec() {
        return $this->codRec;
    }

    /**
     * @param codRec the codRec to set
     */
    public function setCodRec($codRec) {
        $this->codRec = $codRec;
    }

    /**
     * @return the numProc
     */
    public function getNumProc() {
        return $this->numProc;
    }

    /**
     * @param numProc the numProc to set
     */
    public function setNumProc($numProc) {
        $this->numProc = $numProc;
    }

    /**
     * @return the indProc
     */
    public function getIndProc() {
        return $this->indProc;
    }

    /**
     * @param indProc the indProc to set
     */
    public function setIndProc($indProc) {
        $this->indProc = $indProc;
    }

    /**
     * @return the proc
     */
    public function getProc() {
        return $this->proc;
    }

    /**
     * @param proc the proc to set
     */
    public function setProc($proc) {
        $this->proc = $proc;
    }

    /**
     * @return the txtCompl
     */
    public function getTxtCompl() {
        return $this->txtCompl;
    }

    /**
     * @param txtCompl the txtCompl to set
     */
    public function setTxtCompl($txtCompl) {
        $this->txtCompl = $txtCompl;
    }

    /**
     * @return the mesRef
     */
    public function getMesRef() {
        return $this->mesRef;
    }

    /**
     * @param mesRef the mesRef to set
     */
    public function setMesRef($mesRef) {
        $this->mesRef = $mesRef;
    }
}
