<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VENDA_DETALHE] 
                                                                                
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

class VendaDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VENDA_DETALHE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['produto', ];
	
    /**
     * Relations
     */
    public function vendaCabecalho()
    {
    	return $this->belongsTo(VendaCabecalho::class, 'ID_VENDA_CABECALHO', 'ID');
    }

    public function produto()
    {
    	return $this->belongsTo(Produto::class, 'ID_PRODUTO', 'ID');
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

    public function getQuantidadeAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE'];
	}

	public function setQuantidadeAttribute($quantidade) 
	{
		$this->attributes['QUANTIDADE'] = $quantidade;
	}

    public function getValorUnitarioAttribute() 
	{
		return (double)$this->attributes['VALOR_UNITARIO'];
	}

	public function setValorUnitarioAttribute($valorUnitario) 
	{
		$this->attributes['VALOR_UNITARIO'] = $valorUnitario;
	}

    public function getValorSubtotalAttribute() 
	{
		return (double)$this->attributes['VALOR_SUBTOTAL'];
	}

	public function setValorSubtotalAttribute($valorSubtotal) 
	{
		$this->attributes['VALOR_SUBTOTAL'] = $valorSubtotal;
	}

    public function getTaxaDescontoAttribute() 
	{
		return (double)$this->attributes['TAXA_DESCONTO'];
	}

	public function setTaxaDescontoAttribute($taxaDesconto) 
	{
		$this->attributes['TAXA_DESCONTO'] = $taxaDesconto;
	}

    public function getValorDescontoAttribute() 
	{
		return (double)$this->attributes['VALOR_DESCONTO'];
	}

	public function setValorDescontoAttribute($valorDesconto) 
	{
		$this->attributes['VALOR_DESCONTO'] = $valorDesconto;
	}

    public function getValorTotalAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL'];
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

			$this->setQuantidadeAttribute($objeto->quantidade);
			$this->setValorUnitarioAttribute($objeto->valorUnitario);
			$this->setValorSubtotalAttribute($objeto->valorSubtotal);
			$this->setTaxaDescontoAttribute($objeto->taxaDesconto);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setValorTotalAttribute($objeto->valorTotal);

			// vincular objetos
			$produto = new Produto();
			$produto->mapear($objeto->produto);
			$this->produto()->associate($produto);

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
			'quantidade' => $this->getQuantidadeAttribute(),
			'valorUnitario' => $this->getValorUnitarioAttribute(),
			'valorSubtotal' => $this->getValorSubtotalAttribute(),
			'taxaDesconto' => $this->getTaxaDescontoAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'valorTotal' => $this->getValorTotalAttribute(),
			'produto' => $this->produto,
        ];
    }
}