<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_PIS] 
                                                                                
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

class NfeDetalheImpostoPis extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DETALHE_IMPOSTO_PIS';

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

    public function getCstPisAttribute() 
	{
		return $this->attributes['CST_PIS'];
	}

	public function setCstPisAttribute($cstPis) 
	{
		$this->attributes['CST_PIS'] = $cstPis;
	}

    public function getValorBaseCalculoPisAttribute() 
	{
		return (double)$this->attributes['VALOR_BASE_CALCULO_PIS'];
	}

	public function setValorBaseCalculoPisAttribute($valorBaseCalculoPis) 
	{
		$this->attributes['VALOR_BASE_CALCULO_PIS'] = $valorBaseCalculoPis;
	}

    public function getAliquotaPisPercentualAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_PIS_PERCENTUAL'];
	}

	public function setAliquotaPisPercentualAttribute($aliquotaPisPercentual) 
	{
		$this->attributes['ALIQUOTA_PIS_PERCENTUAL'] = $aliquotaPisPercentual;
	}

    public function getValorPisAttribute() 
	{
		return (double)$this->attributes['VALOR_PIS'];
	}

	public function setValorPisAttribute($valorPis) 
	{
		$this->attributes['VALOR_PIS'] = $valorPis;
	}

    public function getQuantidadeVendidaAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_VENDIDA'];
	}

	public function setQuantidadeVendidaAttribute($quantidadeVendida) 
	{
		$this->attributes['QUANTIDADE_VENDIDA'] = $quantidadeVendida;
	}

    public function getAliquotaPisReaisAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_PIS_REAIS'];
	}

	public function setAliquotaPisReaisAttribute($aliquotaPisReais) 
	{
		$this->attributes['ALIQUOTA_PIS_REAIS'] = $aliquotaPisReais;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCstPisAttribute($objeto->cstPis);
			$this->setValorBaseCalculoPisAttribute($objeto->valorBaseCalculoPis);
			$this->setAliquotaPisPercentualAttribute($objeto->aliquotaPisPercentual);
			$this->setValorPisAttribute($objeto->valorPis);
			$this->setQuantidadeVendidaAttribute($objeto->quantidadeVendida);
			$this->setAliquotaPisReaisAttribute($objeto->aliquotaPisReais);

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
			'cstPis' => $this->getCstPisAttribute(),
			'valorBaseCalculoPis' => $this->getValorBaseCalculoPisAttribute(),
			'aliquotaPisPercentual' => $this->getAliquotaPisPercentualAttribute(),
			'valorPis' => $this->getValorPisAttribute(),
			'quantidadeVendida' => $this->getQuantidadeVendidaAttribute(),
			'aliquotaPisReais' => $this->getAliquotaPisReaisAttribute(),
        ];
    }
}