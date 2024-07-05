<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [COMPRA_FORNECEDOR_COTACAO] 
                                                                                
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

class CompraFornecedorCotacao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'COMPRA_FORNECEDOR_COTACAO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['fornecedor', ];
	
    /**
     * Relations
     */
    public function compraCotacao()
    {
    	return $this->belongsTo(CompraCotacao::class, 'ID_COMPRA_COTACAO', 'ID');
    }

    public function fornecedor()
    {
    	return $this->belongsTo(Fornecedor::class, 'ID_FORNECEDOR', 'ID');
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

    public function getCodigoAttribute() 
	{
		return $this->attributes['CODIGO'];
	}

	public function setCodigoAttribute($codigo) 
	{
		$this->attributes['CODIGO'] = $codigo;
	}

    public function getPrazoEntregaAttribute() 
	{
		return $this->attributes['PRAZO_ENTREGA'];
	}

	public function setPrazoEntregaAttribute($prazoEntrega) 
	{
		$this->attributes['PRAZO_ENTREGA'] = $prazoEntrega;
	}

    public function getVendaCondicoesPagamentoAttribute() 
	{
		return $this->attributes['VENDA_CONDICOES_PAGAMENTO'];
	}

	public function setVendaCondicoesPagamentoAttribute($vendaCondicoesPagamento) 
	{
		$this->attributes['VENDA_CONDICOES_PAGAMENTO'] = $vendaCondicoesPagamento;
	}

    public function getValorSubtotalAttribute() 
	{
		return $this->attributes['VALOR_SUBTOTAL'];
	}

	public function setValorSubtotalAttribute($valorSubtotal) 
	{
		$this->attributes['VALOR_SUBTOTAL'] = $valorSubtotal;
	}

    public function getTaxaDescontoAttribute() 
	{
		return $this->attributes['TAXA_DESCONTO'];
	}

	public function setTaxaDescontoAttribute($taxaDesconto) 
	{
		$this->attributes['TAXA_DESCONTO'] = $taxaDesconto;
	}

    public function getValorDescontoAttribute() 
	{
		return $this->attributes['VALOR_DESCONTO'];
	}

	public function setValorDescontoAttribute($valorDesconto) 
	{
		$this->attributes['VALOR_DESCONTO'] = $valorDesconto;
	}

    public function getValorTotalAttribute() 
	{
		return $this->attributes['VALOR_TOTAL'];
	}

	public function setValorTotalAttribute($valorTotal) 
	{
		$this->attributes['VALOR_TOTAL'] = $valorTotal;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCodigoAttribute($objeto->codigo);
			$this->setPrazoEntregaAttribute($objeto->prazoEntrega);
			$this->setVendaCondicoesPagamentoAttribute($objeto->vendaCondicoesPagamento);
			$this->setValorSubtotalAttribute($objeto->valorSubtotal);
			$this->setTaxaDescontoAttribute($objeto->taxaDesconto);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setValorTotalAttribute($objeto->valorTotal);

			// vincular objetos
			$fornecedor = new Fornecedor();
			$fornecedor->mapear($objeto->fornecedor);
			$this->fornecedor()->associate($fornecedor);

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
			'codigo' => $this->getCodigoAttribute(),
			'prazoEntrega' => $this->getPrazoEntregaAttribute(),
			'vendaCondicoesPagamento' => $this->getVendaCondicoesPagamentoAttribute(),
			'valorSubtotal' => $this->getValorSubtotalAttribute(),
			'taxaDesconto' => $this->getTaxaDescontoAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'valorTotal' => $this->getValorTotalAttribute(),
			'fornecedor' => $this->fornecedor,
        ];
    }
}