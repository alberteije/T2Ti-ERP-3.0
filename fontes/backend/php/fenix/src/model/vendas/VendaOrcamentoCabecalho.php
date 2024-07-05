<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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

class VendaOrcamentoCabecalho extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VENDA_ORCAMENTO_CABECALHO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['listaVendaOrcamentoDetalhe', 'vendaCondicoesPagamento', 'vendedor', 'cliente', 'transportadora', ];
	
    /**
     * Relations
     */
    public function listaVendaOrcamentoDetalhe()
    {
    	return $this->hasMany(VendaOrcamentoDetalhe::class, 'ID_VENDA_ORCAMENTO_CABECALHO', 'ID');
    }

    public function vendaCondicoesPagamento()
    {
    	return $this->belongsTo(VendaCondicoesPagamento::class, 'ID_VENDA_CONDICOES_PAGAMENTO', 'ID');
    }

    public function vendedor()
    {
    	return $this->belongsTo(Vendedor::class, 'ID_VENDEDOR', 'ID');
    }

    public function cliente()
    {
    	return $this->belongsTo(Cliente::class, 'ID_CLIENTE', 'ID');
    }

    public function transportadora()
    {
    	return $this->belongsTo(Transportadora::class, 'ID_TRANSPORTADORA', 'ID');
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

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}

	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}

    public function getDataEntregaAttribute() 
	{
		return $this->attributes['DATA_ENTREGA'];
	}

	public function setDataEntregaAttribute($dataEntrega) 
	{
		$this->attributes['DATA_ENTREGA'] = $dataEntrega;
	}

    public function getValidadeAttribute() 
	{
		return $this->attributes['VALIDADE'];
	}

	public function setValidadeAttribute($validade) 
	{
		$this->attributes['VALIDADE'] = $validade;
	}

    public function getTipoFreteAttribute() 
	{
		return $this->attributes['TIPO_FRETE'];
	}

	public function setTipoFreteAttribute($tipoFrete) 
	{
		$this->attributes['TIPO_FRETE'] = $tipoFrete;
	}

    public function getValorSubtotalAttribute() 
	{
		return (double)$this->attributes['VALOR_SUBTOTAL'];
	}

	public function setValorSubtotalAttribute($valorSubtotal) 
	{
		$this->attributes['VALOR_SUBTOTAL'] = $valorSubtotal;
	}

    public function getValorFreteAttribute() 
	{
		return (double)$this->attributes['VALOR_FRETE'];
	}

	public function setValorFreteAttribute($valorFrete) 
	{
		$this->attributes['VALOR_FRETE'] = $valorFrete;
	}

    public function getTaxaComissaoAttribute() 
	{
		return (double)$this->attributes['TAXA_COMISSAO'];
	}

	public function setTaxaComissaoAttribute($taxaComissao) 
	{
		$this->attributes['TAXA_COMISSAO'] = $taxaComissao;
	}

    public function getValorComissaoAttribute() 
	{
		return (double)$this->attributes['VALOR_COMISSAO'];
	}

	public function setValorComissaoAttribute($valorComissao) 
	{
		$this->attributes['VALOR_COMISSAO'] = $valorComissao;
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

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCodigoAttribute($objeto->codigo);
			$this->setDataCadastroAttribute($objeto->dataCadastro);
			$this->setDataEntregaAttribute($objeto->dataEntrega);
			$this->setValidadeAttribute($objeto->validade);
			$this->setTipoFreteAttribute($objeto->tipoFrete);
			$this->setValorSubtotalAttribute($objeto->valorSubtotal);
			$this->setValorFreteAttribute($objeto->valorFrete);
			$this->setTaxaComissaoAttribute($objeto->taxaComissao);
			$this->setValorComissaoAttribute($objeto->valorComissao);
			$this->setTaxaDescontoAttribute($objeto->taxaDesconto);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setValorTotalAttribute($objeto->valorTotal);
			$this->setObservacaoAttribute($objeto->observacao);

			// vincular objetos
			$vendaCondicoesPagamento = new VendaCondicoesPagamento();
			$vendaCondicoesPagamento->mapear($objeto->vendaCondicoesPagamento);
			$this->vendaCondicoesPagamento()->associate($vendaCondicoesPagamento);

			$vendedor = new Vendedor();
			$vendedor->mapear($objeto->vendedor);
			$this->vendedor()->associate($vendedor);

			$cliente = new Cliente();
			$cliente->mapear($objeto->cliente);
			$this->cliente()->associate($cliente);

			$transportadora = new Transportadora();
			$transportadora->mapear($objeto->transportadora);
			$this->transportadora()->associate($transportadora);

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
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'dataEntrega' => $this->getDataEntregaAttribute(),
			'validade' => $this->getValidadeAttribute(),
			'tipoFrete' => $this->getTipoFreteAttribute(),
			'valorSubtotal' => $this->getValorSubtotalAttribute(),
			'valorFrete' => $this->getValorFreteAttribute(),
			'taxaComissao' => $this->getTaxaComissaoAttribute(),
			'valorComissao' => $this->getValorComissaoAttribute(),
			'taxaDesconto' => $this->getTaxaDescontoAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'valorTotal' => $this->getValorTotalAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'vendaCondicoesPagamento' => $this->vendaCondicoesPagamento,
			'vendedor' => $this->vendedor,
			'cliente' => $this->cliente,
			'transportadora' => $this->transportadora,
			'listaVendaOrcamentoDetalhe' => $this->listaVendaOrcamentoDetalhe,
        ];
    }
}