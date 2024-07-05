<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FISCAL_PARAMETRO] 
                                                                                
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

class FiscalParametro extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FISCAL_PARAMETRO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['fiscalEstadualPorte', 'fiscalEstadualRegime', 'fiscalMunicipalRegime', ];
	
    /**
     * Relations
     */
    public function fiscalEstadualPorte()
    {
    	return $this->belongsTo(FiscalEstadualPorte::class, 'ID_FISCAL_ESTADUAL_PORTE', 'ID');
    }

    public function fiscalEstadualRegime()
    {
    	return $this->belongsTo(FiscalEstadualRegime::class, 'ID_FISCAL_ESTADUAL_REGIME', 'ID');
    }

    public function fiscalMunicipalRegime()
    {
    	return $this->belongsTo(FiscalMunicipalRegime::class, 'ID_FISCAL_MUNICIPAL_REGIME', 'ID');
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

    public function getVigenciaAttribute() 
	{
		return $this->attributes['VIGENCIA'];
	}

	public function setVigenciaAttribute($vigencia) 
	{
		$this->attributes['VIGENCIA'] = $vigencia;
	}

    public function getDescricaoVigenciaAttribute() 
	{
		return $this->attributes['DESCRICAO_VIGENCIA'];
	}

	public function setDescricaoVigenciaAttribute($descricaoVigencia) 
	{
		$this->attributes['DESCRICAO_VIGENCIA'] = $descricaoVigencia;
	}

    public function getCriterioLancamentoAttribute() 
	{
		return $this->attributes['CRITERIO_LANCAMENTO'];
	}

	public function setCriterioLancamentoAttribute($criterioLancamento) 
	{
		$this->attributes['CRITERIO_LANCAMENTO'] = $criterioLancamento;
	}

    public function getApuracaoAttribute() 
	{
		return $this->attributes['APURACAO'];
	}

	public function setApuracaoAttribute($apuracao) 
	{
		$this->attributes['APURACAO'] = $apuracao;
	}

    public function getMicroempreeIndividualAttribute() 
	{
		return $this->attributes['MICROEMPREE_INDIVIDUAL'];
	}

	public function setMicroempreeIndividualAttribute($microempreeIndividual) 
	{
		$this->attributes['MICROEMPREE_INDIVIDUAL'] = $microempreeIndividual;
	}

    public function getCalcPisCofinsEfdAttribute() 
	{
		return $this->attributes['CALC_PIS_COFINS_EFD'];
	}

	public function setCalcPisCofinsEfdAttribute($calcPisCofinsEfd) 
	{
		$this->attributes['CALC_PIS_COFINS_EFD'] = $calcPisCofinsEfd;
	}

    public function getSimplesCodigoAcessoAttribute() 
	{
		return $this->attributes['SIMPLES_CODIGO_ACESSO'];
	}

	public function setSimplesCodigoAcessoAttribute($simplesCodigoAcesso) 
	{
		$this->attributes['SIMPLES_CODIGO_ACESSO'] = $simplesCodigoAcesso;
	}

    public function getSimplesTabelaAttribute() 
	{
		return $this->attributes['SIMPLES_TABELA'];
	}

	public function setSimplesTabelaAttribute($simplesTabela) 
	{
		$this->attributes['SIMPLES_TABELA'] = $simplesTabela;
	}

    public function getSimplesAtividadeAttribute() 
	{
		return $this->attributes['SIMPLES_ATIVIDADE'];
	}

	public function setSimplesAtividadeAttribute($simplesAtividade) 
	{
		$this->attributes['SIMPLES_ATIVIDADE'] = $simplesAtividade;
	}

    public function getPerfilSpedAttribute() 
	{
		return $this->attributes['PERFIL_SPED'];
	}

	public function setPerfilSpedAttribute($perfilSped) 
	{
		$this->attributes['PERFIL_SPED'] = $perfilSped;
	}

    public function getApuracaoConsolidadaAttribute() 
	{
		return $this->attributes['APURACAO_CONSOLIDADA'];
	}

	public function setApuracaoConsolidadaAttribute($apuracaoConsolidada) 
	{
		$this->attributes['APURACAO_CONSOLIDADA'] = $apuracaoConsolidada;
	}

    public function getSubstituicaoTributariaAttribute() 
	{
		return $this->attributes['SUBSTITUICAO_TRIBUTARIA'];
	}

	public function setSubstituicaoTributariaAttribute($substituicaoTributaria) 
	{
		$this->attributes['SUBSTITUICAO_TRIBUTARIA'] = $substituicaoTributaria;
	}

    public function getFormaCalculoIssAttribute() 
	{
		return $this->attributes['FORMA_CALCULO_ISS'];
	}

	public function setFormaCalculoIssAttribute($formaCalculoIss) 
	{
		$this->attributes['FORMA_CALCULO_ISS'] = $formaCalculoIss;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setVigenciaAttribute($objeto->vigencia);
			$this->setDescricaoVigenciaAttribute($objeto->descricaoVigencia);
			$this->setCriterioLancamentoAttribute($objeto->criterioLancamento);
			$this->setApuracaoAttribute($objeto->apuracao);
			$this->setMicroempreeIndividualAttribute($objeto->microempreeIndividual);
			$this->setCalcPisCofinsEfdAttribute($objeto->calcPisCofinsEfd);
			$this->setSimplesCodigoAcessoAttribute($objeto->simplesCodigoAcesso);
			$this->setSimplesTabelaAttribute($objeto->simplesTabela);
			$this->setSimplesAtividadeAttribute($objeto->simplesAtividade);
			$this->setPerfilSpedAttribute($objeto->perfilSped);
			$this->setApuracaoConsolidadaAttribute($objeto->apuracaoConsolidada);
			$this->setSubstituicaoTributariaAttribute($objeto->substituicaoTributaria);
			$this->setFormaCalculoIssAttribute($objeto->formaCalculoIss);

			// vincular objetos
			$fiscalEstadualPorte = new FiscalEstadualPorte();
			$fiscalEstadualPorte->mapear($objeto->fiscalEstadualPorte);
			$this->fiscalEstadualPorte()->associate($fiscalEstadualPorte);

			$fiscalEstadualRegime = new FiscalEstadualRegime();
			$fiscalEstadualRegime->mapear($objeto->fiscalEstadualRegime);
			$this->fiscalEstadualRegime()->associate($fiscalEstadualRegime);

			$fiscalMunicipalRegime = new FiscalMunicipalRegime();
			$fiscalMunicipalRegime->mapear($objeto->fiscalMunicipalRegime);
			$this->fiscalMunicipalRegime()->associate($fiscalMunicipalRegime);

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
			'vigencia' => $this->getVigenciaAttribute(),
			'descricaoVigencia' => $this->getDescricaoVigenciaAttribute(),
			'criterioLancamento' => $this->getCriterioLancamentoAttribute(),
			'apuracao' => $this->getApuracaoAttribute(),
			'microempreeIndividual' => $this->getMicroempreeIndividualAttribute(),
			'calcPisCofinsEfd' => $this->getCalcPisCofinsEfdAttribute(),
			'simplesCodigoAcesso' => $this->getSimplesCodigoAcessoAttribute(),
			'simplesTabela' => $this->getSimplesTabelaAttribute(),
			'simplesAtividade' => $this->getSimplesAtividadeAttribute(),
			'perfilSped' => $this->getPerfilSpedAttribute(),
			'apuracaoConsolidada' => $this->getApuracaoConsolidadaAttribute(),
			'substituicaoTributaria' => $this->getSubstituicaoTributariaAttribute(),
			'formaCalculoIss' => $this->getFormaCalculoIssAttribute(),
			'fiscalEstadualPorte' => $this->fiscalEstadualPorte,
			'fiscalEstadualRegime' => $this->fiscalEstadualRegime,
			'fiscalMunicipalRegime' => $this->fiscalMunicipalRegime,
        ];
    }
}