<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_INFORMACAO_NF_OUTROS] 
                                                                                
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

class CteInformacaoNfOutros extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_INFORMACAO_NF_OUTROS';

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

    public function getIdCteCabecalhoAttribute() 
	{
		return $this->attributes['ID_CTE_CABECALHO'];
	}

	public function setIdCteCabecalhoAttribute($idCteCabecalho) 
	{
		$this->attributes['ID_CTE_CABECALHO'] = $idCteCabecalho;
	}

    public function getNumeroRomaneioAttribute() 
	{
		return $this->attributes['NUMERO_ROMANEIO'];
	}

	public function setNumeroRomaneioAttribute($numeroRomaneio) 
	{
		$this->attributes['NUMERO_ROMANEIO'] = $numeroRomaneio;
	}

    public function getNumeroPedidoAttribute() 
	{
		return $this->attributes['NUMERO_PEDIDO'];
	}

	public function setNumeroPedidoAttribute($numeroPedido) 
	{
		$this->attributes['NUMERO_PEDIDO'] = $numeroPedido;
	}

    public function getChaveAcessoNfeAttribute() 
	{
		return $this->attributes['CHAVE_ACESSO_NFE'];
	}

	public function setChaveAcessoNfeAttribute($chaveAcessoNfe) 
	{
		$this->attributes['CHAVE_ACESSO_NFE'] = $chaveAcessoNfe;
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

    public function getDataEmissaoAttribute() 
	{
		return $this->attributes['DATA_EMISSAO'];
	}

	public function setDataEmissaoAttribute($dataEmissao) 
	{
		$this->attributes['DATA_EMISSAO'] = $dataEmissao;
	}

    public function getUfEmitenteAttribute() 
	{
		return $this->attributes['UF_EMITENTE'];
	}

	public function setUfEmitenteAttribute($ufEmitente) 
	{
		$this->attributes['UF_EMITENTE'] = $ufEmitente;
	}

    public function getBaseCalculoIcmsAttribute() 
	{
		return $this->attributes['BASE_CALCULO_ICMS'];
	}

	public function setBaseCalculoIcmsAttribute($baseCalculoIcms) 
	{
		$this->attributes['BASE_CALCULO_ICMS'] = $baseCalculoIcms;
	}

    public function getValorIcmsAttribute() 
	{
		return $this->attributes['VALOR_ICMS'];
	}

	public function setValorIcmsAttribute($valorIcms) 
	{
		$this->attributes['VALOR_ICMS'] = $valorIcms;
	}

    public function getBaseCalculoIcmsStAttribute() 
	{
		return $this->attributes['BASE_CALCULO_ICMS_ST'];
	}

	public function setBaseCalculoIcmsStAttribute($baseCalculoIcmsSt) 
	{
		$this->attributes['BASE_CALCULO_ICMS_ST'] = $baseCalculoIcmsSt;
	}

    public function getValorIcmsStAttribute() 
	{
		return $this->attributes['VALOR_ICMS_ST'];
	}

	public function setValorIcmsStAttribute($valorIcmsSt) 
	{
		$this->attributes['VALOR_ICMS_ST'] = $valorIcmsSt;
	}

    public function getValorTotalProdutosAttribute() 
	{
		return $this->attributes['VALOR_TOTAL_PRODUTOS'];
	}

	public function setValorTotalProdutosAttribute($valorTotalProdutos) 
	{
		$this->attributes['VALOR_TOTAL_PRODUTOS'] = $valorTotalProdutos;
	}

    public function getValorTotalAttribute() 
	{
		return $this->attributes['VALOR_TOTAL'];
	}

	public function setValorTotalAttribute($valorTotal) 
	{
		$this->attributes['VALOR_TOTAL'] = $valorTotal;
	}

    public function getCfopPredominanteAttribute() 
	{
		return $this->attributes['CFOP_PREDOMINANTE'];
	}

	public function setCfopPredominanteAttribute($cfopPredominante) 
	{
		$this->attributes['CFOP_PREDOMINANTE'] = $cfopPredominante;
	}

    public function getPesoTotalKgAttribute() 
	{
		return $this->attributes['PESO_TOTAL_KG'];
	}

	public function setPesoTotalKgAttribute($pesoTotalKg) 
	{
		$this->attributes['PESO_TOTAL_KG'] = $pesoTotalKg;
	}

    public function getPinSuframaAttribute() 
	{
		return $this->attributes['PIN_SUFRAMA'];
	}

	public function setPinSuframaAttribute($pinSuframa) 
	{
		$this->attributes['PIN_SUFRAMA'] = $pinSuframa;
	}

    public function getDataPrevistaEntregaAttribute() 
	{
		return $this->attributes['DATA_PREVISTA_ENTREGA'];
	}

	public function setDataPrevistaEntregaAttribute($dataPrevistaEntrega) 
	{
		$this->attributes['DATA_PREVISTA_ENTREGA'] = $dataPrevistaEntrega;
	}

    public function getOutroTipoDocOrigAttribute() 
	{
		return $this->attributes['OUTRO_TIPO_DOC_ORIG'];
	}

	public function setOutroTipoDocOrigAttribute($outroTipoDocOrig) 
	{
		$this->attributes['OUTRO_TIPO_DOC_ORIG'] = $outroTipoDocOrig;
	}

    public function getOutroDescricaoAttribute() 
	{
		return $this->attributes['OUTRO_DESCRICAO'];
	}

	public function setOutroDescricaoAttribute($outroDescricao) 
	{
		$this->attributes['OUTRO_DESCRICAO'] = $outroDescricao;
	}

    public function getOutroValorDocumentoAttribute() 
	{
		return $this->attributes['OUTRO_VALOR_DOCUMENTO'];
	}

	public function setOutroValorDocumentoAttribute($outroValorDocumento) 
	{
		$this->attributes['OUTRO_VALOR_DOCUMENTO'] = $outroValorDocumento;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteCabecalhoAttribute($objeto->idCteCabecalho);
			$this->setNumeroRomaneioAttribute($objeto->numeroRomaneio);
			$this->setNumeroPedidoAttribute($objeto->numeroPedido);
			$this->setChaveAcessoNfeAttribute($objeto->chaveAcessoNfe);
			$this->setCodigoModeloAttribute($objeto->codigoModelo);
			$this->setSerieAttribute($objeto->serie);
			$this->setNumeroAttribute($objeto->numero);
			$this->setDataEmissaoAttribute($objeto->dataEmissao);
			$this->setUfEmitenteAttribute($objeto->ufEmitente);
			$this->setBaseCalculoIcmsAttribute($objeto->baseCalculoIcms);
			$this->setValorIcmsAttribute($objeto->valorIcms);
			$this->setBaseCalculoIcmsStAttribute($objeto->baseCalculoIcmsSt);
			$this->setValorIcmsStAttribute($objeto->valorIcmsSt);
			$this->setValorTotalProdutosAttribute($objeto->valorTotalProdutos);
			$this->setValorTotalAttribute($objeto->valorTotal);
			$this->setCfopPredominanteAttribute($objeto->cfopPredominante);
			$this->setPesoTotalKgAttribute($objeto->pesoTotalKg);
			$this->setPinSuframaAttribute($objeto->pinSuframa);
			$this->setDataPrevistaEntregaAttribute($objeto->dataPrevistaEntrega);
			$this->setOutroTipoDocOrigAttribute($objeto->outroTipoDocOrig);
			$this->setOutroDescricaoAttribute($objeto->outroDescricao);
			$this->setOutroValorDocumentoAttribute($objeto->outroValorDocumento);

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
			'idCteCabecalho' => $this->getIdCteCabecalhoAttribute(),
			'numeroRomaneio' => $this->getNumeroRomaneioAttribute(),
			'numeroPedido' => $this->getNumeroPedidoAttribute(),
			'chaveAcessoNfe' => $this->getChaveAcessoNfeAttribute(),
			'codigoModelo' => $this->getCodigoModeloAttribute(),
			'serie' => $this->getSerieAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'dataEmissao' => $this->getDataEmissaoAttribute(),
			'ufEmitente' => $this->getUfEmitenteAttribute(),
			'baseCalculoIcms' => $this->getBaseCalculoIcmsAttribute(),
			'valorIcms' => $this->getValorIcmsAttribute(),
			'baseCalculoIcmsSt' => $this->getBaseCalculoIcmsStAttribute(),
			'valorIcmsSt' => $this->getValorIcmsStAttribute(),
			'valorTotalProdutos' => $this->getValorTotalProdutosAttribute(),
			'valorTotal' => $this->getValorTotalAttribute(),
			'cfopPredominante' => $this->getCfopPredominanteAttribute(),
			'pesoTotalKg' => $this->getPesoTotalKgAttribute(),
			'pinSuframa' => $this->getPinSuframaAttribute(),
			'dataPrevistaEntrega' => $this->getDataPrevistaEntregaAttribute(),
			'outroTipoDocOrig' => $this->getOutroTipoDocOrigAttribute(),
			'outroDescricao' => $this->getOutroDescricaoAttribute(),
			'outroValorDocumento' => $this->getOutroValorDocumentoAttribute(),
        ];
    }
}