<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_INFORMACAO_PAGAMENTO] 
                                                                                
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

class NfeInformacaoPagamento extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_INFORMACAO_PAGAMENTO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeCabecalho()
    {
    	return $this->belongsTo(NfeCabecalho::class, 'ID_NFE_CABECALHO', 'ID');
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

    public function getIndicadorPagamentoAttribute() 
	{
		return $this->attributes['INDICADOR_PAGAMENTO'];
	}

	public function setIndicadorPagamentoAttribute($indicadorPagamento) 
	{
		$this->attributes['INDICADOR_PAGAMENTO'] = $indicadorPagamento;
	}

    public function getMeioPagamentoAttribute() 
	{
		return $this->attributes['MEIO_PAGAMENTO'];
	}

	public function setMeioPagamentoAttribute($meioPagamento) 
	{
		$this->attributes['MEIO_PAGAMENTO'] = $meioPagamento;
	}

    public function getValorAttribute() 
	{
		return (double)$this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}

    public function getTipoIntegracaoAttribute() 
	{
		return $this->attributes['TIPO_INTEGRACAO'];
	}

	public function setTipoIntegracaoAttribute($tipoIntegracao) 
	{
		$this->attributes['TIPO_INTEGRACAO'] = $tipoIntegracao;
	}

    public function getCnpjOperadoraCartaoAttribute() 
	{
		return $this->attributes['CNPJ_OPERADORA_CARTAO'];
	}

	public function setCnpjOperadoraCartaoAttribute($cnpjOperadoraCartao) 
	{
		$this->attributes['CNPJ_OPERADORA_CARTAO'] = $cnpjOperadoraCartao;
	}

    public function getBandeiraAttribute() 
	{
		return $this->attributes['BANDEIRA'];
	}

	public function setBandeiraAttribute($bandeira) 
	{
		$this->attributes['BANDEIRA'] = $bandeira;
	}

    public function getNumeroAutorizacaoAttribute() 
	{
		return $this->attributes['NUMERO_AUTORIZACAO'];
	}

	public function setNumeroAutorizacaoAttribute($numeroAutorizacao) 
	{
		$this->attributes['NUMERO_AUTORIZACAO'] = $numeroAutorizacao;
	}

    public function getTrocoAttribute() 
	{
		return (double)$this->attributes['TROCO'];
	}

	public function setTrocoAttribute($troco) 
	{
		$this->attributes['TROCO'] = $troco;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIndicadorPagamentoAttribute($objeto->indicadorPagamento);
			$this->setMeioPagamentoAttribute($objeto->meioPagamento);
			$this->setValorAttribute($objeto->valor);
			$this->setTipoIntegracaoAttribute($objeto->tipoIntegracao);
			$this->setCnpjOperadoraCartaoAttribute($objeto->cnpjOperadoraCartao);
			$this->setBandeiraAttribute($objeto->bandeira);
			$this->setNumeroAutorizacaoAttribute($objeto->numeroAutorizacao);
			$this->setTrocoAttribute($objeto->troco);

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
			'indicadorPagamento' => $this->getIndicadorPagamentoAttribute(),
			'meioPagamento' => $this->getMeioPagamentoAttribute(),
			'valor' => $this->getValorAttribute(),
			'tipoIntegracao' => $this->getTipoIntegracaoAttribute(),
			'cnpjOperadoraCartao' => $this->getCnpjOperadoraCartaoAttribute(),
			'bandeira' => $this->getBandeiraAttribute(),
			'numeroAutorizacao' => $this->getNumeroAutorizacaoAttribute(),
			'troco' => $this->getTrocoAttribute(),
        ];
    }
}