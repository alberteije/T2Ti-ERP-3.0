<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [WMS_RECEBIMENTO_CABECALHO] 
                                                                                
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

class WmsRecebimentoCabecalho extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'WMS_RECEBIMENTO_CABECALHO';

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

    public function getIdWmsAgendamentoAttribute() 
	{
		return $this->attributes['ID_WMS_AGENDAMENTO'];
	}

	public function setIdWmsAgendamentoAttribute($idWmsAgendamento) 
	{
		$this->attributes['ID_WMS_AGENDAMENTO'] = $idWmsAgendamento;
	}

    public function getDataRecebimentoAttribute() 
	{
		return $this->attributes['DATA_RECEBIMENTO'];
	}

	public function setDataRecebimentoAttribute($dataRecebimento) 
	{
		$this->attributes['DATA_RECEBIMENTO'] = $dataRecebimento;
	}

    public function getHoraInicioAttribute() 
	{
		return $this->attributes['HORA_INICIO'];
	}

	public function setHoraInicioAttribute($horaInicio) 
	{
		$this->attributes['HORA_INICIO'] = $horaInicio;
	}

    public function getHoraFimAttribute() 
	{
		return $this->attributes['HORA_FIM'];
	}

	public function setHoraFimAttribute($horaFim) 
	{
		$this->attributes['HORA_FIM'] = $horaFim;
	}

    public function getVolumeRecebidoAttribute() 
	{
		return $this->attributes['VOLUME_RECEBIDO'];
	}

	public function setVolumeRecebidoAttribute($volumeRecebido) 
	{
		$this->attributes['VOLUME_RECEBIDO'] = $volumeRecebido;
	}

    public function getPesoRecebidoAttribute() 
	{
		return $this->attributes['PESO_RECEBIDO'];
	}

	public function setPesoRecebidoAttribute($pesoRecebido) 
	{
		$this->attributes['PESO_RECEBIDO'] = $pesoRecebido;
	}

    public function getInconsistenciaAttribute() 
	{
		return $this->attributes['INCONSISTENCIA'];
	}

	public function setInconsistenciaAttribute($inconsistencia) 
	{
		$this->attributes['INCONSISTENCIA'] = $inconsistencia;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdWmsAgendamentoAttribute($objeto->idWmsAgendamento);
			$this->setDataRecebimentoAttribute($objeto->dataRecebimento);
			$this->setHoraInicioAttribute($objeto->horaInicio);
			$this->setHoraFimAttribute($objeto->horaFim);
			$this->setVolumeRecebidoAttribute($objeto->volumeRecebido);
			$this->setPesoRecebidoAttribute($objeto->pesoRecebido);
			$this->setInconsistenciaAttribute($objeto->inconsistencia);
			$this->setObservacaoAttribute($objeto->observacao);

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
			'idWmsAgendamento' => $this->getIdWmsAgendamentoAttribute(),
			'dataRecebimento' => $this->getDataRecebimentoAttribute(),
			'horaInicio' => $this->getHoraInicioAttribute(),
			'horaFim' => $this->getHoraFimAttribute(),
			'volumeRecebido' => $this->getVolumeRecebidoAttribute(),
			'pesoRecebido' => $this->getPesoRecebidoAttribute(),
			'inconsistencia' => $this->getInconsistenciaAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
        ];
    }
}