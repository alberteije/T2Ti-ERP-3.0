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

class EFDRegistroC320  {
    
    private $cstIcms; // Código da Situação Tributária, conforme a Tabela indicada no item 4.3.1
    private $cfop; // Código Fiscal de Operação e Prestação
    private $aliqIcms; // Alíquota do ICMS
    private $vlOpr; // Valor total acumulado das operações correspondentes à combinação de CST_ICMS, CFOP e alíquota do ICMS, incluídas as despesas acessórias e acréscimos.
    private $vlBcIcms; // Valor acumulado da base de cálculo do ICMS, referente à combinação de CST_ICMS, CFOP, e alíquota do ICMS.
    private $vlIcms; // Valor acumulado do ICMS, referente à combinação de CST_ICMS, CFOP e alíquota do ICMS.
    private $vlRedBc; // Valor não tributado em função da redução da base de cálculo do ICMS, referente à combinação de CST_ICMS, CFOP, e alíquota do ICMS.
    private $codObs; // Código da observação do lançamento fiscal (campo 02 do Registro 0460)
    private $registroC321List;

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
     * @return the vlOpr
     */
    public function  getVlOpr() {
        return $this->vlOpr;
    }

    /**
     * @param vlOpr the vlOpr to set
     */
    public function setVlOpr($vlOpr) {
        $this->vlOpr = $vlOpr;
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
     * @return the vlRedBc
     */
    public function  getVlRedBc() {
        return $this->vlRedBc;
    }

    /**
     * @param vlRedBc the vlRedBc to set
     */
    public function setVlRedBc($vlRedBc) {
        $this->vlRedBc = $vlRedBc;
    }

    /**
     * @return the codObs
     */
    public function getCodObs() {
        return $this->codObs;
    }

    /**
     * @param codObs the codObs to set
     */
    public function setCodObs($codObs) {
        $this->codObs = $codObs;
    }

    /**
     * @return the registroC321List
     */
    public function getRegistroC321List() {
        return $this->registroC321List;
    }

    /**
     * @param registroC321List the registroC321List to set
     */
    public function setRegistroC321List(array $registroC321List) {
        $this->registroC321List = $registroC321List;
    }
}
