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

class EFDRegistro0005  {
    
    private $fantasia; // Nome de fantasia associado
    private $cep; // Código de Endereçamento Postal
    private $endereco; // Logradouro e endereço do imóvel
    private $num; // Número do imóvel
    private $compl; // Dados complementares do endereço
    private $bairro; // Bairro em que o imóvel está situado
    private $fone; // Número do telefone
    private $fax; // Número do fax
    private $email; // Endereço do correio eletrônico

    /**
     * @return the fantasia
     */
    public function getFantasia() {
        return $this->fantasia;
    }

    /**
     * @param fantasia the fantasia to set
     */
    public function setFantasia($fantasia) {
        $this->fantasia = $fantasia;
    }

    /**
     * @return the cep
     */
    public function getCep() {
        return $this->cep;
    }

    /**
     * @param cep the cep to set
     */
    public function setCep($cep) {
        $this->cep = $cep;
    }

    /**
     * @return the endereco
     */
    public function getEndereco() {
        return $this->endereco;
    }

    /**
     * @param endereco the endereco to set
     */
    public function setEndereco($endereco) {
        $this->endereco = $endereco;
    }

    /**
     * @return the num
     */
    public function getNum() {
        return $this->num;
    }

    /**
     * @param num the num to set
     */
    public function setNum($num) {
        $this->num = $num;
    }

    /**
     * @return the compl
     */
    public function getCompl() {
        return $this->compl;
    }

    /**
     * @param compl the compl to set
     */
    public function setCompl($compl) {
        $this->compl = $compl;
    }

    /**
     * @return the bairro
     */
    public function getBairro() {
        return $this->bairro;
    }

    /**
     * @param bairro the bairro to set
     */
    public function setBairro($bairro) {
        $this->bairro = $bairro;
    }

    /**
     * @return the fone
     */
    public function getFone() {
        return $this->fone;
    }

    /**
     * @param fone the fone to set
     */
    public function setFone($fone) {
        $this->fone = $fone;
    }

    /**
     * @return the fax
     */
    public function getFax() {
        return $this->fax;
    }

    /**
     * @param fax the fax to set
     */
    public function setFax($fax) {
        $this->fax = $fax;
    }

    /**
     * @return the email
     */
    public function getEmail() {
        return $this->email;
    }

    /**
     * @param email the email to set
     */
    public function setEmail($email) {
        $this->email = $email;
    }
}
