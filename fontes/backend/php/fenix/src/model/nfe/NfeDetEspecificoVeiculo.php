<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_VEICULO] 
                                                                                
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

class NfeDetEspecificoVeiculo extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DET_ESPECIFICO_VEICULO';

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

    public function getTipoOperacaoAttribute() 
	{
		return $this->attributes['TIPO_OPERACAO'];
	}

	public function setTipoOperacaoAttribute($tipoOperacao) 
	{
		$this->attributes['TIPO_OPERACAO'] = $tipoOperacao;
	}

    public function getChassiAttribute() 
	{
		return $this->attributes['CHASSI'];
	}

	public function setChassiAttribute($chassi) 
	{
		$this->attributes['CHASSI'] = $chassi;
	}

    public function getCorAttribute() 
	{
		return $this->attributes['COR'];
	}

	public function setCorAttribute($cor) 
	{
		$this->attributes['COR'] = $cor;
	}

    public function getDescricaoCorAttribute() 
	{
		return $this->attributes['DESCRICAO_COR'];
	}

	public function setDescricaoCorAttribute($descricaoCor) 
	{
		$this->attributes['DESCRICAO_COR'] = $descricaoCor;
	}

    public function getPotenciaMotorAttribute() 
	{
		return $this->attributes['POTENCIA_MOTOR'];
	}

	public function setPotenciaMotorAttribute($potenciaMotor) 
	{
		$this->attributes['POTENCIA_MOTOR'] = $potenciaMotor;
	}

    public function getCilindradasAttribute() 
	{
		return $this->attributes['CILINDRADAS'];
	}

	public function setCilindradasAttribute($cilindradas) 
	{
		$this->attributes['CILINDRADAS'] = $cilindradas;
	}

    public function getPesoLiquidoAttribute() 
	{
		return $this->attributes['PESO_LIQUIDO'];
	}

	public function setPesoLiquidoAttribute($pesoLiquido) 
	{
		$this->attributes['PESO_LIQUIDO'] = $pesoLiquido;
	}

    public function getPesoBrutoAttribute() 
	{
		return $this->attributes['PESO_BRUTO'];
	}

	public function setPesoBrutoAttribute($pesoBruto) 
	{
		$this->attributes['PESO_BRUTO'] = $pesoBruto;
	}

    public function getNumeroSerieAttribute() 
	{
		return $this->attributes['NUMERO_SERIE'];
	}

	public function setNumeroSerieAttribute($numeroSerie) 
	{
		$this->attributes['NUMERO_SERIE'] = $numeroSerie;
	}

    public function getTipoCombustivelAttribute() 
	{
		return $this->attributes['TIPO_COMBUSTIVEL'];
	}

	public function setTipoCombustivelAttribute($tipoCombustivel) 
	{
		$this->attributes['TIPO_COMBUSTIVEL'] = $tipoCombustivel;
	}

    public function getNumeroMotorAttribute() 
	{
		return $this->attributes['NUMERO_MOTOR'];
	}

	public function setNumeroMotorAttribute($numeroMotor) 
	{
		$this->attributes['NUMERO_MOTOR'] = $numeroMotor;
	}

    public function getCapacidadeMaximaTracaoAttribute() 
	{
		return $this->attributes['CAPACIDADE_MAXIMA_TRACAO'];
	}

	public function setCapacidadeMaximaTracaoAttribute($capacidadeMaximaTracao) 
	{
		$this->attributes['CAPACIDADE_MAXIMA_TRACAO'] = $capacidadeMaximaTracao;
	}

    public function getDistanciaEixosAttribute() 
	{
		return $this->attributes['DISTANCIA_EIXOS'];
	}

	public function setDistanciaEixosAttribute($distanciaEixos) 
	{
		$this->attributes['DISTANCIA_EIXOS'] = $distanciaEixos;
	}

    public function getAnoModeloAttribute() 
	{
		return $this->attributes['ANO_MODELO'];
	}

	public function setAnoModeloAttribute($anoModelo) 
	{
		$this->attributes['ANO_MODELO'] = $anoModelo;
	}

    public function getAnoFabricacaoAttribute() 
	{
		return $this->attributes['ANO_FABRICACAO'];
	}

	public function setAnoFabricacaoAttribute($anoFabricacao) 
	{
		$this->attributes['ANO_FABRICACAO'] = $anoFabricacao;
	}

    public function getTipoPinturaAttribute() 
	{
		return $this->attributes['TIPO_PINTURA'];
	}

	public function setTipoPinturaAttribute($tipoPintura) 
	{
		$this->attributes['TIPO_PINTURA'] = $tipoPintura;
	}

    public function getTipoVeiculoAttribute() 
	{
		return $this->attributes['TIPO_VEICULO'];
	}

	public function setTipoVeiculoAttribute($tipoVeiculo) 
	{
		$this->attributes['TIPO_VEICULO'] = $tipoVeiculo;
	}

    public function getEspecieVeiculoAttribute() 
	{
		return $this->attributes['ESPECIE_VEICULO'];
	}

	public function setEspecieVeiculoAttribute($especieVeiculo) 
	{
		$this->attributes['ESPECIE_VEICULO'] = $especieVeiculo;
	}

    public function getCondicaoVinAttribute() 
	{
		return $this->attributes['CONDICAO_VIN'];
	}

	public function setCondicaoVinAttribute($condicaoVin) 
	{
		$this->attributes['CONDICAO_VIN'] = $condicaoVin;
	}

    public function getCondicaoVeiculoAttribute() 
	{
		return $this->attributes['CONDICAO_VEICULO'];
	}

	public function setCondicaoVeiculoAttribute($condicaoVeiculo) 
	{
		$this->attributes['CONDICAO_VEICULO'] = $condicaoVeiculo;
	}

    public function getCodigoMarcaModeloAttribute() 
	{
		return $this->attributes['CODIGO_MARCA_MODELO'];
	}

	public function setCodigoMarcaModeloAttribute($codigoMarcaModelo) 
	{
		$this->attributes['CODIGO_MARCA_MODELO'] = $codigoMarcaModelo;
	}

    public function getCodigoCorDenatranAttribute() 
	{
		return $this->attributes['CODIGO_COR_DENATRAN'];
	}

	public function setCodigoCorDenatranAttribute($codigoCorDenatran) 
	{
		$this->attributes['CODIGO_COR_DENATRAN'] = $codigoCorDenatran;
	}

    public function getLotacaoMaximaAttribute() 
	{
		return $this->attributes['LOTACAO_MAXIMA'];
	}

	public function setLotacaoMaximaAttribute($lotacaoMaxima) 
	{
		$this->attributes['LOTACAO_MAXIMA'] = $lotacaoMaxima;
	}

    public function getRestricaoAttribute() 
	{
		return $this->attributes['RESTRICAO'];
	}

	public function setRestricaoAttribute($restricao) 
	{
		$this->attributes['RESTRICAO'] = $restricao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setTipoOperacaoAttribute($objeto->tipoOperacao);
			$this->setChassiAttribute($objeto->chassi);
			$this->setCorAttribute($objeto->cor);
			$this->setDescricaoCorAttribute($objeto->descricaoCor);
			$this->setPotenciaMotorAttribute($objeto->potenciaMotor);
			$this->setCilindradasAttribute($objeto->cilindradas);
			$this->setPesoLiquidoAttribute($objeto->pesoLiquido);
			$this->setPesoBrutoAttribute($objeto->pesoBruto);
			$this->setNumeroSerieAttribute($objeto->numeroSerie);
			$this->setTipoCombustivelAttribute($objeto->tipoCombustivel);
			$this->setNumeroMotorAttribute($objeto->numeroMotor);
			$this->setCapacidadeMaximaTracaoAttribute($objeto->capacidadeMaximaTracao);
			$this->setDistanciaEixosAttribute($objeto->distanciaEixos);
			$this->setAnoModeloAttribute($objeto->anoModelo);
			$this->setAnoFabricacaoAttribute($objeto->anoFabricacao);
			$this->setTipoPinturaAttribute($objeto->tipoPintura);
			$this->setTipoVeiculoAttribute($objeto->tipoVeiculo);
			$this->setEspecieVeiculoAttribute($objeto->especieVeiculo);
			$this->setCondicaoVinAttribute($objeto->condicaoVin);
			$this->setCondicaoVeiculoAttribute($objeto->condicaoVeiculo);
			$this->setCodigoMarcaModeloAttribute($objeto->codigoMarcaModelo);
			$this->setCodigoCorDenatranAttribute($objeto->codigoCorDenatran);
			$this->setLotacaoMaximaAttribute($objeto->lotacaoMaxima);
			$this->setRestricaoAttribute($objeto->restricao);

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
			'tipoOperacao' => $this->getTipoOperacaoAttribute(),
			'chassi' => $this->getChassiAttribute(),
			'cor' => $this->getCorAttribute(),
			'descricaoCor' => $this->getDescricaoCorAttribute(),
			'potenciaMotor' => $this->getPotenciaMotorAttribute(),
			'cilindradas' => $this->getCilindradasAttribute(),
			'pesoLiquido' => $this->getPesoLiquidoAttribute(),
			'pesoBruto' => $this->getPesoBrutoAttribute(),
			'numeroSerie' => $this->getNumeroSerieAttribute(),
			'tipoCombustivel' => $this->getTipoCombustivelAttribute(),
			'numeroMotor' => $this->getNumeroMotorAttribute(),
			'capacidadeMaximaTracao' => $this->getCapacidadeMaximaTracaoAttribute(),
			'distanciaEixos' => $this->getDistanciaEixosAttribute(),
			'anoModelo' => $this->getAnoModeloAttribute(),
			'anoFabricacao' => $this->getAnoFabricacaoAttribute(),
			'tipoPintura' => $this->getTipoPinturaAttribute(),
			'tipoVeiculo' => $this->getTipoVeiculoAttribute(),
			'especieVeiculo' => $this->getEspecieVeiculoAttribute(),
			'condicaoVin' => $this->getCondicaoVinAttribute(),
			'condicaoVeiculo' => $this->getCondicaoVeiculoAttribute(),
			'codigoMarcaModelo' => $this->getCodigoMarcaModeloAttribute(),
			'codigoCorDenatran' => $this->getCodigoCorDenatranAttribute(),
			'lotacaoMaxima' => $this->getLotacaoMaximaAttribute(),
			'restricao' => $this->getRestricaoAttribute(),
        ];
    }
}