<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_RODOVIARIO_VEICULO] 
                                                                                
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

class CteRodoviarioVeiculo extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_RODOVIARIO_VEICULO';

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

    public function getIdCteRodoviarioAttribute() 
	{
		return $this->attributes['ID_CTE_RODOVIARIO'];
	}

	public function setIdCteRodoviarioAttribute($idCteRodoviario) 
	{
		$this->attributes['ID_CTE_RODOVIARIO'] = $idCteRodoviario;
	}

    public function getCodigoInternoAttribute() 
	{
		return $this->attributes['CODIGO_INTERNO'];
	}

	public function setCodigoInternoAttribute($codigoInterno) 
	{
		$this->attributes['CODIGO_INTERNO'] = $codigoInterno;
	}

    public function getRenavamAttribute() 
	{
		return $this->attributes['RENAVAM'];
	}

	public function setRenavamAttribute($renavam) 
	{
		$this->attributes['RENAVAM'] = $renavam;
	}

    public function getPlacaAttribute() 
	{
		return $this->attributes['PLACA'];
	}

	public function setPlacaAttribute($placa) 
	{
		$this->attributes['PLACA'] = $placa;
	}

    public function getTaraAttribute() 
	{
		return $this->attributes['TARA'];
	}

	public function setTaraAttribute($tara) 
	{
		$this->attributes['TARA'] = $tara;
	}

    public function getCapacidadeKgAttribute() 
	{
		return $this->attributes['CAPACIDADE_KG'];
	}

	public function setCapacidadeKgAttribute($capacidadeKg) 
	{
		$this->attributes['CAPACIDADE_KG'] = $capacidadeKg;
	}

    public function getCapacidadeM3Attribute() 
	{
		return $this->attributes['CAPACIDADE_M3'];
	}

	public function setCapacidadeM3Attribute($capacidadeM3) 
	{
		$this->attributes['CAPACIDADE_M3'] = $capacidadeM3;
	}

    public function getTipoPropriedadeAttribute() 
	{
		return $this->attributes['TIPO_PROPRIEDADE'];
	}

	public function setTipoPropriedadeAttribute($tipoPropriedade) 
	{
		$this->attributes['TIPO_PROPRIEDADE'] = $tipoPropriedade;
	}

    public function getTipoVeiculoAttribute() 
	{
		return $this->attributes['TIPO_VEICULO'];
	}

	public function setTipoVeiculoAttribute($tipoVeiculo) 
	{
		$this->attributes['TIPO_VEICULO'] = $tipoVeiculo;
	}

    public function getTipoRodadoAttribute() 
	{
		return $this->attributes['TIPO_RODADO'];
	}

	public function setTipoRodadoAttribute($tipoRodado) 
	{
		$this->attributes['TIPO_RODADO'] = $tipoRodado;
	}

    public function getTipoCarroceriaAttribute() 
	{
		return $this->attributes['TIPO_CARROCERIA'];
	}

	public function setTipoCarroceriaAttribute($tipoCarroceria) 
	{
		$this->attributes['TIPO_CARROCERIA'] = $tipoCarroceria;
	}

    public function getUfAttribute() 
	{
		return $this->attributes['UF'];
	}

	public function setUfAttribute($uf) 
	{
		$this->attributes['UF'] = $uf;
	}

    public function getProprietarioCpfAttribute() 
	{
		return $this->attributes['PROPRIETARIO_CPF'];
	}

	public function setProprietarioCpfAttribute($proprietarioCpf) 
	{
		$this->attributes['PROPRIETARIO_CPF'] = $proprietarioCpf;
	}

    public function getProprietarioCnpjAttribute() 
	{
		return $this->attributes['PROPRIETARIO_CNPJ'];
	}

	public function setProprietarioCnpjAttribute($proprietarioCnpj) 
	{
		$this->attributes['PROPRIETARIO_CNPJ'] = $proprietarioCnpj;
	}

    public function getProprietarioRntrcAttribute() 
	{
		return $this->attributes['PROPRIETARIO_RNTRC'];
	}

	public function setProprietarioRntrcAttribute($proprietarioRntrc) 
	{
		$this->attributes['PROPRIETARIO_RNTRC'] = $proprietarioRntrc;
	}

    public function getProprietarioNomeAttribute() 
	{
		return $this->attributes['PROPRIETARIO_NOME'];
	}

	public function setProprietarioNomeAttribute($proprietarioNome) 
	{
		$this->attributes['PROPRIETARIO_NOME'] = $proprietarioNome;
	}

    public function getProprietarioIeAttribute() 
	{
		return $this->attributes['PROPRIETARIO_IE'];
	}

	public function setProprietarioIeAttribute($proprietarioIe) 
	{
		$this->attributes['PROPRIETARIO_IE'] = $proprietarioIe;
	}

    public function getProprietarioUfAttribute() 
	{
		return $this->attributes['PROPRIETARIO_UF'];
	}

	public function setProprietarioUfAttribute($proprietarioUf) 
	{
		$this->attributes['PROPRIETARIO_UF'] = $proprietarioUf;
	}

    public function getProprietarioTipoAttribute() 
	{
		return $this->attributes['PROPRIETARIO_TIPO'];
	}

	public function setProprietarioTipoAttribute($proprietarioTipo) 
	{
		$this->attributes['PROPRIETARIO_TIPO'] = $proprietarioTipo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteRodoviarioAttribute($objeto->idCteRodoviario);
			$this->setCodigoInternoAttribute($objeto->codigoInterno);
			$this->setRenavamAttribute($objeto->renavam);
			$this->setPlacaAttribute($objeto->placa);
			$this->setTaraAttribute($objeto->tara);
			$this->setCapacidadeKgAttribute($objeto->capacidadeKg);
			$this->setCapacidadeM3Attribute($objeto->capacidadeM3);
			$this->setTipoPropriedadeAttribute($objeto->tipoPropriedade);
			$this->setTipoVeiculoAttribute($objeto->tipoVeiculo);
			$this->setTipoRodadoAttribute($objeto->tipoRodado);
			$this->setTipoCarroceriaAttribute($objeto->tipoCarroceria);
			$this->setUfAttribute($objeto->uf);
			$this->setProprietarioCpfAttribute($objeto->proprietarioCpf);
			$this->setProprietarioCnpjAttribute($objeto->proprietarioCnpj);
			$this->setProprietarioRntrcAttribute($objeto->proprietarioRntrc);
			$this->setProprietarioNomeAttribute($objeto->proprietarioNome);
			$this->setProprietarioIeAttribute($objeto->proprietarioIe);
			$this->setProprietarioUfAttribute($objeto->proprietarioUf);
			$this->setProprietarioTipoAttribute($objeto->proprietarioTipo);

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
			'idCteRodoviario' => $this->getIdCteRodoviarioAttribute(),
			'codigoInterno' => $this->getCodigoInternoAttribute(),
			'renavam' => $this->getRenavamAttribute(),
			'placa' => $this->getPlacaAttribute(),
			'tara' => $this->getTaraAttribute(),
			'capacidadeKg' => $this->getCapacidadeKgAttribute(),
			'capacidadeM3' => $this->getCapacidadeM3Attribute(),
			'tipoPropriedade' => $this->getTipoPropriedadeAttribute(),
			'tipoVeiculo' => $this->getTipoVeiculoAttribute(),
			'tipoRodado' => $this->getTipoRodadoAttribute(),
			'tipoCarroceria' => $this->getTipoCarroceriaAttribute(),
			'uf' => $this->getUfAttribute(),
			'proprietarioCpf' => $this->getProprietarioCpfAttribute(),
			'proprietarioCnpj' => $this->getProprietarioCnpjAttribute(),
			'proprietarioRntrc' => $this->getProprietarioRntrcAttribute(),
			'proprietarioNome' => $this->getProprietarioNomeAttribute(),
			'proprietarioIe' => $this->getProprietarioIeAttribute(),
			'proprietarioUf' => $this->getProprietarioUfAttribute(),
			'proprietarioTipo' => $this->getProprietarioTipoAttribute(),
        ];
    }
}