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

class EFDRegistro0300  {
    
    private $codIndBem; // Código individualizado do bem ou componente adotado no controle patrimonial do estabelecimento informante
    private $identMerc; // Identificação do tipo de mercadoria
    private $descrItem; // Descrição do bem ou componente (modelo, marca e outras características necessárias a sua individualização)
    private $codPrnc; // Código de cadastro do bem principal nos casos em que o bem ou componente ( campo 02) esteja vinculado a um bem principal.
    private $codCta; // Código da conta analítica de contabilização do bem ou componente (campo 06 do Registro 0500)
    private $nrParc; // Número total de parcelas a serem apropriadas, segundo a legislação de cada unidade federada
    private $registro0305; // BLOCO 0 - Registro0305 (FILHO)

    /**
     * @return the codIndBem
     */
    public function getCodIndBem() {
        return $this->codIndBem;
    }

    /**
     * @param codIndBem the codIndBem to set
     */
    public function setCodIndBem($codIndBem) {
        $this->codIndBem = $codIndBem;
    }

    /**
     * @return the identMerc
     */
    public function getIdentMerc() {
        return $this->identMerc;
    }

    /**
     * @param identMerc the identMerc to set
     */
    public function setIdentMerc($identMerc) {
        $this->identMerc = $identMerc;
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
     * @return the codPrnc
     */
    public function getCodPrnc() {
        return $this->codPrnc;
    }

    /**
     * @param codPrnc the codPrnc to set
     */
    public function setCodPrnc($codPrnc) {
        $this->codPrnc = $codPrnc;
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
     * @return the nrParc
     */
    public function getNrParc() {
        return $this->nrParc;
    }

    /**
     * @param nrParc the nrParc to set
     */
    public function setNrParc($nrParc) {
        $this->nrParc = $nrParc;
    }

    /**
     * @return the registro0305
     */
    public function getRegistro0305() {
        return $this->registro0305;
    }

    /**
     * @param registro0305 the registro0305 to set
     */
    public function setRegistro0305(Registro0305 $registro0305) {
        $this->registro0305 = $registro0305;
    }
}
