<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [INVENTARIO_CONTAGEM_DET] 
                                                                                
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

class InventarioContagemDet extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'INVENTARIO_CONTAGEM_DET';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['produto', ];
	
    /**
     * Relations
     */
    public function inventarioContagemCab()
    {
    	return $this->belongsTo(InventarioContagemCab::class, 'ID_INVENTARIO_CONTAGEM_CAB', 'ID');
    }

    public function produto()
    {
    	return $this->belongsTo(Produto::class, 'ID_PRODUTO', 'ID');
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

    public function getContagem01Attribute() 
	{
		return $this->attributes['CONTAGEM01'];
	}

	public function setContagem01Attribute($contagem01) 
	{
		$this->attributes['CONTAGEM01'] = $contagem01;
	}

    public function getContagem02Attribute() 
	{
		return $this->attributes['CONTAGEM02'];
	}

	public function setContagem02Attribute($contagem02) 
	{
		$this->attributes['CONTAGEM02'] = $contagem02;
	}

    public function getContagem03Attribute() 
	{
		return $this->attributes['CONTAGEM03'];
	}

	public function setContagem03Attribute($contagem03) 
	{
		$this->attributes['CONTAGEM03'] = $contagem03;
	}

    public function getFechadoContagemAttribute() 
	{
		return $this->attributes['FECHADO_CONTAGEM'];
	}

	public function setFechadoContagemAttribute($fechadoContagem) 
	{
		$this->attributes['FECHADO_CONTAGEM'] = $fechadoContagem;
	}

    public function getQuantidadeSistemaAttribute() 
	{
		return $this->attributes['QUANTIDADE_SISTEMA'];
	}

	public function setQuantidadeSistemaAttribute($quantidadeSistema) 
	{
		$this->attributes['QUANTIDADE_SISTEMA'] = $quantidadeSistema;
	}

    public function getAcuracidadeAttribute() 
	{
		return $this->attributes['ACURACIDADE'];
	}

	public function setAcuracidadeAttribute($acuracidade) 
	{
		$this->attributes['ACURACIDADE'] = $acuracidade;
	}

    public function getDivergenciaAttribute() 
	{
		return $this->attributes['DIVERGENCIA'];
	}

	public function setDivergenciaAttribute($divergencia) 
	{
		$this->attributes['DIVERGENCIA'] = $divergencia;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setContagem01Attribute($objeto->contagem01);
			$this->setContagem02Attribute($objeto->contagem02);
			$this->setContagem03Attribute($objeto->contagem03);
			$this->setFechadoContagemAttribute($objeto->fechadoContagem);
			$this->setQuantidadeSistemaAttribute($objeto->quantidadeSistema);
			$this->setAcuracidadeAttribute($objeto->acuracidade);
			$this->setDivergenciaAttribute($objeto->divergencia);

			// vincular objetos
			$produto = new Produto();
			$produto->mapear($objeto->produto);
			$this->produto()->associate($produto);

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
			'contagem01' => $this->getContagem01Attribute(),
			'contagem02' => $this->getContagem02Attribute(),
			'contagem03' => $this->getContagem03Attribute(),
			'fechadoContagem' => $this->getFechadoContagemAttribute(),
			'quantidadeSistema' => $this->getQuantidadeSistemaAttribute(),
			'acuracidade' => $this->getAcuracidadeAttribute(),
			'divergencia' => $this->getDivergenciaAttribute(),
			'produto' => $this->produto,
        ];
    }
}