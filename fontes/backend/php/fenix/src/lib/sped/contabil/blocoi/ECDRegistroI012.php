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

class ECDRegistroI012
{
    private $numOrd; /// Número de ordem do instrumento associado.
    private $natLivr; /// Natureza do livro associado
    private $tipo; /// Tipo de escrituração do livro associado
    private $codHashAux; /// Código Hash do arquivo correspondente ao livro auxiliar utilizado na assinatura digital.
    private $registroI015List; /// BLOCO I - Lista de RegistroI051 (FILHO)

    public function __construct()
    {
        $this->registroI015List = array();
    }

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
     * @return the tipo
     */
    public function getTipo() {
        return $this->tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public function setTipo($tipo) {
        $this->tipo = $tipo;
    }

    /**
     * @return the codHashAux
     */
    public function getCodHashAux() {
        return $this->codHashAux;
    }

    /**
     * @param codHashAux the codHashAux to set
     */
    public function setCodHashAux($codHashAux) {
        $this->codHashAux = $codHashAux;
    }

    /**
     * @return the registroI015List
     */
    public function getRegistroI015List() {
        return $this->registroI015List;
    }

    /**
     * @param registroI015List the registroI015List to set
     */
    public function setRegistroI015List($registroI015List) {
        $this->registroI015List = $registroI015List;
    }

}
