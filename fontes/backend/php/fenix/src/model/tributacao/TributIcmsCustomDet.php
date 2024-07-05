<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [TRIBUT_ICMS_CUSTOM_DET] 
                                                                                
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

class TributIcmsCustomDet extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'TRIBUT_ICMS_CUSTOM_DET';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function tributIcmsCustomCab()
    {
    	return $this->belongsTo(TributIcmsCustomCab::class, 'ID_TRIBUT_ICMS_CUSTOM_CAB', 'ID');
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

    public function getUfDestinoAttribute() 
	{
		return $this->attributes['UF_DESTINO'];
	}

	public function setUfDestinoAttribute($ufDestino) 
	{
		$this->attributes['UF_DESTINO'] = $ufDestino;
	}

    public function getCfopAttribute() 
	{
		return $this->attributes['CFOP'];
	}

	public function setCfopAttribute($cfop) 
	{
		$this->attributes['CFOP'] = $cfop;
	}

    public function getCsosnAttribute() 
	{
		return $this->attributes['CSOSN'];
	}

	public function setCsosnAttribute($csosn) 
	{
		$this->attributes['CSOSN'] = $csosn;
	}

    public function getCstAttribute() 
	{
		return $this->attributes['CST'];
	}

	public function setCstAttribute($cst) 
	{
		$this->attributes['CST'] = $cst;
	}

    public function getModalidadeBcAttribute() 
	{
		return $this->attributes['MODALIDADE_BC'];
	}

	public function setModalidadeBcAttribute($modalidadeBc) 
	{
		$this->attributes['MODALIDADE_BC'] = $modalidadeBc;
	}

    public function getAliquotaAttribute() 
	{
		return $this->attributes['ALIQUOTA'];
	}

	public function setAliquotaAttribute($aliquota) 
	{
		$this->attributes['ALIQUOTA'] = $aliquota;
	}

    public function getValorPautaAttribute() 
	{
		return $this->attributes['VALOR_PAUTA'];
	}

	public function setValorPautaAttribute($valorPauta) 
	{
		$this->attributes['VALOR_PAUTA'] = $valorPauta;
	}

    public function getValorPrecoMaximoAttribute() 
	{
		return $this->attributes['VALOR_PRECO_MAXIMO'];
	}

	public function setValorPrecoMaximoAttribute($valorPrecoMaximo) 
	{
		$this->attributes['VALOR_PRECO_MAXIMO'] = $valorPrecoMaximo;
	}

    public function getMvaAttribute() 
	{
		return $this->attributes['MVA'];
	}

	public function setMvaAttribute($mva) 
	{
		$this->attributes['MVA'] = $mva;
	}

    public function getPorcentoBcAttribute() 
	{
		return $this->attributes['PORCENTO_BC'];
	}

	public function setPorcentoBcAttribute($porcentoBc) 
	{
		$this->attributes['PORCENTO_BC'] = $porcentoBc;
	}

    public function getModalidadeBcStAttribute() 
	{
		return $this->attributes['MODALIDADE_BC_ST'];
	}

	public function setModalidadeBcStAttribute($modalidadeBcSt) 
	{
		$this->attributes['MODALIDADE_BC_ST'] = $modalidadeBcSt;
	}

    public function getAliquotaInternaStAttribute() 
	{
		return $this->attributes['ALIQUOTA_INTERNA_ST'];
	}

	public function setAliquotaInternaStAttribute($aliquotaInternaSt) 
	{
		$this->attributes['ALIQUOTA_INTERNA_ST'] = $aliquotaInternaSt;
	}

    public function getAliquotaInterestadualStAttribute() 
	{
		return $this->attributes['ALIQUOTA_INTERESTADUAL_ST'];
	}

	public function setAliquotaInterestadualStAttribute($aliquotaInterestadualSt) 
	{
		$this->attributes['ALIQUOTA_INTERESTADUAL_ST'] = $aliquotaInterestadualSt;
	}

    public function getPorcentoBcStAttribute() 
	{
		return $this->attributes['PORCENTO_BC_ST'];
	}

	public function setPorcentoBcStAttribute($porcentoBcSt) 
	{
		$this->attributes['PORCENTO_BC_ST'] = $porcentoBcSt;
	}

    public function getAliquotaIcmsStAttribute() 
	{
		return $this->attributes['ALIQUOTA_ICMS_ST'];
	}

	public function setAliquotaIcmsStAttribute($aliquotaIcmsSt) 
	{
		$this->attributes['ALIQUOTA_ICMS_ST'] = $aliquotaIcmsSt;
	}

    public function getValorPautaStAttribute() 
	{
		return $this->attributes['VALOR_PAUTA_ST'];
	}

	public function setValorPautaStAttribute($valorPautaSt) 
	{
		$this->attributes['VALOR_PAUTA_ST'] = $valorPautaSt;
	}

    public function getValorPrecoMaximoStAttribute() 
	{
		return $this->attributes['VALOR_PRECO_MAXIMO_ST'];
	}

	public function setValorPrecoMaximoStAttribute($valorPrecoMaximoSt) 
	{
		$this->attributes['VALOR_PRECO_MAXIMO_ST'] = $valorPrecoMaximoSt;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setUfDestinoAttribute($objeto->ufDestino);
			$this->setCfopAttribute($objeto->cfop);
			$this->setCsosnAttribute($objeto->csosn);
			$this->setCstAttribute($objeto->cst);
			$this->setModalidadeBcAttribute($objeto->modalidadeBc);
			$this->setAliquotaAttribute($objeto->aliquota);
			$this->setValorPautaAttribute($objeto->valorPauta);
			$this->setValorPrecoMaximoAttribute($objeto->valorPrecoMaximo);
			$this->setMvaAttribute($objeto->mva);
			$this->setPorcentoBcAttribute($objeto->porcentoBc);
			$this->setModalidadeBcStAttribute($objeto->modalidadeBcSt);
			$this->setAliquotaInternaStAttribute($objeto->aliquotaInternaSt);
			$this->setAliquotaInterestadualStAttribute($objeto->aliquotaInterestadualSt);
			$this->setPorcentoBcStAttribute($objeto->porcentoBcSt);
			$this->setAliquotaIcmsStAttribute($objeto->aliquotaIcmsSt);
			$this->setValorPautaStAttribute($objeto->valorPautaSt);
			$this->setValorPrecoMaximoStAttribute($objeto->valorPrecoMaximoSt);

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
			'ufDestino' => $this->getUfDestinoAttribute(),
			'cfop' => $this->getCfopAttribute(),
			'csosn' => $this->getCsosnAttribute(),
			'cst' => $this->getCstAttribute(),
			'modalidadeBc' => $this->getModalidadeBcAttribute(),
			'aliquota' => $this->getAliquotaAttribute(),
			'valorPauta' => $this->getValorPautaAttribute(),
			'valorPrecoMaximo' => $this->getValorPrecoMaximoAttribute(),
			'mva' => $this->getMvaAttribute(),
			'porcentoBc' => $this->getPorcentoBcAttribute(),
			'modalidadeBcSt' => $this->getModalidadeBcStAttribute(),
			'aliquotaInternaSt' => $this->getAliquotaInternaStAttribute(),
			'aliquotaInterestadualSt' => $this->getAliquotaInterestadualStAttribute(),
			'porcentoBcSt' => $this->getPorcentoBcStAttribute(),
			'aliquotaIcmsSt' => $this->getAliquotaIcmsStAttribute(),
			'valorPautaSt' => $this->getValorPautaStAttribute(),
			'valorPrecoMaximoSt' => $this->getValorPrecoMaximoStAttribute(),
        ];
    }
}