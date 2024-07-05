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

class ECDRegistroJ930
{

    private $identNom; /// Nome do signatário.
    private $identCpf; /// CPF.
    private $identQualif; /// Qualificação do assinante, conforme tabela do Departamento Nacional de Registro do Comércio - DNRC.
    private $codAssin; /// Código de qualificação do assinante, conforme tabela do Departamento Nacional de Registro do Comércio - DNRC.
    private $indCrc; /// Número de inscrição do contabilista no Conselho Regional de Contabilidade.

    /**
     * $return the identNom
     */
    public function getIdentNom() {
        return $this->identNom;
    }

    /**
     * @param identNom the identNom to set
     */
    public function setIdentNom($identNom) {
        $this->identNom = $identNom;
    }

    /**
     * $return the identCpf
     */
    public function getIdentCpf() {
        return $this->identCpf;
    }

    /**
     * @param identCpf the identCpf to set
     */
    public function setIdentCpf($identCpf) {
        $this->identCpf = $identCpf;
    }

    /**
     * $return the identQualif
     */
    public function getIdentQualif() {
        return $this->identQualif;
    }

    /**
     * @param identQualif the identQualif to set
     */
    public function setIdentQualif($identQualif) {
        $this->identQualif = $identQualif;
    }

    /**
     * $return the codAssin
     */
    public function getCodAssin() {
        return $this->codAssin;
    }

    /**
     * @param codAssin the codAssin to set
     */
    public function setCodAssin($codAssin) {
        $this->codAssin = $codAssin;
    }

    /**
     * $return the indCrc
     */
    public function getIndCrc() {
        return $this->indCrc;
    }

    /**
     * @param indCrc the indCrc to set
     */
    public function setIndCrc($indCrc) {
        $this->indCrc = $indCrc;
    }


}
