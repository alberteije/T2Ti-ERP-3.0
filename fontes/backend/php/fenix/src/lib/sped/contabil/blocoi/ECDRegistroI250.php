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

class ECDRegistroI250
{

    private $codCta;
    private $codCcus;
    private $vlDc;
    private $indDc;
    private $numArq;
    private $codHistPad;
    private $hist;
    private $codPart;

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
     * @return the codCcus
     */
    public function getCodCcus() {
        return $this->codCcus;
    }

    /**
     * @param codCcus the codCcus to set
     */
    public function setCodCcus($codCcus) {
        $this->codCcus = $codCcus;
    }

    /**
     * @return the vlDc
     */
    public function getVlDc() {
        return $this->vlDc;
    }

    /**
     * @param vlDc the vlDc to set
     */
    public function setVlDc($vlDc) {
        $this->vlDc = $vlDc;
    }

    /**
     * @return the indDc
     */
    public function getIndDc() {
        return $this->indDc;
    }

    /**
     * @param indDc the indDc to set
     */
    public function setIndDc($indDc) {
        $this->indDc = $indDc;
    }

    /**
     * @return the numArq
     */
    public function getNumArq() {
        return $this->numArq;
    }

    /**
     * @param numArq the numArq to set
     */
    public function setNumArq($numArq) {
        $this->numArq = $numArq;
    }

    /**
     * @return the codHistPad
     */
    public function getCodHistPad() {
        return $this->codHistPad;
    }

    /**
     * @param codHistPad the codHistPad to set
     */
    public function setCodHistPad($codHistPad) {
        $this->codHistPad = $codHistPad;
    }

    /**
     * @return the hist
     */
    public function getHist() {
        return $this->hist;
    }

    /**
     * @param hist the hist to set
     */
    public function setHist($hist) {
        $this->hist = $hist;
    }

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

}
