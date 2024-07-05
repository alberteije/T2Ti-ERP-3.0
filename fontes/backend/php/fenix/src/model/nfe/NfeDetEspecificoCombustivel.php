<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_COMBUSTIVEL] 
                                                                                
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

class NfeDetEspecificoCombustivel extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DET_ESPECIFICO_COMBUSTIVEL';

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

    public function getCodigoAnpAttribute() 
	{
		return $this->attributes['CODIGO_ANP'];
	}

	public function setCodigoAnpAttribute($codigoAnp) 
	{
		$this->attributes['CODIGO_ANP'] = $codigoAnp;
	}

    public function getDescricaoAnpAttribute() 
	{
		return $this->attributes['DESCRICAO_ANP'];
	}

	public function setDescricaoAnpAttribute($descricaoAnp) 
	{
		$this->attributes['DESCRICAO_ANP'] = $descricaoAnp;
	}

    public function getPercentualGlpAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_GLP'];
	}

	public function setPercentualGlpAttribute($percentualGlp) 
	{
		$this->attributes['PERCENTUAL_GLP'] = $percentualGlp;
	}

    public function getPercentualGasNacionalAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_GAS_NACIONAL'];
	}

	public function setPercentualGasNacionalAttribute($percentualGasNacional) 
	{
		$this->attributes['PERCENTUAL_GAS_NACIONAL'] = $percentualGasNacional;
	}

    public function getPercentualGasImportadoAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_GAS_IMPORTADO'];
	}

	public function setPercentualGasImportadoAttribute($percentualGasImportado) 
	{
		$this->attributes['PERCENTUAL_GAS_IMPORTADO'] = $percentualGasImportado;
	}

    public function getValorPartidaAttribute() 
	{
		return (double)$this->attributes['VALOR_PARTIDA'];
	}

	public function setValorPartidaAttribute($valorPartida) 
	{
		$this->attributes['VALOR_PARTIDA'] = $valorPartida;
	}

    public function getCodifAttribute() 
	{
		return $this->attributes['CODIF'];
	}

	public function setCodifAttribute($codif) 
	{
		$this->attributes['CODIF'] = $codif;
	}

    public function getQuantidadeTempAmbienteAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_TEMP_AMBIENTE'];
	}

	public function setQuantidadeTempAmbienteAttribute($quantidadeTempAmbiente) 
	{
		$this->attributes['QUANTIDADE_TEMP_AMBIENTE'] = $quantidadeTempAmbiente;
	}

    public function getUfConsumoAttribute() 
	{
		return $this->attributes['UF_CONSUMO'];
	}

	public function setUfConsumoAttribute($ufConsumo) 
	{
		$this->attributes['UF_CONSUMO'] = $ufConsumo;
	}

    public function getCideBaseCalculoAttribute() 
	{
		return (double)$this->attributes['CIDE_BASE_CALCULO'];
	}

	public function setCideBaseCalculoAttribute($cideBaseCalculo) 
	{
		$this->attributes['CIDE_BASE_CALCULO'] = $cideBaseCalculo;
	}

    public function getCideAliquotaAttribute() 
	{
		return (double)$this->attributes['CIDE_ALIQUOTA'];
	}

	public function setCideAliquotaAttribute($cideAliquota) 
	{
		$this->attributes['CIDE_ALIQUOTA'] = $cideAliquota;
	}

    public function getCideValorAttribute() 
	{
		return (double)$this->attributes['CIDE_VALOR'];
	}

	public function setCideValorAttribute($cideValor) 
	{
		$this->attributes['CIDE_VALOR'] = $cideValor;
	}

    public function getEncerranteBicoAttribute() 
	{
		return $this->attributes['ENCERRANTE_BICO'];
	}

	public function setEncerranteBicoAttribute($encerranteBico) 
	{
		$this->attributes['ENCERRANTE_BICO'] = $encerranteBico;
	}

    public function getEncerranteBombaAttribute() 
	{
		return $this->attributes['ENCERRANTE_BOMBA'];
	}

	public function setEncerranteBombaAttribute($encerranteBomba) 
	{
		$this->attributes['ENCERRANTE_BOMBA'] = $encerranteBomba;
	}

    public function getEncerranteTanqueAttribute() 
	{
		return $this->attributes['ENCERRANTE_TANQUE'];
	}

	public function setEncerranteTanqueAttribute($encerranteTanque) 
	{
		$this->attributes['ENCERRANTE_TANQUE'] = $encerranteTanque;
	}

    public function getEncerranteValorInicioAttribute() 
	{
		return (double)$this->attributes['ENCERRANTE_VALOR_INICIO'];
	}

	public function setEncerranteValorInicioAttribute($encerranteValorInicio) 
	{
		$this->attributes['ENCERRANTE_VALOR_INICIO'] = $encerranteValorInicio;
	}

    public function getEncerranteValorFimAttribute() 
	{
		return (double)$this->attributes['ENCERRANTE_VALOR_FIM'];
	}

	public function setEncerranteValorFimAttribute($encerranteValorFim) 
	{
		$this->attributes['ENCERRANTE_VALOR_FIM'] = $encerranteValorFim;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCodigoAnpAttribute($objeto->codigoAnp);
			$this->setDescricaoAnpAttribute($objeto->descricaoAnp);
			$this->setPercentualGlpAttribute($objeto->percentualGlp);
			$this->setPercentualGasNacionalAttribute($objeto->percentualGasNacional);
			$this->setPercentualGasImportadoAttribute($objeto->percentualGasImportado);
			$this->setValorPartidaAttribute($objeto->valorPartida);
			$this->setCodifAttribute($objeto->codif);
			$this->setQuantidadeTempAmbienteAttribute($objeto->quantidadeTempAmbiente);
			$this->setUfConsumoAttribute($objeto->ufConsumo);
			$this->setCideBaseCalculoAttribute($objeto->cideBaseCalculo);
			$this->setCideAliquotaAttribute($objeto->cideAliquota);
			$this->setCideValorAttribute($objeto->cideValor);
			$this->setEncerranteBicoAttribute($objeto->encerranteBico);
			$this->setEncerranteBombaAttribute($objeto->encerranteBomba);
			$this->setEncerranteTanqueAttribute($objeto->encerranteTanque);
			$this->setEncerranteValorInicioAttribute($objeto->encerranteValorInicio);
			$this->setEncerranteValorFimAttribute($objeto->encerranteValorFim);

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
			'codigoAnp' => $this->getCodigoAnpAttribute(),
			'descricaoAnp' => $this->getDescricaoAnpAttribute(),
			'percentualGlp' => $this->getPercentualGlpAttribute(),
			'percentualGasNacional' => $this->getPercentualGasNacionalAttribute(),
			'percentualGasImportado' => $this->getPercentualGasImportadoAttribute(),
			'valorPartida' => $this->getValorPartidaAttribute(),
			'codif' => $this->getCodifAttribute(),
			'quantidadeTempAmbiente' => $this->getQuantidadeTempAmbienteAttribute(),
			'ufConsumo' => $this->getUfConsumoAttribute(),
			'cideBaseCalculo' => $this->getCideBaseCalculoAttribute(),
			'cideAliquota' => $this->getCideAliquotaAttribute(),
			'cideValor' => $this->getCideValorAttribute(),
			'encerranteBico' => $this->getEncerranteBicoAttribute(),
			'encerranteBomba' => $this->getEncerranteBombaAttribute(),
			'encerranteTanque' => $this->getEncerranteTanqueAttribute(),
			'encerranteValorInicio' => $this->getEncerranteValorInicioAttribute(),
			'encerranteValorFim' => $this->getEncerranteValorFimAttribute(),
        ];
    }
}