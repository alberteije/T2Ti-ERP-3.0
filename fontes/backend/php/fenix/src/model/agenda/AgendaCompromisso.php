<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [AGENDA_COMPROMISSO] 
                                                                                
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

class AgendaCompromisso extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'AGENDA_COMPROMISSO';

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

    public function getIdAgendaCategoriaCompromissoAttribute() 
	{
		return $this->attributes['ID_AGENDA_CATEGORIA_COMPROMISSO'];
	}

	public function setIdAgendaCategoriaCompromissoAttribute($idAgendaCategoriaCompromisso) 
	{
		$this->attributes['ID_AGENDA_CATEGORIA_COMPROMISSO'] = $idAgendaCategoriaCompromisso;
	}

    public function getIdColaboradorAttribute() 
	{
		return $this->attributes['ID_COLABORADOR'];
	}

	public function setIdColaboradorAttribute($idColaborador) 
	{
		$this->attributes['ID_COLABORADOR'] = $idColaborador;
	}

    public function getDataCompromissoAttribute() 
	{
		return $this->attributes['DATA_COMPROMISSO'];
	}

	public function setDataCompromissoAttribute($dataCompromisso) 
	{
		$this->attributes['DATA_COMPROMISSO'] = $dataCompromisso;
	}

    public function getHoraAttribute() 
	{
		return $this->attributes['HORA'];
	}

	public function setHoraAttribute($hora) 
	{
		$this->attributes['HORA'] = $hora;
	}

    public function getDuracaoAttribute() 
	{
		return $this->attributes['DURACAO'];
	}

	public function setDuracaoAttribute($duracao) 
	{
		$this->attributes['DURACAO'] = $duracao;
	}

    public function getOndeAttribute() 
	{
		return $this->attributes['ONDE'];
	}

	public function setOndeAttribute($onde) 
	{
		$this->attributes['ONDE'] = $onde;
	}

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdAgendaCategoriaCompromissoAttribute($objeto->idAgendaCategoriaCompromisso);
			$this->setIdColaboradorAttribute($objeto->idColaborador);
			$this->setDataCompromissoAttribute($objeto->dataCompromisso);
			$this->setHoraAttribute($objeto->hora);
			$this->setDuracaoAttribute($objeto->duracao);
			$this->setOndeAttribute($objeto->onde);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setTipoAttribute($objeto->tipo);

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
			'idAgendaCategoriaCompromisso' => $this->getIdAgendaCategoriaCompromissoAttribute(),
			'idColaborador' => $this->getIdColaboradorAttribute(),
			'dataCompromisso' => $this->getDataCompromissoAttribute(),
			'hora' => $this->getHoraAttribute(),
			'duracao' => $this->getDuracaoAttribute(),
			'onde' => $this->getOndeAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'tipo' => $this->getTipoAttribute(),
        ];
    }
}