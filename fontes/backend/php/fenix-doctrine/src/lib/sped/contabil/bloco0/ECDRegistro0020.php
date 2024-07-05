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

class ECDRegistro0020
{
    private $indDec; /// Indicador de descentralização - 0 - escrituração da matriz; 1 - escrituração da filial.
    private $cnpj; /// Número de inscrição do empresário ou sociedade empresária no CNPJ da matriz ou da filial.
    private $uf; /// Sigla da unidade da federação da matriz ou da filial.
    private $ie; /// Inscrição estadual da matriz ou da filial.
    private $codMun; /// Código do município do domicílio da matriz ou da filial.
    private $im; /// Número de Inscrição Municipal da matriz ou da filial.
    private $nire; /// Número de Identificação do Registro de Empresas da matriz ou da filial na Junta Comercial.

    /**
     * @return $this->the indDec
     */
    public function getIndDec() {
        return $this->indDec;
    }

    /**
     * @param indDec the indDec to set
     */
    public function setIndDec($indDec) {
        $this->indDec = $indDec;
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
     * @return $this->the nire
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

}
