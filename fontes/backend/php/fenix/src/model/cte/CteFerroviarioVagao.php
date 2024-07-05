<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_FERROVIARIO_VAGAO] 
                                                                                
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

class CteFerroviarioVagao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_FERROVIARIO_VAGAO';

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

    public function getIdCteFerroviarioAttribute() 
	{
		return $this->attributes['ID_CTE_FERROVIARIO'];
	}

	public function setIdCteFerroviarioAttribute($idCteFerroviario) 
	{
		$this->attributes['ID_CTE_FERROVIARIO'] = $idCteFerroviario;
	}

    public function getNumeroVagaoAttribute() 
	{
		return $this->attributes['NUMERO_VAGAO'];
	}

	public function setNumeroVagaoAttribute($numeroVagao) 
	{
		$this->attributes['NUMERO_VAGAO'] = $numeroVagao;
	}

    public function getCapacidadeAttribute() 
	{
		return $this->attributes['CAPACIDADE'];
	}

	public function setCapacidadeAttribute($capacidade) 
	{
		$this->attributes['CAPACIDADE'] = $capacidade;
	}

    public function getTipoVagaoAttribute() 
	{
		return $this->attributes['TIPO_VAGAO'];
	}

	public function setTipoVagaoAttribute($tipoVagao) 
	{
		$this->attributes['TIPO_VAGAO'] = $tipoVagao;
	}

    public function getPesoRealAttribute() 
	{
		return $this->attributes['PESO_REAL'];
	}

	public function setPesoRealAttribute($pesoReal) 
	{
		$this->attributes['PESO_REAL'] = $pesoReal;
	}

    public function getPesoBcAttribute() 
	{
		return $this->attributes['PESO_BC'];
	}

	public function setPesoBcAttribute($pesoBc) 
	{
		$this->attributes['PESO_BC'] = $pesoBc;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteFerroviarioAttribute($objeto->idCteFerroviario);
			$this->setNumeroVagaoAttribute($objeto->numeroVagao);
			$this->setCapacidadeAttribute($objeto->capacidade);
			$this->setTipoVagaoAttribute($objeto->tipoVagao);
			$this->setPesoRealAttribute($objeto->pesoReal);
			$this->setPesoBcAttribute($objeto->pesoBc);

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
			'idCteFerroviario' => $this->getIdCteFerroviarioAttribute(),
			'numeroVagao' => $this->getNumeroVagaoAttribute(),
			'capacidade' => $this->getCapacidadeAttribute(),
			'tipoVagao' => $this->getTipoVagaoAttribute(),
			'pesoReal' => $this->getPesoRealAttribute(),
			'pesoBc' => $this->getPesoBcAttribute(),
        ];
    }
}