<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FISCAL_NOTA_FISCAL_ENTRADA] 
                                                                                
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

class FiscalNotaFiscalEntrada extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FISCAL_NOTA_FISCAL_ENTRADA';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['nfeCabecalho', ];
	
    /**
     * Relations
     */
    public function nfeCabecalho()
    {
    	return $this->belongsTo(NfeCabecalho::class, 'ID_NFE_CABECALHO', 'ID');
    }


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

    public function getCfopEntradaAttribute() 
	{
		return $this->attributes['CFOP_ENTRADA'];
	}

	public function setCfopEntradaAttribute($cfopEntrada) 
	{
		$this->attributes['CFOP_ENTRADA'] = $cfopEntrada;
	}

    public function getValorRateioFreteAttribute() 
	{
		return $this->attributes['VALOR_RATEIO_FRETE'];
	}

	public function setValorRateioFreteAttribute($valorRateioFrete) 
	{
		$this->attributes['VALOR_RATEIO_FRETE'] = $valorRateioFrete;
	}

    public function getValorCustoMedioAttribute() 
	{
		return $this->attributes['VALOR_CUSTO_MEDIO'];
	}

	public function setValorCustoMedioAttribute($valorCustoMedio) 
	{
		$this->attributes['VALOR_CUSTO_MEDIO'] = $valorCustoMedio;
	}

    public function getValorIcmsAntecipadoAttribute() 
	{
		return $this->attributes['VALOR_ICMS_ANTECIPADO'];
	}

	public function setValorIcmsAntecipadoAttribute($valorIcmsAntecipado) 
	{
		$this->attributes['VALOR_ICMS_ANTECIPADO'] = $valorIcmsAntecipado;
	}

    public function getValorBcIcmsAntecipadoAttribute() 
	{
		return $this->attributes['VALOR_BC_ICMS_ANTECIPADO'];
	}

	public function setValorBcIcmsAntecipadoAttribute($valorBcIcmsAntecipado) 
	{
		$this->attributes['VALOR_BC_ICMS_ANTECIPADO'] = $valorBcIcmsAntecipado;
	}

    public function getValorBcIcmsCreditadoAttribute() 
	{
		return $this->attributes['VALOR_BC_ICMS_CREDITADO'];
	}

	public function setValorBcIcmsCreditadoAttribute($valorBcIcmsCreditado) 
	{
		$this->attributes['VALOR_BC_ICMS_CREDITADO'] = $valorBcIcmsCreditado;
	}

    public function getValorBcPisCreditadoAttribute() 
	{
		return $this->attributes['VALOR_BC_PIS_CREDITADO'];
	}

	public function setValorBcPisCreditadoAttribute($valorBcPisCreditado) 
	{
		$this->attributes['VALOR_BC_PIS_CREDITADO'] = $valorBcPisCreditado;
	}

    public function getValorBcCofinsCreditadoAttribute() 
	{
		return $this->attributes['VALOR_BC_COFINS_CREDITADO'];
	}

	public function setValorBcCofinsCreditadoAttribute($valorBcCofinsCreditado) 
	{
		$this->attributes['VALOR_BC_COFINS_CREDITADO'] = $valorBcCofinsCreditado;
	}

    public function getValorBcIpiCreditadoAttribute() 
	{
		return $this->attributes['VALOR_BC_IPI_CREDITADO'];
	}

	public function setValorBcIpiCreditadoAttribute($valorBcIpiCreditado) 
	{
		$this->attributes['VALOR_BC_IPI_CREDITADO'] = $valorBcIpiCreditado;
	}

    public function getCstCreditoIcmsAttribute() 
	{
		return $this->attributes['CST_CREDITO_ICMS'];
	}

	public function setCstCreditoIcmsAttribute($cstCreditoIcms) 
	{
		$this->attributes['CST_CREDITO_ICMS'] = $cstCreditoIcms;
	}

    public function getCstCreditoPisAttribute() 
	{
		return $this->attributes['CST_CREDITO_PIS'];
	}

	public function setCstCreditoPisAttribute($cstCreditoPis) 
	{
		$this->attributes['CST_CREDITO_PIS'] = $cstCreditoPis;
	}

    public function getCstCreditoCofinsAttribute() 
	{
		return $this->attributes['CST_CREDITO_COFINS'];
	}

	public function setCstCreditoCofinsAttribute($cstCreditoCofins) 
	{
		$this->attributes['CST_CREDITO_COFINS'] = $cstCreditoCofins;
	}

    public function getCstCreditoIpiAttribute() 
	{
		return $this->attributes['CST_CREDITO_IPI'];
	}

	public function setCstCreditoIpiAttribute($cstCreditoIpi) 
	{
		$this->attributes['CST_CREDITO_IPI'] = $cstCreditoIpi;
	}

    public function getValorIcmsCreditadoAttribute() 
	{
		return $this->attributes['VALOR_ICMS_CREDITADO'];
	}

	public function setValorIcmsCreditadoAttribute($valorIcmsCreditado) 
	{
		$this->attributes['VALOR_ICMS_CREDITADO'] = $valorIcmsCreditado;
	}

    public function getValorPisCreditadoAttribute() 
	{
		return $this->attributes['VALOR_PIS_CREDITADO'];
	}

	public function setValorPisCreditadoAttribute($valorPisCreditado) 
	{
		$this->attributes['VALOR_PIS_CREDITADO'] = $valorPisCreditado;
	}

    public function getValorCofinsCreditadoAttribute() 
	{
		return $this->attributes['VALOR_COFINS_CREDITADO'];
	}

	public function setValorCofinsCreditadoAttribute($valorCofinsCreditado) 
	{
		$this->attributes['VALOR_COFINS_CREDITADO'] = $valorCofinsCreditado;
	}

    public function getValorIpiCreditadoAttribute() 
	{
		return $this->attributes['VALOR_IPI_CREDITADO'];
	}

	public function setValorIpiCreditadoAttribute($valorIpiCreditado) 
	{
		$this->attributes['VALOR_IPI_CREDITADO'] = $valorIpiCreditado;
	}

    public function getQtdeParcelaCreditoPisAttribute() 
	{
		return $this->attributes['QTDE_PARCELA_CREDITO_PIS'];
	}

	public function setQtdeParcelaCreditoPisAttribute($qtdeParcelaCreditoPis) 
	{
		$this->attributes['QTDE_PARCELA_CREDITO_PIS'] = $qtdeParcelaCreditoPis;
	}

    public function getQtdeParcelaCreditoCofinsAttribute() 
	{
		return $this->attributes['QTDE_PARCELA_CREDITO_COFINS'];
	}

	public function setQtdeParcelaCreditoCofinsAttribute($qtdeParcelaCreditoCofins) 
	{
		$this->attributes['QTDE_PARCELA_CREDITO_COFINS'] = $qtdeParcelaCreditoCofins;
	}

    public function getQtdeParcelaCreditoIcmsAttribute() 
	{
		return $this->attributes['QTDE_PARCELA_CREDITO_ICMS'];
	}

	public function setQtdeParcelaCreditoIcmsAttribute($qtdeParcelaCreditoIcms) 
	{
		$this->attributes['QTDE_PARCELA_CREDITO_ICMS'] = $qtdeParcelaCreditoIcms;
	}

    public function getQtdeParcelaCreditoIpiAttribute() 
	{
		return $this->attributes['QTDE_PARCELA_CREDITO_IPI'];
	}

	public function setQtdeParcelaCreditoIpiAttribute($qtdeParcelaCreditoIpi) 
	{
		$this->attributes['QTDE_PARCELA_CREDITO_IPI'] = $qtdeParcelaCreditoIpi;
	}

    public function getAliquotaCreditoIcmsAttribute() 
	{
		return $this->attributes['ALIQUOTA_CREDITO_ICMS'];
	}

	public function setAliquotaCreditoIcmsAttribute($aliquotaCreditoIcms) 
	{
		$this->attributes['ALIQUOTA_CREDITO_ICMS'] = $aliquotaCreditoIcms;
	}

    public function getAliquotaCreditoPisAttribute() 
	{
		return $this->attributes['ALIQUOTA_CREDITO_PIS'];
	}

	public function setAliquotaCreditoPisAttribute($aliquotaCreditoPis) 
	{
		$this->attributes['ALIQUOTA_CREDITO_PIS'] = $aliquotaCreditoPis;
	}

    public function getAliquotaCreditoCofinsAttribute() 
	{
		return $this->attributes['ALIQUOTA_CREDITO_COFINS'];
	}

	public function setAliquotaCreditoCofinsAttribute($aliquotaCreditoCofins) 
	{
		$this->attributes['ALIQUOTA_CREDITO_COFINS'] = $aliquotaCreditoCofins;
	}

    public function getAliquotaCreditoIpiAttribute() 
	{
		return $this->attributes['ALIQUOTA_CREDITO_IPI'];
	}

	public function setAliquotaCreditoIpiAttribute($aliquotaCreditoIpi) 
	{
		$this->attributes['ALIQUOTA_CREDITO_IPI'] = $aliquotaCreditoIpi;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCompetenciaAttribute($objeto->competencia);
			$this->setCfopEntradaAttribute($objeto->cfopEntrada);
			$this->setValorRateioFreteAttribute($objeto->valorRateioFrete);
			$this->setValorCustoMedioAttribute($objeto->valorCustoMedio);
			$this->setValorIcmsAntecipadoAttribute($objeto->valorIcmsAntecipado);
			$this->setValorBcIcmsAntecipadoAttribute($objeto->valorBcIcmsAntecipado);
			$this->setValorBcIcmsCreditadoAttribute($objeto->valorBcIcmsCreditado);
			$this->setValorBcPisCreditadoAttribute($objeto->valorBcPisCreditado);
			$this->setValorBcCofinsCreditadoAttribute($objeto->valorBcCofinsCreditado);
			$this->setValorBcIpiCreditadoAttribute($objeto->valorBcIpiCreditado);
			$this->setCstCreditoIcmsAttribute($objeto->cstCreditoIcms);
			$this->setCstCreditoPisAttribute($objeto->cstCreditoPis);
			$this->setCstCreditoCofinsAttribute($objeto->cstCreditoCofins);
			$this->setCstCreditoIpiAttribute($objeto->cstCreditoIpi);
			$this->setValorIcmsCreditadoAttribute($objeto->valorIcmsCreditado);
			$this->setValorPisCreditadoAttribute($objeto->valorPisCreditado);
			$this->setValorCofinsCreditadoAttribute($objeto->valorCofinsCreditado);
			$this->setValorIpiCreditadoAttribute($objeto->valorIpiCreditado);
			$this->setQtdeParcelaCreditoPisAttribute($objeto->qtdeParcelaCreditoPis);
			$this->setQtdeParcelaCreditoCofinsAttribute($objeto->qtdeParcelaCreditoCofins);
			$this->setQtdeParcelaCreditoIcmsAttribute($objeto->qtdeParcelaCreditoIcms);
			$this->setQtdeParcelaCreditoIpiAttribute($objeto->qtdeParcelaCreditoIpi);
			$this->setAliquotaCreditoIcmsAttribute($objeto->aliquotaCreditoIcms);
			$this->setAliquotaCreditoPisAttribute($objeto->aliquotaCreditoPis);
			$this->setAliquotaCreditoCofinsAttribute($objeto->aliquotaCreditoCofins);
			$this->setAliquotaCreditoIpiAttribute($objeto->aliquotaCreditoIpi);

			// vincular objetos
			$nfeCabecalho = new NfeCabecalho();
			$nfeCabecalho->mapear($objeto->nfeCabecalho);
			$this->nfeCabecalho()->associate($nfeCabecalho);

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
			'cfopEntrada' => $this->getCfopEntradaAttribute(),
			'valorRateioFrete' => $this->getValorRateioFreteAttribute(),
			'valorCustoMedio' => $this->getValorCustoMedioAttribute(),
			'valorIcmsAntecipado' => $this->getValorIcmsAntecipadoAttribute(),
			'valorBcIcmsAntecipado' => $this->getValorBcIcmsAntecipadoAttribute(),
			'valorBcIcmsCreditado' => $this->getValorBcIcmsCreditadoAttribute(),
			'valorBcPisCreditado' => $this->getValorBcPisCreditadoAttribute(),
			'valorBcCofinsCreditado' => $this->getValorBcCofinsCreditadoAttribute(),
			'valorBcIpiCreditado' => $this->getValorBcIpiCreditadoAttribute(),
			'cstCreditoIcms' => $this->getCstCreditoIcmsAttribute(),
			'cstCreditoPis' => $this->getCstCreditoPisAttribute(),
			'cstCreditoCofins' => $this->getCstCreditoCofinsAttribute(),
			'cstCreditoIpi' => $this->getCstCreditoIpiAttribute(),
			'valorIcmsCreditado' => $this->getValorIcmsCreditadoAttribute(),
			'valorPisCreditado' => $this->getValorPisCreditadoAttribute(),
			'valorCofinsCreditado' => $this->getValorCofinsCreditadoAttribute(),
			'valorIpiCreditado' => $this->getValorIpiCreditadoAttribute(),
			'qtdeParcelaCreditoPis' => $this->getQtdeParcelaCreditoPisAttribute(),
			'qtdeParcelaCreditoCofins' => $this->getQtdeParcelaCreditoCofinsAttribute(),
			'qtdeParcelaCreditoIcms' => $this->getQtdeParcelaCreditoIcmsAttribute(),
			'qtdeParcelaCreditoIpi' => $this->getQtdeParcelaCreditoIpiAttribute(),
			'aliquotaCreditoIcms' => $this->getAliquotaCreditoIcmsAttribute(),
			'aliquotaCreditoPis' => $this->getAliquotaCreditoPisAttribute(),
			'aliquotaCreditoCofins' => $this->getAliquotaCreditoCofinsAttribute(),
			'aliquotaCreditoIpi' => $this->getAliquotaCreditoIpiAttribute(),
			'nfeCabecalho' => $this->nfeCabecalho,
        ];
    }
}