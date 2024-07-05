<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [SIMPLES_NACIONAL_DETALHE] 
                                                                                
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

class SimplesNacionalDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'SIMPLES_NACIONAL_DETALHE';

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

    public function getIdSimplesNacionalCabecalhoAttribute() 
	{
		return $this->attributes['ID_SIMPLES_NACIONAL_CABECALHO'];
	}

	public function setIdSimplesNacionalCabecalhoAttribute($idSimplesNacionalCabecalho) 
	{
		$this->attributes['ID_SIMPLES_NACIONAL_CABECALHO'] = $idSimplesNacionalCabecalho;
	}

    public function getFaixaAttribute() 
	{
		return $this->attributes['FAIXA'];
	}

	public function setFaixaAttribute($faixa) 
	{
		$this->attributes['FAIXA'] = $faixa;
	}

    public function getValorInicialAttribute() 
	{
		return $this->attributes['VALOR_INICIAL'];
	}

	public function setValorInicialAttribute($valorInicial) 
	{
		$this->attributes['VALOR_INICIAL'] = $valorInicial;
	}

    public function getValorFinalAttribute() 
	{
		return $this->attributes['VALOR_FINAL'];
	}

	public function setValorFinalAttribute($valorFinal) 
	{
		$this->attributes['VALOR_FINAL'] = $valorFinal;
	}

    public function getAliquotaAttribute() 
	{
		return $this->attributes['ALIQUOTA'];
	}

	public function setAliquotaAttribute($aliquota) 
	{
		$this->attributes['ALIQUOTA'] = $aliquota;
	}

    public function getIrpjAttribute() 
	{
		return $this->attributes['IRPJ'];
	}

	public function setIrpjAttribute($irpj) 
	{
		$this->attributes['IRPJ'] = $irpj;
	}

    public function getCsllAttribute() 
	{
		return $this->attributes['CSLL'];
	}

	public function setCsllAttribute($csll) 
	{
		$this->attributes['CSLL'] = $csll;
	}

    public function getCofinsAttribute() 
	{
		return $this->attributes['COFINS'];
	}

	public function setCofinsAttribute($cofins) 
	{
		$this->attributes['COFINS'] = $cofins;
	}

    public function getPisPasepAttribute() 
	{
		return $this->attributes['PIS_PASEP'];
	}

	public function setPisPasepAttribute($pisPasep) 
	{
		$this->attributes['PIS_PASEP'] = $pisPasep;
	}

    public function getCppAttribute() 
	{
		return $this->attributes['CPP'];
	}

	public function setCppAttribute($cpp) 
	{
		$this->attributes['CPP'] = $cpp;
	}

    public function getIcmsAttribute() 
	{
		return $this->attributes['ICMS'];
	}

	public function setIcmsAttribute($icms) 
	{
		$this->attributes['ICMS'] = $icms;
	}

    public function getIpiAttribute() 
	{
		return $this->attributes['IPI'];
	}

	public function setIpiAttribute($ipi) 
	{
		$this->attributes['IPI'] = $ipi;
	}

    public function getIssAttribute() 
	{
		return $this->attributes['ISS'];
	}

	public function setIssAttribute($iss) 
	{
		$this->attributes['ISS'] = $iss;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdSimplesNacionalCabecalhoAttribute($objeto->idSimplesNacionalCabecalho);
			$this->setFaixaAttribute($objeto->faixa);
			$this->setValorInicialAttribute($objeto->valorInicial);
			$this->setValorFinalAttribute($objeto->valorFinal);
			$this->setAliquotaAttribute($objeto->aliquota);
			$this->setIrpjAttribute($objeto->irpj);
			$this->setCsllAttribute($objeto->csll);
			$this->setCofinsAttribute($objeto->cofins);
			$this->setPisPasepAttribute($objeto->pisPasep);
			$this->setCppAttribute($objeto->cpp);
			$this->setIcmsAttribute($objeto->icms);
			$this->setIpiAttribute($objeto->ipi);
			$this->setIssAttribute($objeto->iss);

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
			'idSimplesNacionalCabecalho' => $this->getIdSimplesNacionalCabecalhoAttribute(),
			'faixa' => $this->getFaixaAttribute(),
			'valorInicial' => $this->getValorInicialAttribute(),
			'valorFinal' => $this->getValorFinalAttribute(),
			'aliquota' => $this->getAliquotaAttribute(),
			'irpj' => $this->getIrpjAttribute(),
			'csll' => $this->getCsllAttribute(),
			'cofins' => $this->getCofinsAttribute(),
			'pisPasep' => $this->getPisPasepAttribute(),
			'cpp' => $this->getCppAttribute(),
			'icms' => $this->getIcmsAttribute(),
			'ipi' => $this->getIpiAttribute(),
			'iss' => $this->getIssAttribute(),
        ];
    }
}