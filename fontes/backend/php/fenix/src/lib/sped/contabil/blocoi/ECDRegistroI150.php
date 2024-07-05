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

class ECDRegistroI150
{

    private $dtIni; /// Data de início do período.
    private $dtFin; /// Data de fim do período.
    private $registroi151List; /// BLOCO I - Lista de RegistroI151 (FILHO)
    private $registroi155List; /// BLOCO I - Lista de RegistroI155 (FILHO)

    public function __construct()
    {
        $this->registroi151List = array();
        $this->registroi155List = array();
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
     * @return the registroi151List
     */
    public function getRegistroi151List() {
        return $this->registroi151List;
    }

    /**
     * @param registroi151List the registroi151List to set
     */
    public function setRegistroi151List($registroi151List) {
        $this->registroi151List = $registroi151List;
    }

    /**
     * @return the registroi155List
     */
    public function getRegistroi155List() {
        return $this->registroi155List;
    }

    /**
     * @param registroi155List the registroi155List to set
     */
    public function setRegistroi155List($registroi155List) {
        $this->registroi155List = $registroi155List;
    }

}
