<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PAIS] 
                                                                                
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

class Pais extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PAIS';

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

    public function getCodigoAttribute() 
	{
		return $this->attributes['CODIGO'];
	}

	public function setCodigoAttribute($codigo) 
	{
		$this->attributes['CODIGO'] = $codigo;
	}

    public function getNomeEnAttribute() 
	{
		return $this->attributes['NOME_EN'];
	}

	public function setNomeEnAttribute($nomeEn) 
	{
		$this->attributes['NOME_EN'] = $nomeEn;
	}

    public function getNomePtbrAttribute() 
	{
		return $this->attributes['NOME_PTBR'];
	}

	public function setNomePtbrAttribute($nomePtbr) 
	{
		$this->attributes['NOME_PTBR'] = $nomePtbr;
	}

    public function getSigla2Attribute() 
	{
		return $this->attributes['SIGLA2'];
	}

	public function setSigla2Attribute($sigla2) 
	{
		$this->attributes['SIGLA2'] = $sigla2;
	}

    public function getSigla3Attribute() 
	{
		return $this->attributes['SIGLA3'];
	}

	public function setSigla3Attribute($sigla3) 
	{
		$this->attributes['SIGLA3'] = $sigla3;
	}

    public function getCodigoBacenAttribute() 
	{
		return $this->attributes['CODIGO_BACEN'];
	}

	public function setCodigoBacenAttribute($codigoBacen) 
	{
		$this->attributes['CODIGO_BACEN'] = $codigoBacen;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCodigoAttribute($objeto->codigo);
			$this->setNomeEnAttribute($objeto->nomeEn);
			$this->setNomePtbrAttribute($objeto->nomePtbr);
			$this->setSigla2Attribute($objeto->sigla2);
			$this->setSigla3Attribute($objeto->sigla3);
			$this->setCodigoBacenAttribute($objeto->codigoBacen);

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
			'codigo' => $this->getCodigoAttribute(),
			'nomeEn' => $this->getNomeEnAttribute(),
			'nomePtbr' => $this->getNomePtbrAttribute(),
			'sigla2' => $this->getSigla2Attribute(),
			'sigla3' => $this->getSigla3Attribute(),
			'codigoBacen' => $this->getCodigoBacenAttribute(),
        ];
    }
}