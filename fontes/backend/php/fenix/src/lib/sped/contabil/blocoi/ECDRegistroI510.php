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

class ECDRegistroI510
{

    private $nmCampo; ///Nome do campo, sem espaços em branco ou caractere especial.
    private $descCampo; ///Descrição do campo que será utilizado na visualização do Livro Auxiliar.
    private $tipoCampo; ///Tipo do campo
    private $tamCampo; ///Tamanho do campo.
    private $decCampo; ///Quantidade de casas decimais para campos tipo "N".
    private $colCampo; ///Largura da coluna no relatório (em quantidade de caracteres).

    /**
     * @return the nmCampo
     */
    public function getNmCampo() {
        return $this->nmCampo;
    }

    /**
     * @param nmCampo the nmCampo to set
     */
    public function setNmCampo($nmCampo) {
        $this->nmCampo = $nmCampo;
    }

    /**
     * @return the descCampo
     */
    public function getDescCampo() {
        return $this->descCampo;
    }

    /**
     * @param descCampo the descCampo to set
     */
    public function setDescCampo($descCampo) {
        $this->descCampo = $descCampo;
    }

    /**
     * @return the tipoCampo
     */
    public function getTipoCampo() {
        return $this->tipoCampo;
    }

    /**
     * @param tipoCampo the tipoCampo to set
     */
    public function setTipoCampo($tipoCampo) {
        $this->tipoCampo = $tipoCampo;
    }

    /**
     * @return the tamCampo
     */
    public function getTamCampo() {
        return $this->tamCampo;
    }

    /**
     * @param tamCampo the tamCampo to set
     */
    public function setTamCampo($tamCampo) {
        $this->tamCampo = $tamCampo;
    }

    /**
     * @return the decCampo
     */
    public function getDecCampo() {
        return $this->decCampo;
    }

    /**
     * @param decCampo the decCampo to set
     */
    public function setDecCampo($decCampo) {
        $this->decCampo = $decCampo;
    }

    /**
     * @return the colCampo
     */
    public function getColCampo() {
        return $this->colCampo;
    }

    /**
     * @param colCampo the colCampo to set
     */
    public function setColCampo($colCampo) {
        $this->colCampo = $colCampo;
    }

}
