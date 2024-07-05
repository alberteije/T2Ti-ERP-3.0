<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FOLHA_HISTORICO_SALARIAL] 
                                                                                
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

class FolhaHistoricoSalarial extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FOLHA_HISTORICO_SALARIAL';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['colaborador', ];
	
    /**
     * Relations
     */
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

    public function getCompetenciaAttribute() 
	{
		return $this->attributes['COMPETENCIA'];
	}

	public function setCompetenciaAttribute($competencia) 
	{
		$this->attributes['COMPETENCIA'] = $competencia;
	}

    public function getSalarioAtualAttribute() 
	{
		return $this->attributes['SALARIO_ATUAL'];
	}

	public function setSalarioAtualAttribute($salarioAtual) 
	{
		$this->attributes['SALARIO_ATUAL'] = $salarioAtual;
	}

    public function getPercentualAumentoAttribute() 
	{
		return $this->attributes['PERCENTUAL_AUMENTO'];
	}

	public function setPercentualAumentoAttribute($percentualAumento) 
	{
		$this->attributes['PERCENTUAL_AUMENTO'] = $percentualAumento;
	}

    public function getSalarioNovoAttribute() 
	{
		return $this->attributes['SALARIO_NOVO'];
	}

	public function setSalarioNovoAttribute($salarioNovo) 
	{
		$this->attributes['SALARIO_NOVO'] = $salarioNovo;
	}

    public function getValidoAPartirAttribute() 
	{
		return $this->attributes['VALIDO_A_PARTIR'];
	}

	public function setValidoAPartirAttribute($validoAPartir) 
	{
		$this->attributes['VALIDO_A_PARTIR'] = $validoAPartir;
	}

    public function getMotivoAttribute() 
	{
		return $this->attributes['MOTIVO'];
	}

	public function setMotivoAttribute($motivo) 
	{
		$this->attributes['MOTIVO'] = $motivo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCompetenciaAttribute($objeto->competencia);
			$this->setSalarioAtualAttribute($objeto->salarioAtual);
			$this->setPercentualAumentoAttribute($objeto->percentualAumento);
			$this->setSalarioNovoAttribute($objeto->salarioNovo);
			$this->setValidoAPartirAttribute($objeto->validoAPartir);
			$this->setMotivoAttribute($objeto->motivo);

			// vincular objetos
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
			'competencia' => $this->getCompetenciaAttribute(),
			'salarioAtual' => $this->getSalarioAtualAttribute(),
			'percentualAumento' => $this->getPercentualAumentoAttribute(),
			'salarioNovo' => $this->getSalarioNovoAttribute(),
			'validoAPartir' => $this->getValidoAPartirAttribute(),
			'motivo' => $this->getMotivoAttribute(),
			'colaborador' => $this->colaborador,
        ];
    }
}