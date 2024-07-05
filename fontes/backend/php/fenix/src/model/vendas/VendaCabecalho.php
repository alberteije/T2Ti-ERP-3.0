<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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

class VendaCabecalho extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VENDA_CABECALHO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['vendaFrete', 'listaVendaComissao', 'listaVendaDetalhe', 'vendaOrcamentoCabecalho', 'vendaCondicoesPagamento', 'notaFiscalTipo', 'cliente', 'transportadora', 'vendedor', ];
	
    /**
     * Relations
     */
	public function vendaFrete()
    {
    	return $this->hasOne(VendaFrete::class, 'ID_VENDA_CABECALHO', 'ID');
    }
    public function listaVendaComissao()
    {
    	return $this->hasMany(VendaComissao::class, 'ID_VENDA_CABECALHO', 'ID');
    }

    public function listaVendaDetalhe()
    {
    	return $this->hasMany(VendaDetalhe::class, 'ID_VENDA_CABECALHO', 'ID');
    }

    public function vendaOrcamentoCabecalho()
    {
    	return $this->belongsTo(VendaOrcamentoCabecalho::class, 'ID_VENDA_ORCAMENTO_CABECALHO', 'ID');
    }

    public function vendaCondicoesPagamento()
    {
    	return $this->belongsTo(VendaCondicoesPagamento::class, 'ID_VENDA_CONDICOES_PAGAMENTO', 'ID');
    }

    public function notaFiscalTipo()
    {
    	return $this->belongsTo(NotaFiscalTipo::class, 'ID_NOTA_FISCAL_TIPO', 'ID');
    }

    public function cliente()
    {
    	return $this->belongsTo(Cliente::class, 'ID_CLIENTE', 'ID');
    }

    public function transportadora()
    {
    	return $this->belongsTo(Transportadora::class, 'ID_TRANSPORTADORA', 'ID');
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

    public function getDataVendaAttribute() 
	{
		return $this->attributes['DATA_VENDA'];
	}

	public function setDataVendaAttribute($dataVenda) 
	{
		$this->attributes['DATA_VENDA'] = $dataVenda;
	}

    public function getDataSaidaAttribute() 
	{
		return $this->attributes['DATA_SAIDA'];
	}

	public function setDataSaidaAttribute($dataSaida) 
	{
		$this->attributes['DATA_SAIDA'] = $dataSaida;
	}

    public function getHoraSaidaAttribute() 
	{
		return $this->attributes['HORA_SAIDA'];
	}

	public function setHoraSaidaAttribute($horaSaida) 
	{
		$this->attributes['HORA_SAIDA'] = $horaSaida;
	}

    public function getNumeroFaturaAttribute() 
	{
		return $this->attributes['NUMERO_FATURA'];
	}

	public function setNumeroFaturaAttribute($numeroFatura) 
	{
		$this->attributes['NUMERO_FATURA'] = $numeroFatura;
	}

    public function getLocalEntregaAttribute() 
	{
		return $this->attributes['LOCAL_ENTREGA'];
	}

	public function setLocalEntregaAttribute($localEntrega) 
	{
		$this->attributes['LOCAL_ENTREGA'] = $localEntrega;
	}

    public function getLocalCobrancaAttribute() 
	{
		return $this->attributes['LOCAL_COBRANCA'];
	}

	public function setLocalCobrancaAttribute($localCobranca) 
	{
		$this->attributes['LOCAL_COBRANCA'] = $localCobranca;
	}

    public function getValorSubtotalAttribute() 
	{
		return (double)$this->attributes['VALOR_SUBTOTAL'];
	}

	public function setValorSubtotalAttribute($valorSubtotal) 
	{
		$this->attributes['VALOR_SUBTOTAL'] = $valorSubtotal;
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

    public function getTipoFreteAttribute() 
	{
		return $this->attributes['TIPO_FRETE'];
	}

	public function setTipoFreteAttribute($tipoFrete) 
	{
		$this->attributes['TIPO_FRETE'] = $tipoFrete;
	}

    public function getFormaPagamentoAttribute() 
	{
		return $this->attributes['FORMA_PAGAMENTO'];
	}

	public function setFormaPagamentoAttribute($formaPagamento) 
	{
		$this->attributes['FORMA_PAGAMENTO'] = $formaPagamento;
	}

    public function getValorFreteAttribute() 
	{
		return (double)$this->attributes['VALOR_FRETE'];
	}

	public function setValorFreteAttribute($valorFrete) 
	{
		$this->attributes['VALOR_FRETE'] = $valorFrete;
	}

    public function getValorSeguroAttribute() 
	{
		return (double)$this->attributes['VALOR_SEGURO'];
	}

	public function setValorSeguroAttribute($valorSeguro) 
	{
		$this->attributes['VALOR_SEGURO'] = $valorSeguro;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}

    public function getSituacaoAttribute() 
	{
		return $this->attributes['SITUACAO'];
	}

	public function setSituacaoAttribute($situacao) 
	{
		$this->attributes['SITUACAO'] = $situacao;
	}

    public function getDiaFixoParcelaAttribute() 
	{
		return $this->attributes['DIA_FIXO_PARCELA'];
	}

	public function setDiaFixoParcelaAttribute($diaFixoParcela) 
	{
		$this->attributes['DIA_FIXO_PARCELA'] = $diaFixoParcela;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDataVendaAttribute($objeto->dataVenda);
			$this->setDataSaidaAttribute($objeto->dataSaida);
			$this->setHoraSaidaAttribute($objeto->horaSaida);
			$this->setNumeroFaturaAttribute($objeto->numeroFatura);
			$this->setLocalEntregaAttribute($objeto->localEntrega);
			$this->setLocalCobrancaAttribute($objeto->localCobranca);
			$this->setValorSubtotalAttribute($objeto->valorSubtotal);
			$this->setTaxaComissaoAttribute($objeto->taxaComissao);
			$this->setValorComissaoAttribute($objeto->valorComissao);
			$this->setTaxaDescontoAttribute($objeto->taxaDesconto);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setValorTotalAttribute($objeto->valorTotal);
			$this->setTipoFreteAttribute($objeto->tipoFrete);
			$this->setFormaPagamentoAttribute($objeto->formaPagamento);
			$this->setValorFreteAttribute($objeto->valorFrete);
			$this->setValorSeguroAttribute($objeto->valorSeguro);
			$this->setObservacaoAttribute($objeto->observacao);
			$this->setSituacaoAttribute($objeto->situacao);
			$this->setDiaFixoParcelaAttribute($objeto->diaFixoParcela);

			// vincular objetos
			$vendaOrcamentoCabecalho = new VendaOrcamentoCabecalho();
			$vendaOrcamentoCabecalho->mapear($objeto->vendaOrcamentoCabecalho);
			$this->vendaOrcamentoCabecalho()->associate($vendaOrcamentoCabecalho);

			$vendaCondicoesPagamento = new VendaCondicoesPagamento();
			$vendaCondicoesPagamento->mapear($objeto->vendaCondicoesPagamento);
			$this->vendaCondicoesPagamento()->associate($vendaCondicoesPagamento);

			$notaFiscalTipo = new NotaFiscalTipo();
			$notaFiscalTipo->mapear($objeto->notaFiscalTipo);
			$this->notaFiscalTipo()->associate($notaFiscalTipo);

			$cliente = new Cliente();
			$cliente->mapear($objeto->cliente);
			$this->cliente()->associate($cliente);

			$transportadora = new Transportadora();
			$transportadora->mapear($objeto->transportadora);
			$this->transportadora()->associate($transportadora);

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
			'dataVenda' => $this->getDataVendaAttribute(),
			'dataSaida' => $this->getDataSaidaAttribute(),
			'horaSaida' => $this->getHoraSaidaAttribute(),
			'numeroFatura' => $this->getNumeroFaturaAttribute(),
			'localEntrega' => $this->getLocalEntregaAttribute(),
			'localCobranca' => $this->getLocalCobrancaAttribute(),
			'valorSubtotal' => $this->getValorSubtotalAttribute(),
			'taxaComissao' => $this->getTaxaComissaoAttribute(),
			'valorComissao' => $this->getValorComissaoAttribute(),
			'taxaDesconto' => $this->getTaxaDescontoAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'valorTotal' => $this->getValorTotalAttribute(),
			'tipoFrete' => $this->getTipoFreteAttribute(),
			'formaPagamento' => $this->getFormaPagamentoAttribute(),
			'valorFrete' => $this->getValorFreteAttribute(),
			'valorSeguro' => $this->getValorSeguroAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'situacao' => $this->getSituacaoAttribute(),
			'diaFixoParcela' => $this->getDiaFixoParcelaAttribute(),
			'vendaOrcamentoCabecalho' => $this->vendaOrcamentoCabecalho,
			'vendaCondicoesPagamento' => $this->vendaCondicoesPagamento,
			'notaFiscalTipo' => $this->notaFiscalTipo,
			'cliente' => $this->cliente,
			'transportadora' => $this->transportadora,
			'vendedor' => $this->vendedor,
			'vendaFrete' => $this->vendaFrete,
			'listaVendaComissao' => $this->listaVendaComissao,
			'listaVendaDetalhe' => $this->listaVendaDetalhe,
        ];
    }
}