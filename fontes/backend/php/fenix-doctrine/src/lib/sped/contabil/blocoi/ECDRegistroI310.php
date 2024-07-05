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

class ECDRegistroI310
{

    private $codCta; /// Código da conta analítica debitada/creditada.
    private $codCcus; /// Código do centro de custos.
    private $valDebd; /// Total dos débitos do dia.
    private $valCred; /// Total dos créditos do dia.

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
     * @return the valDebd
     */
    public function getValDebd() {
        return $this->valDebd;
    }

    /**
     * @param valDebd the valDebd to set
     */
    public function setValDebd($valDebd) {
        $this->valDebd = $valDebd;
    }

    /**
     * @return the valCred
     */
    public function getValCred() {
        return $this->valCred;
    }

    /**
     * @param valCred the valCred to set
     */
    public function setValCred($valCred) {
        $this->valCred = $valCred;
    }

}
