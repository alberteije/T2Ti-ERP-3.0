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

class EFDRegistro0150  {
    
    private $codPart; // Código de identificação do participante
    private $nome; // Nome pessoal ou empresarial
    private $codPais; // Código do país do participante
    private $cnpj; // CNPJ do participante
    private $cpf; // CPF do participante na unidade da federação do destinatário
    private $ie; // Inscrição Estadual do participante
    private $codMun; // Código do município
    private $suframa; // Número de inscrição na Suframa
    private $endereco; // Logradouro e endereço do imóvel
    private $num; // Número do imóvel
    private $compl; // Dados complementares do endereço
    private $bairro; // Bairro em que o imóvel está situado
    private $registro0175List;

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
     * @return the nome
     */
    public function getNome() {
        return $this->nome;
    }

    /**
     * @param nome the nome to set
     */
    public function setNome($nome) {
        $this->nome = $nome;
    }

    /**
     * @return the codPais
     */
    public function getCodPais() {
        return $this->codPais;
    }

    /**
     * @param codPais the codPais to set
     */
    public function setCodPais($codPais) {
        $this->codPais = $codPais;
    }

    /**
     * @return the cnpj
     */
    public function getCnpj() {
        return $this->cnpj;
    }

    /**
     * @param cnpj the cnpj to set
     */
    public function setCnpj($cnpj) {
        $this->cnpj = $cnpj;
    }

    /**
     * @return the cpf
     */
    public function getCpf() {
        return $this->cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public function setCpf($cpf) {
        $this->cpf = $cpf;
    }

    /**
     * @return the ie
     */
    public function getIe() {
        return $this->ie;
    }

    /**
     * @param ie the ie to set
     */
    public function setIe($ie) {
        $this->ie = $ie;
    }

    /**
     * @return the codMun
     */
    public function getCodMun() {
        return $this->codMun;
    }

    /**
     * @param codMun the codMun to set
     */
    public function setCodMun($codMun) {
        $this->codMun = $codMun;
    }

    /**
     * @return the suframa
     */
    public function getSuframa() {
        return $this->suframa;
    }

    /**
     * @param suframa the suframa to set
     */
    public function setSuframa($suframa) {
        $this->suframa = $suframa;
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
     * @return the registro0175List
     */
    public function getRegistro0175List() {
        return $this->registro0175List;
    }

    /**
     * @param registro0175List the registro0175List to set
     */
    public function setRegistro0175List(array $registro0175List) {
        $this->registro0175List = $registro0175List;
    }
}
