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

class ECDRegistroJ005
{

    private $dtIni; /// Data inicial das demonstrações contábeis.
    private $dtFin; /// Data final das demonstrações contábeis.
    private $idDem; /// Identificação das demonstrações
    private $cabDem; /// Cabeçalho das demonstrações.
    private $registroJ100List; /// BLOCO J - Lista de RegistroJ100 (FILHO)
    private $registroJ150List; /// BLOCO J - Lista de RegistroJ150 (FILHO)

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
     * @return the idDem
     */
    public function getIdDem() {
        return $this->idDem;
    }

    /**
     * @param idDem the idDem to set
     */
    public function setIdDem($idDem) {
        $this->idDem = $idDem;
    }

    /**
     * @return the cabDem
     */
    public function getCabDem() {
        return $this->cabDem;
    }

    /**
     * @param cabDem the cabDem to set
     */
    public function setCabDem($cabDem) {
        $this->cabDem = $cabDem;
    }

    /**
     * @return the registroJ100List
     */
    public function getRegistroJ100List() {
        return $this->registroJ100List;
    }

    /**
     * @param registroJ100List the registroJ100List to set
     */
    public function setRegistroJ100List($registroJ100List) {
        $this->registroJ100List = $registroJ100List;
    }

    /**
     * @return the registroJ150List
     */
    public function getRegistroJ150List() {
        return $this->registroJ150List;
    }

    /**
     * @param registroJ150List the registroJ150List to set
     */
    public function setRegistroJ150List($registroJ150List) {
        $this->registroJ150List = $registroJ150List;
    }

}
