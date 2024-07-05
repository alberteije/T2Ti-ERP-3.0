<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [COMPRA_PEDIDO] 
                                                                                
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

class CompraPedido extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'COMPRA_PEDIDO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['compraTipoPedido', 'fornecedor', 'colaborador', ];
	
    /**
     * Relations
     */
    public function compraTipoPedido()
    {
    	return $this->belongsTo(CompraTipoPedido::class, 'ID_COMPRA_TIPO_PEDIDO', 'ID');
    }

    public function fornecedor()
    {
    	return $this->belongsTo(Fornecedor::class, 'ID_FORNECEDOR', 'ID');
    }

    public function colaborador()
    {
    	return $this->belongsTo(Colaborador::class, 'ID_COLABORADOR', 'ID');
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

    public function getDataPedidoAttribute() 
	{
		return $this->attributes['DATA_PEDIDO'];
	}

	public function setDataPedidoAttribute($dataPedido) 
	{
		$this->attributes['DATA_PEDIDO'] = $dataPedido;
	}

    public function getDataPrevistaEntregaAttribute() 
	{
		return $this->attributes['DATA_PREVISTA_ENTREGA'];
	}

	public function setDataPrevistaEntregaAttribute($dataPrevistaEntrega) 
	{
		$this->attributes['DATA_PREVISTA_ENTREGA'] = $dataPrevistaEntrega;
	}

    public function getDataPrevisaoPagamentoAttribute() 
	{
		return $this->attributes['DATA_PREVISAO_PAGAMENTO'];
	}

	public function setDataPrevisaoPagamentoAttribute($dataPrevisaoPagamento) 
	{
		$this->attributes['DATA_PREVISAO_PAGAMENTO'] = $dataPrevisaoPagamento;
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

    public function getContatoAttribute() 
	{
		return $this->attributes['CONTATO'];
	}

	public function setContatoAttribute($contato) 
	{
		$this->attributes['CONTATO'] = $contato;
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

    public function getBaseCalculoIcmsAttribute() 
	{
		return $this->attributes['BASE_CALCULO_ICMS'];
	}

	public function setBaseCalculoIcmsAttribute($baseCalculoIcms) 
	{
		$this->attributes['BASE_CALCULO_ICMS'] = $baseCalculoIcms;
	}

    public function getValorIcmsAttribute() 
	{
		return $this->attributes['VALOR_ICMS'];
	}

	public function setValorIcmsAttribute($valorIcms) 
	{
		$this->attributes['VALOR_ICMS'] = $valorIcms;
	}

    public function getBaseCalculoIcmsStAttribute() 
	{
		return $this->attributes['BASE_CALCULO_ICMS_ST'];
	}

	public function setBaseCalculoIcmsStAttribute($baseCalculoIcmsSt) 
	{
		$this->attributes['BASE_CALCULO_ICMS_ST'] = $baseCalculoIcmsSt;
	}

    public function getValorIcmsStAttribute() 
	{
		return $this->attributes['VALOR_ICMS_ST'];
	}

	public function setValorIcmsStAttribute($valorIcmsSt) 
	{
		$this->attributes['VALOR_ICMS_ST'] = $valorIcmsSt;
	}

    public function getValorTotalProdutosAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_PRODUTOS'];
	}

	public function setValorTotalProdutosAttribute($valorTotalProdutos) 
	{
		$this->attributes['VALOR_TOTAL_PRODUTOS'] = $valorTotalProdutos;
	}

    public function getValorFreteAttribute() 
	{
		return $this->attributes['VALOR_FRETE'];
	}

	public function setValorFreteAttribute($valorFrete) 
	{
		$this->attributes['VALOR_FRETE'] = $valorFrete;
	}

    public function getValorSeguroAttribute() 
	{
		return $this->attributes['VALOR_SEGURO'];
	}

	public function setValorSeguroAttribute($valorSeguro) 
	{
		$this->attributes['VALOR_SEGURO'] = $valorSeguro;
	}

    public function getValorOutrasDespesasAttribute() 
	{
		return $this->attributes['VALOR_OUTRAS_DESPESAS'];
	}

	public function setValorOutrasDespesasAttribute($valorOutrasDespesas) 
	{
		$this->attributes['VALOR_OUTRAS_DESPESAS'] = $valorOutrasDespesas;
	}

    public function getValorIpiAttribute() 
	{
		return $this->attributes['VALOR_IPI'];
	}

	public function setValorIpiAttribute($valorIpi) 
	{
		$this->attributes['VALOR_IPI'] = $valorIpi;
	}

    public function getValorTotalNfAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_NF'];
	}

	public function setValorTotalNfAttribute($valorTotalNf) 
	{
		$this->attributes['VALOR_TOTAL_NF'] = $valorTotalNf;
	}

    public function getQuantidadeParcelasAttribute() 
	{
		return $this->attributes['QUANTIDADE_PARCELAS'];
	}

	public function setQuantidadeParcelasAttribute($quantidadeParcelas) 
	{
		$this->attributes['QUANTIDADE_PARCELAS'] = $quantidadeParcelas;
	}

    public function getDiaPrimeiroVencimentoAttribute() 
	{
		return $this->attributes['DIA_PRIMEIRO_VENCIMENTO'];
	}

	public function setDiaPrimeiroVencimentoAttribute($diaPrimeiroVencimento) 
	{
		$this->attributes['DIA_PRIMEIRO_VENCIMENTO'] = $diaPrimeiroVencimento;
	}

    public function getIntervaloEntreParcelasAttribute() 
	{
		return $this->attributes['INTERVALO_ENTRE_PARCELAS'];
	}

	public function setIntervaloEntreParcelasAttribute($intervaloEntreParcelas) 
	{
		$this->attributes['INTERVALO_ENTRE_PARCELAS'] = $intervaloEntreParcelas;
	}

    public function getDiaFixoParcelaAttribute() 
	{
		return $this->attributes['DIA_FIXO_PARCELA'];
	}

	public function setDiaFixoParcelaAttribute($diaFixoParcela) 
	{
		$this->attributes['DIA_FIXO_PARCELA'] = $diaFixoParcela;
	}

    public function getCodigoCotacaoAttribute() 
	{
		return $this->attributes['CODIGO_COTACAO'];
	}

	public function setCodigoCotacaoAttribute($codigoCotacao) 
	{
		$this->attributes['CODIGO_COTACAO'] = $codigoCotacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDataPedidoAttribute($objeto->dataPedido);
			$this->setDataPrevistaEntregaAttribute($objeto->dataPrevistaEntrega);
			$this->setDataPrevisaoPagamentoAttribute($objeto->dataPrevisaoPagamento);
			$this->setLocalEntregaAttribute($objeto->localEntrega);
			$this->setLocalCobrancaAttribute($objeto->localCobranca);
			$this->setContatoAttribute($objeto->contato);
			$this->setValorSubtotalAttribute($objeto->valorSubtotal);
			$this->setTaxaDescontoAttribute($objeto->taxaDesconto);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setValorTotalAttribute($objeto->valorTotal);
			$this->setTipoFreteAttribute($objeto->tipoFrete);
			$this->setFormaPagamentoAttribute($objeto->formaPagamento);
			$this->setBaseCalculoIcmsAttribute($objeto->baseCalculoIcms);
			$this->setValorIcmsAttribute($objeto->valorIcms);
			$this->setBaseCalculoIcmsStAttribute($objeto->baseCalculoIcmsSt);
			$this->setValorIcmsStAttribute($objeto->valorIcmsSt);
			$this->setValorTotalProdutosAttribute($objeto->valorTotalProdutos);
			$this->setValorFreteAttribute($objeto->valorFrete);
			$this->setValorSeguroAttribute($objeto->valorSeguro);
			$this->setValorOutrasDespesasAttribute($objeto->valorOutrasDespesas);
			$this->setValorIpiAttribute($objeto->valorIpi);
			$this->setValorTotalNfAttribute($objeto->valorTotalNf);
			$this->setQuantidadeParcelasAttribute($objeto->quantidadeParcelas);
			$this->setDiaPrimeiroVencimentoAttribute($objeto->diaPrimeiroVencimento);
			$this->setIntervaloEntreParcelasAttribute($objeto->intervaloEntreParcelas);
			$this->setDiaFixoParcelaAttribute($objeto->diaFixoParcela);
			$this->setCodigoCotacaoAttribute($objeto->codigoCotacao);

			// vincular objetos
			$compraTipoPedido = new CompraTipoPedido();
			$compraTipoPedido->mapear($objeto->compraTipoPedido);
			$this->compraTipoPedido()->associate($compraTipoPedido);

			$fornecedor = new Fornecedor();
			$fornecedor->mapear($objeto->fornecedor);
			$this->fornecedor()->associate($fornecedor);

			$colaborador = new Colaborador();
			$colaborador->mapear($objeto->colaborador);
			$this->colaborador()->associate($colaborador);

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
			'dataPedido' => $this->getDataPedidoAttribute(),
			'dataPrevistaEntrega' => $this->getDataPrevistaEntregaAttribute(),
			'dataPrevisaoPagamento' => $this->getDataPrevisaoPagamentoAttribute(),
			'localEntrega' => $this->getLocalEntregaAttribute(),
			'localCobranca' => $this->getLocalCobrancaAttribute(),
			'contato' => $this->getContatoAttribute(),
			'valorSubtotal' => $this->getValorSubtotalAttribute(),
			'taxaDesconto' => $this->getTaxaDescontoAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'valorTotal' => $this->getValorTotalAttribute(),
			'tipoFrete' => $this->getTipoFreteAttribute(),
			'formaPagamento' => $this->getFormaPagamentoAttribute(),
			'baseCalculoIcms' => $this->getBaseCalculoIcmsAttribute(),
			'valorIcms' => $this->getValorIcmsAttribute(),
			'baseCalculoIcmsSt' => $this->getBaseCalculoIcmsStAttribute(),
			'valorIcmsSt' => $this->getValorIcmsStAttribute(),
			'valorTotalProdutos' => $this->getValorTotalProdutosAttribute(),
			'valorFrete' => $this->getValorFreteAttribute(),
			'valorSeguro' => $this->getValorSeguroAttribute(),
			'valorOutrasDespesas' => $this->getValorOutrasDespesasAttribute(),
			'valorIpi' => $this->getValorIpiAttribute(),
			'valorTotalNf' => $this->getValorTotalNfAttribute(),
			'quantidadeParcelas' => $this->getQuantidadeParcelasAttribute(),
			'diaPrimeiroVencimento' => $this->getDiaPrimeiroVencimentoAttribute(),
			'intervaloEntreParcelas' => $this->getIntervaloEntreParcelasAttribute(),
			'diaFixoParcela' => $this->getDiaFixoParcelaAttribute(),
			'codigoCotacao' => $this->getCodigoCotacaoAttribute(),
			'compraTipoPedido' => $this->compraTipoPedido,
			'fornecedor' => $this->fornecedor,
			'colaborador' => $this->colaborador,
        ];
    }
}