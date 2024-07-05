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

class EFDRegistro1010  {
    
    private $indExp; // Reg. 1100 - Ocorreu averbação (conclusão) de exportação no período
    private $indCcrf; // Reg. 1200 – Existem informações acerca de créditos de ICMS a serem controlados, definidos pela Sefaz
    private $indComb; // Reg. 1300 – É comercio varejista de combustíveis
    private $indUsina; // Reg. 1390 – Usinas de açúcar e/álcool – O estabelecimento é produtor de açúcar e/ou álcool carburante
    private $indVa; // Reg. 1400 – Existem informações a serem prestadas neste registro e o registro é obrigatório em sua Unidade da Federação
    private $indEe; // Reg. 1500 - A empresa é distribuidora de energia e ocorreu fornecimento de energia elétrica para consumidores de outra UF
    private $indCart; // Reg. 1600 - Realizou vendas com Cartão de Crédito ou de débito
    private $indForm; // Reg. 1700 - É obrigatório em sua unidade da federação o controle de utilização de documentos fiscais em papel
    private $indAer; // Reg. 1800 – A empresa prestou serviços de transporte aéreo de cargas e de passageiros

    public function getIndExp() {
        return $this->indExp;
    }

    public function setIndExp($indExp) {
        $this->indExp = $indExp;
    }

    public function getIndCcrf() {
        return $this->indCcrf;
    }

    public function setIndCcrf($indCcrf) {
        $this->indCcrf = $indCcrf;
    }

    public function getIndComb() {
        return $this->indComb;
    }

    public function setIndComb($indComb) {
        $this->indComb = $indComb;
    }

    public function getIndUsina() {
        return $this->indUsina;
    }

    public function setIndUsina($indUsina) {
        $this->indUsina = $indUsina;
    }

    public function getIndVa() {
        return $this->indVa;
    }

    public function setIndVa($indVa) {
        $this->indVa = $indVa;
    }

    public function getIndEe() {
        return $this->indEe;
    }

    public function setIndEe($indEe) {
        $this->indEe = $indEe;
    }

    public function getIndCart() {
        return $this->indCart;
    }

    public function setIndCart($indCart) {
        $this->indCart = $indCart;
    }

    public function getIndForm() {
        return $this->indForm;
    }

    public function setIndForm($indForm) {
        $this->indForm = $indForm;
    }

    public function getIndAer() {
        return $this->indAer;
    }

    public function setIndAer($indAer) {
        $this->indAer = $indAer;
    }
}
