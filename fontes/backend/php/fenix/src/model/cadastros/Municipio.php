<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [MUNICIPIO] 
                                                                                
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

class Municipio extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'MUNICIPIO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['uf', ];
	
    /**
     * Relations
     */
    public function uf()
    {
    	return $this->belongsTo(Uf::class, 'ID_UF', 'ID');
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

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getCodigoIbgeAttribute() 
	{
		return $this->attributes['CODIGO_IBGE'];
	}

	public function setCodigoIbgeAttribute($codigoIbge) 
	{
		$this->attributes['CODIGO_IBGE'] = $codigoIbge;
	}

    public function getCodigoReceitaFederalAttribute() 
	{
		return $this->attributes['CODIGO_RECEITA_FEDERAL'];
	}

	public function setCodigoReceitaFederalAttribute($codigoReceitaFederal) 
	{
		$this->attributes['CODIGO_RECEITA_FEDERAL'] = $codigoReceitaFederal;
	}

    public function getCodigoEstadualAttribute() 
	{
		return $this->attributes['CODIGO_ESTADUAL'];
	}

	public function setCodigoEstadualAttribute($codigoEstadual) 
	{
		$this->attributes['CODIGO_ESTADUAL'] = $codigoEstadual;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNomeAttribute($objeto->nome);
			$this->setCodigoIbgeAttribute($objeto->codigoIbge);
			$this->setCodigoReceitaFederalAttribute($objeto->codigoReceitaFederal);
			$this->setCodigoEstadualAttribute($objeto->codigoEstadual);

			// vincular objetos
			$uf = new Uf();
			$uf->mapear($objeto->uf);
			$this->uf()->associate($uf);

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
			'nome' => $this->getNomeAttribute(),
			'codigoIbge' => $this->getCodigoIbgeAttribute(),
			'codigoReceitaFederal' => $this->getCodigoReceitaFederalAttribute(),
			'codigoEstadual' => $this->getCodigoEstadualAttribute(),
			'uf' => $this->uf,
        ];
    }
}