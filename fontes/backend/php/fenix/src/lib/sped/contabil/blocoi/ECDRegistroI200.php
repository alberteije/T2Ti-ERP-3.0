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

class ECDRegistroI200
{

    private $numLcto; // Número de identificação do lançamento
    private $dtLcto; // Data do lançamento
    private $vlLcto; // Valor do Lançamento
    private $indLcto; // Indicador do tipo do lançamento
    private $registroi250List; /// BLOCO I - Lista de RegistroI250 (FILHO)

    public function __construct()
    {
        $this->registroi250List = array();
    }

    /**
     * @return the numLcto
     */
    public function getNumLcto() {
        return $this->numLcto;
    }

    /**
     * @param numLcto the numLcto to set
     */
    public function setNumLcto($numLcto) {
        $this->numLcto = $numLcto;
    }

    /**
     * @return the dtLcto
     */
    public function getDtLcto() {
        return $this->dtLcto;
    }

    /**
     * @param dtLcto the dtLcto to set
     */
    public function setDtLcto($dtLcto) {
        $this->dtLcto = $dtLcto;
    }

    /**
     * @return the vlLcto
     */
    public function getVlLcto() {
        return $this->vlLcto;
    }

    /**
     * @param vlLcto the vlLcto to set
     */
    public function setVlLcto($vlLcto) {
        $this->vlLcto = $vlLcto;
    }

    /**
     * @return the indLcto
     */
    public function getIndLcto() {
        return $this->indLcto;
    }

    /**
     * @param indLcto the indLcto to set
     */
    public function setIndLcto($indLcto) {
        $this->indLcto = $indLcto;
    }

    /**
     * @return the registroi250List
     */
    public function getRegistroi250List() {
        return $this->registroi250List;
    }

    /**
     * @param registroi250List the registroi250List to set
     */
    public function setRegistroi250List($registroi250List) {
        $this->registroi250List = $registroi250List;
    }

}
