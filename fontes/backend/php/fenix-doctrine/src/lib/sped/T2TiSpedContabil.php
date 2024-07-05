<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Lib T2Ti Sped Contábil
                                                                                
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

class T2TiSpedContabil
{
    private $bloco0;
    private $blocoI;
    private $blocoJ;
    private $bloco9;
    private $spedUtil;
    private $linhasArquivo;
    private $indexI030;
    private $indexJ900;

    public function __construct()
	{
        $this->spedUtil = new SpedUtil();

        $this->bloco0 = new ECDBloco0();
        $this->blocoI = new ECDBlocoI();
        $this->blocoJ = new ECDBlocoJ();
        $this->bloco9 = new ECDBloco9();
        $this->linhasArquivo = array();
    }

    public function limpaRegistros() {
        $this->bloco0->limpaRegistros();
        $this->blocoI->limpaRegistros();
        $this->blocoJ->limpaRegistros();
		$this->bloco9->limpaRegistros();
    }

    public function geraArquivoTxt($pArquivo) {
		try {
			$this->bloco9->limpaContador();

			//bloco 0
			$this->linhasArquivo[] = $this->bloco0->gravaRegistro0000();
			$this->incluiRegistro9900("0000", 1);
			$this->linhasArquivo[] = $this->bloco0->gravaRegistro0001();
			$this->incluiRegistro9900("0001", 1);
			if (count($this->bloco0->getListaRegistro0007()) > 0) {
				$this->linhasArquivo[] = $this->bloco0->gravaRegistro0007();
				$this->incluiRegistro9900("0007", count($this->bloco0->getListaRegistro0007()));
			}
			if (count($this->bloco0->getListaRegistro0020()) > 0) {
				$this->linhasArquivo[] = $this->bloco0->gravaRegistro0020();
				$this->incluiRegistro9900("0020", count($this->bloco0->getListaRegistro0020()));
			}
			if (count($this->bloco0->getListaRegistro0150()) > 0) {
				$this->linhasArquivo[] = $this->bloco0->gravaRegistro0150();
				$this->incluiRegistro9900("0150", count($this->bloco0->getListaRegistro0150()));
			}
			if (count($this->bloco0->getListaRegistro0180()) > 0) {
				$this->linhasArquivo[] = $this->bloco0->gravaRegistro0180();
				$this->incluiRegistro9900("0180", count($this->bloco0->getListaRegistro0180()));
			}
			$this->linhasArquivo[] = $this->bloco0->gravaRegistro0990();
			$this->incluiRegistro9900("0990", 1);
	
			//bloco I
			$this->linhasArquivo[] = $this->blocoI->gravaRegistroI001();
			$this->incluiRegistro9900("I001", 1);
			$this->linhasArquivo[] = $this->blocoI->gravaRegistroI010();
			$this->incluiRegistro9900("I010", 1);
			if (count($this->blocoI->getListaRegistroI012()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI012();
				$this->incluiRegistro9900("I012", count($this->blocoI->getListaRegistroI012()));
				if ($this->blocoI->getNumeroRegistrosI015() > 0) {
					$this->incluiRegistro9900("I015", $this->blocoI->getNumeroRegistrosI015());
				}
			}
			if (count($this->blocoI->getListaRegistroI020()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI020();
				$this->incluiRegistro9900("I020", count($this->blocoI->getListaRegistroI020()));
			}
	
			$this->linhasArquivo[] = $this->blocoI->gravaRegistroI030();
			$this->incluiRegistro9900("I030", 1);
			$indexI030 = count($this->linhasArquivo) - 1;
	
			if (count($this->blocoI->getListaRegistroI050()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI050();
				$this->incluiRegistro9900("I050", count($this->blocoI->getListaRegistroI050()));
				if ($this->blocoI->getNumeroRegistrosI051() > 0) {
					$this->incluiRegistro9900("I051", $this->blocoI->getNumeroRegistrosI051());
				}
				if ($this->blocoI->getNumeroRegistrosI052() > 0) {
					$this->incluiRegistro9900("I052", $this->blocoI->getNumeroRegistrosI052());
				}
			}
			if (count($this->blocoI->getListaRegistroI075()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI075();
				$this->incluiRegistro9900("I075", count($this->blocoI->getListaRegistroI075()));
			}
			if (count($this->blocoI->getListaRegistroI100()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI100();
				$this->incluiRegistro9900("I100", count($this->blocoI->getListaRegistroI100()));
			}
			if (count($this->blocoI->getListaRegistroI150()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI150();
				$this->incluiRegistro9900("I150", count($this->blocoI->getListaRegistroI150()));
				if ($this->blocoI->getNumeroRegistrosI151() > 0) {
					$this->incluiRegistro9900("I151", $this->blocoI->getNumeroRegistrosI151());
				}
				if ($this->blocoI->getNumeroRegistrosI155() > 0) {
					$this->incluiRegistro9900("I155", $this->blocoI->getNumeroRegistrosI155());
				}
			}
			if (count($this->blocoI->getListaRegistroI200()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI200();
				$this->incluiRegistro9900("I200", count($this->blocoI->getListaRegistroI200()));
				if ($this->blocoI->getNumeroRegistrosI250() > 0) {
					$this->incluiRegistro9900("I250", $this->blocoI->getNumeroRegistrosI250());
				}
			}
			if (count($this->blocoI->getListaRegistroI300()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI300();
				$this->incluiRegistro9900("I300", count($this->blocoI->getListaRegistroI300()));
				if ($this->blocoI->getNumeroRegistrosI310() > 0) {
					$this->incluiRegistro9900("I310", $this->blocoI->getNumeroRegistrosI310());
				}
			}
			if (count($this->blocoI->getListaRegistroI350()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI350();
				$this->incluiRegistro9900("I350", count($this->blocoI->getListaRegistroI350()));
				if ($this->blocoI->getNumeroRegistrosI355() > 0) {
					$this->incluiRegistro9900("I355", $this->blocoI->getNumeroRegistrosI355());
				}
			}
			if (count($this->blocoI->getListaRegistroI500()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI500();
				$this->incluiRegistro9900("I500", count($this->blocoI->getListaRegistroI500()));
			}
			if (count($this->blocoI->getListaRegistroI510()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI510();
				$this->incluiRegistro9900("I510", count($this->blocoI->getListaRegistroI510()));
			}
			if (count($this->blocoI->getListaRegistroI550()) > 0) {
				$this->linhasArquivo[] = $this->blocoI->gravaRegistroI550();
				$this->incluiRegistro9900("I550", count($this->blocoI->getListaRegistroI550()));
				if ($this->blocoI->getNumeroRegistrosI555() > 0) {
					$this->incluiRegistro9900("I555", $this->blocoI->getNumeroRegistrosI555());
				}
			}
			$this->linhasArquivo[] = $this->blocoI->gravaRegistroI990();
			$this->incluiRegistro9900("I990", 1);
	
			//bloco J
			$this->linhasArquivo[] = $this->blocoJ->gravaRegistroJ001();
			$this->incluiRegistro9900("J001", 1);
			if (count($this->blocoJ->getListaRegistroJ005()) > 0) {
				$this->linhasArquivo[] = $this->blocoJ->gravaRegistroJ005();
				$this->incluiRegistro9900("J005", count($this->blocoJ->getListaRegistroJ005()));
				if ($this->blocoJ->getNumeroRegistrosJ100() > 0) {
					$this->incluiRegistro9900("J100", $this->blocoJ->getNumeroRegistrosJ100());
				}
				if ($this->blocoJ->getNumeroRegistrosJ150() > 0) {
					$this->incluiRegistro9900("J150", $this->blocoJ->getNumeroRegistrosJ150());
				}
			}
			if (count($this->blocoJ->getListaRegistroJ800()) > 0) {
				$this->linhasArquivo[] = $this->blocoJ->gravaRegistroJ800();
				$this->incluiRegistro9900("J800", count($this->blocoJ->getListaRegistroJ800()));
			}
			$this->linhasArquivo[] = $this->blocoJ->gravaRegistroJ900();
			$this->incluiRegistro9900("J900", 1);
			$indexJ900 = count($this->linhasArquivo) - 1;
	
			if (count($this->blocoJ->getListaRegistroJ930()) > 0) {
				$this->linhasArquivo[] = $this->blocoJ->gravaRegistroJ930();
				$this->incluiRegistro9900("J930", count($this->blocoJ->getListaRegistroJ930()));
			}
			$this->linhasArquivo[] = $this->blocoJ->gravaRegistroJ990();
			$this->incluiRegistro9900("J990", 1);
	
			//bloco 9
			$this->linhasArquivo[] = $this->bloco9->gravaRegistro9001();
			$this->incluiRegistro9900("9001", 1);
	
			$this->incluiRegistro9900("9900", count($this->bloco9->getListaRegistro9900()) + 2);
			$this->incluiRegistro9900("9990", 1);
			$this->incluiRegistro9900("9999", 1);
			$this->linhasArquivo[] = $this->bloco9->gravaRegistro9900();
			$this->linhasArquivo[] = $this->bloco9->gravaRegistro9990();
	
			$this->bloco9->getRegistro9999()->setQtdLin(
					$this->bloco0->getRegistro0990()->getQtdLin0()
					+ $this->blocoI->getRegistroI990()->getQtdLinI()
					+ $this->blocoJ->getRegistroJ990()->getQtdLinJ()
					+ $this->bloco9->getRegistro9990()->getQtdLin9());
			$this->linhasArquivo[] = $this->bloco9->gravaRegistro9999();
	
			$this->blocoI->getRegistroI030()->setQtdLin($this->bloco9->getRegistro9999()->getQtdLin());
			$this->linhasArquivo[$indexI030] = $this->blocoI->gravaRegistroI030();
	
			$this->blocoJ->getRegistroJ900()->setQtdLin($this->bloco9->getRegistro9999()->getQtdLin());
			$this->linhasArquivo[$indexJ900] = $this->blocoJ->gravaRegistroJ900();
	
            for ($i=0; $i < count($this->linhasArquivo); $i++) { 
                fwrite($pArquivo, $this->linhasArquivo[$i]);
            }
		} catch(Exception $e) {
			//TODO: tratar erro na geração do arquivo
			echo $e->getMessage();
		}
    }

    private function incluiRegistro9900($registro, $quantidade) {
        $registro9900 = new ECDRegistro9900();
        $registro9900->setRegBlc($registro);
        $registro9900->setQtdRegBlc($quantidade);

        $this->bloco9->adicionaRegistro9900($registro9900);
    }

    /**
     * @returnthe bloco0
     */
    public function getBloco0() {
        return $this->bloco0;
    }

    /**
     * @returnthe blocoI
     */
    public function getBlocoI() {
        return $this->blocoI;
    }

    /**
     * @returnthe blocoJ
     */
    public function getBlocoJ() {
        return $this->blocoJ;
    }

    /**
     * @returnthe bloco9
     */
    public function getBloco9() {
        return $this->bloco9;
    }

}
