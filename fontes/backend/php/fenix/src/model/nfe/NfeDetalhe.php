<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_DETALHE] 
                                                                                
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

class NfeDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_DETALHE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['listaNfeDeclaracaoImportacao', 'listaNfeDetEspecificoArmamento', 'nfeDetEspecificoCombustivel', 'nfeDetEspecificoMedicamento', 'nfeDetEspecificoVeiculo', 'nfeDetalheImpostoCofins', 'nfeDetalheImpostoCofinsSt', 'nfeDetalheImpostoIcms', 'nfeDetalheImpostoIcmsUfdest', 'nfeDetalheImpostoIi', 'nfeDetalheImpostoIpi', 'nfeDetalheImpostoIssqn', 'nfeDetalheImpostoPis', 'nfeDetalheImpostoPisSt', 'listaNfeExportacao', 'listaNfeItemRastreado', 'produto', ];
	
    /**
     * Relations
     */
    public function listaNfeDeclaracaoImportacao()
    {
    	return $this->hasMany(NfeDeclaracaoImportacao::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function listaNfeDetEspecificoArmamento()
    {
    	return $this->hasMany(NfeDetEspecificoArmamento::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetEspecificoCombustivel()
    {
    	return $this->hasOne(NfeDetEspecificoCombustivel::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetEspecificoMedicamento()
    {
    	return $this->hasOne(NfeDetEspecificoMedicamento::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetEspecificoVeiculo()
    {
    	return $this->hasOne(NfeDetEspecificoVeiculo::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetalheImpostoCofins()
    {
    	return $this->hasOne(NfeDetalheImpostoCofins::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetalheImpostoCofinsSt()
    {
    	return $this->hasOne(NfeDetalheImpostoCofinsSt::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetalheImpostoIcms()
    {
    	return $this->hasOne(NfeDetalheImpostoIcms::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetalheImpostoIcmsUfdest()
    {
    	return $this->hasOne(NfeDetalheImpostoIcmsUfdest::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetalheImpostoIi()
    {
    	return $this->hasOne(NfeDetalheImpostoIi::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetalheImpostoIpi()
    {
    	return $this->hasOne(NfeDetalheImpostoIpi::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetalheImpostoIssqn()
    {
    	return $this->hasOne(NfeDetalheImpostoIssqn::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetalheImpostoPis()
    {
    	return $this->hasOne(NfeDetalheImpostoPis::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeDetalheImpostoPisSt()
    {
    	return $this->hasOne(NfeDetalheImpostoPisSt::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function listaNfeExportacao()
    {
    	return $this->hasMany(NfeExportacao::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function listaNfeItemRastreado()
    {
    	return $this->hasMany(NfeItemRastreado::class, 'ID_NFE_DETALHE', 'ID');
    }

    public function nfeCabecalho()
    {
    	return $this->belongsTo(NfeCabecalho::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function produto()
    {
    	return $this->belongsTo(Produto::class, 'ID_PRODUTO', 'ID');
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

			// vincular objetos
			$produto = new Produto();
			$produto->mapear($objeto->produto);
			$this->produto()->associate($produto);
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
			'nfeDetEspecificoCombustivel' => $this->nfeDetEspecificoCombustivel,
			'nfeDetEspecificoMedicamento' => $this->nfeDetEspecificoMedicamento,
			'nfeDetEspecificoVeiculo' => $this->nfeDetEspecificoVeiculo,
			'nfeDetalheImpostoCofins' => $this->nfeDetalheImpostoCofins,
			'nfeDetalheImpostoCofinsSt' => $this->nfeDetalheImpostoCofinsSt,
			'nfeDetalheImpostoIcms' => $this->nfeDetalheImpostoIcms,
			'nfeDetalheImpostoIcmsUfdest' => $this->nfeDetalheImpostoIcmsUfdest,
			'nfeDetalheImpostoIi' => $this->nfeDetalheImpostoIi,
			'nfeDetalheImpostoIpi' => $this->nfeDetalheImpostoIpi,
			'nfeDetalheImpostoIssqn' => $this->nfeDetalheImpostoIssqn,
			'nfeDetalheImpostoPis' => $this->nfeDetalheImpostoPis,
			'nfeDetalheImpostoPisSt' => $this->nfeDetalheImpostoPisSt,
			'produto' => $this->produto,
			'listaNfeDeclaracaoImportacao' => $this->listaNfeDeclaracaoImportacao,
			'listaNfeDetEspecificoArmamento' => $this->listaNfeDetEspecificoArmamento,
			'listaNfeExportacao' => $this->listaNfeExportacao,
			'listaNfeItemRastreado' => $this->listaNfeItemRastreado,
        ];
    }
}