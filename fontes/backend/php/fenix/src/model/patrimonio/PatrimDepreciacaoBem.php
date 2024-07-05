<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PATRIM_DEPRECIACAO_BEM] 
                                                                                
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

class PatrimDepreciacaoBem extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PATRIM_DEPRECIACAO_BEM';

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

    public function getIdPatrimBemAttribute() 
	{
		return $this->attributes['ID_PATRIM_BEM'];
	}

	public function setIdPatrimBemAttribute($idPatrimBem) 
	{
		$this->attributes['ID_PATRIM_BEM'] = $idPatrimBem;
	}

    public function getDataDepreciacaoAttribute() 
	{
		return $this->attributes['DATA_DEPRECIACAO'];
	}

	public function setDataDepreciacaoAttribute($dataDepreciacao) 
	{
		$this->attributes['DATA_DEPRECIACAO'] = $dataDepreciacao;
	}

    public function getDiasAttribute() 
	{
		return $this->attributes['DIAS'];
	}

	public function setDiasAttribute($dias) 
	{
		$this->attributes['DIAS'] = $dias;
	}

    public function getTaxaAttribute() 
	{
		return $this->attributes['TAXA'];
	}

	public function setTaxaAttribute($taxa) 
	{
		$this->attributes['TAXA'] = $taxa;
	}

    public function getIndiceAttribute() 
	{
		return $this->attributes['INDICE'];
	}

	public function setIndiceAttribute($indice) 
	{
		$this->attributes['INDICE'] = $indice;
	}

    public function getValorAttribute() 
	{
		return $this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}

    public function getDepreciacaoAcumuladaAttribute() 
	{
		return $this->attributes['DEPRECIACAO_ACUMULADA'];
	}

	public function setDepreciacaoAcumuladaAttribute($depreciacaoAcumulada) 
	{
		$this->attributes['DEPRECIACAO_ACUMULADA'] = $depreciacaoAcumulada;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdPatrimBemAttribute($objeto->idPatrimBem);
			$this->setDataDepreciacaoAttribute($objeto->dataDepreciacao);
			$this->setDiasAttribute($objeto->dias);
			$this->setTaxaAttribute($objeto->taxa);
			$this->setIndiceAttribute($objeto->indice);
			$this->setValorAttribute($objeto->valor);
			$this->setDepreciacaoAcumuladaAttribute($objeto->depreciacaoAcumulada);

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
			'idPatrimBem' => $this->getIdPatrimBemAttribute(),
			'dataDepreciacao' => $this->getDataDepreciacaoAttribute(),
			'dias' => $this->getDiasAttribute(),
			'taxa' => $this->getTaxaAttribute(),
			'indice' => $this->getIndiceAttribute(),
			'valor' => $this->getValorAttribute(),
			'depreciacaoAcumulada' => $this->getDepreciacaoAcumuladaAttribute(),
        ];
    }
}