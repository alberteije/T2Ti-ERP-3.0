<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_CABECALHO] 
                                                                                
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

class CteCabecalho extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_CABECALHO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['listaCteCarga', 'cteDestinatario', 'cteLocalEntrega', 'cteRemetente', 'cteRodoviario', 'cteTomador', ];
	
    /**
     * Relations
     */
    public function listaCteCarga()
    {
    	return $this->hasMany(CteCarga::class, 'ID_CTE_CABECALHO', 'ID');
    }

    public function cteDestinatario()
    {
    	return $this->hasOne(CteDestinatario::class, 'ID_CTE_CABECALHO', 'ID');
    }

    public function cteLocalEntrega()
    {
    	return $this->hasOne(CteLocalEntrega::class, 'ID_CTE_CABECALHO', 'ID');
    }

    public function cteRemetente()
    {
    	return $this->hasOne(CteRemetente::class, 'ID_CTE_CABECALHO', 'ID');
    }

    public function cteRodoviario()
    {
    	return $this->hasOne(CteRodoviario::class, 'ID_CTE_CABECALHO', 'ID');
    }

    public function cteTomador()
    {
    	return $this->hasOne(CteTomador::class, 'ID_CTE_CABECALHO', 'ID');
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

    public function getUfEmitenteAttribute() 
	{
		return $this->attributes['UF_EMITENTE'];
	}

	public function setUfEmitenteAttribute($ufEmitente) 
	{
		$this->attributes['UF_EMITENTE'] = $ufEmitente;
	}

    public function getCodigoNumericoAttribute() 
	{
		return $this->attributes['CODIGO_NUMERICO'];
	}

	public function setCodigoNumericoAttribute($codigoNumerico) 
	{
		$this->attributes['CODIGO_NUMERICO'] = $codigoNumerico;
	}

    public function getCfopAttribute() 
	{
		return $this->attributes['CFOP'];
	}

	public function setCfopAttribute($cfop) 
	{
		$this->attributes['CFOP'] = $cfop;
	}

    public function getNaturezaOperacaoAttribute() 
	{
		return $this->attributes['NATUREZA_OPERACAO'];
	}

	public function setNaturezaOperacaoAttribute($naturezaOperacao) 
	{
		$this->attributes['NATUREZA_OPERACAO'] = $naturezaOperacao;
	}

    public function getFormaPagamentoAttribute() 
	{
		return $this->attributes['FORMA_PAGAMENTO'];
	}

	public function setFormaPagamentoAttribute($formaPagamento) 
	{
		$this->attributes['FORMA_PAGAMENTO'] = $formaPagamento;
	}

    public function getModeloAttribute() 
	{
		return $this->attributes['MODELO'];
	}

	public function setModeloAttribute($modelo) 
	{
		$this->attributes['MODELO'] = $modelo;
	}

    public function getSerieAttribute() 
	{
		return $this->attributes['SERIE'];
	}

	public function setSerieAttribute($serie) 
	{
		$this->attributes['SERIE'] = $serie;
	}

    public function getNumeroAttribute() 
	{
		return $this->attributes['NUMERO'];
	}

	public function setNumeroAttribute($numero) 
	{
		$this->attributes['NUMERO'] = $numero;
	}

    public function getDataHoraEmissaoAttribute() 
	{
		return $this->attributes['DATA_HORA_EMISSAO'];
	}

	public function setDataHoraEmissaoAttribute($dataHoraEmissao) 
	{
		$this->attributes['DATA_HORA_EMISSAO'] = $dataHoraEmissao;
	}

    public function getFormatoImpressaoDacteAttribute() 
	{
		return $this->attributes['FORMATO_IMPRESSAO_DACTE'];
	}

	public function setFormatoImpressaoDacteAttribute($formatoImpressaoDacte) 
	{
		$this->attributes['FORMATO_IMPRESSAO_DACTE'] = $formatoImpressaoDacte;
	}

    public function getTipoEmissaoAttribute() 
	{
		return $this->attributes['TIPO_EMISSAO'];
	}

	public function setTipoEmissaoAttribute($tipoEmissao) 
	{
		$this->attributes['TIPO_EMISSAO'] = $tipoEmissao;
	}

    public function getChaveAcessoAttribute() 
	{
		return $this->attributes['CHAVE_ACESSO'];
	}

	public function setChaveAcessoAttribute($chaveAcesso) 
	{
		$this->attributes['CHAVE_ACESSO'] = $chaveAcesso;
	}

    public function getDigitoChaveAcessoAttribute() 
	{
		return $this->attributes['DIGITO_CHAVE_ACESSO'];
	}

	public function setDigitoChaveAcessoAttribute($digitoChaveAcesso) 
	{
		$this->attributes['DIGITO_CHAVE_ACESSO'] = $digitoChaveAcesso;
	}

    public function getAmbienteAttribute() 
	{
		return $this->attributes['AMBIENTE'];
	}

	public function setAmbienteAttribute($ambiente) 
	{
		$this->attributes['AMBIENTE'] = $ambiente;
	}

    public function getTipoCteAttribute() 
	{
		return $this->attributes['TIPO_CTE'];
	}

	public function setTipoCteAttribute($tipoCte) 
	{
		$this->attributes['TIPO_CTE'] = $tipoCte;
	}

    public function getProcessoEmissaoAttribute() 
	{
		return $this->attributes['PROCESSO_EMISSAO'];
	}

	public function setProcessoEmissaoAttribute($processoEmissao) 
	{
		$this->attributes['PROCESSO_EMISSAO'] = $processoEmissao;
	}

    public function getVersaoProcessoEmissaoAttribute() 
	{
		return $this->attributes['VERSAO_PROCESSO_EMISSAO'];
	}

	public function setVersaoProcessoEmissaoAttribute($versaoProcessoEmissao) 
	{
		$this->attributes['VERSAO_PROCESSO_EMISSAO'] = $versaoProcessoEmissao;
	}

    public function getChaveReferenciadoAttribute() 
	{
		return $this->attributes['CHAVE_REFERENCIADO'];
	}

	public function setChaveReferenciadoAttribute($chaveReferenciado) 
	{
		$this->attributes['CHAVE_REFERENCIADO'] = $chaveReferenciado;
	}

    public function getCodigoMunicipioEnvioAttribute() 
	{
		return $this->attributes['CODIGO_MUNICIPIO_ENVIO'];
	}

	public function setCodigoMunicipioEnvioAttribute($codigoMunicipioEnvio) 
	{
		$this->attributes['CODIGO_MUNICIPIO_ENVIO'] = $codigoMunicipioEnvio;
	}

    public function getNomeMunicipioEnvioAttribute() 
	{
		return $this->attributes['NOME_MUNICIPIO_ENVIO'];
	}

	public function setNomeMunicipioEnvioAttribute($nomeMunicipioEnvio) 
	{
		$this->attributes['NOME_MUNICIPIO_ENVIO'] = $nomeMunicipioEnvio;
	}

    public function getUfEnvioAttribute() 
	{
		return $this->attributes['UF_ENVIO'];
	}

	public function setUfEnvioAttribute($ufEnvio) 
	{
		$this->attributes['UF_ENVIO'] = $ufEnvio;
	}

    public function getModalAttribute() 
	{
		return $this->attributes['MODAL'];
	}

	public function setModalAttribute($modal) 
	{
		$this->attributes['MODAL'] = $modal;
	}

    public function getTipoServicoAttribute() 
	{
		return $this->attributes['TIPO_SERVICO'];
	}

	public function setTipoServicoAttribute($tipoServico) 
	{
		$this->attributes['TIPO_SERVICO'] = $tipoServico;
	}

    public function getCodigoMunicipioIniPrestacaoAttribute() 
	{
		return $this->attributes['CODIGO_MUNICIPIO_INI_PRESTACAO'];
	}

	public function setCodigoMunicipioIniPrestacaoAttribute($codigoMunicipioIniPrestacao) 
	{
		$this->attributes['CODIGO_MUNICIPIO_INI_PRESTACAO'] = $codigoMunicipioIniPrestacao;
	}

    public function getNomeMunicipioIniPrestacaoAttribute() 
	{
		return $this->attributes['NOME_MUNICIPIO_INI_PRESTACAO'];
	}

	public function setNomeMunicipioIniPrestacaoAttribute($nomeMunicipioIniPrestacao) 
	{
		$this->attributes['NOME_MUNICIPIO_INI_PRESTACAO'] = $nomeMunicipioIniPrestacao;
	}

    public function getUfIniPrestacaoAttribute() 
	{
		return $this->attributes['UF_INI_PRESTACAO'];
	}

	public function setUfIniPrestacaoAttribute($ufIniPrestacao) 
	{
		$this->attributes['UF_INI_PRESTACAO'] = $ufIniPrestacao;
	}

    public function getCodigoMunicipioFimPrestacaoAttribute() 
	{
		return $this->attributes['CODIGO_MUNICIPIO_FIM_PRESTACAO'];
	}

	public function setCodigoMunicipioFimPrestacaoAttribute($codigoMunicipioFimPrestacao) 
	{
		$this->attributes['CODIGO_MUNICIPIO_FIM_PRESTACAO'] = $codigoMunicipioFimPrestacao;
	}

    public function getNomeMunicipioFimPrestacaoAttribute() 
	{
		return $this->attributes['NOME_MUNICIPIO_FIM_PRESTACAO'];
	}

	public function setNomeMunicipioFimPrestacaoAttribute($nomeMunicipioFimPrestacao) 
	{
		$this->attributes['NOME_MUNICIPIO_FIM_PRESTACAO'] = $nomeMunicipioFimPrestacao;
	}

    public function getUfFimPrestacaoAttribute() 
	{
		return $this->attributes['UF_FIM_PRESTACAO'];
	}

	public function setUfFimPrestacaoAttribute($ufFimPrestacao) 
	{
		$this->attributes['UF_FIM_PRESTACAO'] = $ufFimPrestacao;
	}

    public function getRetiraAttribute() 
	{
		return $this->attributes['RETIRA'];
	}

	public function setRetiraAttribute($retira) 
	{
		$this->attributes['RETIRA'] = $retira;
	}

    public function getRetiraDetalheAttribute() 
	{
		return $this->attributes['RETIRA_DETALHE'];
	}

	public function setRetiraDetalheAttribute($retiraDetalhe) 
	{
		$this->attributes['RETIRA_DETALHE'] = $retiraDetalhe;
	}

    public function getTomadorAttribute() 
	{
		return $this->attributes['TOMADOR'];
	}

	public function setTomadorAttribute($tomador) 
	{
		$this->attributes['TOMADOR'] = $tomador;
	}

    public function getDataEntradaContingenciaAttribute() 
	{
		return $this->attributes['DATA_ENTRADA_CONTINGENCIA'];
	}

	public function setDataEntradaContingenciaAttribute($dataEntradaContingencia) 
	{
		$this->attributes['DATA_ENTRADA_CONTINGENCIA'] = $dataEntradaContingencia;
	}

    public function getJustificativaContingenciaAttribute() 
	{
		return $this->attributes['JUSTIFICATIVA_CONTINGENCIA'];
	}

	public function setJustificativaContingenciaAttribute($justificativaContingencia) 
	{
		$this->attributes['JUSTIFICATIVA_CONTINGENCIA'] = $justificativaContingencia;
	}

    public function getCaracAdicionalTransporteAttribute() 
	{
		return $this->attributes['CARAC_ADICIONAL_TRANSPORTE'];
	}

	public function setCaracAdicionalTransporteAttribute($caracAdicionalTransporte) 
	{
		$this->attributes['CARAC_ADICIONAL_TRANSPORTE'] = $caracAdicionalTransporte;
	}

    public function getCaracAdicionalServicoAttribute() 
	{
		return $this->attributes['CARAC_ADICIONAL_SERVICO'];
	}

	public function setCaracAdicionalServicoAttribute($caracAdicionalServico) 
	{
		$this->attributes['CARAC_ADICIONAL_SERVICO'] = $caracAdicionalServico;
	}

    public function getFuncionarioEmissorAttribute() 
	{
		return $this->attributes['FUNCIONARIO_EMISSOR'];
	}

	public function setFuncionarioEmissorAttribute($funcionarioEmissor) 
	{
		$this->attributes['FUNCIONARIO_EMISSOR'] = $funcionarioEmissor;
	}

    public function getFluxoOrigemAttribute() 
	{
		return $this->attributes['FLUXO_ORIGEM'];
	}

	public function setFluxoOrigemAttribute($fluxoOrigem) 
	{
		$this->attributes['FLUXO_ORIGEM'] = $fluxoOrigem;
	}

    public function getEntregaTipoPeriodoAttribute() 
	{
		return $this->attributes['ENTREGA_TIPO_PERIODO'];
	}

	public function setEntregaTipoPeriodoAttribute($entregaTipoPeriodo) 
	{
		$this->attributes['ENTREGA_TIPO_PERIODO'] = $entregaTipoPeriodo;
	}

    public function getEntregaDataProgramadaAttribute() 
	{
		return $this->attributes['ENTREGA_DATA_PROGRAMADA'];
	}

	public function setEntregaDataProgramadaAttribute($entregaDataProgramada) 
	{
		$this->attributes['ENTREGA_DATA_PROGRAMADA'] = $entregaDataProgramada;
	}

    public function getEntregaDataInicialAttribute() 
	{
		return $this->attributes['ENTREGA_DATA_INICIAL'];
	}

	public function setEntregaDataInicialAttribute($entregaDataInicial) 
	{
		$this->attributes['ENTREGA_DATA_INICIAL'] = $entregaDataInicial;
	}

    public function getEntregaDataFinalAttribute() 
	{
		return $this->attributes['ENTREGA_DATA_FINAL'];
	}

	public function setEntregaDataFinalAttribute($entregaDataFinal) 
	{
		$this->attributes['ENTREGA_DATA_FINAL'] = $entregaDataFinal;
	}

    public function getEntregaTipoHoraAttribute() 
	{
		return $this->attributes['ENTREGA_TIPO_HORA'];
	}

	public function setEntregaTipoHoraAttribute($entregaTipoHora) 
	{
		$this->attributes['ENTREGA_TIPO_HORA'] = $entregaTipoHora;
	}

    public function getEntregaHoraProgramadaAttribute() 
	{
		return $this->attributes['ENTREGA_HORA_PROGRAMADA'];
	}

	public function setEntregaHoraProgramadaAttribute($entregaHoraProgramada) 
	{
		$this->attributes['ENTREGA_HORA_PROGRAMADA'] = $entregaHoraProgramada;
	}

    public function getEntregaHoraInicialAttribute() 
	{
		return $this->attributes['ENTREGA_HORA_INICIAL'];
	}

	public function setEntregaHoraInicialAttribute($entregaHoraInicial) 
	{
		$this->attributes['ENTREGA_HORA_INICIAL'] = $entregaHoraInicial;
	}

    public function getEntregaHoraFinalAttribute() 
	{
		return $this->attributes['ENTREGA_HORA_FINAL'];
	}

	public function setEntregaHoraFinalAttribute($entregaHoraFinal) 
	{
		$this->attributes['ENTREGA_HORA_FINAL'] = $entregaHoraFinal;
	}

    public function getMunicipioOrigemCalculoAttribute() 
	{
		return $this->attributes['MUNICIPIO_ORIGEM_CALCULO'];
	}

	public function setMunicipioOrigemCalculoAttribute($municipioOrigemCalculo) 
	{
		$this->attributes['MUNICIPIO_ORIGEM_CALCULO'] = $municipioOrigemCalculo;
	}

    public function getMunicipioDestinoCalculoAttribute() 
	{
		return $this->attributes['MUNICIPIO_DESTINO_CALCULO'];
	}

	public function setMunicipioDestinoCalculoAttribute($municipioDestinoCalculo) 
	{
		$this->attributes['MUNICIPIO_DESTINO_CALCULO'] = $municipioDestinoCalculo;
	}

    public function getObservacoesGeraisAttribute() 
	{
		return $this->attributes['OBSERVACOES_GERAIS'];
	}

	public function setObservacoesGeraisAttribute($observacoesGerais) 
	{
		$this->attributes['OBSERVACOES_GERAIS'] = $observacoesGerais;
	}

    public function getValorTotalServicoAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_SERVICO'];
	}

	public function setValorTotalServicoAttribute($valorTotalServico) 
	{
		$this->attributes['VALOR_TOTAL_SERVICO'] = $valorTotalServico;
	}

    public function getValorReceberAttribute() 
	{
		return $this->attributes['VALOR_RECEBER'];
	}

	public function setValorReceberAttribute($valorReceber) 
	{
		$this->attributes['VALOR_RECEBER'] = $valorReceber;
	}

    public function getCstAttribute() 
	{
		return $this->attributes['CST'];
	}

	public function setCstAttribute($cst) 
	{
		$this->attributes['CST'] = $cst;
	}

    public function getBaseCalculoIcmsAttribute() 
	{
		return $this->attributes['BASE_CALCULO_ICMS'];
	}

	public function setBaseCalculoIcmsAttribute($baseCalculoIcms) 
	{
		$this->attributes['BASE_CALCULO_ICMS'] = $baseCalculoIcms;
	}

    public function getAliquotaIcmsAttribute() 
	{
		return $this->attributes['ALIQUOTA_ICMS'];
	}

	public function setAliquotaIcmsAttribute($aliquotaIcms) 
	{
		$this->attributes['ALIQUOTA_ICMS'] = $aliquotaIcms;
	}

    public function getValorIcmsAttribute() 
	{
		return $this->attributes['VALOR_ICMS'];
	}

	public function setValorIcmsAttribute($valorIcms) 
	{
		$this->attributes['VALOR_ICMS'] = $valorIcms;
	}

    public function getPercentualReducaoBcIcmsAttribute() 
	{
		return $this->attributes['PERCENTUAL_REDUCAO_BC_ICMS'];
	}

	public function setPercentualReducaoBcIcmsAttribute($percentualReducaoBcIcms) 
	{
		$this->attributes['PERCENTUAL_REDUCAO_BC_ICMS'] = $percentualReducaoBcIcms;
	}

    public function getValorBcIcmsStRetidoAttribute() 
	{
		return $this->attributes['VALOR_BC_ICMS_ST_RETIDO'];
	}

	public function setValorBcIcmsStRetidoAttribute($valorBcIcmsStRetido) 
	{
		$this->attributes['VALOR_BC_ICMS_ST_RETIDO'] = $valorBcIcmsStRetido;
	}

    public function getValorIcmsStRetidoAttribute() 
	{
		return $this->attributes['VALOR_ICMS_ST_RETIDO'];
	}

	public function setValorIcmsStRetidoAttribute($valorIcmsStRetido) 
	{
		$this->attributes['VALOR_ICMS_ST_RETIDO'] = $valorIcmsStRetido;
	}

    public function getAliquotaIcmsStRetidoAttribute() 
	{
		return $this->attributes['ALIQUOTA_ICMS_ST_RETIDO'];
	}

	public function setAliquotaIcmsStRetidoAttribute($aliquotaIcmsStRetido) 
	{
		$this->attributes['ALIQUOTA_ICMS_ST_RETIDO'] = $aliquotaIcmsStRetido;
	}

    public function getValorCreditoPresumidoIcmsAttribute() 
	{
		return $this->attributes['VALOR_CREDITO_PRESUMIDO_ICMS'];
	}

	public function setValorCreditoPresumidoIcmsAttribute($valorCreditoPresumidoIcms) 
	{
		$this->attributes['VALOR_CREDITO_PRESUMIDO_ICMS'] = $valorCreditoPresumidoIcms;
	}

    public function getPercentualBcIcmsOutraUfAttribute() 
	{
		return $this->attributes['PERCENTUAL_BC_ICMS_OUTRA_UF'];
	}

	public function setPercentualBcIcmsOutraUfAttribute($percentualBcIcmsOutraUf) 
	{
		$this->attributes['PERCENTUAL_BC_ICMS_OUTRA_UF'] = $percentualBcIcmsOutraUf;
	}

    public function getValorBcIcmsOutraUfAttribute() 
	{
		return $this->attributes['VALOR_BC_ICMS_OUTRA_UF'];
	}

	public function setValorBcIcmsOutraUfAttribute($valorBcIcmsOutraUf) 
	{
		$this->attributes['VALOR_BC_ICMS_OUTRA_UF'] = $valorBcIcmsOutraUf;
	}

    public function getAliquotaIcmsOutraUfAttribute() 
	{
		return $this->attributes['ALIQUOTA_ICMS_OUTRA_UF'];
	}

	public function setAliquotaIcmsOutraUfAttribute($aliquotaIcmsOutraUf) 
	{
		$this->attributes['ALIQUOTA_ICMS_OUTRA_UF'] = $aliquotaIcmsOutraUf;
	}

    public function getValorIcmsOutraUfAttribute() 
	{
		return $this->attributes['VALOR_ICMS_OUTRA_UF'];
	}

	public function setValorIcmsOutraUfAttribute($valorIcmsOutraUf) 
	{
		$this->attributes['VALOR_ICMS_OUTRA_UF'] = $valorIcmsOutraUf;
	}

    public function getSimplesNacionalIndicadorAttribute() 
	{
		return $this->attributes['SIMPLES_NACIONAL_INDICADOR'];
	}

	public function setSimplesNacionalIndicadorAttribute($simplesNacionalIndicador) 
	{
		$this->attributes['SIMPLES_NACIONAL_INDICADOR'] = $simplesNacionalIndicador;
	}

    public function getSimplesNacionalTotalAttribute() 
	{
		return $this->attributes['SIMPLES_NACIONAL_TOTAL'];
	}

	public function setSimplesNacionalTotalAttribute($simplesNacionalTotal) 
	{
		$this->attributes['SIMPLES_NACIONAL_TOTAL'] = $simplesNacionalTotal;
	}

    public function getInformacoesAddFiscoAttribute() 
	{
		return $this->attributes['INFORMACOES_ADD_FISCO'];
	}

	public function setInformacoesAddFiscoAttribute($informacoesAddFisco) 
	{
		$this->attributes['INFORMACOES_ADD_FISCO'] = $informacoesAddFisco;
	}

    public function getValorTotalCargaAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_CARGA'];
	}

	public function setValorTotalCargaAttribute($valorTotalCarga) 
	{
		$this->attributes['VALOR_TOTAL_CARGA'] = $valorTotalCarga;
	}

    public function getProdutoPredominanteAttribute() 
	{
		return $this->attributes['PRODUTO_PREDOMINANTE'];
	}

	public function setProdutoPredominanteAttribute($produtoPredominante) 
	{
		$this->attributes['PRODUTO_PREDOMINANTE'] = $produtoPredominante;
	}

    public function getCargaOutrasCaracteristicasAttribute() 
	{
		return $this->attributes['CARGA_OUTRAS_CARACTERISTICAS'];
	}

	public function setCargaOutrasCaracteristicasAttribute($cargaOutrasCaracteristicas) 
	{
		$this->attributes['CARGA_OUTRAS_CARACTERISTICAS'] = $cargaOutrasCaracteristicas;
	}

    public function getModalVersaoLayoutAttribute() 
	{
		return $this->attributes['MODAL_VERSAO_LAYOUT'];
	}

	public function setModalVersaoLayoutAttribute($modalVersaoLayout) 
	{
		$this->attributes['MODAL_VERSAO_LAYOUT'] = $modalVersaoLayout;
	}

    public function getChaveCteSubstituidoAttribute() 
	{
		return $this->attributes['CHAVE_CTE_SUBSTITUIDO'];
	}

	public function setChaveCteSubstituidoAttribute($chaveCteSubstituido) 
	{
		$this->attributes['CHAVE_CTE_SUBSTITUIDO'] = $chaveCteSubstituido;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setUfEmitenteAttribute($objeto->ufEmitente);
			$this->setCodigoNumericoAttribute($objeto->codigoNumerico);
			$this->setCfopAttribute($objeto->cfop);
			$this->setNaturezaOperacaoAttribute($objeto->naturezaOperacao);
			$this->setFormaPagamentoAttribute($objeto->formaPagamento);
			$this->setModeloAttribute($objeto->modelo);
			$this->setSerieAttribute($objeto->serie);
			$this->setNumeroAttribute($objeto->numero);
			$this->setDataHoraEmissaoAttribute($objeto->dataHoraEmissao);
			$this->setFormatoImpressaoDacteAttribute($objeto->formatoImpressaoDacte);
			$this->setTipoEmissaoAttribute($objeto->tipoEmissao);
			$this->setChaveAcessoAttribute($objeto->chaveAcesso);
			$this->setDigitoChaveAcessoAttribute($objeto->digitoChaveAcesso);
			$this->setAmbienteAttribute($objeto->ambiente);
			$this->setTipoCteAttribute($objeto->tipoCte);
			$this->setProcessoEmissaoAttribute($objeto->processoEmissao);
			$this->setVersaoProcessoEmissaoAttribute($objeto->versaoProcessoEmissao);
			$this->setChaveReferenciadoAttribute($objeto->chaveReferenciado);
			$this->setCodigoMunicipioEnvioAttribute($objeto->codigoMunicipioEnvio);
			$this->setNomeMunicipioEnvioAttribute($objeto->nomeMunicipioEnvio);
			$this->setUfEnvioAttribute($objeto->ufEnvio);
			$this->setModalAttribute($objeto->modal);
			$this->setTipoServicoAttribute($objeto->tipoServico);
			$this->setCodigoMunicipioIniPrestacaoAttribute($objeto->codigoMunicipioIniPrestacao);
			$this->setNomeMunicipioIniPrestacaoAttribute($objeto->nomeMunicipioIniPrestacao);
			$this->setUfIniPrestacaoAttribute($objeto->ufIniPrestacao);
			$this->setCodigoMunicipioFimPrestacaoAttribute($objeto->codigoMunicipioFimPrestacao);
			$this->setNomeMunicipioFimPrestacaoAttribute($objeto->nomeMunicipioFimPrestacao);
			$this->setUfFimPrestacaoAttribute($objeto->ufFimPrestacao);
			$this->setRetiraAttribute($objeto->retira);
			$this->setRetiraDetalheAttribute($objeto->retiraDetalhe);
			$this->setTomadorAttribute($objeto->tomador);
			$this->setDataEntradaContingenciaAttribute($objeto->dataEntradaContingencia);
			$this->setJustificativaContingenciaAttribute($objeto->justificativaContingencia);
			$this->setCaracAdicionalTransporteAttribute($objeto->caracAdicionalTransporte);
			$this->setCaracAdicionalServicoAttribute($objeto->caracAdicionalServico);
			$this->setFuncionarioEmissorAttribute($objeto->funcionarioEmissor);
			$this->setFluxoOrigemAttribute($objeto->fluxoOrigem);
			$this->setEntregaTipoPeriodoAttribute($objeto->entregaTipoPeriodo);
			$this->setEntregaDataProgramadaAttribute($objeto->entregaDataProgramada);
			$this->setEntregaDataInicialAttribute($objeto->entregaDataInicial);
			$this->setEntregaDataFinalAttribute($objeto->entregaDataFinal);
			$this->setEntregaTipoHoraAttribute($objeto->entregaTipoHora);
			$this->setEntregaHoraProgramadaAttribute($objeto->entregaHoraProgramada);
			$this->setEntregaHoraInicialAttribute($objeto->entregaHoraInicial);
			$this->setEntregaHoraFinalAttribute($objeto->entregaHoraFinal);
			$this->setMunicipioOrigemCalculoAttribute($objeto->municipioOrigemCalculo);
			$this->setMunicipioDestinoCalculoAttribute($objeto->municipioDestinoCalculo);
			$this->setObservacoesGeraisAttribute($objeto->observacoesGerais);
			$this->setValorTotalServicoAttribute($objeto->valorTotalServico);
			$this->setValorReceberAttribute($objeto->valorReceber);
			$this->setCstAttribute($objeto->cst);
			$this->setBaseCalculoIcmsAttribute($objeto->baseCalculoIcms);
			$this->setAliquotaIcmsAttribute($objeto->aliquotaIcms);
			$this->setValorIcmsAttribute($objeto->valorIcms);
			$this->setPercentualReducaoBcIcmsAttribute($objeto->percentualReducaoBcIcms);
			$this->setValorBcIcmsStRetidoAttribute($objeto->valorBcIcmsStRetido);
			$this->setValorIcmsStRetidoAttribute($objeto->valorIcmsStRetido);
			$this->setAliquotaIcmsStRetidoAttribute($objeto->aliquotaIcmsStRetido);
			$this->setValorCreditoPresumidoIcmsAttribute($objeto->valorCreditoPresumidoIcms);
			$this->setPercentualBcIcmsOutraUfAttribute($objeto->percentualBcIcmsOutraUf);
			$this->setValorBcIcmsOutraUfAttribute($objeto->valorBcIcmsOutraUf);
			$this->setAliquotaIcmsOutraUfAttribute($objeto->aliquotaIcmsOutraUf);
			$this->setValorIcmsOutraUfAttribute($objeto->valorIcmsOutraUf);
			$this->setSimplesNacionalIndicadorAttribute($objeto->simplesNacionalIndicador);
			$this->setSimplesNacionalTotalAttribute($objeto->simplesNacionalTotal);
			$this->setInformacoesAddFiscoAttribute($objeto->informacoesAddFisco);
			$this->setValorTotalCargaAttribute($objeto->valorTotalCarga);
			$this->setProdutoPredominanteAttribute($objeto->produtoPredominante);
			$this->setCargaOutrasCaracteristicasAttribute($objeto->cargaOutrasCaracteristicas);
			$this->setModalVersaoLayoutAttribute($objeto->modalVersaoLayout);
			$this->setChaveCteSubstituidoAttribute($objeto->chaveCteSubstituido);

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
			'ufEmitente' => $this->getUfEmitenteAttribute(),
			'codigoNumerico' => $this->getCodigoNumericoAttribute(),
			'cfop' => $this->getCfopAttribute(),
			'naturezaOperacao' => $this->getNaturezaOperacaoAttribute(),
			'formaPagamento' => $this->getFormaPagamentoAttribute(),
			'modelo' => $this->getModeloAttribute(),
			'serie' => $this->getSerieAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'dataHoraEmissao' => $this->getDataHoraEmissaoAttribute(),
			'formatoImpressaoDacte' => $this->getFormatoImpressaoDacteAttribute(),
			'tipoEmissao' => $this->getTipoEmissaoAttribute(),
			'chaveAcesso' => $this->getChaveAcessoAttribute(),
			'digitoChaveAcesso' => $this->getDigitoChaveAcessoAttribute(),
			'ambiente' => $this->getAmbienteAttribute(),
			'tipoCte' => $this->getTipoCteAttribute(),
			'processoEmissao' => $this->getProcessoEmissaoAttribute(),
			'versaoProcessoEmissao' => $this->getVersaoProcessoEmissaoAttribute(),
			'chaveReferenciado' => $this->getChaveReferenciadoAttribute(),
			'codigoMunicipioEnvio' => $this->getCodigoMunicipioEnvioAttribute(),
			'nomeMunicipioEnvio' => $this->getNomeMunicipioEnvioAttribute(),
			'ufEnvio' => $this->getUfEnvioAttribute(),
			'modal' => $this->getModalAttribute(),
			'tipoServico' => $this->getTipoServicoAttribute(),
			'codigoMunicipioIniPrestacao' => $this->getCodigoMunicipioIniPrestacaoAttribute(),
			'nomeMunicipioIniPrestacao' => $this->getNomeMunicipioIniPrestacaoAttribute(),
			'ufIniPrestacao' => $this->getUfIniPrestacaoAttribute(),
			'codigoMunicipioFimPrestacao' => $this->getCodigoMunicipioFimPrestacaoAttribute(),
			'nomeMunicipioFimPrestacao' => $this->getNomeMunicipioFimPrestacaoAttribute(),
			'ufFimPrestacao' => $this->getUfFimPrestacaoAttribute(),
			'retira' => $this->getRetiraAttribute(),
			'retiraDetalhe' => $this->getRetiraDetalheAttribute(),
			'tomador' => $this->getTomadorAttribute(),
			'dataEntradaContingencia' => $this->getDataEntradaContingenciaAttribute(),
			'justificativaContingencia' => $this->getJustificativaContingenciaAttribute(),
			'caracAdicionalTransporte' => $this->getCaracAdicionalTransporteAttribute(),
			'caracAdicionalServico' => $this->getCaracAdicionalServicoAttribute(),
			'funcionarioEmissor' => $this->getFuncionarioEmissorAttribute(),
			'fluxoOrigem' => $this->getFluxoOrigemAttribute(),
			'entregaTipoPeriodo' => $this->getEntregaTipoPeriodoAttribute(),
			'entregaDataProgramada' => $this->getEntregaDataProgramadaAttribute(),
			'entregaDataInicial' => $this->getEntregaDataInicialAttribute(),
			'entregaDataFinal' => $this->getEntregaDataFinalAttribute(),
			'entregaTipoHora' => $this->getEntregaTipoHoraAttribute(),
			'entregaHoraProgramada' => $this->getEntregaHoraProgramadaAttribute(),
			'entregaHoraInicial' => $this->getEntregaHoraInicialAttribute(),
			'entregaHoraFinal' => $this->getEntregaHoraFinalAttribute(),
			'municipioOrigemCalculo' => $this->getMunicipioOrigemCalculoAttribute(),
			'municipioDestinoCalculo' => $this->getMunicipioDestinoCalculoAttribute(),
			'observacoesGerais' => $this->getObservacoesGeraisAttribute(),
			'valorTotalServico' => $this->getValorTotalServicoAttribute(),
			'valorReceber' => $this->getValorReceberAttribute(),
			'cst' => $this->getCstAttribute(),
			'baseCalculoIcms' => $this->getBaseCalculoIcmsAttribute(),
			'aliquotaIcms' => $this->getAliquotaIcmsAttribute(),
			'valorIcms' => $this->getValorIcmsAttribute(),
			'percentualReducaoBcIcms' => $this->getPercentualReducaoBcIcmsAttribute(),
			'valorBcIcmsStRetido' => $this->getValorBcIcmsStRetidoAttribute(),
			'valorIcmsStRetido' => $this->getValorIcmsStRetidoAttribute(),
			'aliquotaIcmsStRetido' => $this->getAliquotaIcmsStRetidoAttribute(),
			'valorCreditoPresumidoIcms' => $this->getValorCreditoPresumidoIcmsAttribute(),
			'percentualBcIcmsOutraUf' => $this->getPercentualBcIcmsOutraUfAttribute(),
			'valorBcIcmsOutraUf' => $this->getValorBcIcmsOutraUfAttribute(),
			'aliquotaIcmsOutraUf' => $this->getAliquotaIcmsOutraUfAttribute(),
			'valorIcmsOutraUf' => $this->getValorIcmsOutraUfAttribute(),
			'simplesNacionalIndicador' => $this->getSimplesNacionalIndicadorAttribute(),
			'simplesNacionalTotal' => $this->getSimplesNacionalTotalAttribute(),
			'informacoesAddFisco' => $this->getInformacoesAddFiscoAttribute(),
			'valorTotalCarga' => $this->getValorTotalCargaAttribute(),
			'produtoPredominante' => $this->getProdutoPredominanteAttribute(),
			'cargaOutrasCaracteristicas' => $this->getCargaOutrasCaracteristicasAttribute(),
			'modalVersaoLayout' => $this->getModalVersaoLayoutAttribute(),
			'chaveCteSubstituido' => $this->getChaveCteSubstituidoAttribute(),
			'cteDestinatario' => $this->cteDestinatario,
			'cteLocalEntrega' => $this->cteLocalEntrega,
			'cteRemetente' => $this->cteRemetente,
			'cteRodoviario' => $this->cteRodoviario,
			'cteTomador' => $this->cteTomador,
			'listaCteCarga' => $this->listaCteCarga,
        ];
    }
}