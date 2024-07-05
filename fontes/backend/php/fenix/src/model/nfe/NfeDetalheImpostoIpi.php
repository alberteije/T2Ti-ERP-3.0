<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_IPI] 
                                                                                
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

class NfeDetalheImpostoIpi extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DETALHE_IMPOSTO_IPI';

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

    public function getCnpjProdutorAttribute() 
	{
		return $this->attributes['CNPJ_PRODUTOR'];
	}

	public function setCnpjProdutorAttribute($cnpjProdutor) 
	{
		$this->attributes['CNPJ_PRODUTOR'] = $cnpjProdutor;
	}

    public function getCodigoSeloIpiAttribute() 
	{
		return $this->attributes['CODIGO_SELO_IPI'];
	}

	public function setCodigoSeloIpiAttribute($codigoSeloIpi) 
	{
		$this->attributes['CODIGO_SELO_IPI'] = $codigoSeloIpi;
	}

    public function getQuantidadeSeloIpiAttribute() 
	{
		return $this->attributes['QUANTIDADE_SELO_IPI'];
	}

	public function setQuantidadeSeloIpiAttribute($quantidadeSeloIpi) 
	{
		$this->attributes['QUANTIDADE_SELO_IPI'] = $quantidadeSeloIpi;
	}

    public function getEnquadramentoLegalIpiAttribute() 
	{
		return $this->attributes['ENQUADRAMENTO_LEGAL_IPI'];
	}

	public function setEnquadramentoLegalIpiAttribute($enquadramentoLegalIpi) 
	{
		$this->attributes['ENQUADRAMENTO_LEGAL_IPI'] = $enquadramentoLegalIpi;
	}

    public function getCstIpiAttribute() 
	{
		return $this->attributes['CST_IPI'];
	}

	public function setCstIpiAttribute($cstIpi) 
	{
		$this->attributes['CST_IPI'] = $cstIpi;
	}

    public function getValorBaseCalculoIpiAttribute() 
	{
		return (double)$this->attributes['VALOR_BASE_CALCULO_IPI'];
	}

	public function setValorBaseCalculoIpiAttribute($valorBaseCalculoIpi) 
	{
		$this->attributes['VALOR_BASE_CALCULO_IPI'] = $valorBaseCalculoIpi;
	}

    public function getQuantidadeUnidadeTributavelAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_UNIDADE_TRIBUTAVEL'];
	}

	public function setQuantidadeUnidadeTributavelAttribute($quantidadeUnidadeTributavel) 
	{
		$this->attributes['QUANTIDADE_UNIDADE_TRIBUTAVEL'] = $quantidadeUnidadeTributavel;
	}

    public function getValorUnidadeTributavelAttribute() 
	{
		return (double)$this->attributes['VALOR_UNIDADE_TRIBUTAVEL'];
	}

	public function setValorUnidadeTributavelAttribute($valorUnidadeTributavel) 
	{
		$this->attributes['VALOR_UNIDADE_TRIBUTAVEL'] = $valorUnidadeTributavel;
	}

    public function getAliquotaIpiAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_IPI'];
	}

	public function setAliquotaIpiAttribute($aliquotaIpi) 
	{
		$this->attributes['ALIQUOTA_IPI'] = $aliquotaIpi;
	}

    public function getValorIpiAttribute() 
	{
		return (double)$this->attributes['VALOR_IPI'];
	}

	public function setValorIpiAttribute($valorIpi) 
	{
		$this->attributes['VALOR_IPI'] = $valorIpi;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCnpjProdutorAttribute($objeto->cnpjProdutor);
			$this->setCodigoSeloIpiAttribute($objeto->codigoSeloIpi);
			$this->setQuantidadeSeloIpiAttribute($objeto->quantidadeSeloIpi);
			$this->setEnquadramentoLegalIpiAttribute($objeto->enquadramentoLegalIpi);
			$this->setCstIpiAttribute($objeto->cstIpi);
			$this->setValorBaseCalculoIpiAttribute($objeto->valorBaseCalculoIpi);
			$this->setQuantidadeUnidadeTributavelAttribute($objeto->quantidadeUnidadeTributavel);
			$this->setValorUnidadeTributavelAttribute($objeto->valorUnidadeTributavel);
			$this->setAliquotaIpiAttribute($objeto->aliquotaIpi);
			$this->setValorIpiAttribute($objeto->valorIpi);

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
			'cnpjProdutor' => $this->getCnpjProdutorAttribute(),
			'codigoSeloIpi' => $this->getCodigoSeloIpiAttribute(),
			'quantidadeSeloIpi' => $this->getQuantidadeSeloIpiAttribute(),
			'enquadramentoLegalIpi' => $this->getEnquadramentoLegalIpiAttribute(),
			'cstIpi' => $this->getCstIpiAttribute(),
			'valorBaseCalculoIpi' => $this->getValorBaseCalculoIpiAttribute(),
			'quantidadeUnidadeTributavel' => $this->getQuantidadeUnidadeTributavelAttribute(),
			'valorUnidadeTributavel' => $this->getValorUnidadeTributavelAttribute(),
			'aliquotaIpi' => $this->getAliquotaIpiAttribute(),
			'valorIpi' => $this->getValorIpiAttribute(),
        ];
    }
}