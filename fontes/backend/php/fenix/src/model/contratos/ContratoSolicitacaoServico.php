<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CONTRATO_SOLICITACAO_SERVICO] 
                                                                                
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

class ContratoSolicitacaoServico extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CONTRATO_SOLICITACAO_SERVICO';

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

    public function getIdContratoTipoServicoAttribute() 
	{
		return $this->attributes['ID_CONTRATO_TIPO_SERVICO'];
	}

	public function setIdContratoTipoServicoAttribute($idContratoTipoServico) 
	{
		$this->attributes['ID_CONTRATO_TIPO_SERVICO'] = $idContratoTipoServico;
	}

    public function getIdSetorAttribute() 
	{
		return $this->attributes['ID_SETOR'];
	}

	public function setIdSetorAttribute($idSetor) 
	{
		$this->attributes['ID_SETOR'] = $idSetor;
	}

    public function getIdColaboradorAttribute() 
	{
		return $this->attributes['ID_COLABORADOR'];
	}

	public function setIdColaboradorAttribute($idColaborador) 
	{
		$this->attributes['ID_COLABORADOR'] = $idColaborador;
	}

    public function getIdClienteAttribute() 
	{
		return $this->attributes['ID_CLIENTE'];
	}

	public function setIdClienteAttribute($idCliente) 
	{
		$this->attributes['ID_CLIENTE'] = $idCliente;
	}

    public function getIdFornecedorAttribute() 
	{
		return $this->attributes['ID_FORNECEDOR'];
	}

	public function setIdFornecedorAttribute($idFornecedor) 
	{
		$this->attributes['ID_FORNECEDOR'] = $idFornecedor;
	}

    public function getDataSolicitacaoAttribute() 
	{
		return $this->attributes['DATA_SOLICITACAO'];
	}

	public function setDataSolicitacaoAttribute($dataSolicitacao) 
	{
		$this->attributes['DATA_SOLICITACAO'] = $dataSolicitacao;
	}

    public function getDataDesejadaInicioAttribute() 
	{
		return $this->attributes['DATA_DESEJADA_INICIO'];
	}

	public function setDataDesejadaInicioAttribute($dataDesejadaInicio) 
	{
		$this->attributes['DATA_DESEJADA_INICIO'] = $dataDesejadaInicio;
	}

    public function getUrgenteAttribute() 
	{
		return $this->attributes['URGENTE'];
	}

	public function setUrgenteAttribute($urgente) 
	{
		$this->attributes['URGENTE'] = $urgente;
	}

    public function getStatusSolicitacaoAttribute() 
	{
		return $this->attributes['STATUS_SOLICITACAO'];
	}

	public function setStatusSolicitacaoAttribute($statusSolicitacao) 
	{
		$this->attributes['STATUS_SOLICITACAO'] = $statusSolicitacao;
	}

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdContratoTipoServicoAttribute($objeto->idContratoTipoServico);
			$this->setIdSetorAttribute($objeto->idSetor);
			$this->setIdColaboradorAttribute($objeto->idColaborador);
			$this->setIdClienteAttribute($objeto->idCliente);
			$this->setIdFornecedorAttribute($objeto->idFornecedor);
			$this->setDataSolicitacaoAttribute($objeto->dataSolicitacao);
			$this->setDataDesejadaInicioAttribute($objeto->dataDesejadaInicio);
			$this->setUrgenteAttribute($objeto->urgente);
			$this->setStatusSolicitacaoAttribute($objeto->statusSolicitacao);
			$this->setDescricaoAttribute($objeto->descricao);

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
			'idContratoTipoServico' => $this->getIdContratoTipoServicoAttribute(),
			'idSetor' => $this->getIdSetorAttribute(),
			'idColaborador' => $this->getIdColaboradorAttribute(),
			'idCliente' => $this->getIdClienteAttribute(),
			'idFornecedor' => $this->getIdFornecedorAttribute(),
			'dataSolicitacao' => $this->getDataSolicitacaoAttribute(),
			'dataDesejadaInicio' => $this->getDataDesejadaInicioAttribute(),
			'urgente' => $this->getUrgenteAttribute(),
			'statusSolicitacao' => $this->getStatusSolicitacaoAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
        ];
    }
}