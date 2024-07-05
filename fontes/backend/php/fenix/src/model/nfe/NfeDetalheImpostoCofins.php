<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_COFINS] 
                                                                                
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

class NfeDetalheImpostoCofins extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DETALHE_IMPOSTO_COFINS';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeDetalhe()
    {
    	return $this->belongsTo(NfeDetalhe::class, 'ID_NFE_DETALHE', 'ID');
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

    public function getCstCofinsAttribute() 
	{
		return $this->attributes['CST_COFINS'];
	}

	public function setCstCofinsAttribute($cstCofins) 
	{
		$this->attributes['CST_COFINS'] = $cstCofins;
	}

    public function getBaseCalculoCofinsAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_COFINS'];
	}

	public function setBaseCalculoCofinsAttribute($baseCalculoCofins) 
	{
		$this->attributes['BASE_CALCULO_COFINS'] = $baseCalculoCofins;
	}

    public function getAliquotaCofinsPercentualAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_COFINS_PERCENTUAL'];
	}

	public function setAliquotaCofinsPercentualAttribute($aliquotaCofinsPercentual) 
	{
		$this->attributes['ALIQUOTA_COFINS_PERCENTUAL'] = $aliquotaCofinsPercentual;
	}

    public function getQuantidadeVendidaAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_VENDIDA'];
	}

	public function setQuantidadeVendidaAttribute($quantidadeVendida) 
	{
		$this->attributes['QUANTIDADE_VENDIDA'] = $quantidadeVendida;
	}

    public function getAliquotaCofinsReaisAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_COFINS_REAIS'];
	}

	public function setAliquotaCofinsReaisAttribute($aliquotaCofinsReais) 
	{
		$this->attributes['ALIQUOTA_COFINS_REAIS'] = $aliquotaCofinsReais;
	}

    public function getValorCofinsAttribute() 
	{
		return (double)$this->attributes['VALOR_COFINS'];
	}

	public function setValorCofinsAttribute($valorCofins) 
	{
		$this->attributes['VALOR_COFINS'] = $valorCofins;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCstCofinsAttribute($objeto->cstCofins);
			$this->setBaseCalculoCofinsAttribute($objeto->baseCalculoCofins);
			$this->setAliquotaCofinsPercentualAttribute($objeto->aliquotaCofinsPercentual);
			$this->setQuantidadeVendidaAttribute($objeto->quantidadeVendida);
			$this->setAliquotaCofinsReaisAttribute($objeto->aliquotaCofinsReais);
			$this->setValorCofinsAttribute($objeto->valorCofins);

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
			'cstCofins' => $this->getCstCofinsAttribute(),
			'baseCalculoCofins' => $this->getBaseCalculoCofinsAttribute(),
			'aliquotaCofinsPercentual' => $this->getAliquotaCofinsPercentualAttribute(),
			'quantidadeVendida' => $this->getQuantidadeVendidaAttribute(),
			'aliquotaCofinsReais' => $this->getAliquotaCofinsReaisAttribute(),
			'valorCofins' => $this->getValorCofinsAttribute(),
        ];
    }
}