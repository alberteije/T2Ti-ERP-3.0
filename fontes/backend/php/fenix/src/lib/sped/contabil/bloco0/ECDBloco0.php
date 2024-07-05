<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado ao SPED Contábil - ECD
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti->COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software->                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT-> IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE->                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti->com@gmail->com                                                   
                                                                                
@author Albert Eije (alberteije@gmail->com)                    
@version 1->0->0
*******************************************************************************/
declare(strict_types=1);

class ECDBloco0
{
    private $registro0000;
    private $registro0001;
    private $listaRegistro0007;
    private $listaRegistro0020;
    private $listaregistro0150;
    private $listaRegistro0180;
    private $registro0990;
	private $spedUtil;
	
    /**
     * Constructor
     */
    public function __construct()
    {
		$this->registro0000 = new ECDRegistro0000();
        $this->registro0001 = new ECDRegistro0001();
        $this->registro0001->setIndDad(1);
        $this->listaRegistro0007 = array();
        $this->listaRegistro0020 = array();
        $this->listaregistro0150 = array();
        $this->listaRegistro0180 = array();
        $this->registro0990 = new ECDRegistro0990();
        $this->registro0990->setQtdLin0(0);
        $this->spedUtil = new SpedUtil();
	}
	
    public function limpaRegistros() {
        $this->listaRegistro0007 = array();
        $this->listaRegistro0020 = array();
        $this->listaregistro0150 = array();
        $this->listaRegistro0180 = array();
        $this->registro0990->setQtdLin0(0);
	}	
	
    public function gravaRegistro0000() {
        $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);

        return $this->spedUtil->preencheTexto("0000")
                . $this->spedUtil->preencheTexto("LECD")
                . $this->spedUtil->preencheData($this->registro0000->getDtIni())
                . $this->spedUtil->preencheData($this->registro0000->getDtFin())
                . $this->spedUtil->preencheTexto($this->registro0000->getNome())
                . $this->spedUtil->preencheTexto($this->registro0000->getCnpj())
                . $this->spedUtil->preencheTexto($this->registro0000->getUf())
                . $this->spedUtil->preencheTexto($this->registro0000->getIe())
                . $this->spedUtil->preencheTexto($this->registro0000->getCodMun())
                . $this->spedUtil->preencheTexto($this->registro0000->getIm())
                . $this->spedUtil->preencheValorInteiro($this->registro0000->getIndSitEsp())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
	}
	
    public function gravaRegistro0001() {
        $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);

        return $this->spedUtil->preencheTexto("0001")
                . $this->spedUtil->preencheValorInteiro($this->registro0001->getIndDad())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistro0007() {
        $registro = "";
        foreach ($this->listaRegistro0007 as $registro0007) {
            $registro .= ($this->spedUtil->preencheTexto("0007")
                    . $this->spedUtil->preencheTexto($registro0007->getCodEntRef())
                    . $this->spedUtil->preencheTexto($registro0007->getCodInscr())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf());

            $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
        }
        return $registro;
    }

    public function gravaRegistro0020() {
        $registro = "";
        foreach ($this->listaRegistro0020 as $registro0020) {
            $registro .= ($this->spedUtil->preencheTexto("0020")
                    . $this->spedUtil->preencheValorInteiro($registro0020->getIndDec())
                    . $this->spedUtil->preencheTexto($registro0020->getCnpj())
                    . $this->spedUtil->preencheTexto($registro0020->getUf())
                    . $this->spedUtil->preencheTexto($registro0020->getIe())
                    . $this->spedUtil->preencheTexto($registro0020->getCodMun())
                    . $this->spedUtil->preencheTexto($registro0020->getIm())
                    . $this->spedUtil->preencheTexto($registro0020->getNire())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf());

			$this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
        }
        return $registro;
    }

    public function gravaregistro0150() {
        $registro = "";
        foreach ($this->listaregistro0150 as $registro0150) {
            $registro .= $this->spedUtil->preencheTexto("0150")
                    . $this->spedUtil->preencheTexto($registro0150->getCodPart())
                    . $this->spedUtil->preencheTexto($registro0150->getNome())
                    . $this->spedUtil->preencheValorInteiro($registro0150->getCodPais())
                    . $this->spedUtil->preencheTexto($registro0150->getCnpj())
                    . $this->spedUtil->preencheTexto($registro0150->getCpf())
                    . $this->spedUtil->preencheTexto($registro0150->getNit())
                    . $this->spedUtil->preencheTexto($registro0150->getUf())
                    . $this->spedUtil->preencheTexto($registro0150->getIe())
                    . $this->spedUtil->preencheTexto($registro0150->getIeSt())
                    . $this->spedUtil->preencheTexto($registro0150->getCodMun())
                    . $this->spedUtil->preencheTexto($registro0150->getIm())
                    . $this->spedUtil->preencheTexto($registro0150->getSuframa())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

			$this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
        }
        return $registro;
    }

    public function gravaRegistro0180() {
        $registro = "";
        foreach ($this->listaRegistro0180 as $registro0180) {
            $registro .= $this->spedUtil->preencheTexto("0180")
                    . $this->spedUtil->preencheTexto($registro0180->getCodRel())
                    . $this->spedUtil->preencheTexto($registro0180->getDtIniRel())
                    . $this->spedUtil->preencheTexto($registro0180->getDtFinRel())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

			$this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);
        }
        return $registro;
    }

    public function gravaRegistro0990() {
        $this->registro0990->setQtdLin0($this->registro0990->getQtdLin0() + 1);

        return $this->spedUtil->preencheTexto("0990")
                . $this->spedUtil->preencheValorInteiro($this->registro0990->getQtdLin0())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    /**
     * @return the registro0000
     */
    public function getRegistro0000() {
        return $this->registro0000;
    }

    /**
     * @return the registro0001
     */
    public function getRegistro0001() {
        return $this->registro0001;
    }

    /**
     * @return the listaRegistro0007
     */
    public function getListaRegistro0007() {
        return $this->listaRegistro0007;
    }

    /**
     * @return the listaRegistro0020
     */
    public function getListaRegistro0020() {
        return $this->listaRegistro0020;
    }

    /**
     * @return the lista$registro0150
     */
    public function getListaRegistro0150() {
        return $this->listaregistro0150;
    }

    /**
     * @return the listaRegistro0180
     */
    public function getListaRegistro0180() {
        return $this->listaRegistro0180;
    }

    /**
     * @return the registro0990
     */
    public function getRegistro0990() {
        return $this->registro0990;
    }	
}
