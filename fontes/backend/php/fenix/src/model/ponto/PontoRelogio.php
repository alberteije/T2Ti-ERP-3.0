<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PONTO_RELOGIO] 
                                                                                
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

class PontoRelogio extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PONTO_RELOGIO';

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

    public function getLocalizacaoAttribute() 
	{
		return $this->attributes['LOCALIZACAO'];
	}

	public function setLocalizacaoAttribute($localizacao) 
	{
		$this->attributes['LOCALIZACAO'] = $localizacao;
	}

    public function getMarcaAttribute() 
	{
		return $this->attributes['MARCA'];
	}

	public function setMarcaAttribute($marca) 
	{
		$this->attributes['MARCA'] = $marca;
	}

    public function getFabricanteAttribute() 
	{
		return $this->attributes['FABRICANTE'];
	}

	public function setFabricanteAttribute($fabricante) 
	{
		$this->attributes['FABRICANTE'] = $fabricante;
	}

    public function getNumeroSerieAttribute() 
	{
		return $this->attributes['NUMERO_SERIE'];
	}

	public function setNumeroSerieAttribute($numeroSerie) 
	{
		$this->attributes['NUMERO_SERIE'] = $numeroSerie;
	}

    public function getUtilizacaoAttribute() 
	{
		return $this->attributes['UTILIZACAO'];
	}

	public function setUtilizacaoAttribute($utilizacao) 
	{
		$this->attributes['UTILIZACAO'] = $utilizacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setLocalizacaoAttribute($objeto->localizacao);
			$this->setMarcaAttribute($objeto->marca);
			$this->setFabricanteAttribute($objeto->fabricante);
			$this->setNumeroSerieAttribute($objeto->numeroSerie);
			$this->setUtilizacaoAttribute($objeto->utilizacao);

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
			'localizacao' => $this->getLocalizacaoAttribute(),
			'marca' => $this->getMarcaAttribute(),
			'fabricante' => $this->getFabricanteAttribute(),
			'numeroSerie' => $this->getNumeroSerieAttribute(),
			'utilizacao' => $this->getUtilizacaoAttribute(),
        ];
    }
}