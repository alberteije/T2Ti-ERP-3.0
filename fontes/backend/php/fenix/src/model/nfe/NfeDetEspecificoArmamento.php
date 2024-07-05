<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_ARMAMENTO] 
                                                                                
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

class NfeDetEspecificoArmamento extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DET_ESPECIFICO_ARMAMENTO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeDetalhe()
    {
    	return $this->belongsTo(NfeDetalhe::class, 'ID_NFE_DETALHE', 'ID');
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

    public function getTipoArmaAttribute() 
	{
		return $this->attributes['TIPO_ARMA'];
	}

	public function setTipoArmaAttribute($tipoArma) 
	{
		$this->attributes['TIPO_ARMA'] = $tipoArma;
	}

    public function getNumeroSerieArmaAttribute() 
	{
		return $this->attributes['NUMERO_SERIE_ARMA'];
	}

	public function setNumeroSerieArmaAttribute($numeroSerieArma) 
	{
		$this->attributes['NUMERO_SERIE_ARMA'] = $numeroSerieArma;
	}

    public function getNumeroSerieCanoAttribute() 
	{
		return $this->attributes['NUMERO_SERIE_CANO'];
	}

	public function setNumeroSerieCanoAttribute($numeroSerieCano) 
	{
		$this->attributes['NUMERO_SERIE_CANO'] = $numeroSerieCano;
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

			$this->setTipoArmaAttribute($objeto->tipoArma);
			$this->setNumeroSerieArmaAttribute($objeto->numeroSerieArma);
			$this->setNumeroSerieCanoAttribute($objeto->numeroSerieCano);
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
			'tipoArma' => $this->getTipoArmaAttribute(),
			'numeroSerieArma' => $this->getNumeroSerieArmaAttribute(),
			'numeroSerieCano' => $this->getNumeroSerieCanoAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
        ];
    }
}