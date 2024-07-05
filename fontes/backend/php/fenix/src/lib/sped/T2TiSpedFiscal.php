<?php
/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Lib T2Ti Sped Fiscal

The MIT License

Copyright: Copyright (C) 2020 T2Ti.COM


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
copies of the to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

The author may be contacted at: t2ti.com@gmail.com


@author Albert Eije (alberteije@gmail.com)
@version 1.0.0
*******************************************************************************/
declare(strict_types=1);

class T2TiSpedFiscal {

    private $bloco0;
    private $blocoC;
    private $blocoE;
    private $blocoH;
    private $bloco1;
    private $bloco9;
    private $linhasArquivo;

    public function __construct()
    {
        $this->bloco0 = new EFDBloco0();
        $this->blocoC = new EFDBlocoC();
        $this->blocoE = new EFDBlocoE();
        $this->blocoH = new EFDBlocoH();
        $this->bloco1 = new EFDBloco1();
        $this->bloco9 = new EFDBloco9();
        $this->linhasArquivo = array();
    }

    public function geraArquivoTxt($pArquivo) {
        try {
            //bloco 0
            $this->linhasArquivo[] = $this->bloco0->gravaRegistro0000();
            $this->incluiRegistro9900("0000", 1);
            $this->linhasArquivo[] = $this->bloco0->gravaRegistro0001();
            $this->incluiRegistro9900("0001", 1);
            $this->linhasArquivo[] = $this->bloco0->gravaRegistro0005();
            $this->incluiRegistro9900("0005", 1);
            $this->linhasArquivo[] = $this->bloco0->gravaRegistro0100();
            $this->incluiRegistro9900("0100", 1);
            if (count($this->bloco0->getListaRegistro0150()) > 0) {
                $this->linhasArquivo[] = $this->bloco0->gravaRegistro0150();
                $this->incluiRegistro9900("0150", count($this->bloco0->getListaRegistro0150()));
                if ($this->bloco0->getNumeroRegistro0175() > 0) {
                    $this->incluiRegistro9900("0175", $this->bloco0->getNumeroRegistro0175());
                }
            }
            if (count($this->bloco0->getListaRegistro0190()) > 0) {
                $this->linhasArquivo[] = $this->bloco0->gravaRegistro0190();
                $this->incluiRegistro9900("0190", count($this->bloco0->getListaRegistro0190()));
            }
            if (count($this->bloco0->getListaRegistro0200()) > 0) {
                $this->linhasArquivo[] = $this->bloco0->gravaRegistro0200();
                $this->incluiRegistro9900("0200", count($this->bloco0->getListaRegistro0200()));
                if ($this->bloco0->getNumeroRegistro0205() > 0) {
                    $this->incluiRegistro9900("0205", $this->bloco0->getNumeroRegistro0205());
                }
                if ($this->bloco0->getNumeroRegistro0220() > 0) {
                    $this->incluiRegistro9900("0220", $this->bloco0->getNumeroRegistro0220());
                }
            }
            $this->linhasArquivo[] = $this->bloco0->gravaRegistro0990();
            $this->incluiRegistro9900("0990", 1);

            //bloco C
            $this->linhasArquivo[] = $this->blocoC->gravaRegistroC001();
            $this->incluiRegistro9900("C001", 1);
            if (count($this->blocoC->getListaRegistroC100()) > 0) {
                $this->linhasArquivo[] = $this->blocoC->gravaRegistroC100();
                $this->incluiRegistro9900("C100", count($this->blocoC->getListaRegistroC100()));
                if ($this->blocoC->getNumeroRegistroC170() > 0) {
                    $this->incluiRegistro9900("C170", $this->blocoC->getNumeroRegistroC170());
                }
                if ($this->blocoC->getNumeroRegistroC190() > 0) {
                    $this->incluiRegistro9900("C190", $this->blocoC->getNumeroRegistroC190());
                }
            }
            if (count($this->blocoC->getListaRegistroC114()) > 0) {
                $this->linhasArquivo[] = $this->blocoC->gravaRegistroC114();
                $this->incluiRegistro9900("C114", count($this->blocoC->getListaRegistroC114()));
            }
            if (count($this->blocoC->getListaRegistroC300()) > 0) {
                $this->linhasArquivo[] = $this->blocoC->gravaRegistroC300();
                $this->incluiRegistro9900("C300", count($this->blocoC->getListaRegistroC300()));
                if ($this->blocoC->getNumeroRegistroC310() > 0) {
                    $this->incluiRegistro9900("C310", $this->blocoC->getNumeroRegistroC310());
                }
                if ($this->blocoC->getNumeroRegistroC320() > 0) {
                    $this->incluiRegistro9900("C320", $this->blocoC->getNumeroRegistroC320());
                    if ($this->blocoC->getNumeroRegistroC321() > 0) {
                        $this->incluiRegistro9900("C321", $this->blocoC->getNumeroRegistroC321());
                    }
                }
            }
            if (count($this->blocoC->getListaRegistroC350()) > 0) {
                $this->linhasArquivo[] = $this->blocoC->gravaRegistroC350();
                $this->incluiRegistro9900("C350", count($this->blocoC->getListaRegistroC350()));
                if ($this->blocoC->getNumeroRegistroC370() > 0) {
                    $this->incluiRegistro9900("C370", $this->blocoC->getNumeroRegistroC370());
                }
                if ($this->blocoC->getNumeroRegistroC390() > 0) {
                    $this->incluiRegistro9900("C390", $this->blocoC->getNumeroRegistroC390());
                }
            }
            if (count($this->blocoC->getListaRegistroC400()) > 0) {
                $this->linhasArquivo[] = $this->blocoC->gravaRegistroC400();
                $this->incluiRegistro9900("C400", count($this->blocoC->getListaRegistroC400()));
                if ($this->blocoC->getNumeroRegistroC405() > 0) {
                    $this->incluiRegistro9900("C405", count($this->blocoC->getNumeroRegistroC405()));
                    if ($this->blocoC->getNumeroRegistroC420() > 0) {
                        $this->incluiRegistro9900("C420", $this->blocoC->getNumeroRegistroC420());
                    }
                    if ($this->blocoC->getNumeroRegistroC460() > 0) {
                        $this->incluiRegistro9900("C460", $this->blocoC->getNumeroRegistroC460());
                        if ($this->blocoC->getNumeroRegistroC470() > 0) {
                            $this->incluiRegistro9900("C470", $this->blocoC->getNumeroRegistroC470());
                        }
                    }
                    if ($this->blocoC->getNumeroRegistroC490() > 0) {
                        $this->incluiRegistro9900("C490", $this->blocoC->getNumeroRegistroC490());
                    }
                }
            }
            if (count($this->blocoC->getListaRegistroC425()) > 0) {
                $this->linhasArquivo[] = $this->blocoC->gravaRegistroC425();
                $this->incluiRegistro9900("C425", count($this->blocoC->getListaRegistroC425()));
            }
            $this->linhasArquivo[] = $this->blocoC->gravaRegistroC990();
            $this->incluiRegistro9900("C990", 1);

            //bloco E
            $this->linhasArquivo[] = $this->blocoE->gravaRegistroE001();
            $this->incluiRegistro9900("E001", 1);
            if (count($this->blocoE->getListaRegistroE100()) > 0) {
                $this->linhasArquivo[] = $this->blocoE->gravaRegistroE100($this->bloco0->getRegistro0000()->getCodVer());
                $this->incluiRegistro9900("E100", count($this->blocoE->getListaRegistroE100()));
                if ($this->blocoE->getNumeroRegistroE110() > 0) {
                    $this->incluiRegistro9900("E110", $this->blocoE->getNumeroRegistroE110());
                    if ($this->blocoE->getNumeroRegistroE116() > 0) {
                        $this->incluiRegistro9900("E116", $this->blocoE->getNumeroRegistroE116());
                    }
                }
            }
            $this->linhasArquivo[] = $this->blocoE->gravaRegistroE990();
            $this->incluiRegistro9900("E990", 1);

            //bloco H
            $this->linhasArquivo[] = $this->blocoH->gravaRegistroH001();
            $this->incluiRegistro9900("H001", 1);
            if (count($this->blocoH->getListaRegistroH005()) > 0) {
                $this->linhasArquivo[] = $this->blocoH->gravaRegistroH005();
                $this->incluiRegistro9900("H005", $this->blocoH->getNumeroRegistroH005());
                if ($this->blocoH->getNumeroRegistroH010() > 0) {
                    $this->incluiRegistro9900("H010", $this->blocoH->getNumeroRegistroH010());
                }
            }
            $this->linhasArquivo[] = $this->blocoH->gravaRegistroH990();
            $this->incluiRegistro9900("H990", 1);

            //bloco 1
            $this->linhasArquivo[] = $this->bloco1->gravaRegistro1001();
            $this->incluiRegistro9900("1001", 1);
            if (count($this->bloco1->getListaRegistro1010()) > 0) {
                $this->linhasArquivo[] = $this->bloco1->gravaRegistro1010();
                $this->incluiRegistro9900("1010", $this->bloco1->getNumeroRegistro1010());
            }
            $this->linhasArquivo[] = $this->bloco1->gravaRegistro1990();
            $this->incluiRegistro9900("1990", 1);

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
                    + $this->blocoC->getRegistroC990()->getQtdLinC()
                    + $this->blocoE->getRegistroE990()->getQtdLinE()
                    + $this->blocoH->getRegistroH990()->getQtdLinH()
                    + $this->bloco1->getRegistro1990()->getQtdLin1()
                    + $this->bloco9->getRegistro9990()->getQtdLin9());
            $this->linhasArquivo[] = $this->bloco9->gravaRegistro9999();

            for ($i=0; $i < count($this->linhasArquivo); $i++) { 
                fwrite($pArquivo, $this->linhasArquivo[$i]);
            }
        } catch(Exception $e) {
			//TODO: tratar erro na geração do arquivo
			echo $e->getMessage();
		}
    }

    private function incluiRegistro9900($registro, $quantidade) {
        $registro9900 = new EFDRegistro9900();
        $registro9900->setRegBlc($registro);
        $registro9900->setQtdRegBlc($quantidade);

        $this->bloco9->adicionaRegistro9900($registro9900);
    }

    public function getDelimitador() {
        return $this->spedUtil->getDelimitador();
    }

    /**
     * @return the bloco0
     */
    public function getBloco0() {
        return $this->bloco0;
    }

    /**
     * @return the blocoC
     */
    public function getBlocoC() {
        return $this->blocoC;
    }

    /**
     * @return the blocoE
     */
    public function getBlocoE() {
        return $this->blocoE;
    }

    /**
     * @return the blocoH
     */
    public function getBlocoH() {
        return $this->blocoH;
    }

    /**
     * @return the bloco1
     */
    public function getBloco1() {
        return $this->bloco1;
    }

    /**
     * @return the bloco9
     */
    public function getBloco9() {
        return $this->bloco9;
    }
}
