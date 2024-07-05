<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [OS_ABERTURA] 
                                                                                
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

class OsAbertura extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'OS_ABERTURA';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['osStatus', 'cliente', 'colaborador', ];
	
    /**
     * Relations
     */
    public function osStatus()
    {
    	return $this->belongsTo(OsStatus::class, 'ID_OS_STATUS', 'ID');
    }

    public function cliente()
    {
    	return $this->belongsTo(Cliente::class, 'ID_CLIENTE', 'ID');
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

    public function getNumeroAttribute() 
	{
		return $this->attributes['NUMERO'];
	}

	public function setNumeroAttribute($numero) 
	{
		$this->attributes['NUMERO'] = $numero;
	}

    public function getDataInicioAttribute() 
	{
		return $this->attributes['DATA_INICIO'];
	}

	public function setDataInicioAttribute($dataInicio) 
	{
		$this->attributes['DATA_INICIO'] = $dataInicio;
	}

    public function getHoraInicioAttribute() 
	{
		return $this->attributes['HORA_INICIO'];
	}

	public function setHoraInicioAttribute($horaInicio) 
	{
		$this->attributes['HORA_INICIO'] = $horaInicio;
	}

    public function getDataPrevisaoAttribute() 
	{
		return $this->attributes['DATA_PREVISAO'];
	}

	public function setDataPrevisaoAttribute($dataPrevisao) 
	{
		$this->attributes['DATA_PREVISAO'] = $dataPrevisao;
	}

    public function getHoraPrevisaoAttribute() 
	{
		return $this->attributes['HORA_PREVISAO'];
	}

	public function setHoraPrevisaoAttribute($horaPrevisao) 
	{
		$this->attributes['HORA_PREVISAO'] = $horaPrevisao;
	}

    public function getDataFimAttribute() 
	{
		return $this->attributes['DATA_FIM'];
	}

	public function setDataFimAttribute($dataFim) 
	{
		$this->attributes['DATA_FIM'] = $dataFim;
	}

    public function getHoraFimAttribute() 
	{
		return $this->attributes['HORA_FIM'];
	}

	public function setHoraFimAttribute($horaFim) 
	{
		$this->attributes['HORA_FIM'] = $horaFim;
	}

    public function getNomeContatoAttribute() 
	{
		return $this->attributes['NOME_CONTATO'];
	}

	public function setNomeContatoAttribute($nomeContato) 
	{
		$this->attributes['NOME_CONTATO'] = $nomeContato;
	}

    public function getFoneContatoAttribute() 
	{
		return $this->attributes['FONE_CONTATO'];
	}

	public function setFoneContatoAttribute($foneContato) 
	{
		$this->attributes['FONE_CONTATO'] = $foneContato;
	}

    public function getObservacaoClienteAttribute() 
	{
		return $this->attributes['OBSERVACAO_CLIENTE'];
	}

	public function setObservacaoClienteAttribute($observacaoCliente) 
	{
		$this->attributes['OBSERVACAO_CLIENTE'] = $observacaoCliente;
	}

    public function getObservacaoAberturaAttribute() 
	{
		return $this->attributes['OBSERVACAO_ABERTURA'];
	}

	public function setObservacaoAberturaAttribute($observacaoAbertura) 
	{
		$this->attributes['OBSERVACAO_ABERTURA'] = $observacaoAbertura;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNumeroAttribute($objeto->numero);
			$this->setDataInicioAttribute($objeto->dataInicio);
			$this->setHoraInicioAttribute($objeto->horaInicio);
			$this->setDataPrevisaoAttribute($objeto->dataPrevisao);
			$this->setHoraPrevisaoAttribute($objeto->horaPrevisao);
			$this->setDataFimAttribute($objeto->dataFim);
			$this->setHoraFimAttribute($objeto->horaFim);
			$this->setNomeContatoAttribute($objeto->nomeContato);
			$this->setFoneContatoAttribute($objeto->foneContato);
			$this->setObservacaoClienteAttribute($objeto->observacaoCliente);
			$this->setObservacaoAberturaAttribute($objeto->observacaoAbertura);

			// vincular objetos
			$osStatus = new OsStatus();
			$osStatus->mapear($objeto->osStatus);
			$this->osStatus()->associate($osStatus);

			$cliente = new Cliente();
			$cliente->mapear($objeto->cliente);
			$this->cliente()->associate($cliente);

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
			'numero' => $this->getNumeroAttribute(),
			'dataInicio' => $this->getDataInicioAttribute(),
			'horaInicio' => $this->getHoraInicioAttribute(),
			'dataPrevisao' => $this->getDataPrevisaoAttribute(),
			'horaPrevisao' => $this->getHoraPrevisaoAttribute(),
			'dataFim' => $this->getDataFimAttribute(),
			'horaFim' => $this->getHoraFimAttribute(),
			'nomeContato' => $this->getNomeContatoAttribute(),
			'foneContato' => $this->getFoneContatoAttribute(),
			'observacaoCliente' => $this->getObservacaoClienteAttribute(),
			'observacaoAbertura' => $this->getObservacaoAberturaAttribute(),
			'osStatus' => $this->osStatus,
			'cliente' => $this->cliente,
			'colaborador' => $this->colaborador,
        ];
    }
}