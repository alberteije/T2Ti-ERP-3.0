<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS] 
                                                                                
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

class NfeDetalheImpostoIcms extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DETALHE_IMPOSTO_ICMS';

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

    public function getOrigemMercadoriaAttribute() 
	{
		return $this->attributes['ORIGEM_MERCADORIA'];
	}

	public function setOrigemMercadoriaAttribute($origemMercadoria) 
	{
		$this->attributes['ORIGEM_MERCADORIA'] = $origemMercadoria;
	}

    public function getCstIcmsAttribute() 
	{
		return $this->attributes['CST_ICMS'];
	}

	public function setCstIcmsAttribute($cstIcms) 
	{
		$this->attributes['CST_ICMS'] = $cstIcms;
	}

    public function getCsosnAttribute() 
	{
		return $this->attributes['CSOSN'];
	}

	public function setCsosnAttribute($csosn) 
	{
		$this->attributes['CSOSN'] = $csosn;
	}

    public function getModalidadeBcIcmsAttribute() 
	{
		return $this->attributes['MODALIDADE_BC_ICMS'];
	}

	public function setModalidadeBcIcmsAttribute($modalidadeBcIcms) 
	{
		$this->attributes['MODALIDADE_BC_ICMS'] = $modalidadeBcIcms;
	}

    public function getPercentualReducaoBcIcmsAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_REDUCAO_BC_ICMS'];
	}

	public function setPercentualReducaoBcIcmsAttribute($percentualReducaoBcIcms) 
	{
		$this->attributes['PERCENTUAL_REDUCAO_BC_ICMS'] = $percentualReducaoBcIcms;
	}

    public function getValorBcIcmsAttribute() 
	{
		return (double)$this->attributes['VALOR_BC_ICMS'];
	}

	public function setValorBcIcmsAttribute($valorBcIcms) 
	{
		$this->attributes['VALOR_BC_ICMS'] = $valorBcIcms;
	}

    public function getAliquotaIcmsAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_ICMS'];
	}

	public function setAliquotaIcmsAttribute($aliquotaIcms) 
	{
		$this->attributes['ALIQUOTA_ICMS'] = $aliquotaIcms;
	}

    public function getValorIcmsOperacaoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_OPERACAO'];
	}

	public function setValorIcmsOperacaoAttribute($valorIcmsOperacao) 
	{
		$this->attributes['VALOR_ICMS_OPERACAO'] = $valorIcmsOperacao;
	}

    public function getPercentualDiferimentoAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_DIFERIMENTO'];
	}

	public function setPercentualDiferimentoAttribute($percentualDiferimento) 
	{
		$this->attributes['PERCENTUAL_DIFERIMENTO'] = $percentualDiferimento;
	}

    public function getValorIcmsDiferidoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_DIFERIDO'];
	}

	public function setValorIcmsDiferidoAttribute($valorIcmsDiferido) 
	{
		$this->attributes['VALOR_ICMS_DIFERIDO'] = $valorIcmsDiferido;
	}

    public function getValorIcmsAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS'];
	}

	public function setValorIcmsAttribute($valorIcms) 
	{
		$this->attributes['VALOR_ICMS'] = $valorIcms;
	}

    public function getBaseCalculoFcpAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_FCP'];
	}

	public function setBaseCalculoFcpAttribute($baseCalculoFcp) 
	{
		$this->attributes['BASE_CALCULO_FCP'] = $baseCalculoFcp;
	}

    public function getPercentualFcpAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_FCP'];
	}

	public function setPercentualFcpAttribute($percentualFcp) 
	{
		$this->attributes['PERCENTUAL_FCP'] = $percentualFcp;
	}

    public function getValorFcpAttribute() 
	{
		return (double)$this->attributes['VALOR_FCP'];
	}

	public function setValorFcpAttribute($valorFcp) 
	{
		$this->attributes['VALOR_FCP'] = $valorFcp;
	}

    public function getModalidadeBcIcmsStAttribute() 
	{
		return $this->attributes['MODALIDADE_BC_ICMS_ST'];
	}

	public function setModalidadeBcIcmsStAttribute($modalidadeBcIcmsSt) 
	{
		$this->attributes['MODALIDADE_BC_ICMS_ST'] = $modalidadeBcIcmsSt;
	}

    public function getPercentualMvaIcmsStAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_MVA_ICMS_ST'];
	}

	public function setPercentualMvaIcmsStAttribute($percentualMvaIcmsSt) 
	{
		$this->attributes['PERCENTUAL_MVA_ICMS_ST'] = $percentualMvaIcmsSt;
	}

    public function getPercentualReducaoBcIcmsStAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_REDUCAO_BC_ICMS_ST'];
	}

	public function setPercentualReducaoBcIcmsStAttribute($percentualReducaoBcIcmsSt) 
	{
		$this->attributes['PERCENTUAL_REDUCAO_BC_ICMS_ST'] = $percentualReducaoBcIcmsSt;
	}

    public function getValorBaseCalculoIcmsStAttribute() 
	{
		return (double)$this->attributes['VALOR_BASE_CALCULO_ICMS_ST'];
	}

	public function setValorBaseCalculoIcmsStAttribute($valorBaseCalculoIcmsSt) 
	{
		$this->attributes['VALOR_BASE_CALCULO_ICMS_ST'] = $valorBaseCalculoIcmsSt;
	}

    public function getAliquotaIcmsStAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_ICMS_ST'];
	}

	public function setAliquotaIcmsStAttribute($aliquotaIcmsSt) 
	{
		$this->attributes['ALIQUOTA_ICMS_ST'] = $aliquotaIcmsSt;
	}

    public function getValorIcmsStAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_ST'];
	}

	public function setValorIcmsStAttribute($valorIcmsSt) 
	{
		$this->attributes['VALOR_ICMS_ST'] = $valorIcmsSt;
	}

    public function getBaseCalculoFcpStAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_FCP_ST'];
	}

	public function setBaseCalculoFcpStAttribute($baseCalculoFcpSt) 
	{
		$this->attributes['BASE_CALCULO_FCP_ST'] = $baseCalculoFcpSt;
	}

    public function getPercentualFcpStAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_FCP_ST'];
	}

	public function setPercentualFcpStAttribute($percentualFcpSt) 
	{
		$this->attributes['PERCENTUAL_FCP_ST'] = $percentualFcpSt;
	}

    public function getValorFcpStAttribute() 
	{
		return (double)$this->attributes['VALOR_FCP_ST'];
	}

	public function setValorFcpStAttribute($valorFcpSt) 
	{
		$this->attributes['VALOR_FCP_ST'] = $valorFcpSt;
	}

    public function getUfStAttribute() 
	{
		return $this->attributes['UF_ST'];
	}

	public function setUfStAttribute($ufSt) 
	{
		$this->attributes['UF_ST'] = $ufSt;
	}

    public function getPercentualBcOperacaoPropriaAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_BC_OPERACAO_PROPRIA'];
	}

	public function setPercentualBcOperacaoPropriaAttribute($percentualBcOperacaoPropria) 
	{
		$this->attributes['PERCENTUAL_BC_OPERACAO_PROPRIA'] = $percentualBcOperacaoPropria;
	}

    public function getValorBcIcmsStRetidoAttribute() 
	{
		return (double)$this->attributes['VALOR_BC_ICMS_ST_RETIDO'];
	}

	public function setValorBcIcmsStRetidoAttribute($valorBcIcmsStRetido) 
	{
		$this->attributes['VALOR_BC_ICMS_ST_RETIDO'] = $valorBcIcmsStRetido;
	}

    public function getAliquotaSuportadaConsumidorAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_SUPORTADA_CONSUMIDOR'];
	}

	public function setAliquotaSuportadaConsumidorAttribute($aliquotaSuportadaConsumidor) 
	{
		$this->attributes['ALIQUOTA_SUPORTADA_CONSUMIDOR'] = $aliquotaSuportadaConsumidor;
	}

    public function getValorIcmsSubstitutoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_SUBSTITUTO'];
	}

	public function setValorIcmsSubstitutoAttribute($valorIcmsSubstituto) 
	{
		$this->attributes['VALOR_ICMS_SUBSTITUTO'] = $valorIcmsSubstituto;
	}

    public function getValorIcmsStRetidoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_ST_RETIDO'];
	}

	public function setValorIcmsStRetidoAttribute($valorIcmsStRetido) 
	{
		$this->attributes['VALOR_ICMS_ST_RETIDO'] = $valorIcmsStRetido;
	}

    public function getBaseCalculoFcpStRetidoAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_FCP_ST_RETIDO'];
	}

	public function setBaseCalculoFcpStRetidoAttribute($baseCalculoFcpStRetido) 
	{
		$this->attributes['BASE_CALCULO_FCP_ST_RETIDO'] = $baseCalculoFcpStRetido;
	}

    public function getPercentualFcpStRetidoAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_FCP_ST_RETIDO'];
	}

	public function setPercentualFcpStRetidoAttribute($percentualFcpStRetido) 
	{
		$this->attributes['PERCENTUAL_FCP_ST_RETIDO'] = $percentualFcpStRetido;
	}

    public function getValorFcpStRetidoAttribute() 
	{
		return (double)$this->attributes['VALOR_FCP_ST_RETIDO'];
	}

	public function setValorFcpStRetidoAttribute($valorFcpStRetido) 
	{
		$this->attributes['VALOR_FCP_ST_RETIDO'] = $valorFcpStRetido;
	}

    public function getMotivoDesoneracaoIcmsAttribute() 
	{
		return $this->attributes['MOTIVO_DESONERACAO_ICMS'];
	}

	public function setMotivoDesoneracaoIcmsAttribute($motivoDesoneracaoIcms) 
	{
		$this->attributes['MOTIVO_DESONERACAO_ICMS'] = $motivoDesoneracaoIcms;
	}

    public function getValorIcmsDesoneradoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_DESONERADO'];
	}

	public function setValorIcmsDesoneradoAttribute($valorIcmsDesonerado) 
	{
		$this->attributes['VALOR_ICMS_DESONERADO'] = $valorIcmsDesonerado;
	}

    public function getAliquotaCreditoIcmsSnAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_CREDITO_ICMS_SN'];
	}

	public function setAliquotaCreditoIcmsSnAttribute($aliquotaCreditoIcmsSn) 
	{
		$this->attributes['ALIQUOTA_CREDITO_ICMS_SN'] = $aliquotaCreditoIcmsSn;
	}

    public function getValorCreditoIcmsSnAttribute() 
	{
		return (double)$this->attributes['VALOR_CREDITO_ICMS_SN'];
	}

	public function setValorCreditoIcmsSnAttribute($valorCreditoIcmsSn) 
	{
		$this->attributes['VALOR_CREDITO_ICMS_SN'] = $valorCreditoIcmsSn;
	}

    public function getValorBcIcmsStDestinoAttribute() 
	{
		return (double)$this->attributes['VALOR_BC_ICMS_ST_DESTINO'];
	}

	public function setValorBcIcmsStDestinoAttribute($valorBcIcmsStDestino) 
	{
		$this->attributes['VALOR_BC_ICMS_ST_DESTINO'] = $valorBcIcmsStDestino;
	}

    public function getValorIcmsStDestinoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_ST_DESTINO'];
	}

	public function setValorIcmsStDestinoAttribute($valorIcmsStDestino) 
	{
		$this->attributes['VALOR_ICMS_ST_DESTINO'] = $valorIcmsStDestino;
	}

    public function getPercentualReducaoBcEfetivoAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_REDUCAO_BC_EFETIVO'];
	}

	public function setPercentualReducaoBcEfetivoAttribute($percentualReducaoBcEfetivo) 
	{
		$this->attributes['PERCENTUAL_REDUCAO_BC_EFETIVO'] = $percentualReducaoBcEfetivo;
	}

    public function getValorBcEfetivoAttribute() 
	{
		return (double)$this->attributes['VALOR_BC_EFETIVO'];
	}

	public function setValorBcEfetivoAttribute($valorBcEfetivo) 
	{
		$this->attributes['VALOR_BC_EFETIVO'] = $valorBcEfetivo;
	}

    public function getAliquotaIcmsEfetivoAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_ICMS_EFETIVO'];
	}

	public function setAliquotaIcmsEfetivoAttribute($aliquotaIcmsEfetivo) 
	{
		$this->attributes['ALIQUOTA_ICMS_EFETIVO'] = $aliquotaIcmsEfetivo;
	}

    public function getValorIcmsEfetivoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_EFETIVO'];
	}

	public function setValorIcmsEfetivoAttribute($valorIcmsEfetivo) 
	{
		$this->attributes['VALOR_ICMS_EFETIVO'] = $valorIcmsEfetivo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setOrigemMercadoriaAttribute($objeto->origemMercadoria);
			$this->setCstIcmsAttribute($objeto->cstIcms);
			$this->setCsosnAttribute($objeto->csosn);
			$this->setModalidadeBcIcmsAttribute($objeto->modalidadeBcIcms);
			$this->setPercentualReducaoBcIcmsAttribute($objeto->percentualReducaoBcIcms);
			$this->setValorBcIcmsAttribute($objeto->valorBcIcms);
			$this->setAliquotaIcmsAttribute($objeto->aliquotaIcms);
			$this->setValorIcmsOperacaoAttribute($objeto->valorIcmsOperacao);
			$this->setPercentualDiferimentoAttribute($objeto->percentualDiferimento);
			$this->setValorIcmsDiferidoAttribute($objeto->valorIcmsDiferido);
			$this->setValorIcmsAttribute($objeto->valorIcms);
			$this->setBaseCalculoFcpAttribute($objeto->baseCalculoFcp);
			$this->setPercentualFcpAttribute($objeto->percentualFcp);
			$this->setValorFcpAttribute($objeto->valorFcp);
			$this->setModalidadeBcIcmsStAttribute($objeto->modalidadeBcIcmsSt);
			$this->setPercentualMvaIcmsStAttribute($objeto->percentualMvaIcmsSt);
			$this->setPercentualReducaoBcIcmsStAttribute($objeto->percentualReducaoBcIcmsSt);
			$this->setValorBaseCalculoIcmsStAttribute($objeto->valorBaseCalculoIcmsSt);
			$this->setAliquotaIcmsStAttribute($objeto->aliquotaIcmsSt);
			$this->setValorIcmsStAttribute($objeto->valorIcmsSt);
			$this->setBaseCalculoFcpStAttribute($objeto->baseCalculoFcpSt);
			$this->setPercentualFcpStAttribute($objeto->percentualFcpSt);
			$this->setValorFcpStAttribute($objeto->valorFcpSt);
			$this->setUfStAttribute($objeto->ufSt);
			$this->setPercentualBcOperacaoPropriaAttribute($objeto->percentualBcOperacaoPropria);
			$this->setValorBcIcmsStRetidoAttribute($objeto->valorBcIcmsStRetido);
			$this->setAliquotaSuportadaConsumidorAttribute($objeto->aliquotaSuportadaConsumidor);
			$this->setValorIcmsSubstitutoAttribute($objeto->valorIcmsSubstituto);
			$this->setValorIcmsStRetidoAttribute($objeto->valorIcmsStRetido);
			$this->setBaseCalculoFcpStRetidoAttribute($objeto->baseCalculoFcpStRetido);
			$this->setPercentualFcpStRetidoAttribute($objeto->percentualFcpStRetido);
			$this->setValorFcpStRetidoAttribute($objeto->valorFcpStRetido);
			$this->setMotivoDesoneracaoIcmsAttribute($objeto->motivoDesoneracaoIcms);
			$this->setValorIcmsDesoneradoAttribute($objeto->valorIcmsDesonerado);
			$this->setAliquotaCreditoIcmsSnAttribute($objeto->aliquotaCreditoIcmsSn);
			$this->setValorCreditoIcmsSnAttribute($objeto->valorCreditoIcmsSn);
			$this->setValorBcIcmsStDestinoAttribute($objeto->valorBcIcmsStDestino);
			$this->setValorIcmsStDestinoAttribute($objeto->valorIcmsStDestino);
			$this->setPercentualReducaoBcEfetivoAttribute($objeto->percentualReducaoBcEfetivo);
			$this->setValorBcEfetivoAttribute($objeto->valorBcEfetivo);
			$this->setAliquotaIcmsEfetivoAttribute($objeto->aliquotaIcmsEfetivo);
			$this->setValorIcmsEfetivoAttribute($objeto->valorIcmsEfetivo);

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
			'origemMercadoria' => $this->getOrigemMercadoriaAttribute(),
			'cstIcms' => $this->getCstIcmsAttribute(),
			'csosn' => $this->getCsosnAttribute(),
			'modalidadeBcIcms' => $this->getModalidadeBcIcmsAttribute(),
			'percentualReducaoBcIcms' => $this->getPercentualReducaoBcIcmsAttribute(),
			'valorBcIcms' => $this->getValorBcIcmsAttribute(),
			'aliquotaIcms' => $this->getAliquotaIcmsAttribute(),
			'valorIcmsOperacao' => $this->getValorIcmsOperacaoAttribute(),
			'percentualDiferimento' => $this->getPercentualDiferimentoAttribute(),
			'valorIcmsDiferido' => $this->getValorIcmsDiferidoAttribute(),
			'valorIcms' => $this->getValorIcmsAttribute(),
			'baseCalculoFcp' => $this->getBaseCalculoFcpAttribute(),
			'percentualFcp' => $this->getPercentualFcpAttribute(),
			'valorFcp' => $this->getValorFcpAttribute(),
			'modalidadeBcIcmsSt' => $this->getModalidadeBcIcmsStAttribute(),
			'percentualMvaIcmsSt' => $this->getPercentualMvaIcmsStAttribute(),
			'percentualReducaoBcIcmsSt' => $this->getPercentualReducaoBcIcmsStAttribute(),
			'valorBaseCalculoIcmsSt' => $this->getValorBaseCalculoIcmsStAttribute(),
			'aliquotaIcmsSt' => $this->getAliquotaIcmsStAttribute(),
			'valorIcmsSt' => $this->getValorIcmsStAttribute(),
			'baseCalculoFcpSt' => $this->getBaseCalculoFcpStAttribute(),
			'percentualFcpSt' => $this->getPercentualFcpStAttribute(),
			'valorFcpSt' => $this->getValorFcpStAttribute(),
			'ufSt' => $this->getUfStAttribute(),
			'percentualBcOperacaoPropria' => $this->getPercentualBcOperacaoPropriaAttribute(),
			'valorBcIcmsStRetido' => $this->getValorBcIcmsStRetidoAttribute(),
			'aliquotaSuportadaConsumidor' => $this->getAliquotaSuportadaConsumidorAttribute(),
			'valorIcmsSubstituto' => $this->getValorIcmsSubstitutoAttribute(),
			'valorIcmsStRetido' => $this->getValorIcmsStRetidoAttribute(),
			'baseCalculoFcpStRetido' => $this->getBaseCalculoFcpStRetidoAttribute(),
			'percentualFcpStRetido' => $this->getPercentualFcpStRetidoAttribute(),
			'valorFcpStRetido' => $this->getValorFcpStRetidoAttribute(),
			'motivoDesoneracaoIcms' => $this->getMotivoDesoneracaoIcmsAttribute(),
			'valorIcmsDesonerado' => $this->getValorIcmsDesoneradoAttribute(),
			'aliquotaCreditoIcmsSn' => $this->getAliquotaCreditoIcmsSnAttribute(),
			'valorCreditoIcmsSn' => $this->getValorCreditoIcmsSnAttribute(),
			'valorBcIcmsStDestino' => $this->getValorBcIcmsStDestinoAttribute(),
			'valorIcmsStDestino' => $this->getValorIcmsStDestinoAttribute(),
			'percentualReducaoBcEfetivo' => $this->getPercentualReducaoBcEfetivoAttribute(),
			'valorBcEfetivo' => $this->getValorBcEfetivoAttribute(),
			'aliquotaIcmsEfetivo' => $this->getAliquotaIcmsEfetivoAttribute(),
			'valorIcmsEfetivo' => $this->getValorIcmsEfetivoAttribute(),
        ];
    }
}