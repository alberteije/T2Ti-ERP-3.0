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

class ECDRegistroI100
{

    private $dtAlt; /// Data da inclusão/alteração.
    private $codCcus; /// Código do centro de custos.
    private $ccus; /// Nome do centro de custos.

    /**
     * @returnthe dtAlt
     */
    public function getDtAlt() {
        return $this->dtAlt;
    }

    /**
     * @param dtAlt the dtAlt to set
     */
    public function setDtAlt($dtAlt) {
        $this->dtAlt = $dtAlt;
    }

    /**
     * @returnthe codCcus
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
     * @returnthe ccus
     */
    public function getCcus() {
        return $this->ccus;
    }

    /**
     * @param ccus the ccus to set
     */
    public function setCcus($ccus) {
        $this->ccus = $ccus;
    }

}
