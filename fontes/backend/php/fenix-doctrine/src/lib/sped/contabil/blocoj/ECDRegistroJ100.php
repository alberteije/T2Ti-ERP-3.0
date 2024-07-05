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

class ECDRegistroJ100
{

    private $codAgl; /// Código de aglutinação das contas, atribuído pelo empresário ou sociedade empresária.
    private $nivelAgl; /// Nível do Código de aglutinação (mesmo conceito do plano de contas - Registro I050).
    private $indGrpBal; /// Indicador de grupo do balanço
    private $descrCodAgl; /// Descrição do Código de aglutinação.
    private $vlCta; /// Valor total do Código de aglutinação no Balanço Patrimonial no exercício informado, ou de período definido em norma específica.
    private $indDcBal; /// Indicador da situação do saldo informado no campo anterior

    /**
     * @return the codAgl
     */
    public function getCodAgl() {
        return $this->codAgl;
    }

    /**
     * @param codAgl the codAgl to set
     */
    public function setCodAgl($codAgl) {
        $this->codAgl = $codAgl;
    }

    /**
     * @return the nivelAgl
     */
    public function getNivelAgl() {
        return $this->nivelAgl;
    }

    /**
     * @param nivelAgl the nivelAgl to set
     */
    public function setNivelAgl($nivelAgl) {
        $this->nivelAgl = $nivelAgl;
    }

    /**
     * @return the indGrpBal
     */
    public function getIndGrpBal() {
        return $this->indGrpBal;
    }

    /**
     * @param indGrpBal the indGrpBal to set
     */
    public function setIndGrpBal($indGrpBal) {
        $this->indGrpBal = $indGrpBal;
    }

    /**
     * @return the descrCodAgl
     */
    public function getDescrCodAgl() {
        return $this->descrCodAgl;
    }

    /**
     * @param descrCodAgl the descrCodAgl to set
     */
    public function setDescrCodAgl($descrCodAgl) {
        $this->descrCodAgl = $descrCodAgl;
    }

    /**
     * @return the vlCta
     */
    public function getVlCta() {
        return $this->vlCta;
    }

    /**
     * @param vlCta the vlCta to set
     */
    public function setVlCta($vlCta) {
        $this->vlCta = $vlCta;
    }

    /**
     * @return the indDcBal
     */
    public function getIndDcBal() {
        return $this->indDcBal;
    }

    /**
     * @param indDcBal the indDcBal to set
     */
    public function setIndDcBal($indDcBal) {
        $this->indDcBal = $indDcBal;
    }

}
