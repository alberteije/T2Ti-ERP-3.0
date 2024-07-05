<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_SPED_NFE_DETALHE] 
                                                                                
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

class ViewSpedNfeDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_SPED_NFE_DETALHE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['produto', 'tributOperacaoFiscal', 'produtoUnidade', ];
	
    /**
     * Relations
     */
    public function nfeCabecalho()
    {
    	return $this->belongsTo(NfeCabecalho::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function produto()
    {
    	return $this->belongsTo(Produto::class, 'ID_PRODUTO', 'ID');
    }

    public function tributOperacaoFiscal()
    {
    	return $this->belongsTo(TributOperacaoFiscal::class, 'ID_TRIBUT_OPERACAO_FISCAL', 'ID');
    }

    public function produtoUnidade()
    {
    	return $this->belongsTo(ProdutoUnidade::class, 'ID_PRODUTO_UNIDADE', 'ID');
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

    public function getNumeroItemAttribute() 
	{
		return $this->attributes['NUMERO_ITEM'];
	}

	public function setNumeroItemAttribute($numeroItem) 
	{
		$this->attributes['NUMERO_ITEM'] = $numeroItem;
	}

    public function getCodigoProdutoAttribute() 
	{
		return $this->attributes['CODIGO_PRODUTO'];
	}

	public function setCodigoProdutoAttribute($codigoProduto) 
	{
		$this->attributes['CODIGO_PRODUTO'] = $codigoProduto;
	}

    public function getGtinAttribute() 
	{
		return $this->attributes['GTIN'];
	}

	public function setGtinAttribute($gtin) 
	{
		$this->attributes['GTIN'] = $gtin;
	}

    public function getNomeProdutoAttribute() 
	{
		return $this->attributes['NOME_PRODUTO'];
	}

	public function setNomeProdutoAttribute($nomeProduto) 
	{
		$this->attributes['NOME_PRODUTO'] = $nomeProduto;
	}

    public function getNcmAttribute() 
	{
		return $this->attributes['NCM'];
	}

	public function setNcmAttribute($ncm) 
	{
		$this->attributes['NCM'] = $ncm;
	}

    public function getNveAttribute() 
	{
		return $this->attributes['NVE'];
	}

	public function setNveAttribute($nve) 
	{
		$this->attributes['NVE'] = $nve;
	}

    public function getCestAttribute() 
	{
		return $this->attributes['CEST'];
	}

	public function setCestAttribute($cest) 
	{
		$this->attributes['CEST'] = $cest;
	}

    public function getIndicadorEscalaRelevanteAttribute() 
	{
		return $this->attributes['INDICADOR_ESCALA_RELEVANTE'];
	}

	public function setIndicadorEscalaRelevanteAttribute($indicadorEscalaRelevante) 
	{
		$this->attributes['INDICADOR_ESCALA_RELEVANTE'] = $indicadorEscalaRelevante;
	}

    public function getCnpjFabricanteAttribute() 
	{
		return $this->attributes['CNPJ_FABRICANTE'];
	}

	public function setCnpjFabricanteAttribute($cnpjFabricante) 
	{
		$this->attributes['CNPJ_FABRICANTE'] = $cnpjFabricante;
	}

    public function getCodigoBeneficioFiscalAttribute() 
	{
		return $this->attributes['CODIGO_BENEFICIO_FISCAL'];
	}

	public function setCodigoBeneficioFiscalAttribute($codigoBeneficioFiscal) 
	{
		$this->attributes['CODIGO_BENEFICIO_FISCAL'] = $codigoBeneficioFiscal;
	}

    public function getExTipiAttribute() 
	{
		return $this->attributes['EX_TIPI'];
	}

	public function setExTipiAttribute($exTipi) 
	{
		$this->attributes['EX_TIPI'] = $exTipi;
	}

    public function getCfopAttribute() 
	{
		return $this->attributes['CFOP'];
	}

	public function setCfopAttribute($cfop) 
	{
		$this->attributes['CFOP'] = $cfop;
	}

    public function getUnidadeComercialAttribute() 
	{
		return $this->attributes['UNIDADE_COMERCIAL'];
	}

	public function setUnidadeComercialAttribute($unidadeComercial) 
	{
		$this->attributes['UNIDADE_COMERCIAL'] = $unidadeComercial;
	}

    public function getQuantidadeComercialAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_COMERCIAL'];
	}

	public function setQuantidadeComercialAttribute($quantidadeComercial) 
	{
		$this->attributes['QUANTIDADE_COMERCIAL'] = $quantidadeComercial;
	}

    public function getNumeroPedidoCompraAttribute() 
	{
		return $this->attributes['NUMERO_PEDIDO_COMPRA'];
	}

	public function setNumeroPedidoCompraAttribute($numeroPedidoCompra) 
	{
		$this->attributes['NUMERO_PEDIDO_COMPRA'] = $numeroPedidoCompra;
	}

    public function getItemPedidoCompraAttribute() 
	{
		return $this->attributes['ITEM_PEDIDO_COMPRA'];
	}

	public function setItemPedidoCompraAttribute($itemPedidoCompra) 
	{
		$this->attributes['ITEM_PEDIDO_COMPRA'] = $itemPedidoCompra;
	}

    public function getNumeroFciAttribute() 
	{
		return $this->attributes['NUMERO_FCI'];
	}

	public function setNumeroFciAttribute($numeroFci) 
	{
		$this->attributes['NUMERO_FCI'] = $numeroFci;
	}

    public function getNumeroRecopiAttribute() 
	{
		return $this->attributes['NUMERO_RECOPI'];
	}

	public function setNumeroRecopiAttribute($numeroRecopi) 
	{
		$this->attributes['NUMERO_RECOPI'] = $numeroRecopi;
	}

    public function getValorUnitarioComercialAttribute() 
	{
		return (double)$this->attributes['VALOR_UNITARIO_COMERCIAL'];
	}

	public function setValorUnitarioComercialAttribute($valorUnitarioComercial) 
	{
		$this->attributes['VALOR_UNITARIO_COMERCIAL'] = $valorUnitarioComercial;
	}

    public function getValorBrutoProdutoAttribute() 
	{
		return (double)$this->attributes['VALOR_BRUTO_PRODUTO'];
	}

	public function setValorBrutoProdutoAttribute($valorBrutoProduto) 
	{
		$this->attributes['VALOR_BRUTO_PRODUTO'] = $valorBrutoProduto;
	}

    public function getGtinUnidadeTributavelAttribute() 
	{
		return $this->attributes['GTIN_UNIDADE_TRIBUTAVEL'];
	}

	public function setGtinUnidadeTributavelAttribute($gtinUnidadeTributavel) 
	{
		$this->attributes['GTIN_UNIDADE_TRIBUTAVEL'] = $gtinUnidadeTributavel;
	}

    public function getUnidadeTributavelAttribute() 
	{
		return $this->attributes['UNIDADE_TRIBUTAVEL'];
	}

	public function setUnidadeTributavelAttribute($unidadeTributavel) 
	{
		$this->attributes['UNIDADE_TRIBUTAVEL'] = $unidadeTributavel;
	}

    public function getQuantidadeTributavelAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_TRIBUTAVEL'];
	}

	public function setQuantidadeTributavelAttribute($quantidadeTributavel) 
	{
		$this->attributes['QUANTIDADE_TRIBUTAVEL'] = $quantidadeTributavel;
	}

    public function getValorUnitarioTributavelAttribute() 
	{
		return (double)$this->attributes['VALOR_UNITARIO_TRIBUTAVEL'];
	}

	public function setValorUnitarioTributavelAttribute($valorUnitarioTributavel) 
	{
		$this->attributes['VALOR_UNITARIO_TRIBUTAVEL'] = $valorUnitarioTributavel;
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

    public function getValorOutrasDespesasAttribute() 
	{
		return (double)$this->attributes['VALOR_OUTRAS_DESPESAS'];
	}

	public function setValorOutrasDespesasAttribute($valorOutrasDespesas) 
	{
		$this->attributes['VALOR_OUTRAS_DESPESAS'] = $valorOutrasDespesas;
	}

    public function getEntraTotalAttribute() 
	{
		return $this->attributes['ENTRA_TOTAL'];
	}

	public function setEntraTotalAttribute($entraTotal) 
	{
		$this->attributes['ENTRA_TOTAL'] = $entraTotal;
	}

    public function getValorTotalTributosAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL_TRIBUTOS'];
	}

	public function setValorTotalTributosAttribute($valorTotalTributos) 
	{
		$this->attributes['VALOR_TOTAL_TRIBUTOS'] = $valorTotalTributos;
	}

    public function getPercentualDevolvidoAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_DEVOLVIDO'];
	}

	public function setPercentualDevolvidoAttribute($percentualDevolvido) 
	{
		$this->attributes['PERCENTUAL_DEVOLVIDO'] = $percentualDevolvido;
	}

    public function getValorIpiDevolvidoAttribute() 
	{
		return (double)$this->attributes['VALOR_IPI_DEVOLVIDO'];
	}

	public function setValorIpiDevolvidoAttribute($valorIpiDevolvido) 
	{
		$this->attributes['VALOR_IPI_DEVOLVIDO'] = $valorIpiDevolvido;
	}

    public function getInformacoesAdicionaisAttribute() 
	{
		return $this->attributes['INFORMACOES_ADICIONAIS'];
	}

	public function setInformacoesAdicionaisAttribute($informacoesAdicionais) 
	{
		$this->attributes['INFORMACOES_ADICIONAIS'] = $informacoesAdicionais;
	}

    public function getValorSubtotalAttribute() 
	{
		return (double)$this->attributes['VALOR_SUBTOTAL'];
	}

	public function setValorSubtotalAttribute($valorSubtotal) 
	{
		$this->attributes['VALOR_SUBTOTAL'] = $valorSubtotal;
	}

    public function getValorTotalAttribute() 
	{
		return (double)$this->attributes['VALOR_TOTAL'];
	}

	public function setValorTotalAttribute($valorTotal) 
	{
		$this->attributes['VALOR_TOTAL'] = $valorTotal;
	}

    public function getCstCofinsAttribute() 
	{
		return $this->attributes['CST_COFINS'];
	}

	public function setCstCofinsAttribute($cstCofins) 
	{
		$this->attributes['CST_COFINS'] = $cstCofins;
	}

    public function getQuantidadeVendidaCofinsAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_VENDIDA_COFINS'];
	}

	public function setQuantidadeVendidaCofinsAttribute($quantidadeVendidaCofins) 
	{
		$this->attributes['QUANTIDADE_VENDIDA_COFINS'] = $quantidadeVendidaCofins;
	}

    public function getBaseCalculoCofinsAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_COFINS'];
	}

	public function setBaseCalculoCofinsAttribute($baseCalculoCofins) 
	{
		$this->attributes['BASE_CALCULO_COFINS'] = $baseCalculoCofins;
	}

    public function getAliquotaCofinsPercentualAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_COFINS_PERCENTUAL'];
	}

	public function setAliquotaCofinsPercentualAttribute($aliquotaCofinsPercentual) 
	{
		$this->attributes['ALIQUOTA_COFINS_PERCENTUAL'] = $aliquotaCofinsPercentual;
	}

    public function getAliquotaCofinsReaisAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_COFINS_REAIS'];
	}

	public function setAliquotaCofinsReaisAttribute($aliquotaCofinsReais) 
	{
		$this->attributes['ALIQUOTA_COFINS_REAIS'] = $aliquotaCofinsReais;
	}

    public function getValorCofinsAttribute() 
	{
		return (double)$this->attributes['VALOR_COFINS'];
	}

	public function setValorCofinsAttribute($valorCofins) 
	{
		$this->attributes['VALOR_COFINS'] = $valorCofins;
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

    public function getValorIcmsAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS'];
	}

	public function setValorIcmsAttribute($valorIcms) 
	{
		$this->attributes['VALOR_ICMS'] = $valorIcms;
	}

    public function getMotivoDesoneracaoIcmsAttribute() 
	{
		return $this->attributes['MOTIVO_DESONERACAO_ICMS'];
	}

	public function setMotivoDesoneracaoIcmsAttribute($motivoDesoneracaoIcms) 
	{
		$this->attributes['MOTIVO_DESONERACAO_ICMS'] = $motivoDesoneracaoIcms;
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

    public function getValorBcIcmsStRetidoAttribute() 
	{
		return (double)$this->attributes['VALOR_BC_ICMS_ST_RETIDO'];
	}

	public function setValorBcIcmsStRetidoAttribute($valorBcIcmsStRetido) 
	{
		$this->attributes['VALOR_BC_ICMS_ST_RETIDO'] = $valorBcIcmsStRetido;
	}

    public function getValorIcmsStRetidoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_ST_RETIDO'];
	}

	public function setValorIcmsStRetidoAttribute($valorIcmsStRetido) 
	{
		$this->attributes['VALOR_ICMS_ST_RETIDO'] = $valorIcmsStRetido;
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

    public function getPercentualBcOperacaoPropriaAttribute() 
	{
		return (double)$this->attributes['PERCENTUAL_BC_OPERACAO_PROPRIA'];
	}

	public function setPercentualBcOperacaoPropriaAttribute($percentualBcOperacaoPropria) 
	{
		$this->attributes['PERCENTUAL_BC_OPERACAO_PROPRIA'] = $percentualBcOperacaoPropria;
	}

    public function getUfStAttribute() 
	{
		return $this->attributes['UF_ST'];
	}

	public function setUfStAttribute($ufSt) 
	{
		$this->attributes['UF_ST'] = $ufSt;
	}

    public function getValorBcIiAttribute() 
	{
		return (double)$this->attributes['VALOR_BC_II'];
	}

	public function setValorBcIiAttribute($valorBcIi) 
	{
		$this->attributes['VALOR_BC_II'] = $valorBcIi;
	}

    public function getValorDespesasAduaneirasAttribute() 
	{
		return (double)$this->attributes['VALOR_DESPESAS_ADUANEIRAS'];
	}

	public function setValorDespesasAduaneirasAttribute($valorDespesasAduaneiras) 
	{
		$this->attributes['VALOR_DESPESAS_ADUANEIRAS'] = $valorDespesasAduaneiras;
	}

    public function getValorImpostoImportacaoAttribute() 
	{
		return (double)$this->attributes['VALOR_IMPOSTO_IMPORTACAO'];
	}

	public function setValorImpostoImportacaoAttribute($valorImpostoImportacao) 
	{
		$this->attributes['VALOR_IMPOSTO_IMPORTACAO'] = $valorImpostoImportacao;
	}

    public function getValorIofAttribute() 
	{
		return (double)$this->attributes['VALOR_IOF'];
	}

	public function setValorIofAttribute($valorIof) 
	{
		$this->attributes['VALOR_IOF'] = $valorIof;
	}

    public function getCnpjProdutorAttribute() 
	{
		return $this->attributes['CNPJ_PRODUTOR'];
	}

	public function setCnpjProdutorAttribute($cnpjProdutor) 
	{
		$this->attributes['CNPJ_PRODUTOR'] = $cnpjProdutor;
	}

    public function getCodigoSeloIpiAttribute() 
	{
		return $this->attributes['CODIGO_SELO_IPI'];
	}

	public function setCodigoSeloIpiAttribute($codigoSeloIpi) 
	{
		$this->attributes['CODIGO_SELO_IPI'] = $codigoSeloIpi;
	}

    public function getQuantidadeSeloIpiAttribute() 
	{
		return $this->attributes['QUANTIDADE_SELO_IPI'];
	}

	public function setQuantidadeSeloIpiAttribute($quantidadeSeloIpi) 
	{
		$this->attributes['QUANTIDADE_SELO_IPI'] = $quantidadeSeloIpi;
	}

    public function getEnquadramentoLegalIpiAttribute() 
	{
		return $this->attributes['ENQUADRAMENTO_LEGAL_IPI'];
	}

	public function setEnquadramentoLegalIpiAttribute($enquadramentoLegalIpi) 
	{
		$this->attributes['ENQUADRAMENTO_LEGAL_IPI'] = $enquadramentoLegalIpi;
	}

    public function getCstIpiAttribute() 
	{
		return $this->attributes['CST_IPI'];
	}

	public function setCstIpiAttribute($cstIpi) 
	{
		$this->attributes['CST_IPI'] = $cstIpi;
	}

    public function getValorBaseCalculoIpiAttribute() 
	{
		return (double)$this->attributes['VALOR_BASE_CALCULO_IPI'];
	}

	public function setValorBaseCalculoIpiAttribute($valorBaseCalculoIpi) 
	{
		$this->attributes['VALOR_BASE_CALCULO_IPI'] = $valorBaseCalculoIpi;
	}

    public function getAliquotaIpiAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_IPI'];
	}

	public function setAliquotaIpiAttribute($aliquotaIpi) 
	{
		$this->attributes['ALIQUOTA_IPI'] = $aliquotaIpi;
	}

    public function getQuantidadeUnidadeTributavelAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_UNIDADE_TRIBUTAVEL'];
	}

	public function setQuantidadeUnidadeTributavelAttribute($quantidadeUnidadeTributavel) 
	{
		$this->attributes['QUANTIDADE_UNIDADE_TRIBUTAVEL'] = $quantidadeUnidadeTributavel;
	}

    public function getValorUnidadeTributavelAttribute() 
	{
		return (double)$this->attributes['VALOR_UNIDADE_TRIBUTAVEL'];
	}

	public function setValorUnidadeTributavelAttribute($valorUnidadeTributavel) 
	{
		$this->attributes['VALOR_UNIDADE_TRIBUTAVEL'] = $valorUnidadeTributavel;
	}

    public function getValorIpiAttribute() 
	{
		return (double)$this->attributes['VALOR_IPI'];
	}

	public function setValorIpiAttribute($valorIpi) 
	{
		$this->attributes['VALOR_IPI'] = $valorIpi;
	}

    public function getBaseCalculoIssqnAttribute() 
	{
		return (double)$this->attributes['BASE_CALCULO_ISSQN'];
	}

	public function setBaseCalculoIssqnAttribute($baseCalculoIssqn) 
	{
		$this->attributes['BASE_CALCULO_ISSQN'] = $baseCalculoIssqn;
	}

    public function getAliquotaIssqnAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_ISSQN'];
	}

	public function setAliquotaIssqnAttribute($aliquotaIssqn) 
	{
		$this->attributes['ALIQUOTA_ISSQN'] = $aliquotaIssqn;
	}

    public function getValorIssqnAttribute() 
	{
		return (double)$this->attributes['VALOR_ISSQN'];
	}

	public function setValorIssqnAttribute($valorIssqn) 
	{
		$this->attributes['VALOR_ISSQN'] = $valorIssqn;
	}

    public function getMunicipioIssqnAttribute() 
	{
		return $this->attributes['MUNICIPIO_ISSQN'];
	}

	public function setMunicipioIssqnAttribute($municipioIssqn) 
	{
		$this->attributes['MUNICIPIO_ISSQN'] = $municipioIssqn;
	}

    public function getItemListaServicosAttribute() 
	{
		return $this->attributes['ITEM_LISTA_SERVICOS'];
	}

	public function setItemListaServicosAttribute($itemListaServicos) 
	{
		$this->attributes['ITEM_LISTA_SERVICOS'] = $itemListaServicos;
	}

    public function getCstPisAttribute() 
	{
		return $this->attributes['CST_PIS'];
	}

	public function setCstPisAttribute($cstPis) 
	{
		$this->attributes['CST_PIS'] = $cstPis;
	}

    public function getQuantidadeVendidaPisAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_VENDIDA_PIS'];
	}

	public function setQuantidadeVendidaPisAttribute($quantidadeVendidaPis) 
	{
		$this->attributes['QUANTIDADE_VENDIDA_PIS'] = $quantidadeVendidaPis;
	}

    public function getValorBaseCalculoPisAttribute() 
	{
		return (double)$this->attributes['VALOR_BASE_CALCULO_PIS'];
	}

	public function setValorBaseCalculoPisAttribute($valorBaseCalculoPis) 
	{
		$this->attributes['VALOR_BASE_CALCULO_PIS'] = $valorBaseCalculoPis;
	}

    public function getAliquotaPisPercentualAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_PIS_PERCENTUAL'];
	}

	public function setAliquotaPisPercentualAttribute($aliquotaPisPercentual) 
	{
		$this->attributes['ALIQUOTA_PIS_PERCENTUAL'] = $aliquotaPisPercentual;
	}

    public function getAliquotaPisReaisAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_PIS_REAIS'];
	}

	public function setAliquotaPisReaisAttribute($aliquotaPisReais) 
	{
		$this->attributes['ALIQUOTA_PIS_REAIS'] = $aliquotaPisReais;
	}

    public function getValorPisAttribute() 
	{
		return (double)$this->attributes['VALOR_PIS'];
	}

	public function setValorPisAttribute($valorPis) 
	{
		$this->attributes['VALOR_PIS'] = $valorPis;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNumeroItemAttribute($objeto->numeroItem);
			$this->setCodigoProdutoAttribute($objeto->codigoProduto);
			$this->setGtinAttribute($objeto->gtin);
			$this->setNomeProdutoAttribute($objeto->nomeProduto);
			$this->setNcmAttribute($objeto->ncm);
			$this->setNveAttribute($objeto->nve);
			$this->setCestAttribute($objeto->cest);
			$this->setIndicadorEscalaRelevanteAttribute($objeto->indicadorEscalaRelevante);
			$this->setCnpjFabricanteAttribute($objeto->cnpjFabricante);
			$this->setCodigoBeneficioFiscalAttribute($objeto->codigoBeneficioFiscal);
			$this->setExTipiAttribute($objeto->exTipi);
			$this->setCfopAttribute($objeto->cfop);
			$this->setUnidadeComercialAttribute($objeto->unidadeComercial);
			$this->setQuantidadeComercialAttribute($objeto->quantidadeComercial);
			$this->setNumeroPedidoCompraAttribute($objeto->numeroPedidoCompra);
			$this->setItemPedidoCompraAttribute($objeto->itemPedidoCompra);
			$this->setNumeroFciAttribute($objeto->numeroFci);
			$this->setNumeroRecopiAttribute($objeto->numeroRecopi);
			$this->setValorUnitarioComercialAttribute($objeto->valorUnitarioComercial);
			$this->setValorBrutoProdutoAttribute($objeto->valorBrutoProduto);
			$this->setGtinUnidadeTributavelAttribute($objeto->gtinUnidadeTributavel);
			$this->setUnidadeTributavelAttribute($objeto->unidadeTributavel);
			$this->setQuantidadeTributavelAttribute($objeto->quantidadeTributavel);
			$this->setValorUnitarioTributavelAttribute($objeto->valorUnitarioTributavel);
			$this->setValorFreteAttribute($objeto->valorFrete);
			$this->setValorSeguroAttribute($objeto->valorSeguro);
			$this->setValorDescontoAttribute($objeto->valorDesconto);
			$this->setValorOutrasDespesasAttribute($objeto->valorOutrasDespesas);
			$this->setEntraTotalAttribute($objeto->entraTotal);
			$this->setValorTotalTributosAttribute($objeto->valorTotalTributos);
			$this->setPercentualDevolvidoAttribute($objeto->percentualDevolvido);
			$this->setValorIpiDevolvidoAttribute($objeto->valorIpiDevolvido);
			$this->setInformacoesAdicionaisAttribute($objeto->informacoesAdicionais);
			$this->setValorSubtotalAttribute($objeto->valorSubtotal);
			$this->setValorTotalAttribute($objeto->valorTotal);
			$this->setCstCofinsAttribute($objeto->cstCofins);
			$this->setQuantidadeVendidaCofinsAttribute($objeto->quantidadeVendidaCofins);
			$this->setBaseCalculoCofinsAttribute($objeto->baseCalculoCofins);
			$this->setAliquotaCofinsPercentualAttribute($objeto->aliquotaCofinsPercentual);
			$this->setAliquotaCofinsReaisAttribute($objeto->aliquotaCofinsReais);
			$this->setValorCofinsAttribute($objeto->valorCofins);
			$this->setOrigemMercadoriaAttribute($objeto->origemMercadoria);
			$this->setCstIcmsAttribute($objeto->cstIcms);
			$this->setCsosnAttribute($objeto->csosn);
			$this->setModalidadeBcIcmsAttribute($objeto->modalidadeBcIcms);
			$this->setPercentualReducaoBcIcmsAttribute($objeto->percentualReducaoBcIcms);
			$this->setValorBcIcmsAttribute($objeto->valorBcIcms);
			$this->setAliquotaIcmsAttribute($objeto->aliquotaIcms);
			$this->setValorIcmsAttribute($objeto->valorIcms);
			$this->setMotivoDesoneracaoIcmsAttribute($objeto->motivoDesoneracaoIcms);
			$this->setModalidadeBcIcmsStAttribute($objeto->modalidadeBcIcmsSt);
			$this->setPercentualMvaIcmsStAttribute($objeto->percentualMvaIcmsSt);
			$this->setPercentualReducaoBcIcmsStAttribute($objeto->percentualReducaoBcIcmsSt);
			$this->setValorBaseCalculoIcmsStAttribute($objeto->valorBaseCalculoIcmsSt);
			$this->setAliquotaIcmsStAttribute($objeto->aliquotaIcmsSt);
			$this->setValorIcmsStAttribute($objeto->valorIcmsSt);
			$this->setValorBcIcmsStRetidoAttribute($objeto->valorBcIcmsStRetido);
			$this->setValorIcmsStRetidoAttribute($objeto->valorIcmsStRetido);
			$this->setValorBcIcmsStDestinoAttribute($objeto->valorBcIcmsStDestino);
			$this->setValorIcmsStDestinoAttribute($objeto->valorIcmsStDestino);
			$this->setAliquotaCreditoIcmsSnAttribute($objeto->aliquotaCreditoIcmsSn);
			$this->setValorCreditoIcmsSnAttribute($objeto->valorCreditoIcmsSn);
			$this->setPercentualBcOperacaoPropriaAttribute($objeto->percentualBcOperacaoPropria);
			$this->setUfStAttribute($objeto->ufSt);
			$this->setValorBcIiAttribute($objeto->valorBcIi);
			$this->setValorDespesasAduaneirasAttribute($objeto->valorDespesasAduaneiras);
			$this->setValorImpostoImportacaoAttribute($objeto->valorImpostoImportacao);
			$this->setValorIofAttribute($objeto->valorIof);
			$this->setCnpjProdutorAttribute($objeto->cnpjProdutor);
			$this->setCodigoSeloIpiAttribute($objeto->codigoSeloIpi);
			$this->setQuantidadeSeloIpiAttribute($objeto->quantidadeSeloIpi);
			$this->setEnquadramentoLegalIpiAttribute($objeto->enquadramentoLegalIpi);
			$this->setCstIpiAttribute($objeto->cstIpi);
			$this->setValorBaseCalculoIpiAttribute($objeto->valorBaseCalculoIpi);
			$this->setAliquotaIpiAttribute($objeto->aliquotaIpi);
			$this->setQuantidadeUnidadeTributavelAttribute($objeto->quantidadeUnidadeTributavel);
			$this->setValorUnidadeTributavelAttribute($objeto->valorUnidadeTributavel);
			$this->setValorIpiAttribute($objeto->valorIpi);
			$this->setBaseCalculoIssqnAttribute($objeto->baseCalculoIssqn);
			$this->setAliquotaIssqnAttribute($objeto->aliquotaIssqn);
			$this->setValorIssqnAttribute($objeto->valorIssqn);
			$this->setMunicipioIssqnAttribute($objeto->municipioIssqn);
			$this->setItemListaServicosAttribute($objeto->itemListaServicos);
			$this->setCstPisAttribute($objeto->cstPis);
			$this->setQuantidadeVendidaPisAttribute($objeto->quantidadeVendidaPis);
			$this->setValorBaseCalculoPisAttribute($objeto->valorBaseCalculoPis);
			$this->setAliquotaPisPercentualAttribute($objeto->aliquotaPisPercentual);
			$this->setAliquotaPisReaisAttribute($objeto->aliquotaPisReais);
			$this->setValorPisAttribute($objeto->valorPis);

			// vincular objetos
			$produto = new Produto();
			$produto->mapear($objeto->produto);
			$this->produto()->associate($produto);

			$tributOperacaoFiscal = new TributOperacaoFiscal();
			$tributOperacaoFiscal->mapear($objeto->tributOperacaoFiscal);
			$this->tributOperacaoFiscal()->associate($tributOperacaoFiscal);

			$produtoUnidade = new ProdutoUnidade();
			$produtoUnidade->mapear($objeto->produtoUnidade);
			$this->produtoUnidade()->associate($produtoUnidade);

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
			'numeroItem' => $this->getNumeroItemAttribute(),
			'codigoProduto' => $this->getCodigoProdutoAttribute(),
			'gtin' => $this->getGtinAttribute(),
			'nomeProduto' => $this->getNomeProdutoAttribute(),
			'ncm' => $this->getNcmAttribute(),
			'nve' => $this->getNveAttribute(),
			'cest' => $this->getCestAttribute(),
			'indicadorEscalaRelevante' => $this->getIndicadorEscalaRelevanteAttribute(),
			'cnpjFabricante' => $this->getCnpjFabricanteAttribute(),
			'codigoBeneficioFiscal' => $this->getCodigoBeneficioFiscalAttribute(),
			'exTipi' => $this->getExTipiAttribute(),
			'cfop' => $this->getCfopAttribute(),
			'unidadeComercial' => $this->getUnidadeComercialAttribute(),
			'quantidadeComercial' => $this->getQuantidadeComercialAttribute(),
			'numeroPedidoCompra' => $this->getNumeroPedidoCompraAttribute(),
			'itemPedidoCompra' => $this->getItemPedidoCompraAttribute(),
			'numeroFci' => $this->getNumeroFciAttribute(),
			'numeroRecopi' => $this->getNumeroRecopiAttribute(),
			'valorUnitarioComercial' => $this->getValorUnitarioComercialAttribute(),
			'valorBrutoProduto' => $this->getValorBrutoProdutoAttribute(),
			'gtinUnidadeTributavel' => $this->getGtinUnidadeTributavelAttribute(),
			'unidadeTributavel' => $this->getUnidadeTributavelAttribute(),
			'quantidadeTributavel' => $this->getQuantidadeTributavelAttribute(),
			'valorUnitarioTributavel' => $this->getValorUnitarioTributavelAttribute(),
			'valorFrete' => $this->getValorFreteAttribute(),
			'valorSeguro' => $this->getValorSeguroAttribute(),
			'valorDesconto' => $this->getValorDescontoAttribute(),
			'valorOutrasDespesas' => $this->getValorOutrasDespesasAttribute(),
			'entraTotal' => $this->getEntraTotalAttribute(),
			'valorTotalTributos' => $this->getValorTotalTributosAttribute(),
			'percentualDevolvido' => $this->getPercentualDevolvidoAttribute(),
			'valorIpiDevolvido' => $this->getValorIpiDevolvidoAttribute(),
			'informacoesAdicionais' => $this->getInformacoesAdicionaisAttribute(),
			'valorSubtotal' => $this->getValorSubtotalAttribute(),
			'valorTotal' => $this->getValorTotalAttribute(),
			'cstCofins' => $this->getCstCofinsAttribute(),
			'quantidadeVendidaCofins' => $this->getQuantidadeVendidaCofinsAttribute(),
			'baseCalculoCofins' => $this->getBaseCalculoCofinsAttribute(),
			'aliquotaCofinsPercentual' => $this->getAliquotaCofinsPercentualAttribute(),
			'aliquotaCofinsReais' => $this->getAliquotaCofinsReaisAttribute(),
			'valorCofins' => $this->getValorCofinsAttribute(),
			'origemMercadoria' => $this->getOrigemMercadoriaAttribute(),
			'cstIcms' => $this->getCstIcmsAttribute(),
			'csosn' => $this->getCsosnAttribute(),
			'modalidadeBcIcms' => $this->getModalidadeBcIcmsAttribute(),
			'percentualReducaoBcIcms' => $this->getPercentualReducaoBcIcmsAttribute(),
			'valorBcIcms' => $this->getValorBcIcmsAttribute(),
			'aliquotaIcms' => $this->getAliquotaIcmsAttribute(),
			'valorIcms' => $this->getValorIcmsAttribute(),
			'motivoDesoneracaoIcms' => $this->getMotivoDesoneracaoIcmsAttribute(),
			'modalidadeBcIcmsSt' => $this->getModalidadeBcIcmsStAttribute(),
			'percentualMvaIcmsSt' => $this->getPercentualMvaIcmsStAttribute(),
			'percentualReducaoBcIcmsSt' => $this->getPercentualReducaoBcIcmsStAttribute(),
			'valorBaseCalculoIcmsSt' => $this->getValorBaseCalculoIcmsStAttribute(),
			'aliquotaIcmsSt' => $this->getAliquotaIcmsStAttribute(),
			'valorIcmsSt' => $this->getValorIcmsStAttribute(),
			'valorBcIcmsStRetido' => $this->getValorBcIcmsStRetidoAttribute(),
			'valorIcmsStRetido' => $this->getValorIcmsStRetidoAttribute(),
			'valorBcIcmsStDestino' => $this->getValorBcIcmsStDestinoAttribute(),
			'valorIcmsStDestino' => $this->getValorIcmsStDestinoAttribute(),
			'aliquotaCreditoIcmsSn' => $this->getAliquotaCreditoIcmsSnAttribute(),
			'valorCreditoIcmsSn' => $this->getValorCreditoIcmsSnAttribute(),
			'percentualBcOperacaoPropria' => $this->getPercentualBcOperacaoPropriaAttribute(),
			'ufSt' => $this->getUfStAttribute(),
			'valorBcIi' => $this->getValorBcIiAttribute(),
			'valorDespesasAduaneiras' => $this->getValorDespesasAduaneirasAttribute(),
			'valorImpostoImportacao' => $this->getValorImpostoImportacaoAttribute(),
			'valorIof' => $this->getValorIofAttribute(),
			'cnpjProdutor' => $this->getCnpjProdutorAttribute(),
			'codigoSeloIpi' => $this->getCodigoSeloIpiAttribute(),
			'quantidadeSeloIpi' => $this->getQuantidadeSeloIpiAttribute(),
			'enquadramentoLegalIpi' => $this->getEnquadramentoLegalIpiAttribute(),
			'cstIpi' => $this->getCstIpiAttribute(),
			'valorBaseCalculoIpi' => $this->getValorBaseCalculoIpiAttribute(),
			'aliquotaIpi' => $this->getAliquotaIpiAttribute(),
			'quantidadeUnidadeTributavel' => $this->getQuantidadeUnidadeTributavelAttribute(),
			'valorUnidadeTributavel' => $this->getValorUnidadeTributavelAttribute(),
			'valorIpi' => $this->getValorIpiAttribute(),
			'baseCalculoIssqn' => $this->getBaseCalculoIssqnAttribute(),
			'aliquotaIssqn' => $this->getAliquotaIssqnAttribute(),
			'valorIssqn' => $this->getValorIssqnAttribute(),
			'municipioIssqn' => $this->getMunicipioIssqnAttribute(),
			'itemListaServicos' => $this->getItemListaServicosAttribute(),
			'cstPis' => $this->getCstPisAttribute(),
			'quantidadeVendidaPis' => $this->getQuantidadeVendidaPisAttribute(),
			'valorBaseCalculoPis' => $this->getValorBaseCalculoPisAttribute(),
			'aliquotaPisPercentual' => $this->getAliquotaPisPercentualAttribute(),
			'aliquotaPisReais' => $this->getAliquotaPisReaisAttribute(),
			'valorPis' => $this->getValorPisAttribute(),
			'produto' => $this->produto,
			'tributOperacaoFiscal' => $this->tributOperacaoFiscal,
			'produtoUnidade' => $this->produtoUnidade,
        ];
    }
}