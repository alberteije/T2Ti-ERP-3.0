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

class ECDRegistroI050
{
    private $dtAlt; /// Data da inclusão/alteração.
    private $codNat; /// Código da natureza da conta/grupo de contas, conforme tabela publicada pelo Sped.
    private $indCta; /// Indicador do tipo de conta
    private $nivel; /// Nível da conta analítica/grupo de contas.
    private $codCta; /// Código da conta analítica/grupo de contas.
    private $codCtaSup; /// Código da conta sintética /grupo de contas de nível imediatamente superior.
    private $cta; /// Nome da conta analítica/grupo de contas.
    private $registroi051List; /// BLOCO I - Lista de RegistroI051 (FILHO)
    private $registroi052List; /// BLOCO I - Lista de RegistroI052 (FILHO)

    public function __construct()
    {
        $this->registroi051List = array();
        $this->registroi052List = array();
    }

    /**
     * @return the dtAlt
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
     * @return the codNat
     */
    public function getCodNat() {
        return $this->codNat;
    }

    /**
     * @param codNat the codNat to set
     */
    public function setCodNat($codNat) {
        $this->codNat = $codNat;
    }

    /**
     * @return the indCta
     */
    public function getIndCta() {
        return $this->indCta;
    }

    /**
     * @param indCta the indCta to set
     */
    public function setIndCta($indCta) {
        $this->indCta = $indCta;
    }

    /**
     * @return the nivel
     */
    public function getNivel() {
        return $this->nivel;
    }

    /**
     * @param nivel the nivel to set
     */
    public function setNivel($nivel) {
        $this->nivel = $nivel;
    }

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
     * @return the codCtaSup
     */
    public function getCodCtaSup() {
        return $this->codCtaSup;
    }

    /**
     * @param codCtaSup the codCtaSup to set
     */
    public function setCodCtaSup($codCtaSup) {
        $this->codCtaSup = $codCtaSup;
    }

    /**
     * @return the cta
     */
    public function getCta() {
        return $this->cta;
    }

    /**
     * @param cta the cta to set
     */
    public function setCta($cta) {
        $this->cta = $cta;
    }

    /**
     * @return the registroi051List
     */
    public function getRegistroi051List() {
        return $this->registroi051List;
    }

    /**
     * @param registroi051List the registroi051List to set
     */
    public function setRegistroi051List($registroi051List) {
        $this->registroi051List = $registroi051List;
    }

    /**
     * @return the registroi052List
     */
    public function getRegistroi052List() {
        return $this->registroi052List;
    }

    /**
     * @param registroi052List the registroi052List to set
     */
    public function setRegistroi052List($registroi052List) {
        $this->registroi052List = $registroi052List;
    }

}
