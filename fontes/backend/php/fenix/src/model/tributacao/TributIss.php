<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [TRIBUT_ISS] 
                                                                                
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

class TributIss extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'TRIBUT_ISS';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['tributOperacaoFiscal', ];
	
    /**
     * Relations
     */
    public function tributOperacaoFiscal()
    {
    	return $this->belongsTo(TributOperacaoFiscal::class, 'ID_TRIBUT_OPERACAO_FISCAL', 'ID');
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

    public function getModalidadeBaseCalculoAttribute() 
	{
		return $this->attributes['MODALIDADE_BASE_CALCULO'];
	}

	public function setModalidadeBaseCalculoAttribute($modalidadeBaseCalculo) 
	{
		$this->attributes['MODALIDADE_BASE_CALCULO'] = $modalidadeBaseCalculo;
	}

    public function getPorcentoBaseCalculoAttribute() 
	{
		return $this->attributes['PORCENTO_BASE_CALCULO'];
	}

	public function setPorcentoBaseCalculoAttribute($porcentoBaseCalculo) 
	{
		$this->attributes['PORCENTO_BASE_CALCULO'] = $porcentoBaseCalculo;
	}

    public function getAliquotaPorcentoAttribute() 
	{
		return $this->attributes['ALIQUOTA_PORCENTO'];
	}

	public function setAliquotaPorcentoAttribute($aliquotaPorcento) 
	{
		$this->attributes['ALIQUOTA_PORCENTO'] = $aliquotaPorcento;
	}

    public function getAliquotaUnidadeAttribute() 
	{
		return $this->attributes['ALIQUOTA_UNIDADE'];
	}

	public function setAliquotaUnidadeAttribute($aliquotaUnidade) 
	{
		$this->attributes['ALIQUOTA_UNIDADE'] = $aliquotaUnidade;
	}

    public function getValorPrecoMaximoAttribute() 
	{
		return $this->attributes['VALOR_PRECO_MAXIMO'];
	}

	public function setValorPrecoMaximoAttribute($valorPrecoMaximo) 
	{
		$this->attributes['VALOR_PRECO_MAXIMO'] = $valorPrecoMaximo;
	}

    public function getValorPautaFiscalAttribute() 
	{
		return $this->attributes['VALOR_PAUTA_FISCAL'];
	}

	public function setValorPautaFiscalAttribute($valorPautaFiscal) 
	{
		$this->attributes['VALOR_PAUTA_FISCAL'] = $valorPautaFiscal;
	}

    public function getItemListaServicoAttribute() 
	{
		return $this->attributes['ITEM_LISTA_SERVICO'];
	}

	public function setItemListaServicoAttribute($itemListaServico) 
	{
		$this->attributes['ITEM_LISTA_SERVICO'] = $itemListaServico;
	}

    public function getCodigoTributacaoAttribute() 
	{
		return $this->attributes['CODIGO_TRIBUTACAO'];
	}

	public function setCodigoTributacaoAttribute($codigoTributacao) 
	{
		$this->attributes['CODIGO_TRIBUTACAO'] = $codigoTributacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setModalidadeBaseCalculoAttribute($objeto->modalidadeBaseCalculo);
			$this->setPorcentoBaseCalculoAttribute($objeto->porcentoBaseCalculo);
			$this->setAliquotaPorcentoAttribute($objeto->aliquotaPorcento);
			$this->setAliquotaUnidadeAttribute($objeto->aliquotaUnidade);
			$this->setValorPrecoMaximoAttribute($objeto->valorPrecoMaximo);
			$this->setValorPautaFiscalAttribute($objeto->valorPautaFiscal);
			$this->setItemListaServicoAttribute($objeto->itemListaServico);
			$this->setCodigoTributacaoAttribute($objeto->codigoTributacao);

			// vincular objetos
			$tributOperacaoFiscal = new TributOperacaoFiscal();
			$tributOperacaoFiscal->mapear($objeto->tributOperacaoFiscal);
			$this->tributOperacaoFiscal()->associate($tributOperacaoFiscal);

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
			'modalidadeBaseCalculo' => $this->getModalidadeBaseCalculoAttribute(),
			'porcentoBaseCalculo' => $this->getPorcentoBaseCalculoAttribute(),
			'aliquotaPorcento' => $this->getAliquotaPorcentoAttribute(),
			'aliquotaUnidade' => $this->getAliquotaUnidadeAttribute(),
			'valorPrecoMaximo' => $this->getValorPrecoMaximoAttribute(),
			'valorPautaFiscal' => $this->getValorPautaFiscalAttribute(),
			'itemListaServico' => $this->getItemListaServicoAttribute(),
			'codigoTributacao' => $this->getCodigoTributacaoAttribute(),
			'tributOperacaoFiscal' => $this->tributOperacaoFiscal,
        ];
    }
}