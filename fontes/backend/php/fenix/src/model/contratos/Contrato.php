<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CONTRATO] 
                                                                                
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

class Contrato extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CONTRATO';

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

    public function getIdSolicitacaoServicoAttribute() 
	{
		return $this->attributes['ID_SOLICITACAO_SERVICO'];
	}

	public function setIdSolicitacaoServicoAttribute($idSolicitacaoServico) 
	{
		$this->attributes['ID_SOLICITACAO_SERVICO'] = $idSolicitacaoServico;
	}

    public function getIdTipoContratoAttribute() 
	{
		return $this->attributes['ID_TIPO_CONTRATO'];
	}

	public function setIdTipoContratoAttribute($idTipoContrato) 
	{
		$this->attributes['ID_TIPO_CONTRATO'] = $idTipoContrato;
	}

    public function getNumeroAttribute() 
	{
		return $this->attributes['NUMERO'];
	}

	public function setNumeroAttribute($numero) 
	{
		$this->attributes['NUMERO'] = $numero;
	}

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}

	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}

    public function getDataInicioVigenciaAttribute() 
	{
		return $this->attributes['DATA_INICIO_VIGENCIA'];
	}

	public function setDataInicioVigenciaAttribute($dataInicioVigencia) 
	{
		$this->attributes['DATA_INICIO_VIGENCIA'] = $dataInicioVigencia;
	}

    public function getDataFimVigenciaAttribute() 
	{
		return $this->attributes['DATA_FIM_VIGENCIA'];
	}

	public function setDataFimVigenciaAttribute($dataFimVigencia) 
	{
		$this->attributes['DATA_FIM_VIGENCIA'] = $dataFimVigencia;
	}

    public function getDiaFaturamentoAttribute() 
	{
		return $this->attributes['DIA_FATURAMENTO'];
	}

	public function setDiaFaturamentoAttribute($diaFaturamento) 
	{
		$this->attributes['DIA_FATURAMENTO'] = $diaFaturamento;
	}

    public function getValorAttribute() 
	{
		return $this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}

    public function getQuantidadeParcelasAttribute() 
	{
		return $this->attributes['QUANTIDADE_PARCELAS'];
	}

	public function setQuantidadeParcelasAttribute($quantidadeParcelas) 
	{
		$this->attributes['QUANTIDADE_PARCELAS'] = $quantidadeParcelas;
	}

    public function getIntervaloEntreParcelasAttribute() 
	{
		return $this->attributes['INTERVALO_ENTRE_PARCELAS'];
	}

	public function setIntervaloEntreParcelasAttribute($intervaloEntreParcelas) 
	{
		$this->attributes['INTERVALO_ENTRE_PARCELAS'] = $intervaloEntreParcelas;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}

    public function getClassificacaoContabilContaAttribute() 
	{
		return $this->attributes['CLASSIFICACAO_CONTABIL_CONTA'];
	}

	public function setClassificacaoContabilContaAttribute($classificacaoContabilConta) 
	{
		$this->attributes['CLASSIFICACAO_CONTABIL_CONTA'] = $classificacaoContabilConta;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdSolicitacaoServicoAttribute($objeto->idSolicitacaoServico);
			$this->setIdTipoContratoAttribute($objeto->idTipoContrato);
			$this->setNumeroAttribute($objeto->numero);
			$this->setNomeAttribute($objeto->nome);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setDataCadastroAttribute($objeto->dataCadastro);
			$this->setDataInicioVigenciaAttribute($objeto->dataInicioVigencia);
			$this->setDataFimVigenciaAttribute($objeto->dataFimVigencia);
			$this->setDiaFaturamentoAttribute($objeto->diaFaturamento);
			$this->setValorAttribute($objeto->valor);
			$this->setQuantidadeParcelasAttribute($objeto->quantidadeParcelas);
			$this->setIntervaloEntreParcelasAttribute($objeto->intervaloEntreParcelas);
			$this->setObservacaoAttribute($objeto->observacao);
			$this->setClassificacaoContabilContaAttribute($objeto->classificacaoContabilConta);

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
			'idSolicitacaoServico' => $this->getIdSolicitacaoServicoAttribute(),
			'idTipoContrato' => $this->getIdTipoContratoAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'nome' => $this->getNomeAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'dataInicioVigencia' => $this->getDataInicioVigenciaAttribute(),
			'dataFimVigencia' => $this->getDataFimVigenciaAttribute(),
			'diaFaturamento' => $this->getDiaFaturamentoAttribute(),
			'valor' => $this->getValorAttribute(),
			'quantidadeParcelas' => $this->getQuantidadeParcelasAttribute(),
			'intervaloEntreParcelas' => $this->getIntervaloEntreParcelasAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'classificacaoContabilConta' => $this->getClassificacaoContabilContaAttribute(),
        ];
    }
}