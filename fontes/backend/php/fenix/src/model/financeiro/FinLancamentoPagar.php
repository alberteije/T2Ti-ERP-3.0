<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FIN_LANCAMENTO_PAGAR] 
                                                                                
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

class FinLancamentoPagar extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FIN_LANCAMENTO_PAGAR';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['finDocumentoOrigem', 'finNaturezaFinanceira', 'fornecedor', 'bancoContaCaixa', ];
	
    /**
     * Relations
     */
    public function finDocumentoOrigem()
    {
    	return $this->belongsTo(FinDocumentoOrigem::class, 'ID_FIN_DOCUMENTO_ORIGEM', 'ID');
    }

    public function finNaturezaFinanceira()
    {
    	return $this->belongsTo(FinNaturezaFinanceira::class, 'ID_FIN_NATUREZA_FINANCEIRA', 'ID');
    }

    public function fornecedor()
    {
    	return $this->belongsTo(Fornecedor::class, 'ID_FORNECEDOR', 'ID');
    }

    public function bancoContaCaixa()
    {
    	return $this->belongsTo(BancoContaCaixa::class, 'ID_BANCO_CONTA_CAIXA', 'ID');
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

    public function getQuantidadeParcelaAttribute() 
	{
		return $this->attributes['QUANTIDADE_PARCELA'];
	}

	public function setQuantidadeParcelaAttribute($quantidadeParcela) 
	{
		$this->attributes['QUANTIDADE_PARCELA'] = $quantidadeParcela;
	}

    public function getValorAPagarAttribute() 
	{
		return $this->attributes['VALOR_A_PAGAR'];
	}

	public function setValorAPagarAttribute($valorAPagar) 
	{
		$this->attributes['VALOR_A_PAGAR'] = $valorAPagar;
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

    public function getImagemDocumentoAttribute() 
	{
		return $this->attributes['IMAGEM_DOCUMENTO'];
	}

	public function setImagemDocumentoAttribute($imagemDocumento) 
	{
		$this->attributes['IMAGEM_DOCUMENTO'] = $imagemDocumento;
	}

    public function getPrimeiroVencimentoAttribute() 
	{
		return $this->attributes['PRIMEIRO_VENCIMENTO'];
	}

	public function setPrimeiroVencimentoAttribute($primeiroVencimento) 
	{
		$this->attributes['PRIMEIRO_VENCIMENTO'] = $primeiroVencimento;
	}

    public function getIntervaloEntreParcelasAttribute() 
	{
		return $this->attributes['INTERVALO_ENTRE_PARCELAS'];
	}

	public function setIntervaloEntreParcelasAttribute($intervaloEntreParcelas) 
	{
		$this->attributes['INTERVALO_ENTRE_PARCELAS'] = $intervaloEntreParcelas;
	}

    public function getDiaFixoAttribute() 
	{
		return $this->attributes['DIA_FIXO'];
	}

	public function setDiaFixoAttribute($diaFixo) 
	{
		$this->attributes['DIA_FIXO'] = $diaFixo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setQuantidadeParcelaAttribute($objeto->quantidadeParcela);
			$this->setValorAPagarAttribute($objeto->valorAPagar);
			$this->setDataLancamentoAttribute($objeto->dataLancamento);
			$this->setNumeroDocumentoAttribute($objeto->numeroDocumento);
			$this->setImagemDocumentoAttribute($objeto->imagemDocumento);
			$this->setPrimeiroVencimentoAttribute($objeto->primeiroVencimento);
			$this->setIntervaloEntreParcelasAttribute($objeto->intervaloEntreParcelas);
			$this->setDiaFixoAttribute($objeto->diaFixo);

			// vincular objetos
			$finDocumentoOrigem = new FinDocumentoOrigem();
			$finDocumentoOrigem->mapear($objeto->finDocumentoOrigem);
			$this->finDocumentoOrigem()->associate($finDocumentoOrigem);

			$finNaturezaFinanceira = new FinNaturezaFinanceira();
			$finNaturezaFinanceira->mapear($objeto->finNaturezaFinanceira);
			$this->finNaturezaFinanceira()->associate($finNaturezaFinanceira);

			$fornecedor = new Fornecedor();
			$fornecedor->mapear($objeto->fornecedor);
			$this->fornecedor()->associate($fornecedor);

			$bancoContaCaixa = new BancoContaCaixa();
			$bancoContaCaixa->mapear($objeto->bancoContaCaixa);
			$this->bancoContaCaixa()->associate($bancoContaCaixa);

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
			'quantidadeParcela' => $this->getQuantidadeParcelaAttribute(),
			'valorAPagar' => $this->getValorAPagarAttribute(),
			'dataLancamento' => $this->getDataLancamentoAttribute(),
			'numeroDocumento' => $this->getNumeroDocumentoAttribute(),
			'imagemDocumento' => $this->getImagemDocumentoAttribute(),
			'primeiroVencimento' => $this->getPrimeiroVencimentoAttribute(),
			'intervaloEntreParcelas' => $this->getIntervaloEntreParcelasAttribute(),
			'diaFixo' => $this->getDiaFixoAttribute(),
			'finDocumentoOrigem' => $this->finDocumentoOrigem,
			'finNaturezaFinanceira' => $this->finNaturezaFinanceira,
			'fornecedor' => $this->fornecedor,
			'bancoContaCaixa' => $this->bancoContaCaixa,
        ];
    }
}