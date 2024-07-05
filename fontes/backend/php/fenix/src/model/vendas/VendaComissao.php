<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VENDA_COMISSAO] 
                                                                                
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

class VendaComissao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VENDA_COMISSAO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['vendedor', ];
	
    /**
     * Relations
     */
    public function vendaCabecalho()
    {
    	return $this->belongsTo(VendaCabecalho::class, 'ID_VENDA_CABECALHO', 'ID');
    }

    public function vendedor()
    {
    	return $this->belongsTo(Vendedor::class, 'ID_VENDEDOR', 'ID');
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

    public function getValorVendaAttribute() 
	{
		return (double)$this->attributes['VALOR_VENDA'];
	}

	public function setValorVendaAttribute($valorVenda) 
	{
		$this->attributes['VALOR_VENDA'] = $valorVenda;
	}

    public function getTipoContabilAttribute() 
	{
		return $this->attributes['TIPO_CONTABIL'];
	}

	public function setTipoContabilAttribute($tipoContabil) 
	{
		$this->attributes['TIPO_CONTABIL'] = $tipoContabil;
	}

    public function getValorComissaoAttribute() 
	{
		return (double)$this->attributes['VALOR_COMISSAO'];
	}

	public function setValorComissaoAttribute($valorComissao) 
	{
		$this->attributes['VALOR_COMISSAO'] = $valorComissao;
	}

    public function getSituacaoAttribute() 
	{
		return $this->attributes['SITUACAO'];
	}

	public function setSituacaoAttribute($situacao) 
	{
		$this->attributes['SITUACAO'] = $situacao;
	}

    public function getDataLancamentoAttribute() 
	{
		return $this->attributes['DATA_LANCAMENTO'];
	}

	public function setDataLancamentoAttribute($dataLancamento) 
	{
		$this->attributes['DATA_LANCAMENTO'] = $dataLancamento;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setValorVendaAttribute($objeto->valorVenda);
			$this->setTipoContabilAttribute($objeto->tipoContabil);
			$this->setValorComissaoAttribute($objeto->valorComissao);
			$this->setSituacaoAttribute($objeto->situacao);
			$this->setDataLancamentoAttribute($objeto->dataLancamento);

			// vincular objetos
			$vendedor = new Vendedor();
			$vendedor->mapear($objeto->vendedor);
			$this->vendedor()->associate($vendedor);

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
			'valorVenda' => $this->getValorVendaAttribute(),
			'tipoContabil' => $this->getTipoContabilAttribute(),
			'valorComissao' => $this->getValorComissaoAttribute(),
			'situacao' => $this->getSituacaoAttribute(),
			'dataLancamento' => $this->getDataLancamentoAttribute(),
			'vendedor' => $this->vendedor,
        ];
    }
}