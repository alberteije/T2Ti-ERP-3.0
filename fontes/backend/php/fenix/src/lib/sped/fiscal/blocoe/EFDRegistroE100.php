<?php
/*******************************************************************************
Title: T2Ti ERP Fenix
Description: Model relacionado ao SPED Fiscal

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

class EFDRegistroE100  {
    
    private $dtIni; // Data inicial a que a apuração se refere
    private $dtFin; // Data final a que a apuração se refere
    private $registroE110;

    /**
     * @return the dtIni
     */
    public function getDtIni() {
        return $this->dtIni;
    }

    /**
     * @param dtIni the dtIni to set
     */
    public function setDtIni($dtIni) {
        $this->dtIni = $dtIni;
    }

    /**
     * @return the dtFin
     */
    public function getDtFin() {
        return $this->dtFin;
    }

    /**
     * @param dtFin the dtFin to set
     */
    public function setDtFin($dtFin) {
        $this->dtFin = $dtFin;
    }

    /**
     * @return the registroe110
     */
    public function getRegistroE110() {
        return $this->registroE110;
    }

    /**
     * @param registroe110 the registroe110 to set
     */
    public function setRegistroE110(RegistroE110 $registroE110) {
        $this->registroE110 = $registroE110;
    }
}
