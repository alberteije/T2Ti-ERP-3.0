<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_ITEM_RASTREADO] 
                                                                                
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

class NfeItemRastreado extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_ITEM_RASTREADO';

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

    public function getNumeroLoteAttribute() 
	{
		return $this->attributes['NUMERO_LOTE'];
	}

	public function setNumeroLoteAttribute($numeroLote) 
	{
		$this->attributes['NUMERO_LOTE'] = $numeroLote;
	}

    public function getQuantidadeItensAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_ITENS'];
	}

	public function setQuantidadeItensAttribute($quantidadeItens) 
	{
		$this->attributes['QUANTIDADE_ITENS'] = $quantidadeItens;
	}

    public function getDataFabricacaoAttribute() 
	{
		return $this->attributes['DATA_FABRICACAO'];
	}

	public function setDataFabricacaoAttribute($dataFabricacao) 
	{
		$this->attributes['DATA_FABRICACAO'] = $dataFabricacao;
	}

    public function getDataValidadeAttribute() 
	{
		return $this->attributes['DATA_VALIDADE'];
	}

	public function setDataValidadeAttribute($dataValidade) 
	{
		$this->attributes['DATA_VALIDADE'] = $dataValidade;
	}

    public function getCodigoAgregacaoAttribute() 
	{
		return $this->attributes['CODIGO_AGREGACAO'];
	}

	public function setCodigoAgregacaoAttribute($codigoAgregacao) 
	{
		$this->attributes['CODIGO_AGREGACAO'] = $codigoAgregacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNumeroLoteAttribute($objeto->numeroLote);
			$this->setQuantidadeItensAttribute($objeto->quantidadeItens);
			$this->setDataFabricacaoAttribute($objeto->dataFabricacao);
			$this->setDataValidadeAttribute($objeto->dataValidade);
			$this->setCodigoAgregacaoAttribute($objeto->codigoAgregacao);

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
			'numeroLote' => $this->getNumeroLoteAttribute(),
			'quantidadeItens' => $this->getQuantidadeItensAttribute(),
			'dataFabricacao' => $this->getDataFabricacaoAttribute(),
			'dataValidade' => $this->getDataValidadeAttribute(),
			'codigoAgregacao' => $this->getCodigoAgregacaoAttribute(),
        ];
    }
}