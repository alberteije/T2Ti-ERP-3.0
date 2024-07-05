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

class ECDRegistroI155
{

    private $codCta; /// Código da conta analítica.
    private $codCcus; /// Código do centro de custos.
    private $vlSldIni; /// Valor do saldo inicial do período.
    private $indDcIni; /// Indicador da situação do saldo inicial
    private $vlDeb; /// Valor total dos débitos no período.
    private $vlCred; /// Valor total dos créditos no período.
    private $vlSldFin; /// Valor do saldo final do período.
    private $indDcFin; /// Indicador da situação do saldo final

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
     * @return the vlSldIni
     */
    public function getVlSldIni() {
        return $this->vlSldIni;
    }

    /**
     * @param vlSldIni the vlSldIni to set
     */
    public function setVlSldIni($vlSldIni) {
        $this->vlSldIni = $vlSldIni;
    }

    /**
     * @return the indDcIni
     */
    public function getIndDcIni() {
        return $this->indDcIni;
    }

    /**
     * @param indDcIni the indDcIni to set
     */
    public function setIndDcIni($indDcIni) {
        $this->indDcIni = $indDcIni;
    }

    /**
     * @return the vlDeb
     */
    public function getVlDeb() {
        return $this->vlDeb;
    }

    /**
     * @param vlDeb the vlDeb to set
     */
    public function setVlDeb($vlDeb) {
        $this->vlDeb = $vlDeb;
    }

    /**
     * @return the vlCred
     */
    public function getVlCred() {
        return $this->vlCred;
    }

    /**
     * @param vlCred the vlCred to set
     */
    public function setVlCred($vlCred) {
        $this->vlCred = $vlCred;
    }

    /**
     * @return the vlSldFin
     */
    public function getVlSldFin() {
        return $this->vlSldFin;
    }

    /**
     * @param vlSldFin the vlSldFin to set
     */
    public function setVlSldFin($vlSldFin) {
        $this->vlSldFin = $vlSldFin;
    }

    /**
     * @return the indDcFin
     */
    public function getIndDcFin() {
        return $this->indDcFin;
    }

    /**
     * @param indDcFin the indDcFin to set
     */
    public function setIndDcFin($indDcFin) {
        $this->indDcFin = $indDcFin;
    }

}
