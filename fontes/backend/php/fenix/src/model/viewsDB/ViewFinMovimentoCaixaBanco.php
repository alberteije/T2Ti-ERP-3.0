<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_FIN_MOVIMENTO_CAIXA_BANCO] 
                                                                                
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

class ViewFinMovimentoCaixaBanco extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_FIN_MOVIMENTO_CAIXA_BANCO';

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

    public function getDataPagoRecebidoAttribute() 
	{
		return $this->attributes['DATA_PAGO_RECEBIDO'];
	}

	public function setDataPagoRecebidoAttribute($dataPagoRecebido) 
	{
		$this->attributes['DATA_PAGO_RECEBIDO'] = $dataPagoRecebido;
	}

    public function getMesAnoAttribute() 
	{
		return $this->attributes['MES_ANO'];
	}

	public function setMesAnoAttribute($mesAno) 
	{
		$this->attributes['MES_ANO'] = $mesAno;
	}

    public function getHistoricoAttribute() 
	{
		return $this->attributes['HISTORICO'];
	}

	public function setHistoricoAttribute($historico) 
	{
		$this->attributes['HISTORICO'] = $historico;
	}

    public function getValorAttribute() 
	{
		return (double)$this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}

    public function getDescricaoDocumentoOrigemAttribute() 
	{
		return $this->attributes['DESCRICAO_DOCUMENTO_ORIGEM'];
	}

	public function setDescricaoDocumentoOrigemAttribute($descricaoDocumentoOrigem) 
	{
		$this->attributes['DESCRICAO_DOCUMENTO_ORIGEM'] = $descricaoDocumentoOrigem;
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
			$this->setDataPagoRecebidoAttribute($objeto->dataPagoRecebido);
			$this->setMesAnoAttribute($objeto->mesAno);
			$this->setHistoricoAttribute($objeto->historico);
			$this->setValorAttribute($objeto->valor);
			$this->setDescricaoDocumentoOrigemAttribute($objeto->descricaoDocumentoOrigem);
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
			'dataPagoRecebido' => $this->getDataPagoRecebidoAttribute(),
			'mesAno' => $this->getMesAnoAttribute(),
			'historico' => $this->getHistoricoAttribute(),
			'valor' => $this->getValorAttribute(),
			'descricaoDocumentoOrigem' => $this->getDescricaoDocumentoOrigemAttribute(),
			'operacao' => $this->getOperacaoAttribute(),
        ];
    }
}