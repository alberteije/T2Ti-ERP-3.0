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

class EFDRegistroE110  {
    
    private $vlTotDebitos; // Valor total dos débitos por "Saídas e prestações com débito do imposto"
    private $vlAjDebitos; // Valor total dos ajustes a débito decorrentes do documento fiscal.
    private $vlTotAjDebitos; // Valor total de "Ajustes a débito"
    private $vlEstornosCred; // Valor total de Ajustes “Estornos de créditos”
    private $vlTotCreditos; // Valor total dos créditos por "Entradas e aquisições com crédito do imposto"
    private $vlAjCreditos; // Valor total dos ajustes a crédito decorrentes do documento fiscal.
    private $vlTotAjCreditos; // Valor total de "Ajustes a crédito"
    private $vlEstornosDeb; // Valor total de Ajustes “Estornos de Débitos”
    private $vlSldCredorAnt; // Valor total de "Saldo credor do período anterior"
    private $vlSldApurado; // Valor total de "Saldo devedor (02+03+04+05-06-07-08-09-10) antes das deduções"
    private $vlTotDed; // Valor total de "Deduções"
    private $vlIcmsRecolher; // Valor total de "ICMS a recolher (11-12)
    private $vlSldCredorTransportar; // Valor total de "Saldo credor a transportar para o período seguinte”
    private $debEsp; // Valores recolhidos ou a recolher, extra-apuração.
    private $registroE116List;

    /**
     * @return the vlTotDebitos
     */
    public function  getVlTotDebitos() {
        return $this->vlTotDebitos;
    }

    /**
     * @param vlTotDebitos the vlTotDebitos to set
     */
    public function setVlTotDebitos($vlTotDebitos) {
        $this->vlTotDebitos = $vlTotDebitos;
    }

    /**
     * @return the vlAjDebitos
     */
    public function  getVlAjDebitos() {
        return $this->vlAjDebitos;
    }

    /**
     * @param vlAjDebitos the vlAjDebitos to set
     */
    public function setVlAjDebitos($vlAjDebitos) {
        $this->vlAjDebitos = $vlAjDebitos;
    }

    /**
     * @return the vlTotAjDebitos
     */
    public function  getVlTotAjDebitos() {
        return $this->vlTotAjDebitos;
    }

    /**
     * @param vlTotAjDebitos the vlTotAjDebitos to set
     */
    public function setVlTotAjDebitos($vlTotAjDebitos) {
        $this->vlTotAjDebitos = $vlTotAjDebitos;
    }

    /**
     * @return the vlEstornosCred
     */
    public function  getVlEstornosCred() {
        return $this->vlEstornosCred;
    }

    /**
     * @param vlEstornosCred the vlEstornosCred to set
     */
    public function setVlEstornosCred($vlEstornosCred) {
        $this->vlEstornosCred = $vlEstornosCred;
    }

    /**
     * @return the vlTotCreditos
     */
    public function  getVlTotCreditos() {
        return $this->vlTotCreditos;
    }

    /**
     * @param vlTotCreditos the vlTotCreditos to set
     */
    public function setVlTotCreditos($vlTotCreditos) {
        $this->vlTotCreditos = $vlTotCreditos;
    }

    /**
     * @return the vlAjCreditos
     */
    public function  getVlAjCreditos() {
        return $this->vlAjCreditos;
    }

    /**
     * @param vlAjCreditos the vlAjCreditos to set
     */
    public function setVlAjCreditos($vlAjCreditos) {
        $this->vlAjCreditos = $vlAjCreditos;
    }

    /**
     * @return the vlTotAjCreditos
     */
    public function  getVlTotAjCreditos() {
        return $this->vlTotAjCreditos;
    }

    /**
     * @param vlTotAjCreditos the vlTotAjCreditos to set
     */
    public function setVlTotAjCreditos($vlTotAjCreditos) {
        $this->vlTotAjCreditos = $vlTotAjCreditos;
    }

    /**
     * @return the vlEstornosDeb
     */
    public function  getVlEstornosDeb() {
        return $this->vlEstornosDeb;
    }

    /**
     * @param vlEstornosDeb the vlEstornosDeb to set
     */
    public function setVlEstornosDeb($vlEstornosDeb) {
        $this->vlEstornosDeb = $vlEstornosDeb;
    }

    /**
     * @return the vlSldCredorAnt
     */
    public function  getVlSldCredorAnt() {
        return $this->vlSldCredorAnt;
    }

    /**
     * @param vlSldCredorAnt the vlSldCredorAnt to set
     */
    public function setVlSldCredorAnt($vlSldCredorAnt) {
        $this->vlSldCredorAnt = $vlSldCredorAnt;
    }

    /**
     * @return the vlSldApurado
     */
    public function  getVlSldApurado() {
        return $this->vlSldApurado;
    }

    /**
     * @param vlSldApurado the vlSldApurado to set
     */
    public function setVlSldApurado($vlSldApurado) {
        $this->vlSldApurado = $vlSldApurado;
    }

    /**
     * @return the vlTotDed
     */
    public function  getVlTotDed() {
        return $this->vlTotDed;
    }

    /**
     * @param vlTotDed the vlTotDed to set
     */
    public function setVlTotDed($vlTotDed) {
        $this->vlTotDed = $vlTotDed;
    }

    /**
     * @return the vlIcmsRecolher
     */
    public function  getVlIcmsRecolher() {
        return $this->vlIcmsRecolher;
    }

    /**
     * @param vlIcmsRecolher the vlIcmsRecolher to set
     */
    public function setVlIcmsRecolher($vlIcmsRecolher) {
        $this->vlIcmsRecolher = $vlIcmsRecolher;
    }

    /**
     * @return the vlSldCredorTransportar
     */
    public function  getVlSldCredorTransportar() {
        return $this->vlSldCredorTransportar;
    }

    /**
     * @param vlSldCredorTransportar the vlSldCredorTransportar to set
     */
    public function setVlSldCredorTransportar($vlSldCredorTransportar) {
        $this->vlSldCredorTransportar = $vlSldCredorTransportar;
    }

    /**
     * @return the debEsp
     */
    public function  getDebEsp() {
        return $this->debEsp;
    }

    /**
     * @param debEsp the debEsp to set
     */
    public function setDebEsp($debEsp) {
        $this->debEsp = $debEsp;
    }

    /**
     * @return the registroE116List
     */
    public function getRegistroE116List() {
        return $this->registroE116List;
    }

    /**
     * @param registroE116List the registroE116List to set
     */
    public function setRegistroE116List(array $registroE116List) {
        $this->registroE116List = $registroE116List;
    }

}
