<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_FIN_FLUXO_CAIXA] 
                                                                                
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

class ViewFinFluxoCaixa extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_FIN_FLUXO_CAIXA';

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

    public function getIdContaCaixaAttribute() 
	{
		return $this->attributes['ID_CONTA_CAIXA'];
	}

	public function setIdContaCaixaAttribute($idContaCaixa) 
	{
		$this->attributes['ID_CONTA_CAIXA'] = $idContaCaixa;
	}

    public function getNomeContaCaixaAttribute() 
	{
		return $this->attributes['NOME_CONTA_CAIXA'];
	}

	public function setNomeContaCaixaAttribute($nomeContaCaixa) 
	{
		$this->attributes['NOME_CONTA_CAIXA'] = $nomeContaCaixa;
	}

    public function getNomePessoaAttribute() 
	{
		return $this->attributes['NOME_PESSOA'];
	}

	public function setNomePessoaAttribute($nomePessoa) 
	{
		$this->attributes['NOME_PESSOA'] = $nomePessoa;
	}

    public function getDataLancamentoAttribute() 
	{
		return $this->attributes['DATA_LANCAMENTO'];
	}

	public function setDataLancamentoAttribute($dataLancamento) 
	{
		$this->attributes['DATA_LANCAMENTO'] = $dataLancamento;
	}

    public function getDataVencimentoAttribute() 
	{
		return $this->attributes['DATA_VENCIMENTO'];
	}

	public function setDataVencimentoAttribute($dataVencimento) 
	{
		$this->attributes['DATA_VENCIMENTO'] = $dataVencimento;
	}

    public function getValorAttribute() 
	{
		return (double)$this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}

    public function getCodigoSituacaoAttribute() 
	{
		return $this->attributes['CODIGO_SITUACAO'];
	}

	public function setCodigoSituacaoAttribute($codigoSituacao) 
	{
		$this->attributes['CODIGO_SITUACAO'] = $codigoSituacao;
	}

    public function getDescricaoSituacaoAttribute() 
	{
		return $this->attributes['DESCRICAO_SITUACAO'];
	}

	public function setDescricaoSituacaoAttribute($descricaoSituacao) 
	{
		$this->attributes['DESCRICAO_SITUACAO'] = $descricaoSituacao;
	}

    public function getOperacaoAttribute() 
	{
		return $this->attributes['OPERACAO'];
	}

	public function setOperacaoAttribute($operacao) 
	{
		$this->attributes['OPERACAO'] = $operacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdContaCaixaAttribute($objeto->idContaCaixa);
			$this->setNomeContaCaixaAttribute($objeto->nomeContaCaixa);
			$this->setNomePessoaAttribute($objeto->nomePessoa);
			$this->setDataLancamentoAttribute($objeto->dataLancamento);
			$this->setDataVencimentoAttribute($objeto->dataVencimento);
			$this->setValorAttribute($objeto->valor);
			$this->setCodigoSituacaoAttribute($objeto->codigoSituacao);
			$this->setDescricaoSituacaoAttribute($objeto->descricaoSituacao);
			$this->setOperacaoAttribute($objeto->operacao);

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
			'idContaCaixa' => $this->getIdContaCaixaAttribute(),
			'nomeContaCaixa' => $this->getNomeContaCaixaAttribute(),
			'nomePessoa' => $this->getNomePessoaAttribute(),
			'dataLancamento' => $this->getDataLancamentoAttribute(),
			'dataVencimento' => $this->getDataVencimentoAttribute(),
			'valor' => $this->getValorAttribute(),
			'codigoSituacao' => $this->getCodigoSituacaoAttribute(),
			'descricaoSituacao' => $this->getDescricaoSituacaoAttribute(),
			'operacao' => $this->getOperacaoAttribute(),
        ];
    }
}