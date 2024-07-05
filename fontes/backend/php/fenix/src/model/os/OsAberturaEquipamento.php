<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [OS_ABERTURA_EQUIPAMENTO] 
                                                                                
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

class OsAberturaEquipamento extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'OS_ABERTURA_EQUIPAMENTO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['osEquipamento', ];
	
    /**
     * Relations
     */
    public function osEquipamento()
    {
    	return $this->belongsTo(OsEquipamento::class, 'ID_OS_EQUIPAMENTO', 'ID');
    }

    public function osAbertura()
    {
    	return $this->belongsTo(OsAbertura::class, 'ID_OS_ABERTURA', 'ID');
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

    public function getNumeroSerieAttribute() 
	{
		return $this->attributes['NUMERO_SERIE'];
	}

	public function setNumeroSerieAttribute($numeroSerie) 
	{
		$this->attributes['NUMERO_SERIE'] = $numeroSerie;
	}

    public function getTipoCoberturaAttribute() 
	{
		return $this->attributes['TIPO_COBERTURA'];
	}

	public function setTipoCoberturaAttribute($tipoCobertura) 
	{
		$this->attributes['TIPO_COBERTURA'] = $tipoCobertura;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNumeroSerieAttribute($objeto->numeroSerie);
			$this->setTipoCoberturaAttribute($objeto->tipoCobertura);

			// vincular objetos
			$osEquipamento = new OsEquipamento();
			$osEquipamento->mapear($objeto->osEquipamento);
			$this->osEquipamento()->associate($osEquipamento);

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
			'numeroSerie' => $this->getNumeroSerieAttribute(),
			'tipoCobertura' => $this->getTipoCoberturaAttribute(),
			'osEquipamento' => $this->osEquipamento,
        ];
    }
}