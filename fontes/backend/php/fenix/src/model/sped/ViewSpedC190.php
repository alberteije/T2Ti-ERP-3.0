<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_SPED_C190] 
                                                                                
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

class ViewSpedC190 extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_SPED_C190';

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

    public function getCstIcmsAttribute() 
	{
		return $this->attributes['CST_ICMS'];
	}

	public function setCstIcmsAttribute($cstIcms) 
	{
		$this->attributes['CST_ICMS'] = $cstIcms;
	}

    public function getCfopAttribute() 
	{
		return $this->attributes['CFOP'];
	}

	public function setCfopAttribute($cfop) 
	{
		$this->attributes['CFOP'] = $cfop;
	}

    public function getAliquotaIcmsAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_ICMS'];
	}

	public function setAliquotaIcmsAttribute($aliquotaIcms) 
	{
		$this->attributes['ALIQUOTA_ICMS'] = $aliquotaIcms;
	}

    public function getDataHoraEmissaoAttribute() 
	{
		return $this->attributes['DATA_HORA_EMISSAO'];
	}

	public function setDataHoraEmissaoAttribute($dataHoraEmissao) 
	{
		$this->attributes['DATA_HORA_EMISSAO'] = $dataHoraEmissao;
	}

    public function getSomaValorOperacaoAttribute() 
	{
		return (double)$this->attributes['SOMA_VALOR_OPERACAO'];
	}

	public function setSomaValorOperacaoAttribute($somaValorOperacao) 
	{
		$this->attributes['SOMA_VALOR_OPERACAO'] = $somaValorOperacao;
	}

    public function getSomaBaseCalculoIcmsAttribute() 
	{
		return (double)$this->attributes['SOMA_BASE_CALCULO_ICMS'];
	}

	public function setSomaBaseCalculoIcmsAttribute($somaBaseCalculoIcms) 
	{
		$this->attributes['SOMA_BASE_CALCULO_ICMS'] = $somaBaseCalculoIcms;
	}

    public function getSomaValorIcmsAttribute() 
	{
		return (double)$this->attributes['SOMA_VALOR_ICMS'];
	}

	public function setSomaValorIcmsAttribute($somaValorIcms) 
	{
		$this->attributes['SOMA_VALOR_ICMS'] = $somaValorIcms;
	}

    public function getSomaBaseCalculoIcmsStAttribute() 
	{
		return (double)$this->attributes['SOMA_BASE_CALCULO_ICMS_ST'];
	}

	public function setSomaBaseCalculoIcmsStAttribute($somaBaseCalculoIcmsSt) 
	{
		$this->attributes['SOMA_BASE_CALCULO_ICMS_ST'] = $somaBaseCalculoIcmsSt;
	}

    public function getSomaValorIcmsStAttribute() 
	{
		return (double)$this->attributes['SOMA_VALOR_ICMS_ST'];
	}

	public function setSomaValorIcmsStAttribute($somaValorIcmsSt) 
	{
		$this->attributes['SOMA_VALOR_ICMS_ST'] = $somaValorIcmsSt;
	}

    public function getSomaVlRedBcAttribute() 
	{
		return (double)$this->attributes['SOMA_VL_RED_BC'];
	}

	public function setSomaVlRedBcAttribute($somaVlRedBc) 
	{
		$this->attributes['SOMA_VL_RED_BC'] = $somaVlRedBc;
	}

    public function getSomaValorIpiAttribute() 
	{
		return (double)$this->attributes['SOMA_VALOR_IPI'];
	}

	public function setSomaValorIpiAttribute($somaValorIpi) 
	{
		$this->attributes['SOMA_VALOR_IPI'] = $somaValorIpi;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCstIcmsAttribute($objeto->cstIcms);
			$this->setCfopAttribute($objeto->cfop);
			$this->setAliquotaIcmsAttribute($objeto->aliquotaIcms);
			$this->setDataHoraEmissaoAttribute($objeto->dataHoraEmissao);
			$this->setSomaValorOperacaoAttribute($objeto->somaValorOperacao);
			$this->setSomaBaseCalculoIcmsAttribute($objeto->somaBaseCalculoIcms);
			$this->setSomaValorIcmsAttribute($objeto->somaValorIcms);
			$this->setSomaBaseCalculoIcmsStAttribute($objeto->somaBaseCalculoIcmsSt);
			$this->setSomaValorIcmsStAttribute($objeto->somaValorIcmsSt);
			$this->setSomaVlRedBcAttribute($objeto->somaVlRedBc);
			$this->setSomaValorIpiAttribute($objeto->somaValorIpi);

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
			'cstIcms' => $this->getCstIcmsAttribute(),
			'cfop' => $this->getCfopAttribute(),
			'aliquotaIcms' => $this->getAliquotaIcmsAttribute(),
			'dataHoraEmissao' => $this->getDataHoraEmissaoAttribute(),
			'somaValorOperacao' => $this->getSomaValorOperacaoAttribute(),
			'somaBaseCalculoIcms' => $this->getSomaBaseCalculoIcmsAttribute(),
			'somaValorIcms' => $this->getSomaValorIcmsAttribute(),
			'somaBaseCalculoIcmsSt' => $this->getSomaBaseCalculoIcmsStAttribute(),
			'somaValorIcmsSt' => $this->getSomaValorIcmsStAttribute(),
			'somaVlRedBc' => $this->getSomaVlRedBcAttribute(),
			'somaValorIpi' => $this->getSomaValorIpiAttribute(),
        ];
    }
}