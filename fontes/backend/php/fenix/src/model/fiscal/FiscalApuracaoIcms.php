<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FISCAL_APURACAO_ICMS] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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

class FiscalApuracaoIcms extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FISCAL_APURACAO_ICMS';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */

    /**
     * Gets e Sets
     */
    public function getIdAttribute() 
	{
		return $this->attributes['ID'];
	}

	public function setIdAttribute($id) 
	{
		$this->attributes['ID'] = $id;
	}

    public function getCompetenciaAttribute() 
	{
		return $this->attributes['COMPETENCIA'];
	}

	public function setCompetenciaAttribute($competencia) 
	{
		$this->attributes['COMPETENCIA'] = $competencia;
	}

    public function getValorTotalDebitoAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_DEBITO'];
	}

	public function setValorTotalDebitoAttribute($valorTotalDebito) 
	{
		$this->attributes['VALOR_TOTAL_DEBITO'] = $valorTotalDebito;
	}

    public function getValorAjusteDebitoAttribute() 
	{
		return $this->attributes['VALOR_AJUSTE_DEBITO'];
	}

	public function setValorAjusteDebitoAttribute($valorAjusteDebito) 
	{
		$this->attributes['VALOR_AJUSTE_DEBITO'] = $valorAjusteDebito;
	}

    public function getValorTotalAjusteDebitoAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_AJUSTE_DEBITO'];
	}

	public function setValorTotalAjusteDebitoAttribute($valorTotalAjusteDebito) 
	{
		$this->attributes['VALOR_TOTAL_AJUSTE_DEBITO'] = $valorTotalAjusteDebito;
	}

    public function getValorEstornoCreditoAttribute() 
	{
		return $this->attributes['VALOR_ESTORNO_CREDITO'];
	}

	public function setValorEstornoCreditoAttribute($valorEstornoCredito) 
	{
		$this->attributes['VALOR_ESTORNO_CREDITO'] = $valorEstornoCredito;
	}

    public function getValorTotalCreditoAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_CREDITO'];
	}

	public function setValorTotalCreditoAttribute($valorTotalCredito) 
	{
		$this->attributes['VALOR_TOTAL_CREDITO'] = $valorTotalCredito;
	}

    public function getValorAjusteCreditoAttribute() 
	{
		return $this->attributes['VALOR_AJUSTE_CREDITO'];
	}

	public function setValorAjusteCreditoAttribute($valorAjusteCredito) 
	{
		$this->attributes['VALOR_AJUSTE_CREDITO'] = $valorAjusteCredito;
	}

    public function getValorTotalAjusteCreditoAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_AJUSTE_CREDITO'];
	}

	public function setValorTotalAjusteCreditoAttribute($valorTotalAjusteCredito) 
	{
		$this->attributes['VALOR_TOTAL_AJUSTE_CREDITO'] = $valorTotalAjusteCredito;
	}

    public function getValorEstornoDebitoAttribute() 
	{
		return $this->attributes['VALOR_ESTORNO_DEBITO'];
	}

	public function setValorEstornoDebitoAttribute($valorEstornoDebito) 
	{
		$this->attributes['VALOR_ESTORNO_DEBITO'] = $valorEstornoDebito;
	}

    public function getValorSaldoCredorAnteriorAttribute() 
	{
		return $this->attributes['VALOR_SALDO_CREDOR_ANTERIOR'];
	}

	public function setValorSaldoCredorAnteriorAttribute($valorSaldoCredorAnterior) 
	{
		$this->attributes['VALOR_SALDO_CREDOR_ANTERIOR'] = $valorSaldoCredorAnterior;
	}

    public function getValorSaldoApuradoAttribute() 
	{
		return $this->attributes['VALOR_SALDO_APURADO'];
	}

	public function setValorSaldoApuradoAttribute($valorSaldoApurado) 
	{
		$this->attributes['VALOR_SALDO_APURADO'] = $valorSaldoApurado;
	}

    public function getValorTotalDeducaoAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_DEDUCAO'];
	}

	public function setValorTotalDeducaoAttribute($valorTotalDeducao) 
	{
		$this->attributes['VALOR_TOTAL_DEDUCAO'] = $valorTotalDeducao;
	}

    public function getValorIcmsRecolherAttribute() 
	{
		return $this->attributes['VALOR_ICMS_RECOLHER'];
	}

	public function setValorIcmsRecolherAttribute($valorIcmsRecolher) 
	{
		$this->attributes['VALOR_ICMS_RECOLHER'] = $valorIcmsRecolher;
	}

    public function getValorSaldoCredorTranspAttribute() 
	{
		return $this->attributes['VALOR_SALDO_CREDOR_TRANSP'];
	}

	public function setValorSaldoCredorTranspAttribute($valorSaldoCredorTransp) 
	{
		$this->attributes['VALOR_SALDO_CREDOR_TRANSP'] = $valorSaldoCredorTransp;
	}

    public function getValorDebitoEspecialAttribute() 
	{
		return $this->attributes['VALOR_DEBITO_ESPECIAL'];
	}

	public function setValorDebitoEspecialAttribute($valorDebitoEspecial) 
	{
		$this->attributes['VALOR_DEBITO_ESPECIAL'] = $valorDebitoEspecial;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCompetenciaAttribute($objeto->competencia);
			$this->setValorTotalDebitoAttribute($objeto->valorTotalDebito);
			$this->setValorAjusteDebitoAttribute($objeto->valorAjusteDebito);
			$this->setValorTotalAjusteDebitoAttribute($objeto->valorTotalAjusteDebito);
			$this->setValorEstornoCreditoAttribute($objeto->valorEstornoCredito);
			$this->setValorTotalCreditoAttribute($objeto->valorTotalCredito);
			$this->setValorAjusteCreditoAttribute($objeto->valorAjusteCredito);
			$this->setValorTotalAjusteCreditoAttribute($objeto->valorTotalAjusteCredito);
			$this->setValorEstornoDebitoAttribute($objeto->valorEstornoDebito);
			$this->setValorSaldoCredorAnteriorAttribute($objeto->valorSaldoCredorAnterior);
			$this->setValorSaldoApuradoAttribute($objeto->valorSaldoApurado);
			$this->setValorTotalDeducaoAttribute($objeto->valorTotalDeducao);
			$this->setValorIcmsRecolherAttribute($objeto->valorIcmsRecolher);
			$this->setValorSaldoCredorTranspAttribute($objeto->valorSaldoCredorTransp);
			$this->setValorDebitoEspecialAttribute($objeto->valorDebitoEspecial);

			// vincular objetos
        }
    }

    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getIdAttribute(),
			'competencia' => $this->getCompetenciaAttribute(),
			'valorTotalDebito' => $this->getValorTotalDebitoAttribute(),
			'valorAjusteDebito' => $this->getValorAjusteDebitoAttribute(),
			'valorTotalAjusteDebito' => $this->getValorTotalAjusteDebitoAttribute(),
			'valorEstornoCredito' => $this->getValorEstornoCreditoAttribute(),
			'valorTotalCredito' => $this->getValorTotalCreditoAttribute(),
			'valorAjusteCredito' => $this->getValorAjusteCreditoAttribute(),
			'valorTotalAjusteCredito' => $this->getValorTotalAjusteCreditoAttribute(),
			'valorEstornoDebito' => $this->getValorEstornoDebitoAttribute(),
			'valorSaldoCredorAnterior' => $this->getValorSaldoCredorAnteriorAttribute(),
			'valorSaldoApurado' => $this->getValorSaldoApuradoAttribute(),
			'valorTotalDeducao' => $this->getValorTotalDeducaoAttribute(),
			'valorIcmsRecolher' => $this->getValorIcmsRecolherAttribute(),
			'valorSaldoCredorTransp' => $this->getValorSaldoCredorTranspAttribute(),
			'valorDebitoEspecial' => $this->getValorDebitoEspecialAttribute(),
        ];
    }
}