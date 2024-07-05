<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado ao SPED Contábil - ECD
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
declare(strict_types=1);

class ECDRegistroI030
{
    private $numOrd; /// Número de ordem do instrumento de escrituração.
    private $natLivr; /// Natureza do livro
    private $qtdLin; /// Quantidade total de linhas do arquivo digital.
    private $nome; /// Nome empresarial.
    private $nire; /// Número de Identificação do Registro de Empresas da Junta Comercial.
    private $cnpj; /// Número de inscrição no CNPJ .
    private $dtArq; /// Data do arquivamento dos atos constitutivos.
    private $dtArqConv; /// Data de arquivamento do ato de conversão de sociedade simples em sociedade empresária.
    private $descMun; /// Município.

    /**
     * @return the numOrd
     */
    public function getNumOrd() {
        return $this->numOrd;
    }

    /**
     * @param numOrd the numOrd to set
     */
    public function setNumOrd($numOrd) {
        $this->numOrd = $numOrd;
    }

    /**
     * @return the natLivr
     */
    public function getNatLivr() {
        return $this->natLivr;
    }

    /**
     * @param natLivr the natLivr to set
     */
    public function setNatLivr($natLivr) {
        $this->natLivr = $natLivr;
    }

    /**
     * @return the qtdLin
     */
    public function getQtdLin() {
        return $this->qtdLin;
    }

    /**
     * @param qtdLin the qtdLin to set
     */
    public function setQtdLin($qtdLin) {
        $this->qtdLin = $qtdLin;
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
     * @return the nire
     */
    public function getNire() {
        return $this->nire;
    }

    /**
     * @param nire the nire to set
     */
    public function setNire($nire) {
        $this->nire = $nire;
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
     * @return the dtArq
     */
    public function getDtArq() {
        return $this->dtArq;
    }

    /**
     * @param dtArq the dtArq to set
     */
    public function setDtArq($dtArq) {
        $this->dtArq = $dtArq;
    }

    /**
     * @return the dtArqConv
     */
    public function getDtArqConv() {
        return $this->dtArqConv;
    }

    /**
     * @param dtArqConv the dtArqConv to set
     */
    public function setDtArqConv($dtArqConv) {
        $this->dtArqConv = $dtArqConv;
    }

    /**
     * @return the descMun
     */
    public function getDescMun() {
        return $this->descMun;
    }

    /**
     * @param descMun the descMun to set
     */
    public function setDescMun($descMun) {
        $this->descMun = $descMun;
    }

}
