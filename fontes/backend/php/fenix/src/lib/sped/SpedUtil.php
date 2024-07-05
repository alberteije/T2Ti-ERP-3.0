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

class SpedUtil
{

    private $delimitador;
    private $formatoData;
    private $crlf;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->delimitador = "|";
        $this->formatoData = "dmY";
        $this->crlf = PHP_EOL;
    }    

    public function preencheTexto($texto) {
        return $texto == null ? $this->delimitador : $this->delimitador . trim($texto);
    }

    public function preencheData($data) {
        return $data == null ? $this->delimitador : $this->delimitador . date_format($data, $this->formatoData);
    }

    public function preencheValorInteiro($valor) {
        return $valor == null ? $this->delimitador : $this->delimitador . $valor;
    }

    public function preencheValorDecimal($valor) {
        return $valor == null ? $this->delimitador : $this->delimitador . number_format($valor, 2, '.', '');
    }

    /**
     * @return the delimitador
     */
    public function getDelimitador() {
        return $this->delimitador;
    }

    /**
     * @return the crlf
     */
    public function getCrlf() {
        return $this->crlf;
    }    
}
