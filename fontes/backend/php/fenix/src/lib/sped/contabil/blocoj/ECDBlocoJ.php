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

class ECDBlocoJ
{
    private $registroJ001;
    private $listaRegistroJ005;
    private $listaRegistroJ800;
    private $registroJ900;
    private $listaRegistroJ930;
    private $registroJ990;
    private $numeroRegistrosJ100;
    private $numeroRegistrosJ150;
    private $spedUtil;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->registroJ001 = new ECDRegistroJ001();
        $this->registroJ001->setIndDad(1);
        $this->listaRegistroJ005 = array();
        $this->listaRegistroJ800 = array();
        $this->listaRegistroJ930 = array();
        $this->registroJ900 = new ECDRegistroJ900();

        $this->registroJ990 = new ECDRegistroJ990();
        $this->registroJ990->setQtdLinJ(0);

        $this->numeroRegistrosJ100 = 0;
        $this->numeroRegistrosJ150 = 0;

        $this->spedUtil = new SpedUtil();
    }

    public function limpaRegistros() {
        $this->listaRegistroJ005 = array();
        $this->listaRegistroJ800 = array();
        $this->listaRegistroJ930 = array();

        $this->registroJ990->setQtdLinJ(0);
    }

    public function gravaRegistroJ001() {
        $this->registroJ990->setQtdLinJ($this->registroJ990->getQtdLinJ() + 1);

        return $this->spedUtil->preencheTexto("J001")
                . $this->spedUtil->preencheValorInteiro($this->registroJ001->getIndDad())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistroJ005() {
        $registro = "";
        foreach ($this->listaRegistroJ005 as $registroJ005) {
            $registro .= $this->spedUtil->preencheTexto("J005")
                    . $this->spedUtil->preencheData($registroJ005->getDtIni())
                    . $this->spedUtil->preencheData($registroJ005->getDtFin())
                    . $this->spedUtil->preencheValorInteiro($registroJ005->getIdDem())
                    . $this->spedUtil->preencheTexto($registroJ005->getCabDem())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $registro .= $this->gravaRegistroJ100($this->$registroJ005->getRegistroJ100List());
            $registro .= $this->gravaRegistroJ150($this->$registroJ005->getRegistroJ150List());

            $this->registroJ990->setQtdLinJ($this->registroJ990->getQtdLinJ() + 1);
        }
        return $registro;
    }

    private function gravaRegistroJ100($listaRegistroJ100) {
        $registro = "";
        foreach ($this->listaRegistroJ100 as $registroJ100) {
            $registro .= $this->spedUtil->preencheTexto("J100")
                    . $this->spedUtil->preencheTexto($registroJ100->getCodAgl())
                    . $this->spedUtil->preencheTexto($registroJ100->getNivelAgl())
                    . $this->spedUtil->preencheTexto($registroJ100->getIndGrpBal())
                    . $this->spedUtil->preencheTexto($registroJ100->getDescrCodAgl())
                    . $this->spedUtil->preencheValorDecimal($registroJ100->getVlCta())
                    . $this->spedUtil->preencheTexto($registroJ100->getIndDcBal())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroJ990->setQtdLinJ($this->registroJ990->getQtdLinJ() + 1);
            $this->numeroRegistrosJ100 += 1;
        }
        return $registro;
    }

    private function gravaRegistroJ150($listaRegistroJ150) {
        $registro = "";
        foreach ($this->listaRegistroJ150 as $registroJ150) {
            $registro .= $this->spedUtil->preencheTexto("J150")
                    . $this->spedUtil->preencheTexto($registroJ150->getCodAgl())
                    . $this->spedUtil->preencheTexto($registroJ150->getNivelAgl())
                    . $this->spedUtil->preencheTexto($registroJ150->getDescrCodAgl())
                    . $this->spedUtil->preencheValorDecimal($registroJ150->getVlCta())
                    . $this->spedUtil->preencheTexto($registroJ150->getIndVl())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroJ990->setQtdLinJ($this->registroJ990->getQtdLinJ() + 1);
            $this->numeroRegistrosJ150 += 1;
        }
        return $registro;
    }

    public function gravaRegistroJ800() {
        $registro = "";
        foreach ($this->listaRegistroJ800 as $registroJ800) {
            $registro .= $this->spedUtil->preencheTexto("J800")
                    . $this->spedUtil->preencheTexto($registroJ800->getArqRtf())
                    . $this->spedUtil->preencheTexto("J800FIM")
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroJ990->setQtdLinJ($this->registroJ990->getQtdLinJ() + 1);
        }
        return $registro;
    }

    public function gravaRegistroJ900() {
        $this->registroJ990->setQtdLinJ($this->registroJ990->getQtdLinJ() + 1);

        return $this->spedUtil->preencheTexto("J900")
                . $this->spedUtil->preencheTexto("TERMO DE ENCERRAMENTO")
                . $this->spedUtil->preencheTexto($this->registroJ900->getNumOrd())
                . $this->spedUtil->preencheTexto($this->registroJ900->getNatLivro())
                . $this->spedUtil->preencheTexto($this->registroJ900->getNome())
                . $this->spedUtil->preencheValorInteiro($this->registroJ900->getQtdLin())
                . $this->spedUtil->preencheData($this->registroJ900->getDtIniEscr())
                . $this->spedUtil->preencheData($this->registroJ900->getDtFinEscr())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    public function gravaRegistroJ930() {
        $registro = "";
        foreach ($this->listaRegistroJ930 as $registroJ930) {
            $registro .= $this->spedUtil->preencheTexto("J930")
                    . $this->spedUtil->preencheTexto($registroJ930->getIdentNom())
                    . $this->spedUtil->preencheTexto($registroJ930->getIdentCpf())
                    . $this->spedUtil->preencheTexto($registroJ930->getIdentQualif())
                    . $this->spedUtil->preencheTexto($registroJ930->getCodAssin())
                    . $this->spedUtil->preencheTexto($registroJ930->getIndCrc())
                    . $this->spedUtil->getDelimitador()
                    . $this->spedUtil->getCrlf();

            $this->registroJ990->setQtdLinJ($this->registroJ990->getQtdLinJ() + 1);
        }
        return $registro;
    }

    public function gravaRegistroJ990() {
        $this->registroJ990->setQtdLinJ($this->registroJ990->getQtdLinJ() + 1);

        return $this->spedUtil->preencheTexto("J990")
                . $this->spedUtil->preencheValorInteiro($this->registroJ990->getQtdLinJ())
                . $this->spedUtil->getDelimitador()
                . $this->spedUtil->getCrlf();
    }

    /**
     * @return the registroJ001
     */
    public function getRegistroJ001() {
        return $this->registroJ001;
    }

    /**
     * @param registroJ001 the registroJ001 to set
     */
    public function setRegistroJ001($registroJ001) {
        $this->registroJ001 = $registroJ001;
    }

    /**
     * @return the listaRegistroJ005
     */
    public function getListaRegistroJ005() {
        return $this->listaRegistroJ005;
    }

    /**
     * @param listaRegistroJ005 the listaRegistroJ005 to set
     */
    public function setListaRegistroJ005($listaRegistroJ005) {
        $this->listaRegistroJ005 = $listaRegistroJ005;
    }

    /**
     * @return the listaRegistroJ800
     */
    public function getListaRegistroJ800() {
        return $this->listaRegistroJ800;
    }

    /**
     * @param listaRegistroJ800 the listaRegistroJ800 to set
     */
    public function setListaRegistroJ800($listaRegistroJ800) {
        $this->listaRegistroJ800 = $listaRegistroJ800;
    }

    /**
     * @return the registroJ900
     */
    public function getRegistroJ900() {
        return $this->registroJ900;
    }

    /**
     * @param registroJ900 the registroJ900 to set
     */
    public function setRegistroJ900($registroJ900) {
        $this->registroJ900 = $registroJ900;
    }

    /**
     * @return the listaRegistroJ930
     */
    public function getListaRegistroJ930() {
        return $this->listaRegistroJ930;
    }

    /**
     * @param listaRegistroJ930 the listaRegistroJ930 to set
     */
    public function setListaRegistroJ930($listaRegistroJ930) {
        $this->listaRegistroJ930 = $listaRegistroJ930;
    }

    /**
     * @return the registroJ990
     */
    public function getRegistroJ990() {
        return $this->registroJ990;
    }

    /**
     * @param registroJ990 the registroJ990 to set
     */
    public function setRegistroJ990($registroJ990) {
        $this->registroJ990 = $registroJ990;
    }

    /**
     * @return the numeroRegistrosJ100
     */
    public function getNumeroRegistrosJ100() {
        return $this->numeroRegistrosJ100;
    }

    /**
     * @param numeroRegistrosJ100 the numeroRegistrosJ100 to set
     */
    public function setNumeroRegistrosJ100($numeroRegistrosJ100) {
        $this->numeroRegistrosJ100 = $numeroRegistrosJ100;
    }

    /**
     * @return the numeroRegistrosJ150
     */
    public function getNumeroRegistrosJ150() {
        return $this->numeroRegistrosJ150;
    }

    /**
     * @param numeroRegistrosJ150 the numeroRegistrosJ150 to set
     */
    public function setNumeroRegistrosJ150($numeroRegistrosJ150) {
        $this->numeroRegistrosJ150 = $numeroRegistrosJ150;
    }
 

}
