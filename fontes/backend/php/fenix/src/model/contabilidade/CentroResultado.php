<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CENTRO_RESULTADO] 
                                                                                
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

class CentroResultado extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CENTRO_RESULTADO';

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

    public function getIdPlanoCentroResultadoAttribute() 
	{
		return $this->attributes['ID_PLANO_CENTRO_RESULTADO'];
	}

	public function setIdPlanoCentroResultadoAttribute($idPlanoCentroResultado) 
	{
		$this->attributes['ID_PLANO_CENTRO_RESULTADO'] = $idPlanoCentroResultado;
	}

    public function getClassificacaoAttribute() 
	{
		return $this->attributes['CLASSIFICACAO'];
	}

	public function setClassificacaoAttribute($classificacao) 
	{
		$this->attributes['CLASSIFICACAO'] = $classificacao;
	}

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}

    public function getSofreRateiroAttribute() 
	{
		return $this->attributes['SOFRE_RATEIRO'];
	}

	public function setSofreRateiroAttribute($sofreRateiro) 
	{
		$this->attributes['SOFRE_RATEIRO'] = $sofreRateiro;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdPlanoCentroResultadoAttribute($objeto->idPlanoCentroResultado);
			$this->setClassificacaoAttribute($objeto->classificacao);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setSofreRateiroAttribute($objeto->sofreRateiro);

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
			'idPlanoCentroResultado' => $this->getIdPlanoCentroResultadoAttribute(),
			'classificacao' => $this->getClassificacaoAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'sofreRateiro' => $this->getSofreRateiroAttribute(),
        ];
    }
}