<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CONTABIL_LOTE] 
                                                                                
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

class ContabilLote extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CONTABIL_LOTE';

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

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}

    public function getLiberadoAttribute() 
	{
		return $this->attributes['LIBERADO'];
	}

	public function setLiberadoAttribute($liberado) 
	{
		$this->attributes['LIBERADO'] = $liberado;
	}

    public function getDataInclusaoAttribute() 
	{
		return $this->attributes['DATA_INCLUSAO'];
	}

	public function setDataInclusaoAttribute($dataInclusao) 
	{
		$this->attributes['DATA_INCLUSAO'] = $dataInclusao;
	}

    public function getDataLiberacaoAttribute() 
	{
		return $this->attributes['DATA_LIBERACAO'];
	}

	public function setDataLiberacaoAttribute($dataLiberacao) 
	{
		$this->attributes['DATA_LIBERACAO'] = $dataLiberacao;
	}

    public function getProgramadoAttribute() 
	{
		return $this->attributes['PROGRAMADO'];
	}

	public function setProgramadoAttribute($programado) 
	{
		$this->attributes['PROGRAMADO'] = $programado;
	}

    public function getValorAttribute() 
	{
		return $this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDescricaoAttribute($objeto->descricao);
			$this->setLiberadoAttribute($objeto->liberado);
			$this->setDataInclusaoAttribute($objeto->dataInclusao);
			$this->setDataLiberacaoAttribute($objeto->dataLiberacao);
			$this->setProgramadoAttribute($objeto->programado);
			$this->setValorAttribute($objeto->valor);

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
			'descricao' => $this->getDescricaoAttribute(),
			'liberado' => $this->getLiberadoAttribute(),
			'dataInclusao' => $this->getDataInclusaoAttribute(),
			'dataLiberacao' => $this->getDataLiberacaoAttribute(),
			'programado' => $this->getProgramadoAttribute(),
			'valor' => $this->getValorAttribute(),
        ];
    }
}