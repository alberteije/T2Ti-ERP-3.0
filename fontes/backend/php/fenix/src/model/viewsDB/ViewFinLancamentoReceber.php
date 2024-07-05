<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_FIN_LANCAMENTO_RECEBER] 
                                                                                
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

class ViewFinLancamentoReceber extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_FIN_LANCAMENTO_RECEBER';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */

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

    public function getIdFinLancamentoReceberAttribute() 
	{
		return $this->attributes['ID_FIN_LANCAMENTO_RECEBER'];
	}

	public function setIdFinLancamentoReceberAttribute($idFinLancamentoReceber) 
	{
		$this->attributes['ID_FIN_LANCAMENTO_RECEBER'] = $idFinLancamentoReceber;
	}

    public function getQuantidadeParcelaAttribute() 
	{
		return $this->attributes['QUANTIDADE_PARCELA'];
	}

	public function setQuantidadeParcelaAttribute($quantidadeParcela) 
	{
		$this->attributes['QUANTIDADE_PARCELA'] = $quantidadeParcela;
	}

    public function getValorLancamentoAttribute() 
	{
		return (double)$this->attributes['VALOR_LANCAMENTO'];
	}

	public function setValorLancamentoAttribute($valorLancamento) 
	{
		$this->attributes['VALOR_LANCAMENTO'] = $valorLancamento;
	}

    public function getDataLancamentoAttribute() 
	{
		return $this->attributes['DATA_LANCAMENTO'];
	}

	public function setDataLancamentoAttribute($dataLancamento) 
	{
		$this->attributes['DATA_LANCAMENTO'] = $dataLancamento;
	}

    public function getNumeroDocumentoAttribute() 
	{
		return $this->attributes['NUMERO_DOCUMENTO'];
	}

	public function setNumeroDocumentoAttribute($numeroDocumento) 
	{
		$this->attributes['NUMERO_DOCUMENTO'] = $numeroDocumento;
	}

    public function getIdFinParcelaReceberAttribute() 
	{
		return $this->attributes['ID_FIN_PARCELA_RECEBER'];
	}

	public function setIdFinParcelaReceberAttribute($idFinParcelaReceber) 
	{
		$this->attributes['ID_FIN_PARCELA_RECEBER'] = $idFinParcelaReceber;
	}

    public function getNumeroParcelaAttribute() 
	{
		return $this->attributes['NUMERO_PARCELA'];
	}

	public function setNumeroParcelaAttribute($numeroParcela) 
	{
		$this->attributes['NUMERO_PARCELA'] = $numeroParcela;
	}

    public function getDataVencimentoAttribute() 
	{
		return $this->attributes['DATA_VENCIMENTO'];
	}

	public function setDataVencimentoAttribute($dataVencimento) 
	{
		$this->attributes['DATA_VENCIMENTO'] = $dataVencimento;
	}

    public function getDataRecebimentoAttribute() 
	{
		return $this->attributes['DATA_RECEBIMENTO'];
	}

	public function setDataRecebimentoAttribute($dataRecebimento) 
	{
		$this->attributes['DATA_RECEBIMENTO'] = $dataRecebimento;
	}

    public function getValorParcelaAttribute() 
	{
		return (double)$this->attributes['VALOR_PARCELA'];
	}

	public function setValorParcelaAttribute($valorParcela) 
	{
		$this->attributes['VALOR_PARCELA'] = $valorParcela;
	}

    public function getTaxaJuroAttribute() 
	{
		return (double)$this->attributes['TAXA_JURO'];
	}

	public function setTaxaJuroAttribute($taxaJuro) 
	{
		$this->attributes['TAXA_JURO'] = $taxaJuro;
	}

    public function getValorJuroAttribute() 
	{
		return (double)$this->attributes['VALOR_JURO'];
	}

	public function setValorJuroAttribute($valorJuro) 
	{
		$this->attributes['VALOR_JURO'] = $valorJuro;
	}

    public function getTaxaMultaAttribute() 
	{
		return (double)$this->attributes['TAXA_MULTA'];
	}

	public function setTaxaMultaAttribute($taxaMulta) 
	{
		$this->attributes['TAXA_MULTA'] = $taxaMulta;
	}

    public function getValorMultaAttribute() 
	{
		return (double)$this->attributes['VALOR_MULTA'];
	}

	public function setValorMultaAttribute($valorMulta) 
	{
		$this->attributes['VALOR_MULTA'] = $valorMulta;
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

    public function getSiglaDocumentoAttribute() 
	{
		return $this->attributes['SIGLA_DOCUMENTO'];
	}

	public function setSiglaDocumentoAttribute($siglaDocumento) 
	{
		$this->attributes['SIGLA_DOCUMENTO'] = $siglaDocumento;
	}

    public function getNomeClienteAttribute() 
	{
		return $this->attributes['NOME_CLIENTE'];
	}

	public function setNomeClienteAttribute($nomeCliente) 
	{
		$this->attributes['NOME_CLIENTE'] = $nomeCliente;
	}

    public function getIdFinStatusParcelaAttribute() 
	{
		return $this->attributes['ID_FIN_STATUS_PARCELA'];
	}

	public function setIdFinStatusParcelaAttribute($idFinStatusParcela) 
	{
		$this->attributes['ID_FIN_STATUS_PARCELA'] = $idFinStatusParcela;
	}

    public function getSituacaoParcelaAttribute() 
	{
		return $this->attributes['SITUACAO_PARCELA'];
	}

	public function setSituacaoParcelaAttribute($situacaoParcela) 
	{
		$this->attributes['SITUACAO_PARCELA'] = $situacaoParcela;
	}

    public function getDescricaoSituacaoParcelaAttribute() 
	{
		return $this->attributes['DESCRICAO_SITUACAO_PARCELA'];
	}

	public function setDescricaoSituacaoParcelaAttribute($descricaoSituacaoParcela) 
	{
		$this->attributes['DESCRICAO_SITUACAO_PARCELA'] = $descricaoSituacaoParcela;
	}

    public function getIdBancoContaCaixaAttribute() 
	{
		return $this->attributes['ID_BANCO_CONTA_CAIXA'];
	}

	public function setIdBancoContaCaixaAttribute($idBancoContaCaixa) 
	{
		$this->attributes['ID_BANCO_CONTA_CAIXA'] = $idBancoContaCaixa;
	}

    public function getNomeContaCaixaAttribute() 
	{
		return $this->attributes['NOME_CONTA_CAIXA'];
	}

	public function setNomeContaCaixaAttribute($nomeContaCaixa) 
	{
		$this->attributes['NOME_CONTA_CAIXA'] = $nomeContaCaixa;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdFinLancamentoReceberAttribute($objeto->idFinLancamentoReceber);
			$this->setQuantidadeParcelaAttribute($objeto->quantidadeParcela);
			$this->setValorLancamentoAttribute($objeto->valorLancamento);
			$this->setDataLancamentoAttribute($objeto->dataLancamento);
			$this->setNumeroDocumentoAttribute($objeto->numeroDocumento);
			$this->setIdFinParcelaReceberAttribute($objeto->idFinParcelaReceber);
			$this->setNumeroParcelaAttribute($objeto->numeroParcela);
			$this->setDataVencimentoAttribute($objeto->dataVencimento);
			$this->setDataRecebimentoAttribute($objeto->dataRecebimento);
			$this->setValorParcelaAttribute($objeto->valorParcela);
			$this->setTaxaJuroAttribute($objeto->taxaJuro);
			$this->setValorJuroAttribute($objeto->valorJuro);
			$this->setTaxaMultaAttribute($objeto->taxaMulta);
			$this->setValorMultaAttribute($objeto->valorMulta);
			$this->setTaxaDescontoAttribute($objeto->taxaDesconto);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setSiglaDocumentoAttribute($objeto->siglaDocumento);
			$this->setNomeClienteAttribute($objeto->nomeCliente);
			$this->setIdFinStatusParcelaAttribute($objeto->idFinStatusParcela);
			$this->setSituacaoParcelaAttribute($objeto->situacaoParcela);
			$this->setDescricaoSituacaoParcelaAttribute($objeto->descricaoSituacaoParcela);
			$this->setIdBancoContaCaixaAttribute($objeto->idBancoContaCaixa);
			$this->setNomeContaCaixaAttribute($objeto->nomeContaCaixa);

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
			'idFinLancamentoReceber' => $this->getIdFinLancamentoReceberAttribute(),
			'quantidadeParcela' => $this->getQuantidadeParcelaAttribute(),
			'valorLancamento' => $this->getValorLancamentoAttribute(),
			'dataLancamento' => $this->getDataLancamentoAttribute(),
			'numeroDocumento' => $this->getNumeroDocumentoAttribute(),
			'idFinParcelaReceber' => $this->getIdFinParcelaReceberAttribute(),
			'numeroParcela' => $this->getNumeroParcelaAttribute(),
			'dataVencimento' => $this->getDataVencimentoAttribute(),
			'dataRecebimento' => $this->getDataRecebimentoAttribute(),
			'valorParcela' => $this->getValorParcelaAttribute(),
			'taxaJuro' => $this->getTaxaJuroAttribute(),
			'valorJuro' => $this->getValorJuroAttribute(),
			'taxaMulta' => $this->getTaxaMultaAttribute(),
			'valorMulta' => $this->getValorMultaAttribute(),
			'taxaDesconto' => $this->getTaxaDescontoAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'siglaDocumento' => $this->getSiglaDocumentoAttribute(),
			'nomeCliente' => $this->getNomeClienteAttribute(),
			'idFinStatusParcela' => $this->getIdFinStatusParcelaAttribute(),
			'situacaoParcela' => $this->getSituacaoParcelaAttribute(),
			'descricaoSituacaoParcela' => $this->getDescricaoSituacaoParcelaAttribute(),
			'idBancoContaCaixa' => $this->getIdBancoContaCaixaAttribute(),
			'nomeContaCaixa' => $this->getNomeContaCaixaAttribute(),
        ];
    }
}