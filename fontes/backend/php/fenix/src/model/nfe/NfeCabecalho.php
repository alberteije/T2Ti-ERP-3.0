<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_CABECALHO] 
                                                                                
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

class NfeCabecalho extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_CABECALHO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['listaNfeAcessoXml', 'nfeCana', 'listaNfeCteReferenciado', 'listaNfeCupomFiscalReferenciado', 'nfeDestinatario', 'listaNfeDetalhe', 'nfeEmitente', 'nfeFatura', 'nfeInformacaoPagamento', 'nfeLocalEntrega', 'nfeLocalRetirada', 'listaNfeNfReferenciada', 'listaNfeProcessoReferenciado', 'listaNfeProdRuralReferenciada', 'listaNfeReferenciada', 'nfeResponsavelTecnico', 'nfeTransporte', 'listaViewSpedNfeDetalhe', 'vendedor', 'fornecedor', 'cliente', 'tributOperacaoFiscal', 'vendaCabecalho', ];
	
    /**
     * Relations
     */
    public function listaNfeAcessoXml()
    {
    	return $this->hasMany(NfeAcessoXml::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function nfeCana()
    {
    	return $this->hasOne(NfeCana::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function listaNfeCteReferenciado()
    {
    	return $this->hasMany(NfeCteReferenciado::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function listaNfeCupomFiscalReferenciado()
    {
    	return $this->hasMany(NfeCupomFiscalReferenciado::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function nfeDestinatario()
    {
    	return $this->hasOne(NfeDestinatario::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function listaNfeDetalhe()
    {
    	return $this->hasMany(NfeDetalhe::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function nfeEmitente()
    {
    	return $this->hasOne(NfeEmitente::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function nfeFatura()
    {
    	return $this->hasOne(NfeFatura::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function nfeInformacaoPagamento()
    {
    	return $this->hasOne(NfeInformacaoPagamento::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function nfeLocalEntrega()
    {
    	return $this->hasOne(NfeLocalEntrega::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function nfeLocalRetirada()
    {
    	return $this->hasOne(NfeLocalRetirada::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function listaNfeNfReferenciada()
    {
    	return $this->hasMany(NfeNfReferenciada::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function listaNfeProcessoReferenciado()
    {
    	return $this->hasMany(NfeProcessoReferenciado::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function listaNfeProdRuralReferenciada()
    {
    	return $this->hasMany(NfeProdRuralReferenciada::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function listaNfeReferenciada()
    {
    	return $this->hasMany(NfeReferenciada::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function nfeResponsavelTecnico()
    {
    	return $this->hasOne(NfeResponsavelTecnico::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function nfeTransporte()
    {
    	return $this->hasOne(NfeTransporte::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function listaViewSpedNfeDetalhe()
    {
    	return $this->hasMany(ViewSpedNfeDetalhe::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function vendedor()
    {
    	return $this->belongsTo(Vendedor::class, 'ID_VENDEDOR', 'ID');
    }

    public function fornecedor()
    {
    	return $this->belongsTo(Fornecedor::class, 'ID_FORNECEDOR', 'ID');
    }

    public function cliente()
    {
    	return $this->belongsTo(Cliente::class, 'ID_CLIENTE', 'ID');
    }

    public function tributOperacaoFiscal()
    {
    	return $this->belongsTo(TributOperacaoFiscal::class, 'ID_TRIBUT_OPERACAO_FISCAL', 'ID');
    }

    public function vendaCabecalho()
    {
    	return $this->belongsTo(VendaCabecalho::class, 'ID_VENDA_CABECALHO', 'ID');
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

    // public function getIdNfceMovimentoAttribute() 
	// {
	// 	return $this->attributes['ID_NFCE_MOVIMENTO'];
	// }

	// public function setIdNfceMovimentoAttribute($idNfceMovimento) 
	// {
	// 	$this->attributes['ID_NFCE_MOVIMENTO'] = $idNfceMovimento;
	// }

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

    public function getNaturezaOperacaoAttribute() 
	{
		return $this->attributes['NATUREZA_OPERACAO'];
	}

	public function setNaturezaOperacaoAttribute($naturezaOperacao) 
	{
		$this->attributes['NATUREZA_OPERACAO'] = $naturezaOperacao;
	}

    public function getCodigoModeloAttribute() 
	{
		return $this->attributes['CODIGO_MODELO'];
	}

	public function setCodigoModeloAttribute($codigoModelo) 
	{
		$this->attributes['CODIGO_MODELO'] = $codigoModelo;
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

    public function getDataHoraEntradaSaidaAttribute() 
	{
		return $this->attributes['DATA_HORA_ENTRADA_SAIDA'];
	}

	public function setDataHoraEntradaSaidaAttribute($dataHoraEntradaSaida) 
	{
		$this->attributes['DATA_HORA_ENTRADA_SAIDA'] = $dataHoraEntradaSaida;
	}

    public function getTipoOperacaoAttribute() 
	{
		return $this->attributes['TIPO_OPERACAO'];
	}

	public function setTipoOperacaoAttribute($tipoOperacao) 
	{
		$this->attributes['TIPO_OPERACAO'] = $tipoOperacao;
	}

    public function getLocalDestinoAttribute() 
	{
		return $this->attributes['LOCAL_DESTINO'];
	}

	public function setLocalDestinoAttribute($localDestino) 
	{
		$this->attributes['LOCAL_DESTINO'] = $localDestino;
	}

    public function getCodigoMunicipioAttribute() 
	{
		return $this->attributes['CODIGO_MUNICIPIO'];
	}

	public function setCodigoMunicipioAttribute($codigoMunicipio) 
	{
		$this->attributes['CODIGO_MUNICIPIO'] = $codigoMunicipio;
	}

    public function getFormatoImpressaoDanfeAttribute() 
	{
		return $this->attributes['FORMATO_IMPRESSAO_DANFE'];
	}

	public function setFormatoImpressaoDanfeAttribute($formatoImpressaoDanfe) 
	{
		$this->attributes['FORMATO_IMPRESSAO_DANFE'] = $formatoImpressaoDanfe;
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

    public function getFinalidadeEmissaoAttribute() 
	{
		return $this->attributes['FINALIDADE_EMISSAO'];
	}

	public function setFinalidadeEmissaoAttribute($finalidadeEmissao) 
	{
		$this->attributes['FINALIDADE_EMISSAO'] = $finalidadeEmissao;
	}

    public function getConsumidorOperacaoAttribute() 
	{
		return $this->attributes['CONSUMIDOR_OPERACAO'];
	}

	public function setConsumidorOperacaoAttribute($consumidorOperacao) 
	{
		$this->attributes['CONSUMIDOR_OPERACAO'] = $consumidorOperacao;
	}

    public function getConsumidorPresencaAttribute() 
	{
		return $this->attributes['CONSUMIDOR_PRESENCA'];
	}

	public function setConsumidorPresencaAttribute($consumidorPresenca) 
	{
		$this->attributes['CONSUMIDOR_PRESENCA'] = $consumidorPresenca;
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

    public function getBaseCalculoIcmsAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_ICMS'];
	}

	public function setBaseCalculoIcmsAttribute($baseCalculoIcms) 
	{
		$this->attributes['BASE_CALCULO_ICMS'] = $baseCalculoIcms;
	}

    public function getValorIcmsAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS'];
	}

	public function setValorIcmsAttribute($valorIcms) 
	{
		$this->attributes['VALOR_ICMS'] = $valorIcms;
	}

    public function getValorIcmsDesoneradoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_DESONERADO'];
	}

	public function setValorIcmsDesoneradoAttribute($valorIcmsDesonerado) 
	{
		$this->attributes['VALOR_ICMS_DESONERADO'] = $valorIcmsDesonerado;
	}

    public function getTotalIcmsFcpUfDestinoAttribute() 
	{
		return (double)$this->attributes['TOTAL_ICMS_FCP_UF_DESTINO'];
	}

	public function setTotalIcmsFcpUfDestinoAttribute($totalIcmsFcpUfDestino) 
	{
		$this->attributes['TOTAL_ICMS_FCP_UF_DESTINO'] = $totalIcmsFcpUfDestino;
	}

    public function getTotalIcmsInterestadualUfDestinoAttribute() 
	{
		return (double)$this->attributes['TOTAL_ICMS_INTERESTADUAL_UF_DESTINO'];
	}

	public function setTotalIcmsInterestadualUfDestinoAttribute($totalIcmsInterestadualUfDestino) 
	{
		$this->attributes['TOTAL_ICMS_INTERESTADUAL_UF_DESTINO'] = $totalIcmsInterestadualUfDestino;
	}

    public function getTotalIcmsInterestadualUfRemetenteAttribute() 
	{
		return (double)$this->attributes['TOTAL_ICMS_INTERESTADUAL_UF_REMETENTE'];
	}

	public function setTotalIcmsInterestadualUfRemetenteAttribute($totalIcmsInterestadualUfRemetente) 
	{
		$this->attributes['TOTAL_ICMS_INTERESTADUAL_UF_REMETENTE'] = $totalIcmsInterestadualUfRemetente;
	}

    public function getValorTotalFcpAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL_FCP'];
	}

	public function setValorTotalFcpAttribute($valorTotalFcp) 
	{
		$this->attributes['VALOR_TOTAL_FCP'] = $valorTotalFcp;
	}

    public function getBaseCalculoIcmsStAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_ICMS_ST'];
	}

	public function setBaseCalculoIcmsStAttribute($baseCalculoIcmsSt) 
	{
		$this->attributes['BASE_CALCULO_ICMS_ST'] = $baseCalculoIcmsSt;
	}

    public function getValorIcmsStAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_ST'];
	}

	public function setValorIcmsStAttribute($valorIcmsSt) 
	{
		$this->attributes['VALOR_ICMS_ST'] = $valorIcmsSt;
	}

    public function getValorTotalFcpStAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL_FCP_ST'];
	}

	public function setValorTotalFcpStAttribute($valorTotalFcpSt) 
	{
		$this->attributes['VALOR_TOTAL_FCP_ST'] = $valorTotalFcpSt;
	}

    public function getValorTotalFcpStRetidoAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL_FCP_ST_RETIDO'];
	}

	public function setValorTotalFcpStRetidoAttribute($valorTotalFcpStRetido) 
	{
		$this->attributes['VALOR_TOTAL_FCP_ST_RETIDO'] = $valorTotalFcpStRetido;
	}

    public function getValorTotalProdutosAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL_PRODUTOS'];
	}

	public function setValorTotalProdutosAttribute($valorTotalProdutos) 
	{
		$this->attributes['VALOR_TOTAL_PRODUTOS'] = $valorTotalProdutos;
	}

    public function getValorFreteAttribute() 
	{
		return (double)$this->attributes['VALOR_FRETE'];
	}

	public function setValorFreteAttribute($valorFrete) 
	{
		$this->attributes['VALOR_FRETE'] = $valorFrete;
	}

    public function getValorSeguroAttribute() 
	{
		return (double)$this->attributes['VALOR_SEGURO'];
	}

	public function setValorSeguroAttribute($valorSeguro) 
	{
		$this->attributes['VALOR_SEGURO'] = $valorSeguro;
	}

    public function getValorDescontoAttribute() 
	{
		return (double)$this->attributes['VALOR_DESCONTO'];
	}

	public function setValorDescontoAttribute($valorDesconto) 
	{
		$this->attributes['VALOR_DESCONTO'] = $valorDesconto;
	}

    public function getValorImpostoImportacaoAttribute() 
	{
		return (double)$this->attributes['VALOR_IMPOSTO_IMPORTACAO'];
	}

	public function setValorImpostoImportacaoAttribute($valorImpostoImportacao) 
	{
		$this->attributes['VALOR_IMPOSTO_IMPORTACAO'] = $valorImpostoImportacao;
	}

    public function getValorIpiAttribute() 
	{
		return (double)$this->attributes['VALOR_IPI'];
	}

	public function setValorIpiAttribute($valorIpi) 
	{
		$this->attributes['VALOR_IPI'] = $valorIpi;
	}

    public function getValorIpiDevolvidoAttribute() 
	{
		return (double)$this->attributes['VALOR_IPI_DEVOLVIDO'];
	}

	public function setValorIpiDevolvidoAttribute($valorIpiDevolvido) 
	{
		$this->attributes['VALOR_IPI_DEVOLVIDO'] = $valorIpiDevolvido;
	}

    public function getValorPisAttribute() 
	{
		return (double)$this->attributes['VALOR_PIS'];
	}

	public function setValorPisAttribute($valorPis) 
	{
		$this->attributes['VALOR_PIS'] = $valorPis;
	}

    public function getValorCofinsAttribute() 
	{
		return (double)$this->attributes['VALOR_COFINS'];
	}

	public function setValorCofinsAttribute($valorCofins) 
	{
		$this->attributes['VALOR_COFINS'] = $valorCofins;
	}

    public function getValorDespesasAcessoriasAttribute() 
	{
		return (double)$this->attributes['VALOR_DESPESAS_ACESSORIAS'];
	}

	public function setValorDespesasAcessoriasAttribute($valorDespesasAcessorias) 
	{
		$this->attributes['VALOR_DESPESAS_ACESSORIAS'] = $valorDespesasAcessorias;
	}

    public function getValorTotalAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL'];
	}

	public function setValorTotalAttribute($valorTotal) 
	{
		$this->attributes['VALOR_TOTAL'] = $valorTotal;
	}

    public function getValorTotalTributosAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL_TRIBUTOS'];
	}

	public function setValorTotalTributosAttribute($valorTotalTributos) 
	{
		$this->attributes['VALOR_TOTAL_TRIBUTOS'] = $valorTotalTributos;
	}

    public function getValorServicosAttribute() 
	{
		return (double)$this->attributes['VALOR_SERVICOS'];
	}

	public function setValorServicosAttribute($valorServicos) 
	{
		$this->attributes['VALOR_SERVICOS'] = $valorServicos;
	}

    public function getBaseCalculoIssqnAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_ISSQN'];
	}

	public function setBaseCalculoIssqnAttribute($baseCalculoIssqn) 
	{
		$this->attributes['BASE_CALCULO_ISSQN'] = $baseCalculoIssqn;
	}

    public function getValorIssqnAttribute() 
	{
		return (double)$this->attributes['VALOR_ISSQN'];
	}

	public function setValorIssqnAttribute($valorIssqn) 
	{
		$this->attributes['VALOR_ISSQN'] = $valorIssqn;
	}

    public function getValorPisIssqnAttribute() 
	{
		return (double)$this->attributes['VALOR_PIS_ISSQN'];
	}

	public function setValorPisIssqnAttribute($valorPisIssqn) 
	{
		$this->attributes['VALOR_PIS_ISSQN'] = $valorPisIssqn;
	}

    public function getValorCofinsIssqnAttribute() 
	{
		return (double)$this->attributes['VALOR_COFINS_ISSQN'];
	}

	public function setValorCofinsIssqnAttribute($valorCofinsIssqn) 
	{
		$this->attributes['VALOR_COFINS_ISSQN'] = $valorCofinsIssqn;
	}

    public function getDataPrestacaoServicoAttribute() 
	{
		return $this->attributes['DATA_PRESTACAO_SERVICO'];
	}

	public function setDataPrestacaoServicoAttribute($dataPrestacaoServico) 
	{
		$this->attributes['DATA_PRESTACAO_SERVICO'] = $dataPrestacaoServico;
	}

    public function getValorDeducaoIssqnAttribute() 
	{
		return (double)$this->attributes['VALOR_DEDUCAO_ISSQN'];
	}

	public function setValorDeducaoIssqnAttribute($valorDeducaoIssqn) 
	{
		$this->attributes['VALOR_DEDUCAO_ISSQN'] = $valorDeducaoIssqn;
	}

    public function getOutrasRetencoesIssqnAttribute() 
	{
		return (double)$this->attributes['OUTRAS_RETENCOES_ISSQN'];
	}

	public function setOutrasRetencoesIssqnAttribute($outrasRetencoesIssqn) 
	{
		$this->attributes['OUTRAS_RETENCOES_ISSQN'] = $outrasRetencoesIssqn;
	}

    public function getDescontoIncondicionadoIssqnAttribute() 
	{
		return (double)$this->attributes['DESCONTO_INCONDICIONADO_ISSQN'];
	}

	public function setDescontoIncondicionadoIssqnAttribute($descontoIncondicionadoIssqn) 
	{
		$this->attributes['DESCONTO_INCONDICIONADO_ISSQN'] = $descontoIncondicionadoIssqn;
	}

    public function getDescontoCondicionadoIssqnAttribute() 
	{
		return (double)$this->attributes['DESCONTO_CONDICIONADO_ISSQN'];
	}

	public function setDescontoCondicionadoIssqnAttribute($descontoCondicionadoIssqn) 
	{
		$this->attributes['DESCONTO_CONDICIONADO_ISSQN'] = $descontoCondicionadoIssqn;
	}

    public function getTotalRetencaoIssqnAttribute() 
	{
		return (double)$this->attributes['TOTAL_RETENCAO_ISSQN'];
	}

	public function setTotalRetencaoIssqnAttribute($totalRetencaoIssqn) 
	{
		$this->attributes['TOTAL_RETENCAO_ISSQN'] = $totalRetencaoIssqn;
	}

    public function getRegimeEspecialTributacaoAttribute() 
	{
		return $this->attributes['REGIME_ESPECIAL_TRIBUTACAO'];
	}

	public function setRegimeEspecialTributacaoAttribute($regimeEspecialTributacao) 
	{
		$this->attributes['REGIME_ESPECIAL_TRIBUTACAO'] = $regimeEspecialTributacao;
	}

    public function getValorRetidoPisAttribute() 
	{
		return (double)$this->attributes['VALOR_RETIDO_PIS'];
	}

	public function setValorRetidoPisAttribute($valorRetidoPis) 
	{
		$this->attributes['VALOR_RETIDO_PIS'] = $valorRetidoPis;
	}

    public function getValorRetidoCofinsAttribute() 
	{
		return (double)$this->attributes['VALOR_RETIDO_COFINS'];
	}

	public function setValorRetidoCofinsAttribute($valorRetidoCofins) 
	{
		$this->attributes['VALOR_RETIDO_COFINS'] = $valorRetidoCofins;
	}

    public function getValorRetidoCsllAttribute() 
	{
		return (double)$this->attributes['VALOR_RETIDO_CSLL'];
	}

	public function setValorRetidoCsllAttribute($valorRetidoCsll) 
	{
		$this->attributes['VALOR_RETIDO_CSLL'] = $valorRetidoCsll;
	}

    public function getBaseCalculoIrrfAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_IRRF'];
	}

	public function setBaseCalculoIrrfAttribute($baseCalculoIrrf) 
	{
		$this->attributes['BASE_CALCULO_IRRF'] = $baseCalculoIrrf;
	}

    public function getValorRetidoIrrfAttribute() 
	{
		return (double)$this->attributes['VALOR_RETIDO_IRRF'];
	}

	public function setValorRetidoIrrfAttribute($valorRetidoIrrf) 
	{
		$this->attributes['VALOR_RETIDO_IRRF'] = $valorRetidoIrrf;
	}

    public function getBaseCalculoPrevidenciaAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_PREVIDENCIA'];
	}

	public function setBaseCalculoPrevidenciaAttribute($baseCalculoPrevidencia) 
	{
		$this->attributes['BASE_CALCULO_PREVIDENCIA'] = $baseCalculoPrevidencia;
	}

    public function getValorRetidoPrevidenciaAttribute() 
	{
		return (double)$this->attributes['VALOR_RETIDO_PREVIDENCIA'];
	}

	public function setValorRetidoPrevidenciaAttribute($valorRetidoPrevidencia) 
	{
		$this->attributes['VALOR_RETIDO_PREVIDENCIA'] = $valorRetidoPrevidencia;
	}

    public function getInformacoesAddFiscoAttribute() 
	{
		return $this->attributes['INFORMACOES_ADD_FISCO'];
	}

	public function setInformacoesAddFiscoAttribute($informacoesAddFisco) 
	{
		$this->attributes['INFORMACOES_ADD_FISCO'] = $informacoesAddFisco;
	}

    public function getInformacoesAddContribuinteAttribute() 
	{
		return $this->attributes['INFORMACOES_ADD_CONTRIBUINTE'];
	}

	public function setInformacoesAddContribuinteAttribute($informacoesAddContribuinte) 
	{
		$this->attributes['INFORMACOES_ADD_CONTRIBUINTE'] = $informacoesAddContribuinte;
	}

    public function getComexUfEmbarqueAttribute() 
	{
		return $this->attributes['COMEX_UF_EMBARQUE'];
	}

	public function setComexUfEmbarqueAttribute($comexUfEmbarque) 
	{
		$this->attributes['COMEX_UF_EMBARQUE'] = $comexUfEmbarque;
	}

    public function getComexLocalEmbarqueAttribute() 
	{
		return $this->attributes['COMEX_LOCAL_EMBARQUE'];
	}

	public function setComexLocalEmbarqueAttribute($comexLocalEmbarque) 
	{
		$this->attributes['COMEX_LOCAL_EMBARQUE'] = $comexLocalEmbarque;
	}

    public function getComexLocalDespachoAttribute() 
	{
		return $this->attributes['COMEX_LOCAL_DESPACHO'];
	}

	public function setComexLocalDespachoAttribute($comexLocalDespacho) 
	{
		$this->attributes['COMEX_LOCAL_DESPACHO'] = $comexLocalDespacho;
	}

    public function getCompraNotaEmpenhoAttribute() 
	{
		return $this->attributes['COMPRA_NOTA_EMPENHO'];
	}

	public function setCompraNotaEmpenhoAttribute($compraNotaEmpenho) 
	{
		$this->attributes['COMPRA_NOTA_EMPENHO'] = $compraNotaEmpenho;
	}

    public function getCompraPedidoAttribute() 
	{
		return $this->attributes['COMPRA_PEDIDO'];
	}

	public function setCompraPedidoAttribute($compraPedido) 
	{
		$this->attributes['COMPRA_PEDIDO'] = $compraPedido;
	}

    public function getCompraContratoAttribute() 
	{
		return $this->attributes['COMPRA_CONTRATO'];
	}

	public function setCompraContratoAttribute($compraContrato) 
	{
		$this->attributes['COMPRA_CONTRATO'] = $compraContrato;
	}

    public function getQrcodeAttribute() 
	{
		return $this->attributes['QRCODE'];
	}

	public function setQrcodeAttribute($qrcode) 
	{
		$this->attributes['QRCODE'] = $qrcode;
	}

    public function getUrlChaveAttribute() 
	{
		return $this->attributes['URL_CHAVE'];
	}

	public function setUrlChaveAttribute($urlChave) 
	{
		$this->attributes['URL_CHAVE'] = $urlChave;
	}

    public function getStatusNotaAttribute() 
	{
		return $this->attributes['STATUS_NOTA'];
	}

	public function setStatusNotaAttribute($statusNota) 
	{
		$this->attributes['STATUS_NOTA'] = $statusNota;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			// $this->setIdNfceMovimentoAttribute($objeto->idNfceMovimento);
			$this->setUfEmitenteAttribute($objeto->ufEmitente);
			$this->setCodigoNumericoAttribute($objeto->codigoNumerico);
			$this->setNaturezaOperacaoAttribute($objeto->naturezaOperacao);
			$this->setCodigoModeloAttribute($objeto->codigoModelo);
			$this->setSerieAttribute($objeto->serie);
			$this->setNumeroAttribute($objeto->numero);
			$this->setDataHoraEmissaoAttribute($objeto->dataHoraEmissao);
			$this->setDataHoraEntradaSaidaAttribute($objeto->dataHoraEntradaSaida);
			$this->setTipoOperacaoAttribute($objeto->tipoOperacao);
			$this->setLocalDestinoAttribute($objeto->localDestino);
			$this->setCodigoMunicipioAttribute($objeto->codigoMunicipio);
			$this->setFormatoImpressaoDanfeAttribute($objeto->formatoImpressaoDanfe);
			$this->setTipoEmissaoAttribute($objeto->tipoEmissao);
			$this->setChaveAcessoAttribute($objeto->chaveAcesso);
			$this->setDigitoChaveAcessoAttribute($objeto->digitoChaveAcesso);
			$this->setAmbienteAttribute($objeto->ambiente);
			$this->setFinalidadeEmissaoAttribute($objeto->finalidadeEmissao);
			$this->setConsumidorOperacaoAttribute($objeto->consumidorOperacao);
			$this->setConsumidorPresencaAttribute($objeto->consumidorPresenca);
			$this->setProcessoEmissaoAttribute($objeto->processoEmissao);
			$this->setVersaoProcessoEmissaoAttribute($objeto->versaoProcessoEmissao);
			$this->setDataEntradaContingenciaAttribute($objeto->dataEntradaContingencia);
			$this->setJustificativaContingenciaAttribute($objeto->justificativaContingencia);
			$this->setBaseCalculoIcmsAttribute($objeto->baseCalculoIcms);
			$this->setValorIcmsAttribute($objeto->valorIcms);
			$this->setValorIcmsDesoneradoAttribute($objeto->valorIcmsDesonerado);
			$this->setTotalIcmsFcpUfDestinoAttribute($objeto->totalIcmsFcpUfDestino);
			$this->setTotalIcmsInterestadualUfDestinoAttribute($objeto->totalIcmsInterestadualUfDestino);
			$this->setTotalIcmsInterestadualUfRemetenteAttribute($objeto->totalIcmsInterestadualUfRemetente);
			$this->setValorTotalFcpAttribute($objeto->valorTotalFcp);
			$this->setBaseCalculoIcmsStAttribute($objeto->baseCalculoIcmsSt);
			$this->setValorIcmsStAttribute($objeto->valorIcmsSt);
			$this->setValorTotalFcpStAttribute($objeto->valorTotalFcpSt);
			$this->setValorTotalFcpStRetidoAttribute($objeto->valorTotalFcpStRetido);
			$this->setValorTotalProdutosAttribute($objeto->valorTotalProdutos);
			$this->setValorFreteAttribute($objeto->valorFrete);
			$this->setValorSeguroAttribute($objeto->valorSeguro);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setValorImpostoImportacaoAttribute($objeto->valorImpostoImportacao);
			$this->setValorIpiAttribute($objeto->valorIpi);
			$this->setValorIpiDevolvidoAttribute($objeto->valorIpiDevolvido);
			$this->setValorPisAttribute($objeto->valorPis);
			$this->setValorCofinsAttribute($objeto->valorCofins);
			$this->setValorDespesasAcessoriasAttribute($objeto->valorDespesasAcessorias);
			$this->setValorTotalAttribute($objeto->valorTotal);
			$this->setValorTotalTributosAttribute($objeto->valorTotalTributos);
			$this->setValorServicosAttribute($objeto->valorServicos);
			$this->setBaseCalculoIssqnAttribute($objeto->baseCalculoIssqn);
			$this->setValorIssqnAttribute($objeto->valorIssqn);
			$this->setValorPisIssqnAttribute($objeto->valorPisIssqn);
			$this->setValorCofinsIssqnAttribute($objeto->valorCofinsIssqn);
			$this->setDataPrestacaoServicoAttribute($objeto->dataPrestacaoServico);
			$this->setValorDeducaoIssqnAttribute($objeto->valorDeducaoIssqn);
			$this->setOutrasRetencoesIssqnAttribute($objeto->outrasRetencoesIssqn);
			$this->setDescontoIncondicionadoIssqnAttribute($objeto->descontoIncondicionadoIssqn);
			$this->setDescontoCondicionadoIssqnAttribute($objeto->descontoCondicionadoIssqn);
			$this->setTotalRetencaoIssqnAttribute($objeto->totalRetencaoIssqn);
			$this->setRegimeEspecialTributacaoAttribute($objeto->regimeEspecialTributacao);
			$this->setValorRetidoPisAttribute($objeto->valorRetidoPis);
			$this->setValorRetidoCofinsAttribute($objeto->valorRetidoCofins);
			$this->setValorRetidoCsllAttribute($objeto->valorRetidoCsll);
			$this->setBaseCalculoIrrfAttribute($objeto->baseCalculoIrrf);
			$this->setValorRetidoIrrfAttribute($objeto->valorRetidoIrrf);
			$this->setBaseCalculoPrevidenciaAttribute($objeto->baseCalculoPrevidencia);
			$this->setValorRetidoPrevidenciaAttribute($objeto->valorRetidoPrevidencia);
			$this->setInformacoesAddFiscoAttribute($objeto->informacoesAddFisco);
			$this->setInformacoesAddContribuinteAttribute($objeto->informacoesAddContribuinte);
			$this->setComexUfEmbarqueAttribute($objeto->comexUfEmbarque);
			$this->setComexLocalEmbarqueAttribute($objeto->comexLocalEmbarque);
			$this->setComexLocalDespachoAttribute($objeto->comexLocalDespacho);
			$this->setCompraNotaEmpenhoAttribute($objeto->compraNotaEmpenho);
			$this->setCompraPedidoAttribute($objeto->compraPedido);
			$this->setCompraContratoAttribute($objeto->compraContrato);
			$this->setQrcodeAttribute($objeto->qrcode);
			$this->setUrlChaveAttribute($objeto->urlChave);
			$this->setStatusNotaAttribute($objeto->statusNota);

			// vincular objetos
			$vendedor = new Vendedor();
			$vendedor->mapear($objeto->vendedor);
			$this->vendedor()->associate($vendedor);

			$fornecedor = new Fornecedor();
			$fornecedor->mapear($objeto->fornecedor);
			$this->fornecedor()->associate($fornecedor);

			$cliente = new Cliente();
			$cliente->mapear($objeto->cliente);
			$this->cliente()->associate($cliente);

			$tributOperacaoFiscal = new TributOperacaoFiscal();
			$tributOperacaoFiscal->mapear($objeto->tributOperacaoFiscal);
			$this->tributOperacaoFiscal()->associate($tributOperacaoFiscal);

			$vendaCabecalho = new VendaCabecalho();
			$vendaCabecalho->mapear($objeto->vendaCabecalho);
			$this->vendaCabecalho()->associate($vendaCabecalho);
		
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
			// 'idNfceMovimento' => $this->getIdNfceMovimentoAttribute(),
			'ufEmitente' => $this->getUfEmitenteAttribute(),
			'codigoNumerico' => $this->getCodigoNumericoAttribute(),
			'naturezaOperacao' => $this->getNaturezaOperacaoAttribute(),
			'codigoModelo' => $this->getCodigoModeloAttribute(),
			'serie' => $this->getSerieAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'dataHoraEmissao' => $this->getDataHoraEmissaoAttribute(),
			'dataHoraEntradaSaida' => $this->getDataHoraEntradaSaidaAttribute(),
			'tipoOperacao' => $this->getTipoOperacaoAttribute(),
			'localDestino' => $this->getLocalDestinoAttribute(),
			'codigoMunicipio' => $this->getCodigoMunicipioAttribute(),
			'formatoImpressaoDanfe' => $this->getFormatoImpressaoDanfeAttribute(),
			'tipoEmissao' => $this->getTipoEmissaoAttribute(),
			'chaveAcesso' => $this->getChaveAcessoAttribute(),
			'digitoChaveAcesso' => $this->getDigitoChaveAcessoAttribute(),
			'ambiente' => $this->getAmbienteAttribute(),
			'finalidadeEmissao' => $this->getFinalidadeEmissaoAttribute(),
			'consumidorOperacao' => $this->getConsumidorOperacaoAttribute(),
			'consumidorPresenca' => $this->getConsumidorPresencaAttribute(),
			'processoEmissao' => $this->getProcessoEmissaoAttribute(),
			'versaoProcessoEmissao' => $this->getVersaoProcessoEmissaoAttribute(),
			'dataEntradaContingencia' => $this->getDataEntradaContingenciaAttribute(),
			'justificativaContingencia' => $this->getJustificativaContingenciaAttribute(),
			'baseCalculoIcms' => $this->getBaseCalculoIcmsAttribute(),
			'valorIcms' => $this->getValorIcmsAttribute(),
			'valorIcmsDesonerado' => $this->getValorIcmsDesoneradoAttribute(),
			'totalIcmsFcpUfDestino' => $this->getTotalIcmsFcpUfDestinoAttribute(),
			'totalIcmsInterestadualUfDestino' => $this->getTotalIcmsInterestadualUfDestinoAttribute(),
			'totalIcmsInterestadualUfRemetente' => $this->getTotalIcmsInterestadualUfRemetenteAttribute(),
			'valorTotalFcp' => $this->getValorTotalFcpAttribute(),
			'baseCalculoIcmsSt' => $this->getBaseCalculoIcmsStAttribute(),
			'valorIcmsSt' => $this->getValorIcmsStAttribute(),
			'valorTotalFcpSt' => $this->getValorTotalFcpStAttribute(),
			'valorTotalFcpStRetido' => $this->getValorTotalFcpStRetidoAttribute(),
			'valorTotalProdutos' => $this->getValorTotalProdutosAttribute(),
			'valorFrete' => $this->getValorFreteAttribute(),
			'valorSeguro' => $this->getValorSeguroAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'valorImpostoImportacao' => $this->getValorImpostoImportacaoAttribute(),
			'valorIpi' => $this->getValorIpiAttribute(),
			'valorIpiDevolvido' => $this->getValorIpiDevolvidoAttribute(),
			'valorPis' => $this->getValorPisAttribute(),
			'valorCofins' => $this->getValorCofinsAttribute(),
			'valorDespesasAcessorias' => $this->getValorDespesasAcessoriasAttribute(),
			'valorTotal' => $this->getValorTotalAttribute(),
			'valorTotalTributos' => $this->getValorTotalTributosAttribute(),
			'valorServicos' => $this->getValorServicosAttribute(),
			'baseCalculoIssqn' => $this->getBaseCalculoIssqnAttribute(),
			'valorIssqn' => $this->getValorIssqnAttribute(),
			'valorPisIssqn' => $this->getValorPisIssqnAttribute(),
			'valorCofinsIssqn' => $this->getValorCofinsIssqnAttribute(),
			'dataPrestacaoServico' => $this->getDataPrestacaoServicoAttribute(),
			'valorDeducaoIssqn' => $this->getValorDeducaoIssqnAttribute(),
			'outrasRetencoesIssqn' => $this->getOutrasRetencoesIssqnAttribute(),
			'descontoIncondicionadoIssqn' => $this->getDescontoIncondicionadoIssqnAttribute(),
			'descontoCondicionadoIssqn' => $this->getDescontoCondicionadoIssqnAttribute(),
			'totalRetencaoIssqn' => $this->getTotalRetencaoIssqnAttribute(),
			'regimeEspecialTributacao' => $this->getRegimeEspecialTributacaoAttribute(),
			'valorRetidoPis' => $this->getValorRetidoPisAttribute(),
			'valorRetidoCofins' => $this->getValorRetidoCofinsAttribute(),
			'valorRetidoCsll' => $this->getValorRetidoCsllAttribute(),
			'baseCalculoIrrf' => $this->getBaseCalculoIrrfAttribute(),
			'valorRetidoIrrf' => $this->getValorRetidoIrrfAttribute(),
			'baseCalculoPrevidencia' => $this->getBaseCalculoPrevidenciaAttribute(),
			'valorRetidoPrevidencia' => $this->getValorRetidoPrevidenciaAttribute(),
			'informacoesAddFisco' => $this->getInformacoesAddFiscoAttribute(),
			'informacoesAddContribuinte' => $this->getInformacoesAddContribuinteAttribute(),
			'comexUfEmbarque' => $this->getComexUfEmbarqueAttribute(),
			'comexLocalEmbarque' => $this->getComexLocalEmbarqueAttribute(),
			'comexLocalDespacho' => $this->getComexLocalDespachoAttribute(),
			'compraNotaEmpenho' => $this->getCompraNotaEmpenhoAttribute(),
			'compraPedido' => $this->getCompraPedidoAttribute(),
			'compraContrato' => $this->getCompraContratoAttribute(),
			'qrcode' => $this->getQrcodeAttribute(),
			'urlChave' => $this->getUrlChaveAttribute(),
			'statusNota' => $this->getStatusNotaAttribute(),
			'nfeCana' => $this->nfeCana,
			'nfeDestinatario' => $this->nfeDestinatario,
			'nfeEmitente' => $this->nfeEmitente,
			'nfeFatura' => $this->nfeFatura,
			'nfeInformacaoPagamento' => $this->nfeInformacaoPagamento,
			'nfeLocalEntrega' => $this->nfeLocalEntrega,
			'nfeLocalRetirada' => $this->nfeLocalRetirada,
			'nfeResponsavelTecnico' => $this->nfeResponsavelTecnico,
			'nfeTransporte' => $this->nfeTransporte,
			'vendedor' => $this->vendedor,
			'fornecedor' => $this->fornecedor,
			'cliente' => $this->cliente,
			'tributOperacaoFiscal' => $this->tributOperacaoFiscal,
			'vendaCabecalho' => $this->vendaCabecalho,
			'listaNfeAcessoXml' => $this->listaNfeAcessoXml,
			'listaNfeCteReferenciado' => $this->listaNfeCteReferenciado,
			'listaNfeCupomFiscalReferenciado' => $this->listaNfeCupomFiscalReferenciado,
			'listaNfeDetalhe' => $this->listaNfeDetalhe,
			'listaNfeNfReferenciada' => $this->listaNfeNfReferenciada,
			'listaNfeProcessoReferenciado' => $this->listaNfeProcessoReferenciado,
			'listaNfeProdRuralReferenciada' => $this->listaNfeProdRuralReferenciada,
			'listaNfeReferenciada' => $this->listaNfeReferenciada,
			'listaViewSpedNfeDetalhe' => $this->listaViewSpedNfeDetalhe,
        ];
    }
}