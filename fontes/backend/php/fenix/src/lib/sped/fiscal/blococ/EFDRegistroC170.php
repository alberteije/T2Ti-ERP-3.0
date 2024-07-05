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

class EFDRegistroC170  {
    
    private $numItem; // Número seqüencial do item no documento fiscal
    private $codItem; // Código do item (campo 02 do Registro 0200)
    private $descrCompl; // Descrição complementar do item como adotado no documento fiscal
    private $qtd; // Quantidade do item
    private $unid; // Unidade do item(Campo 02 do registro 0190)
    private $vlItem; // Valor total do item
    private $vlDesc; // Valor do desconto comercial
    private $indMov; // Movimentação física do ITEM/PRODUTO: 0 - SIM; 1- NÃO
    private $cstIcms; // Código da Situação Tributária referente ao ICMS, conforme a Tabela indicada no item 4.3.1
    private $cfop; // Código Fiscal de Operação e Prestação
    private $codNat; // Código da natureza da operação (campo 02 do Registro 0400)
    private $vlBcIcms; // Valor da base de cálculo do ICMS
    private $aliqIcms; // Alíquota do ICMS
    private $vlIcms; // Valor do ICMS creditado/debitado
    private $vlBcIcmsSt; // Valor da base de cálculo referente à substituição tributária
    private $aliqSt; // Alíquota do ICMS da substituição tributária na unidade da federação de destino
    private $vlIcmsSt; // Valor do ICMS referente à substituição tributária
    private $indApur; // Indicador de período de apuração do IPI: 0 - Mensal; 1 - Decendial
    private $cstIpi; // Código da Situação Tributária referente ao IPI, conforme a Tabela indicada no item 4.3.2.
    private $codEnq; // Código de enquadramento legal do IPI, conforme tabela indicada no item 4.5.3.
    private $vlBcIpi; // Valor da base de cálculo do IPI
    private $aliqIpi; // Alíquota do IPI
    private $vlIpi; // Valor do IPI creditado/debitado
    private $cstPis; // Código da Situação Tributária referente ao PIS.
    private $vlBcPis; // Valor da base de cálculo do PIS
    private $aliqPisPerc; // Alíquota do PIS (em percentual)
    private $quantBcPis; // Quantidade - Base de cálculo PIS
    private $aliqPisR; // Alíquota do PIS (em reais)
    private $vlPis; // Valor do PIS
    private $cstCofins; // Código da Situação Tributária referente ao COFINS.
    private $vlBcCofins; // Valor da base de cálculo da COFINS
    private $aliqCofinsPerc; // Alíquota do COFINS (em percentual)
    private $quantBcCofins; // Quantidade - Base de cálculo COFINS
    private $aliqCofinsR; // Alíquota da COFINS (em reais)
    private $vlCofins; // Valor da COFINS
    private $codCta; // Código da conta analítica contábil debitada/creditada

    public function getNumItem() {
        return $this->numItem;
    }

    public function setNumItem($numItem) {
        $this->numItem = $numItem;
    }

    public function getCodItem() {
        return $this->codItem;
    }

    public function setCodItem($codItem) {
        $this->codItem = $codItem;
    }

    public function getDescrCompl() {
        return $this->descrCompl;
    }

    public function setDescrCompl($descrCompl) {
        $this->descrCompl = $descrCompl;
    }

    public function  getQtd() {
        return $this->qtd;
    }

    public function setQtd($qtd) {
        $this->qtd = $qtd;
    }

    public function getUnid() {
        return $this->unid;
    }

    public function setUnid($unid) {
        $this->unid = $unid;
    }

    public function  getVlItem() {
        return $this->vlItem;
    }

    public function setVlItem($vlItem) {
        $this->vlItem = $vlItem;
    }

    public function  getVlDesc() {
        return $this->vlDesc;
    }

    public function setVlDesc($vlDesc) {
        $this->vlDesc = $vlDesc;
    }

    public function getIndMov() {
        return $this->indMov;
    }

    public function setIndMov($indMov) {
        $this->indMov = $indMov;
    }

    public function getCstIcms() {
        return $this->cstIcms;
    }

    public function setCstIcms($cstIcms) {
        $this->cstIcms = $cstIcms;
    }

    public function getCfop() {
        return $this->cfop;
    }

    public function setCfop($cfop) {
        $this->cfop = $cfop;
    }

    public function getCodNat() {
        return $this->codNat;
    }

    public function setCodNat($codNat) {
        $this->codNat = $codNat;
    }

    public function  getVlBcIcms() {
        return $this->vlBcIcms;
    }

