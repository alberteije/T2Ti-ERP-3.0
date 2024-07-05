<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FIN_PARCELA_PAGAR] 
                                                                                
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

class FinParcelaPagar extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FIN_PARCELA_PAGAR';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['finStatusParcela', 'finTipoPagamento', 'finChequeEmitido', ];
	
    /**
     * Relations
     */
    public function finLancamentoPagar()
    {
    	return $this->belongsTo(FinLancamentoPagar::class, 'ID_FIN_LANCAMENTO_PAGAR', 'ID');
    }

    public function finStatusParcela()
    {
    	return $this->belongsTo(FinStatusParcela::class, 'ID_FIN_STATUS_PARCELA', 'ID');
    }

    public function finTipoPagamento()
    {
    	return $this->belongsTo(FinTipoPagamento::class, 'ID_FIN_TIPO_PAGAMENTO', 'ID');
    }

    public function finChequeEmitido()
    {
    	return $this->belongsTo(FinChequeEmitido::class, 'ID_FIN_CHEQUE_EMITIDO', 'ID');
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

    public function getNumeroParcelaAttribute() 
	{
		return $this->attributes['NUMERO_PARCELA'];
	}

	public function setNumeroParcelaAttribute($numeroParcela) 
	{
		$this->attributes['NUMERO_PARCELA'] = $numeroParcela;
	}

    public function getDataEmissaoAttribute() 
	{
		return $this->attributes['DATA_EMISSAO'];
	}

	public function setDataEmissaoAttribute($dataEmissao) 
	{
		$this->attributes['DATA_EMISSAO'] = $dataEmissao;
	}

    public function getDataVencimentoAttribute() 
	{
		return $this->attributes['DATA_VENCIMENTO'];
	}

	public function setDataVencimentoAttribute($dataVencimento) 
	{
		$this->attributes['DATA_VENCIMENTO'] = $dataVencimento;
	}

    public function getDataPagamentoAttribute() 
	{
		return $this->attributes['DATA_PAGAMENTO'];
	}

	public function setDataPagamentoAttribute($dataPagamento) 
	{
		$this->attributes['DATA_PAGAMENTO'] = $dataPagamento;
	}

    public function getDescontoAteAttribute() 
	{
		return $this->attributes['DESCONTO_ATE'];
	}

	public function setDescontoAteAttribute($descontoAte) 
	{
		$this->attributes['DESCONTO_ATE'] = $descontoAte;
	}

    public function getValorAttribute() 
	{
		return $this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}

    public function getTaxaJuroAttribute() 
	{
		return $this->attributes['TAXA_JURO'];
	}

	public function setTaxaJuroAttribute($taxaJuro) 
	{
		$this->attributes['TAXA_JURO'] = $taxaJuro;
	}

    public function getTaxaMultaAttribute() 
	{
		return $this->attributes['TAXA_MULTA'];
	}

	public function setTaxaMultaAttribute($taxaMulta) 
	{
		$this->attributes['TAXA_MULTA'] = $taxaMulta;
	}

    public function getTaxaDescontoAttribute() 
	{
		return $this->attributes['TAXA_DESCONTO'];
	}

	public function setTaxaDescontoAttribute($taxaDesconto) 
	{
		$this->attributes['TAXA_DESCONTO'] = $taxaDesconto;
	}

    public function getValorJuroAttribute() 
	{
		return $this->attributes['VALOR_JURO'];
	}

	public function setValorJuroAttribute($valorJuro) 
	{
		$this->attributes['VALOR_JURO'] = $valorJuro;
	}

    public function getValorMultaAttribute() 
	{
		return $this->attributes['VALOR_MULTA'];
	}

	public function setValorMultaAttribute($valorMulta) 
	{
		$this->attributes['VALOR_MULTA'] = $valorMulta;
	}

    public function getValorDescontoAttribute() 
	{
		return $this->attributes['VALOR_DESCONTO'];
	}

	public function setValorDescontoAttribute($valorDesconto) 
	{
		$this->attributes['VALOR_DESCONTO'] = $valorDesconto;
	}

    public function getValorPagoAttribute() 
	{
		return $this->attributes['VALOR_PAGO'];
	}

	public function setValorPagoAttribute($valorPago) 
	{
		$this->attributes['VALOR_PAGO'] = $valorPago;
	}

    public function getHistoricoAttribute() 
	{
		return $this->attributes['HISTORICO'];
	}

	public function setHistoricoAttribute($historico) 
	{
		$this->attributes['HISTORICO'] = $historico;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNumeroParcelaAttribute($objeto->numeroParcela);
			$this->setDataEmissaoAttribute($objeto->dataEmissao);
			$this->setDataVencimentoAttribute($objeto->dataVencimento);
			$this->setDataPagamentoAttribute($objeto->dataPagamento);
			$this->setDescontoAteAttribute($objeto->descontoAte);
			$this->setValorAttribute($objeto->valor);
			$this->setTaxaJuroAttribute($objeto->taxaJuro);
			$this->setTaxaMultaAttribute($objeto->taxaMulta);
			$this->setTaxaDescontoAttribute($objeto->taxaDesconto);
			$this->setValorJuroAttribute($objeto->valorJuro);
			$this->setValorMultaAttribute($objeto->valorMulta);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setValorPagoAttribute($objeto->valorPago);
			$this->setHistoricoAttribute($objeto->historico);

			// vincular objetos
			$finStatusParcela = new FinStatusParcela();
			$finStatusParcela->mapear($objeto->finStatusParcela);
			$this->finStatusParcela()->associate($finStatusParcela);

			$finTipoPagamento = new FinTipoPagamento();
			$finTipoPagamento->mapear($objeto->finTipoPagamento);
			$this->finTipoPagamento()->associate($finTipoPagamento);

			$finChequeEmitido = new FinChequeEmitido();
			$finChequeEmitido->mapear($objeto->finChequeEmitido);
			$this->finChequeEmitido()->associate($finChequeEmitido);

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
			'numeroParcela' => $this->getNumeroParcelaAttribute(),
			'dataEmissao' => $this->getDataEmissaoAttribute(),
			'dataVencimento' => $this->getDataVencimentoAttribute(),
			'dataPagamento' => $this->getDataPagamentoAttribute(),
			'descontoAte' => $this->getDescontoAteAttribute(),
			'valor' => $this->getValorAttribute(),
			'taxaJuro' => $this->getTaxaJuroAttribute(),
			'taxaMulta' => $this->getTaxaMultaAttribute(),
			'taxaDesconto' => $this->getTaxaDescontoAttribute(),
			'valorJuro' => $this->getValorJuroAttribute(),
			'valorMulta' => $this->getValorMultaAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'valorPago' => $this->getValorPagoAttribute(),
			'historico' => $this->getHistoricoAttribute(),
			'finStatusParcela' => $this->finStatusParcela,
			'finTipoPagamento' => $this->finTipoPagamento,
			'finChequeEmitido' => $this->finChequeEmitido,
        ];
    }
}