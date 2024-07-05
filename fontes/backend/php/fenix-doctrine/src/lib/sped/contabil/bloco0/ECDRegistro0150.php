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

class ECDRegistro0150
{
    private $codPart; /// Código de identificação do participante
    private $nome; /// Nome pessoal ou empresarial
    private $codPais; /// Código do país do participante
    private $cnpj; /// CNPJ do participante
    private $cpf; /// CPF do participante na unidade da federação do destinatário
    private $nit; /// Número de Identificação do Trabalhador, Pis, Pasep, SUS.
    private $uf; /// Sigla da unidade da federação do participante.
    private $ie; /// Inscrição Estadual do participante
    private $ieSt; /// Inscrição Estadual do participante na unidade da federação do destinatário, na condição de contribuinte substituto
    private $codMun; /// Código do município
    private $im; /// Inscrição Municipal do participante.
    private $suframa; /// Número de inscrição na Suframa

    /**
     * @return $this->the codPart
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
     * @return $this->the nome
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
     * @return $this->the codPais
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
     * @return $this->the cnpj
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
     * @return $this->the cpf
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
     * @return $this->the nit
     */
    public function getNit() {
        return $this->nit;
    }

    /**
     * @param nit the nit to set
     */
    public function setNit($nit) {
        $this->nit = $nit;
    }

    /**
     * @return $this->the uf
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
     * @return $this->the ie
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
     * @return $this->the ieSt
     */
    public function getIeSt() {
        return $this->ieSt;
    }

    /**
     * @param ieSt the ieSt to set
     */
    public function setIeSt($ieSt) {
        $this->ieSt = $ieSt;
    }

    /**
     * @return $this->the codMun
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
     * @return $this->the im
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
     * @return $this->the suframa
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

}