    public function setVlBcIcms($vlBcIcms) {
        $this->vlBcIcms = $vlBcIcms;
    }

    public function  getAliqIcms() {
        return $this->aliqIcms;
    }

    public function setAliqIcms($aliqIcms) {
        $this->aliqIcms = $aliqIcms;
    }

    public function  getVlIcms() {
        return $this->vlIcms;
    }

    public function setVlIcms($vlIcms) {
        $this->vlIcms = $vlIcms;
    }

    public function  getVlBcIcmsSt() {
        return $this->vlBcIcmsSt;
    }

    public function setVlBcIcmsSt($vlBcIcmsSt) {
        $this->vlBcIcmsSt = $vlBcIcmsSt;
    }

    public function  getAliqSt() {
        return $this->aliqSt;
    }

    public function setAliqSt($aliqSt) {
        $this->aliqSt = $aliqSt;
    }

    public function  getVlIcmsSt() {
        return $this->vlIcmsSt;
    }

    public function setVlIcmsSt($vlIcmsSt) {
        $this->vlIcmsSt = $vlIcmsSt;
    }

    public function getIndApur() {
        return $this->indApur;
    }

    public function setIndApur($indApur) {
        $this->indApur = $indApur;
    }

    public function getCstIpi() {
        return $this->cstIpi;
    }

    public function setCstIpi($cstIpi) {
        $this->cstIpi = $cstIpi;
    }

    public function getCodEnq() {
        return $this->codEnq;
    }

    public function setCodEnq($codEnq) {
        $this->codEnq = $codEnq;
    }

    public function  getVlBcIpi() {
        return $this->vlBcIpi;
    }

    public function setVlBcIpi($vlBcIpi) {
        $this->vlBcIpi = $vlBcIpi;
    }

    public function  getAliqIpi() {
        return $this->aliqIpi;
    }

    public function setAliqIpi($aliqIpi) {
        $this->aliqIpi = $aliqIpi;
    }

    public function  getVlIpi() {
        return $this->vlIpi;
    }

    public function setVlIpi($vlIpi) {
        $this->vlIpi = $vlIpi;
    }

    public function getCstPis() {
        return $this->cstPis;
    }

    public function setCstPis($cstPis) {
        $this->cstPis = $cstPis;
    }

    public function  getVlBcPis() {
        return $this->vlBcPis;
    }

    public function setVlBcPis($vlBcPis) {
        $this->vlBcPis = $vlBcPis;
    }

    public function  getAliqPisPerc() {
        return $this->aliqPisPerc;
    }

    public function setAliqPisPerc($aliqPisPerc) {
        $this->aliqPisPerc = $aliqPisPerc;
    }

    public function  getQuantBcPis() {
        return $this->quantBcPis;
    }

    public function setQuantBcPis($quantBcPis) {
        $this->quantBcPis = $quantBcPis;
    }

    public function  getAliqPisR() {
        return $this->aliqPisR;
    }

    public function setAliqPisR($aliqPisR) {
        $this->aliqPisR = $aliqPisR;
    }

    public function  getVlPis() {
        return $this->vlPis;
    }

    public function setVlPis($vlPis) {
        $this->vlPis = $vlPis;
    }

    public function getCstCofins() {
        return $this->cstCofins;
    }

    public function setCstCofins($cstCofins) {
        $this->cstCofins = $cstCofins;
    }

    public function  getVlBcCofins() {
        return $this->vlBcCofins;
    }

    public function setVlBcCofins($vlBcCofins) {
        $this->vlBcCofins = $vlBcCofins;
    }

    public function  getAliqCofinsPerc() {
        return $this->aliqCofinsPerc;
    }

    public function setAliqCofinsPerc($aliqCofinsPerc) {
        $this->aliqCofinsPerc = $aliqCofinsPerc;
    }

    public function  getQuantBcCofins() {
        return $this->quantBcCofins;
    }

    public function setQuantBcCofins($quantBcCofins) {
        $this->quantBcCofins = $quantBcCofins;
    }

    public function  getAliqCofinsR() {
        return $this->aliqCofinsR;
    }

    public function setAliqCofinsR($aliqCofinsR) {
        $this->aliqCofinsR = $aliqCofinsR;
    }

    public function  getVlCofins() {
        return $this->vlCofins;
    }

    public function setVlCofins($vlCofins) {
        $this->vlCofins = $vlCofins;
    }

    public function getCodCta() {
        return $this->codCta;
    }

    public function setCodCta($codCta) {
        $this->codCta = $codCta;
    }
}
