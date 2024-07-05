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

class EFDRegistro0000 {
    
    private $codVer;   // Código da versão do leiaute: 100, 101, 102
    private $codFin;   // Código da finalidade do arquivo: 0 - Remessa do arquivo original / 1 - Remessa do arquivo substituto.
    private $dtIni;      // Data inicial das informações contidas no arquivo
    private $dtFin;      // Data final das informações contidas no arquivo
    private $nome;     // Nome empresarial do contribuinte:
    private $cnpj;     // Número de inscrição do contribuinte:
    private $cpf;      // Número de inscrição do contribuinte:
    private $uf;       // Sigla da unidade da federação:
    private $ie;       // Inscrição Estadual do contribuinte:
    private $codMun;   // Código do município do domicílio fiscal:
    private $im;       // Inscrição Municipal do contribuinte:
    private $suframa;  // Número de inscrição do contribuinte:
    private $indPerfil;// Perfil de apresentação do arquivo fiscal: A - Perfil A / B - Perfil B / C - Perfil C
    private $indAtiv;  // Indicador de tipo de atividade: 0 - Industrial ou equiparado a industrial; 1 - Outros.

    /**
     * @return the codVer
     */
    public function getCodVer() {
        return $this->codVer;
    }

    /**
     * @param codVer the codVer to set
     */
    public function setCodVer($codVer) {
        $this->codVer = $codVer;
    }

    /**
     * @return the codFin
     */
    public function getCodFin() {
        return $this->codFin;
    }

    /**
     * @param codFin the codFin to set
     */
    public function setCodFin($codFin) {
        $this->codFin = $codFin;
    }

    /**
     * @return the dtIni
     */
    public function getDtIni() {
        return $this->dtIni;
    }

    /**
     * @param dtIni the dtIni to set
     */
    public function setDtIni($dtIni) {
        $this->dtIni = $dtIni;
    }

    /**
     * @return the dtFin
     */
    public function getDtFin() {
        return $this->dtFin;
    }

    /**
     * @param dtFin the dtFin to set
     */
    public function setDtFin($dtFin) {
        $this->dtFin = $dtFin;
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
     * @return the uf
     */
    public function getUf() {
        return $this->uf;
    }

    /**
     * @param uf the uf to set
     */
    public function setUf($uf) {
        $this->uf = $uf;
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
     * @return the im
     */
    public function getIm() {
        return $this->im;
    }

    /**
     * @param im the im to set
     */
    public function setIm($im) {
        $this->im = $im;
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
     * @return the indPerfil
     */
    public function getIndPerfil() {
        return $this->indPerfil;
    }

    /**
     * @param indPerfil the indPerfil to set
     */
    public function setIndPerfil($indPerfil) {
        $this->indPerfil = $indPerfil;
    }

    /**
     * @return the indAtiv
     */
    public function getIndAtiv() {
        return $this->indAtiv;
    }

    /**
     * @param indAtiv the indAtiv to set
     */
    public function setIndAtiv($indAtiv) {
        $this->indAtiv = $indAtiv;
    }
}
