<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_NFE_DETALHE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="VIEW_SPED_NFE_DETALHE")
 */
class ViewSpedNfeDetalhe extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_ITEM")
	 */
	private $numeroItem;

	/**
	 * @ORM\Column(type="string", name="CODIGO_PRODUTO")
	 */
	private $codigoProduto;

	/**
	 * @ORM\Column(type="string", name="GTIN")
	 */
	private $gtin;

	/**
	 * @ORM\Column(type="string", name="NOME_PRODUTO")
	 */
	private $nomeProduto;

	/**
	 * @ORM\Column(type="string", name="NCM")
	 */
	private $ncm;

	/**
	 * @ORM\Column(type="string", name="NVE")
	 */
	private $nve;

	/**
	 * @ORM\Column(type="string", name="CEST")
	 */
	private $cest;

	/**
	 * @ORM\Column(type="string", name="INDICADOR_ESCALA_RELEVANTE")
	 */
	private $indicadorEscalaRelevante;

	/**
	 * @ORM\Column(type="string", name="CNPJ_FABRICANTE")
	 */
	private $cnpjFabricante;

	/**
	 * @ORM\Column(type="string", name="CODIGO_BENEFICIO_FISCAL")
	 */
	private $codigoBeneficioFiscal;

	/**
	 * @ORM\Column(type="integer", name="EX_TIPI")
	 */
	private $exTipi;

	/**
	 * @ORM\Column(type="integer", name="CFOP")
	 */
	private $cfop;

	/**
	 * @ORM\Column(type="string", name="UNIDADE_COMERCIAL")
	 */
	private $unidadeComercial;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_COMERCIAL")
	 */
	private $quantidadeComercial;

	/**
	 * @ORM\Column(type="string", name="NUMERO_PEDIDO_COMPRA")
	 */
	private $numeroPedidoCompra;

	/**
	 * @ORM\Column(type="integer", name="ITEM_PEDIDO_COMPRA")
	 */
	private $itemPedidoCompra;

	/**
	 * @ORM\Column(type="string", name="NUMERO_FCI")
	 */
	private $numeroFci;

	/**
	 * @ORM\Column(type="string", name="NUMERO_RECOPI")
	 */
	private $numeroRecopi;

	/**
	 * @ORM\Column(type="float", name="VALOR_UNITARIO_COMERCIAL")
	 */
	private $valorUnitarioComercial;

	/**
	 * @ORM\Column(type="float", name="VALOR_BRUTO_PRODUTO")
	 */
	private $valorBrutoProduto;

	/**
	 * @ORM\Column(type="string", name="GTIN_UNIDADE_TRIBUTAVEL")
	 */
	private $gtinUnidadeTributavel;

	/**
	 * @ORM\Column(type="string", name="UNIDADE_TRIBUTAVEL")
	 */
	private $unidadeTributavel;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_TRIBUTAVEL")
	 */
	private $quantidadeTributavel;

	/**
	 * @ORM\Column(type="float", name="VALOR_UNITARIO_TRIBUTAVEL")
	 */
	private $valorUnitarioTributavel;

	/**
	 * @ORM\Column(type="float", name="VALOR_FRETE")
	 */
	private $valorFrete;

	/**
	 * @ORM\Column(type="float", name="VALOR_SEGURO")
	 */
	private $valorSeguro;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESCONTO")
	 */
	private $valorDesconto;

	/**
	 * @ORM\Column(type="float", name="VALOR_OUTRAS_DESPESAS")
	 */
	private $valorOutrasDespesas;

	/**
	 * @ORM\Column(type="string", name="ENTRA_TOTAL")
	 */
	private $entraTotal;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL_TRIBUTOS")
	 */
	private $valorTotalTributos;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_DEVOLVIDO")
	 */
	private $percentualDevolvido;

	/**
	 * @ORM\Column(type="float", name="VALOR_IPI_DEVOLVIDO")
	 */
	private $valorIpiDevolvido;

	/**
	 * @ORM\Column(type="string", name="INFORMACOES_ADICIONAIS")
	 */
	private $informacoesAdicionais;

	/**
	 * @ORM\Column(type="float", name="VALOR_SUBTOTAL")
	 */
	private $valorSubtotal;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL")
	 */
	private $valorTotal;

	/**
	 * @ORM\Column(type="string", name="CST_COFINS")
	 */
	private $cstCofins;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_VENDIDA_COFINS")
	 */
	private $quantidadeVendidaCofins;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_COFINS")
	 */
	private $baseCalculoCofins;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_COFINS_PERCENTUAL")
	 */
	private $aliquotaCofinsPercentual;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_COFINS_REAIS")
	 */
	private $aliquotaCofinsReais;

	/**
	 * @ORM\Column(type="float", name="VALOR_COFINS")
	 */
	private $valorCofins;

	/**
	 * @ORM\Column(type="string", name="ORIGEM_MERCADORIA")
	 */
	private $origemMercadoria;

	/**
	 * @ORM\Column(type="string", name="CST_ICMS")
	 */
	private $cstIcms;

	/**
	 * @ORM\Column(type="string", name="CSOSN")
	 */
	private $csosn;

	/**
	 * @ORM\Column(type="string", name="MODALIDADE_BC_ICMS")
	 */
	private $modalidadeBcIcms;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_REDUCAO_BC_ICMS")
	 */
	private $percentualReducaoBcIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_ICMS")
	 */
	private $valorBcIcms;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_ICMS")
	 */
	private $aliquotaIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS")
	 */
	private $valorIcms;

	/**
	 * @ORM\Column(type="string", name="MOTIVO_DESONERACAO_ICMS")
	 */
	private $motivoDesoneracaoIcms;

	/**
	 * @ORM\Column(type="string", name="MODALIDADE_BC_ICMS_ST")
	 */
	private $modalidadeBcIcmsSt;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_MVA_ICMS_ST")
	 */
	private $percentualMvaIcmsSt;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_REDUCAO_BC_ICMS_ST")
	 */
	private $percentualReducaoBcIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_BASE_CALCULO_ICMS_ST")
	 */
	private $valorBaseCalculoIcmsSt;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_ICMS_ST")
	 */
	private $aliquotaIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_ST")
	 */
	private $valorIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_ICMS_ST_RETIDO")
	 */
	private $valorBcIcmsStRetido;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_ST_RETIDO")
	 */
	private $valorIcmsStRetido;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_ICMS_ST_DESTINO")
	 */
	private $valorBcIcmsStDestino;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_ST_DESTINO")
	 */
	private $valorIcmsStDestino;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_CREDITO_ICMS_SN")
	 */
	private $aliquotaCreditoIcmsSn;

	/**
	 * @ORM\Column(type="float", name="VALOR_CREDITO_ICMS_SN")
	 */
	private $valorCreditoIcmsSn;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_BC_OPERACAO_PROPRIA")
	 */
	private $percentualBcOperacaoPropria;

	/**
	 * @ORM\Column(type="string", name="UF_ST")
	 */
	private $ufSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_II")
	 */
	private $valorBcIi;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESPESAS_ADUANEIRAS")
	 */
	private $valorDespesasAduaneiras;

	/**
	 * @ORM\Column(type="float", name="VALOR_IMPOSTO_IMPORTACAO")
	 */
	private $valorImpostoImportacao;

	/**
	 * @ORM\Column(type="float", name="VALOR_IOF")
	 */
	private $valorIof;

	/**
	 * @ORM\Column(type="string", name="CNPJ_PRODUTOR")
	 */
	private $cnpjProdutor;

	/**
	 * @ORM\Column(type="string", name="CODIGO_SELO_IPI")
	 */
	private $codigoSeloIpi;

	/**
	 * @ORM\Column(type="integer", name="QUANTIDADE_SELO_IPI")
	 */
	private $quantidadeSeloIpi;

	/**
	 * @ORM\Column(type="string", name="ENQUADRAMENTO_LEGAL_IPI")
	 */
	private $enquadramentoLegalIpi;

	/**
	 * @ORM\Column(type="string", name="CST_IPI")
	 */
	private $cstIpi;

	/**
	 * @ORM\Column(type="float", name="VALOR_BASE_CALCULO_IPI")
	 */
	private $valorBaseCalculoIpi;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_IPI")
	 */
	private $aliquotaIpi;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_UNIDADE_TRIBUTAVEL")
	 */
	private $quantidadeUnidadeTributavel;

	/**
	 * @ORM\Column(type="float", name="VALOR_UNIDADE_TRIBUTAVEL")
	 */
	private $valorUnidadeTributavel;

	/**
	 * @ORM\Column(type="float", name="VALOR_IPI")
	 */
	private $valorIpi;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_ISSQN")
	 */
	private $baseCalculoIssqn;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_ISSQN")
	 */
	private $aliquotaIssqn;

	/**
	 * @ORM\Column(type="float", name="VALOR_ISSQN")
	 */
	private $valorIssqn;

	/**
	 * @ORM\Column(type="integer", name="MUNICIPIO_ISSQN")
	 */
	private $municipioIssqn;

	/**
	 * @ORM\Column(type="integer", name="ITEM_LISTA_SERVICOS")
	 */
	private $itemListaServicos;

	/**
	 * @ORM\Column(type="string", name="CST_PIS")
	 */
	private $cstPis;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_VENDIDA_PIS")
	 */
	private $quantidadeVendidaPis;

	/**
	 * @ORM\Column(type="float", name="VALOR_BASE_CALCULO_PIS")
	 */
	private $valorBaseCalculoPis;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_PIS_PERCENTUAL")
	 */
	private $aliquotaPisPercentual;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_PIS_REAIS")
	 */
	private $aliquotaPisReais;

	/**
	 * @ORM\Column(type="float", name="VALOR_PIS")
	 */
	private $valorPis;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Produto", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_PRODUTO", referencedColumnName="id")
     */
    private $produto;

    /**
     * @ORM\OneToOne(targetEntity="TributOperacaoFiscal", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TRIBUT_OPERACAO_FISCAL", referencedColumnName="id")
     */
    private $tributOperacaoFiscal;

    /**
     * @ORM\OneToOne(targetEntity="ProdutoUnidade", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_PRODUTO_UNIDADE", referencedColumnName="id")
     */
    private $produtoUnidade;

    /**
     * @ORM\ManyToOne(targetEntity="NfeCabecalho", inversedBy="listaViewSpedNfeDetalhe")
     * @ORM\JoinColumn(name="ID_NFE_CABECALHO", referencedColumnName="id")
     */
    private $nfeCabecalho;


    /**
     * Gets e Sets
     */

    public function getId() 
	{
		return $this->id;
	}

	public function setId($id) 
	{
		$this->id = $id;
	}

    public function getNumeroItem() 
	{
		return $this->numeroItem;
	}

	public function setNumeroItem($numeroItem) 
	{
		$this->numeroItem = $numeroItem;
	}

    public function getCodigoProduto() 
	{
		return $this->codigoProduto;
	}

	public function setCodigoProduto($codigoProduto) 
	{
		$this->codigoProduto = $codigoProduto;
	}

    public function getGtin() 
	{
		return $this->gtin;
	}

	public function setGtin($gtin) 
	{
		$this->gtin = $gtin;
	}

    public function getNomeProduto() 
	{
		return $this->nomeProduto;
	}

	public function setNomeProduto($nomeProduto) 
	{
		$this->nomeProduto = $nomeProduto;
	}

    public function getNcm() 
	{
		return $this->ncm;
	}

	public function setNcm($ncm) 
	{
		$this->ncm = $ncm;
	}

    public function getNve() 
	{
		return $this->nve;
	}

	public function setNve($nve) 
	{
		$this->nve = $nve;
	}

    public function getCest() 
	{
		return $this->cest;
	}

	public function setCest($cest) 
	{
		$this->cest = $cest;
	}

    public function getIndicadorEscalaRelevante() 
	{
		return $this->indicadorEscalaRelevante;
	}

	public function setIndicadorEscalaRelevante($indicadorEscalaRelevante) 
	{
		$this->indicadorEscalaRelevante = $indicadorEscalaRelevante;
	}

    public function getCnpjFabricante() 
	{
		return $this->cnpjFabricante;
	}

	public function setCnpjFabricante($cnpjFabricante) 
	{
		$this->cnpjFabricante = $cnpjFabricante;
	}

    public function getCodigoBeneficioFiscal() 
	{
		return $this->codigoBeneficioFiscal;
	}

	public function setCodigoBeneficioFiscal($codigoBeneficioFiscal) 
	{
		$this->codigoBeneficioFiscal = $codigoBeneficioFiscal;
	}

    public function getExTipi() 
	{
		return $this->exTipi;
	}

	public function setExTipi($exTipi) 
	{
		$this->exTipi = $exTipi;
	}

    public function getCfop() 
	{
		return $this->cfop;
	}

	public function setCfop($cfop) 
	{
		$this->cfop = $cfop;
	}

    public function getUnidadeComercial() 
	{
		return $this->unidadeComercial;
	}

	public function setUnidadeComercial($unidadeComercial) 
	{
		$this->unidadeComercial = $unidadeComercial;
	}

    public function getQuantidadeComercial() 
	{
		return $this->quantidadeComercial;
	}

	public function setQuantidadeComercial($quantidadeComercial) 
	{
		$this->quantidadeComercial = $quantidadeComercial;
	}

    public function getNumeroPedidoCompra() 
	{
		return $this->numeroPedidoCompra;
	}

	public function setNumeroPedidoCompra($numeroPedidoCompra) 
	{
		$this->numeroPedidoCompra = $numeroPedidoCompra;
	}

    public function getItemPedidoCompra() 
	{
		return $this->itemPedidoCompra;
	}

	public function setItemPedidoCompra($itemPedidoCompra) 
	{
		$this->itemPedidoCompra = $itemPedidoCompra;
	}

    public function getNumeroFci() 
	{
		return $this->numeroFci;
	}

	public function setNumeroFci($numeroFci) 
	{
		$this->numeroFci = $numeroFci;
	}

    public function getNumeroRecopi() 
	{
		return $this->numeroRecopi;
	}

	public function setNumeroRecopi($numeroRecopi) 
	{
		$this->numeroRecopi = $numeroRecopi;
	}

    public function getValorUnitarioComercial() 
	{
		return $this->valorUnitarioComercial;
	}

	public function setValorUnitarioComercial($valorUnitarioComercial) 
	{
		$this->valorUnitarioComercial = $valorUnitarioComercial;
	}

    public function getValorBrutoProduto() 
	{
		return $this->valorBrutoProduto;
	}

	public function setValorBrutoProduto($valorBrutoProduto) 
	{
		$this->valorBrutoProduto = $valorBrutoProduto;
	}

    public function getGtinUnidadeTributavel() 
	{
		return $this->gtinUnidadeTributavel;
	}

	public function setGtinUnidadeTributavel($gtinUnidadeTributavel) 
	{
		$this->gtinUnidadeTributavel = $gtinUnidadeTributavel;
	}

    public function getUnidadeTributavel() 
	{
		return $this->unidadeTributavel;
	}

	public function setUnidadeTributavel($unidadeTributavel) 
	{
		$this->unidadeTributavel = $unidadeTributavel;
	}

    public function getQuantidadeTributavel() 
	{
		return $this->quantidadeTributavel;
	}

	public function setQuantidadeTributavel($quantidadeTributavel) 
	{
		$this->quantidadeTributavel = $quantidadeTributavel;
	}

    public function getValorUnitarioTributavel() 
	{
		return $this->valorUnitarioTributavel;
	}

	public function setValorUnitarioTributavel($valorUnitarioTributavel) 
	{
		$this->valorUnitarioTributavel = $valorUnitarioTributavel;
	}

    public function getValorFrete() 
	{
		return $this->valorFrete;
	}

	public function setValorFrete($valorFrete) 
	{
		$this->valorFrete = $valorFrete;
	}

    public function getValorSeguro() 
	{
		return $this->valorSeguro;
	}

	public function setValorSeguro($valorSeguro) 
	{
		$this->valorSeguro = $valorSeguro;
	}

    public function getValorDesconto() 
	{
		return $this->valorDesconto;
	}

	public function setValorDesconto($valorDesconto) 
	{
		$this->valorDesconto = $valorDesconto;
	}

    public function getValorOutrasDespesas() 
	{
		return $this->valorOutrasDespesas;
	}

	public function setValorOutrasDespesas($valorOutrasDespesas) 
	{
		$this->valorOutrasDespesas = $valorOutrasDespesas;
	}

    public function getEntraTotal() 
	{
		return $this->entraTotal;
	}

	public function setEntraTotal($entraTotal) 
	{
		$this->entraTotal = $entraTotal;
	}

    public function getValorTotalTributos() 
	{
		return $this->valorTotalTributos;
	}

	public function setValorTotalTributos($valorTotalTributos) 
	{
		$this->valorTotalTributos = $valorTotalTributos;
	}

    public function getPercentualDevolvido() 
	{
		return $this->percentualDevolvido;
	}

	public function setPercentualDevolvido($percentualDevolvido) 
	{
		$this->percentualDevolvido = $percentualDevolvido;
	}

    public function getValorIpiDevolvido() 
	{
		return $this->valorIpiDevolvido;
	}

	public function setValorIpiDevolvido($valorIpiDevolvido) 
	{
		$this->valorIpiDevolvido = $valorIpiDevolvido;
	}

    public function getInformacoesAdicionais() 
	{
		return $this->informacoesAdicionais;
	}

	public function setInformacoesAdicionais($informacoesAdicionais) 
	{
		$this->informacoesAdicionais = $informacoesAdicionais;
	}

    public function getValorSubtotal() 
	{
		return $this->valorSubtotal;
	}

	public function setValorSubtotal($valorSubtotal) 
	{
		$this->valorSubtotal = $valorSubtotal;
	}

    public function getValorTotal() 
	{
		return $this->valorTotal;
	}

	public function setValorTotal($valorTotal) 
	{
		$this->valorTotal = $valorTotal;
	}

    public function getCstCofins() 
	{
		return $this->cstCofins;
	}

	public function setCstCofins($cstCofins) 
	{
		$this->cstCofins = $cstCofins;
	}

    public function getQuantidadeVendidaCofins() 
	{
		return $this->quantidadeVendidaCofins;
	}

	public function setQuantidadeVendidaCofins($quantidadeVendidaCofins) 
	{
		$this->quantidadeVendidaCofins = $quantidadeVendidaCofins;
	}

    public function getBaseCalculoCofins() 
	{
		return $this->baseCalculoCofins;
	}

	public function setBaseCalculoCofins($baseCalculoCofins) 
	{
		$this->baseCalculoCofins = $baseCalculoCofins;
	}

    public function getAliquotaCofinsPercentual() 
	{
		return $this->aliquotaCofinsPercentual;
	}

	public function setAliquotaCofinsPercentual($aliquotaCofinsPercentual) 
	{
		$this->aliquotaCofinsPercentual = $aliquotaCofinsPercentual;
	}

    public function getAliquotaCofinsReais() 
	{
		return $this->aliquotaCofinsReais;
	}

	public function setAliquotaCofinsReais($aliquotaCofinsReais) 
	{
		$this->aliquotaCofinsReais = $aliquotaCofinsReais;
	}

    public function getValorCofins() 
	{
		return $this->valorCofins;
	}

	public function setValorCofins($valorCofins) 
	{
		$this->valorCofins = $valorCofins;
	}

    public function getOrigemMercadoria() 
	{
		return $this->origemMercadoria;
	}

	public function setOrigemMercadoria($origemMercadoria) 
	{
		$this->origemMercadoria = $origemMercadoria;
	}

    public function getCstIcms() 
	{
		return $this->cstIcms;
	}

	public function setCstIcms($cstIcms) 
	{
		$this->cstIcms = $cstIcms;
	}

    public function getCsosn() 
	{
		return $this->csosn;
	}

	public function setCsosn($csosn) 
	{
		$this->csosn = $csosn;
	}

    public function getModalidadeBcIcms() 
	{
		return $this->modalidadeBcIcms;
	}

	public function setModalidadeBcIcms($modalidadeBcIcms) 
	{
		$this->modalidadeBcIcms = $modalidadeBcIcms;
	}

    public function getPercentualReducaoBcIcms() 
	{
		return $this->percentualReducaoBcIcms;
	}

	public function setPercentualReducaoBcIcms($percentualReducaoBcIcms) 
	{
		$this->percentualReducaoBcIcms = $percentualReducaoBcIcms;
	}

    public function getValorBcIcms() 
	{
		return $this->valorBcIcms;
	}

	public function setValorBcIcms($valorBcIcms) 
	{
		$this->valorBcIcms = $valorBcIcms;
	}

    public function getAliquotaIcms() 
	{
		return $this->aliquotaIcms;
	}

	public function setAliquotaIcms($aliquotaIcms) 
	{
		$this->aliquotaIcms = $aliquotaIcms;
	}

    public function getValorIcms() 
	{
		return $this->valorIcms;
	}

	public function setValorIcms($valorIcms) 
	{
		$this->valorIcms = $valorIcms;
	}

    public function getMotivoDesoneracaoIcms() 
	{
		return $this->motivoDesoneracaoIcms;
	}

	public function setMotivoDesoneracaoIcms($motivoDesoneracaoIcms) 
	{
		$this->motivoDesoneracaoIcms = $motivoDesoneracaoIcms;
	}

    public function getModalidadeBcIcmsSt() 
	{
		return $this->modalidadeBcIcmsSt;
	}

	public function setModalidadeBcIcmsSt($modalidadeBcIcmsSt) 
	{
		$this->modalidadeBcIcmsSt = $modalidadeBcIcmsSt;
	}

    public function getPercentualMvaIcmsSt() 
	{
		return $this->percentualMvaIcmsSt;
	}

	public function setPercentualMvaIcmsSt($percentualMvaIcmsSt) 
	{
		$this->percentualMvaIcmsSt = $percentualMvaIcmsSt;
	}

    public function getPercentualReducaoBcIcmsSt() 
	{
		return $this->percentualReducaoBcIcmsSt;
	}

	public function setPercentualReducaoBcIcmsSt($percentualReducaoBcIcmsSt) 
	{
		$this->percentualReducaoBcIcmsSt = $percentualReducaoBcIcmsSt;
	}

    public function getValorBaseCalculoIcmsSt() 
	{
		return $this->valorBaseCalculoIcmsSt;
	}

	public function setValorBaseCalculoIcmsSt($valorBaseCalculoIcmsSt) 
	{
		$this->valorBaseCalculoIcmsSt = $valorBaseCalculoIcmsSt;
	}

    public function getAliquotaIcmsSt() 
	{
		return $this->aliquotaIcmsSt;
	}

	public function setAliquotaIcmsSt($aliquotaIcmsSt) 
	{
		$this->aliquotaIcmsSt = $aliquotaIcmsSt;
	}

    public function getValorIcmsSt() 
	{
		return $this->valorIcmsSt;
	}

	public function setValorIcmsSt($valorIcmsSt) 
	{
		$this->valorIcmsSt = $valorIcmsSt;
	}

    public function getValorBcIcmsStRetido() 
	{
		return $this->valorBcIcmsStRetido;
	}

	public function setValorBcIcmsStRetido($valorBcIcmsStRetido) 
	{
		$this->valorBcIcmsStRetido = $valorBcIcmsStRetido;
	}

    public function getValorIcmsStRetido() 
	{
		return $this->valorIcmsStRetido;
	}

	public function setValorIcmsStRetido($valorIcmsStRetido) 
	{
		$this->valorIcmsStRetido = $valorIcmsStRetido;
	}

    public function getValorBcIcmsStDestino() 
	{
		return $this->valorBcIcmsStDestino;
	}

	public function setValorBcIcmsStDestino($valorBcIcmsStDestino) 
	{
		$this->valorBcIcmsStDestino = $valorBcIcmsStDestino;
	}

    public function getValorIcmsStDestino() 
	{
		return $this->valorIcmsStDestino;
	}

	public function setValorIcmsStDestino($valorIcmsStDestino) 
	{
		$this->valorIcmsStDestino = $valorIcmsStDestino;
	}

    public function getAliquotaCreditoIcmsSn() 
	{
		return $this->aliquotaCreditoIcmsSn;
	}

	public function setAliquotaCreditoIcmsSn($aliquotaCreditoIcmsSn) 
	{
		$this->aliquotaCreditoIcmsSn = $aliquotaCreditoIcmsSn;
	}

    public function getValorCreditoIcmsSn() 
	{
		return $this->valorCreditoIcmsSn;
	}

	public function setValorCreditoIcmsSn($valorCreditoIcmsSn) 
	{
		$this->valorCreditoIcmsSn = $valorCreditoIcmsSn;
	}

    public function getPercentualBcOperacaoPropria() 
	{
		return $this->percentualBcOperacaoPropria;
	}

	public function setPercentualBcOperacaoPropria($percentualBcOperacaoPropria) 
	{
		$this->percentualBcOperacaoPropria = $percentualBcOperacaoPropria;
	}

    public function getUfSt() 
	{
		return $this->ufSt;
	}

	public function setUfSt($ufSt) 
	{
		$this->ufSt = $ufSt;
	}

    public function getValorBcIi() 
	{
		return $this->valorBcIi;
	}

	public function setValorBcIi($valorBcIi) 
	{
		$this->valorBcIi = $valorBcIi;
	}

    public function getValorDespesasAduaneiras() 
	{
		return $this->valorDespesasAduaneiras;
	}

	public function setValorDespesasAduaneiras($valorDespesasAduaneiras) 
	{
		$this->valorDespesasAduaneiras = $valorDespesasAduaneiras;
	}

    public function getValorImpostoImportacao() 
	{
		return $this->valorImpostoImportacao;
	}

	public function setValorImpostoImportacao($valorImpostoImportacao) 
	{
		$this->valorImpostoImportacao = $valorImpostoImportacao;
	}

    public function getValorIof() 
	{
		return $this->valorIof;
	}

	public function setValorIof($valorIof) 
	{
		$this->valorIof = $valorIof;
	}

    public function getCnpjProdutor() 
	{
		return $this->cnpjProdutor;
	}

	public function setCnpjProdutor($cnpjProdutor) 
	{
		$this->cnpjProdutor = $cnpjProdutor;
	}

    public function getCodigoSeloIpi() 
	{
		return $this->codigoSeloIpi;
	}

	public function setCodigoSeloIpi($codigoSeloIpi) 
	{
		$this->codigoSeloIpi = $codigoSeloIpi;
	}

    public function getQuantidadeSeloIpi() 
	{
		return $this->quantidadeSeloIpi;
	}

	public function setQuantidadeSeloIpi($quantidadeSeloIpi) 
	{
		$this->quantidadeSeloIpi = $quantidadeSeloIpi;
	}

    public function getEnquadramentoLegalIpi() 
	{
		return $this->enquadramentoLegalIpi;
	}

	public function setEnquadramentoLegalIpi($enquadramentoLegalIpi) 
	{
		$this->enquadramentoLegalIpi = $enquadramentoLegalIpi;
	}

    public function getCstIpi() 
	{
		return $this->cstIpi;
	}

	public function setCstIpi($cstIpi) 
	{
		$this->cstIpi = $cstIpi;
	}

    public function getValorBaseCalculoIpi() 
	{
		return $this->valorBaseCalculoIpi;
	}

	public function setValorBaseCalculoIpi($valorBaseCalculoIpi) 
	{
		$this->valorBaseCalculoIpi = $valorBaseCalculoIpi;
	}

    public function getAliquotaIpi() 
	{
		return $this->aliquotaIpi;
	}

	public function setAliquotaIpi($aliquotaIpi) 
	{
		$this->aliquotaIpi = $aliquotaIpi;
	}

    public function getQuantidadeUnidadeTributavel() 
	{
		return $this->quantidadeUnidadeTributavel;
	}

	public function setQuantidadeUnidadeTributavel($quantidadeUnidadeTributavel) 
	{
		$this->quantidadeUnidadeTributavel = $quantidadeUnidadeTributavel;
	}

    public function getValorUnidadeTributavel() 
	{
		return $this->valorUnidadeTributavel;
	}

	public function setValorUnidadeTributavel($valorUnidadeTributavel) 
	{
		$this->valorUnidadeTributavel = $valorUnidadeTributavel;
	}

    public function getValorIpi() 
	{
		return $this->valorIpi;
	}

	public function setValorIpi($valorIpi) 
	{
		$this->valorIpi = $valorIpi;
	}

    public function getBaseCalculoIssqn() 
	{
		return $this->baseCalculoIssqn;
	}

	public function setBaseCalculoIssqn($baseCalculoIssqn) 
	{
		$this->baseCalculoIssqn = $baseCalculoIssqn;
	}

    public function getAliquotaIssqn() 
	{
		return $this->aliquotaIssqn;
	}

	public function setAliquotaIssqn($aliquotaIssqn) 
	{
		$this->aliquotaIssqn = $aliquotaIssqn;
	}

    public function getValorIssqn() 
	{
		return $this->valorIssqn;
	}

	public function setValorIssqn($valorIssqn) 
	{
		$this->valorIssqn = $valorIssqn;
	}

    public function getMunicipioIssqn() 
	{
		return $this->municipioIssqn;
	}

	public function setMunicipioIssqn($municipioIssqn) 
	{
		$this->municipioIssqn = $municipioIssqn;
	}

    public function getItemListaServicos() 
	{
		return $this->itemListaServicos;
	}

	public function setItemListaServicos($itemListaServicos) 
	{
		$this->itemListaServicos = $itemListaServicos;
	}

    public function getCstPis() 
	{
		return $this->cstPis;
	}

	public function setCstPis($cstPis) 
	{
		$this->cstPis = $cstPis;
	}

    public function getQuantidadeVendidaPis() 
	{
		return $this->quantidadeVendidaPis;
	}

	public function setQuantidadeVendidaPis($quantidadeVendidaPis) 
	{
		$this->quantidadeVendidaPis = $quantidadeVendidaPis;
	}

    public function getValorBaseCalculoPis() 
	{
		return $this->valorBaseCalculoPis;
	}

	public function setValorBaseCalculoPis($valorBaseCalculoPis) 
	{
		$this->valorBaseCalculoPis = $valorBaseCalculoPis;
	}

    public function getAliquotaPisPercentual() 
	{
		return $this->aliquotaPisPercentual;
	}

	public function setAliquotaPisPercentual($aliquotaPisPercentual) 
	{
		$this->aliquotaPisPercentual = $aliquotaPisPercentual;
	}

    public function getAliquotaPisReais() 
	{
		return $this->aliquotaPisReais;
	}

	public function setAliquotaPisReais($aliquotaPisReais) 
	{
		$this->aliquotaPisReais = $aliquotaPisReais;
	}

    public function getValorPis() 
	{
		return $this->valorPis;
	}

	public function setValorPis($valorPis) 
	{
		$this->valorPis = $valorPis;
	}

    public function getNfeCabecalho(): ?NfeCabecalho 
	{
		return $this->nfeCabecalho;
	}

	public function setNfeCabecalho(?NfeCabecalho $nfeCabecalho) 
	{
		$this->nfeCabecalho = $nfeCabecalho;
	}

    public function getProduto(): ?Produto 
	{
		return $this->produto;
	}

	public function setProduto(?Produto $produto) 
	{
		$this->produto = $produto;
	}

    public function getTributOperacaoFiscal(): ?TributOperacaoFiscal 
	{
		return $this->tributOperacaoFiscal;
	}

	public function setTributOperacaoFiscal(?TributOperacaoFiscal $tributOperacaoFiscal) 
	{
		$this->tributOperacaoFiscal = $tributOperacaoFiscal;
	}

    public function getProdutoUnidade(): ?ProdutoUnidade 
	{
		return $this->produtoUnidade;
	}

	public function setProdutoUnidade(?ProdutoUnidade $produtoUnidade) 
	{
		$this->produtoUnidade = $produtoUnidade;
	}


    /**
     * Constructor
     */
    public function __construct($objetoJson)
    {
        if (isset($objetoJson)) {
            isset($objetoJson->id) ? $this->setId($objetoJson->id) : $this->setId(null);
            $this->mapear($objetoJson);
        }

		
    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setNumeroItem($objeto->numeroItem);
			$this->setCodigoProduto($objeto->codigoProduto);
			$this->setGtin($objeto->gtin);
			$this->setNomeProduto($objeto->nomeProduto);
			$this->setNcm($objeto->ncm);
			$this->setNve($objeto->nve);
			$this->setCest($objeto->cest);
			$this->setIndicadorEscalaRelevante($objeto->indicadorEscalaRelevante);
			$this->setCnpjFabricante($objeto->cnpjFabricante);
			$this->setCodigoBeneficioFiscal($objeto->codigoBeneficioFiscal);
			$this->setExTipi($objeto->exTipi);
			$this->setCfop($objeto->cfop);
			$this->setUnidadeComercial($objeto->unidadeComercial);
			$this->setQuantidadeComercial($objeto->quantidadeComercial);
			$this->setNumeroPedidoCompra($objeto->numeroPedidoCompra);
			$this->setItemPedidoCompra($objeto->itemPedidoCompra);
			$this->setNumeroFci($objeto->numeroFci);
			$this->setNumeroRecopi($objeto->numeroRecopi);
			$this->setValorUnitarioComercial($objeto->valorUnitarioComercial);
			$this->setValorBrutoProduto($objeto->valorBrutoProduto);
			$this->setGtinUnidadeTributavel($objeto->gtinUnidadeTributavel);
			$this->setUnidadeTributavel($objeto->unidadeTributavel);
			$this->setQuantidadeTributavel($objeto->quantidadeTributavel);
			$this->setValorUnitarioTributavel($objeto->valorUnitarioTributavel);
			$this->setValorFrete($objeto->valorFrete);
			$this->setValorSeguro($objeto->valorSeguro);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setValorOutrasDespesas($objeto->valorOutrasDespesas);
			$this->setEntraTotal($objeto->entraTotal);
			$this->setValorTotalTributos($objeto->valorTotalTributos);
			$this->setPercentualDevolvido($objeto->percentualDevolvido);
			$this->setValorIpiDevolvido($objeto->valorIpiDevolvido);
			$this->setInformacoesAdicionais($objeto->informacoesAdicionais);
			$this->setValorSubtotal($objeto->valorSubtotal);
			$this->setValorTotal($objeto->valorTotal);
			$this->setCstCofins($objeto->cstCofins);
			$this->setQuantidadeVendidaCofins($objeto->quantidadeVendidaCofins);
			$this->setBaseCalculoCofins($objeto->baseCalculoCofins);
			$this->setAliquotaCofinsPercentual($objeto->aliquotaCofinsPercentual);
			$this->setAliquotaCofinsReais($objeto->aliquotaCofinsReais);
			$this->setValorCofins($objeto->valorCofins);
			$this->setOrigemMercadoria($objeto->origemMercadoria);
			$this->setCstIcms($objeto->cstIcms);
			$this->setCsosn($objeto->csosn);
			$this->setModalidadeBcIcms($objeto->modalidadeBcIcms);
			$this->setPercentualReducaoBcIcms($objeto->percentualReducaoBcIcms);
			$this->setValorBcIcms($objeto->valorBcIcms);
			$this->setAliquotaIcms($objeto->aliquotaIcms);
			$this->setValorIcms($objeto->valorIcms);
			$this->setMotivoDesoneracaoIcms($objeto->motivoDesoneracaoIcms);
			$this->setModalidadeBcIcmsSt($objeto->modalidadeBcIcmsSt);
			$this->setPercentualMvaIcmsSt($objeto->percentualMvaIcmsSt);
			$this->setPercentualReducaoBcIcmsSt($objeto->percentualReducaoBcIcmsSt);
			$this->setValorBaseCalculoIcmsSt($objeto->valorBaseCalculoIcmsSt);
			$this->setAliquotaIcmsSt($objeto->aliquotaIcmsSt);
			$this->setValorIcmsSt($objeto->valorIcmsSt);
			$this->setValorBcIcmsStRetido($objeto->valorBcIcmsStRetido);
			$this->setValorIcmsStRetido($objeto->valorIcmsStRetido);
			$this->setValorBcIcmsStDestino($objeto->valorBcIcmsStDestino);
			$this->setValorIcmsStDestino($objeto->valorIcmsStDestino);
			$this->setAliquotaCreditoIcmsSn($objeto->aliquotaCreditoIcmsSn);
			$this->setValorCreditoIcmsSn($objeto->valorCreditoIcmsSn);
			$this->setPercentualBcOperacaoPropria($objeto->percentualBcOperacaoPropria);
			$this->setUfSt($objeto->ufSt);
			$this->setValorBcIi($objeto->valorBcIi);
			$this->setValorDespesasAduaneiras($objeto->valorDespesasAduaneiras);
			$this->setValorImpostoImportacao($objeto->valorImpostoImportacao);
			$this->setValorIof($objeto->valorIof);
			$this->setCnpjProdutor($objeto->cnpjProdutor);
			$this->setCodigoSeloIpi($objeto->codigoSeloIpi);
			$this->setQuantidadeSeloIpi($objeto->quantidadeSeloIpi);
			$this->setEnquadramentoLegalIpi($objeto->enquadramentoLegalIpi);
			$this->setCstIpi($objeto->cstIpi);
			$this->setValorBaseCalculoIpi($objeto->valorBaseCalculoIpi);
			$this->setAliquotaIpi($objeto->aliquotaIpi);
			$this->setQuantidadeUnidadeTributavel($objeto->quantidadeUnidadeTributavel);
			$this->setValorUnidadeTributavel($objeto->valorUnidadeTributavel);
			$this->setValorIpi($objeto->valorIpi);
			$this->setBaseCalculoIssqn($objeto->baseCalculoIssqn);
			$this->setAliquotaIssqn($objeto->aliquotaIssqn);
			$this->setValorIssqn($objeto->valorIssqn);
			$this->setMunicipioIssqn($objeto->municipioIssqn);
			$this->setItemListaServicos($objeto->itemListaServicos);
			$this->setCstPis($objeto->cstPis);
			$this->setQuantidadeVendidaPis($objeto->quantidadeVendidaPis);
			$this->setValorBaseCalculoPis($objeto->valorBaseCalculoPis);
			$this->setAliquotaPisPercentual($objeto->aliquotaPisPercentual);
			$this->setAliquotaPisReais($objeto->aliquotaPisReais);
			$this->setValorPis($objeto->valorPis);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'ViewSpedNfeDetalhe');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'numeroItem' => $this->getNumeroItem(),
			'codigoProduto' => $this->getCodigoProduto(),
			'gtin' => $this->getGtin(),
			'nomeProduto' => $this->getNomeProduto(),
			'ncm' => $this->getNcm(),
			'nve' => $this->getNve(),
			'cest' => $this->getCest(),
			'indicadorEscalaRelevante' => $this->getIndicadorEscalaRelevante(),
			'cnpjFabricante' => $this->getCnpjFabricante(),
			'codigoBeneficioFiscal' => $this->getCodigoBeneficioFiscal(),
			'exTipi' => $this->getExTipi(),
			'cfop' => $this->getCfop(),
			'unidadeComercial' => $this->getUnidadeComercial(),
			'quantidadeComercial' => $this->getQuantidadeComercial(),
			'numeroPedidoCompra' => $this->getNumeroPedidoCompra(),
			'itemPedidoCompra' => $this->getItemPedidoCompra(),
			'numeroFci' => $this->getNumeroFci(),
			'numeroRecopi' => $this->getNumeroRecopi(),
			'valorUnitarioComercial' => $this->getValorUnitarioComercial(),
			'valorBrutoProduto' => $this->getValorBrutoProduto(),
			'gtinUnidadeTributavel' => $this->getGtinUnidadeTributavel(),
			'unidadeTributavel' => $this->getUnidadeTributavel(),
			'quantidadeTributavel' => $this->getQuantidadeTributavel(),
			'valorUnitarioTributavel' => $this->getValorUnitarioTributavel(),
			'valorFrete' => $this->getValorFrete(),
			'valorSeguro' => $this->getValorSeguro(),
			'valorDesconto' => $this->getValorDesconto(),
			'valorOutrasDespesas' => $this->getValorOutrasDespesas(),
			'entraTotal' => $this->getEntraTotal(),
			'valorTotalTributos' => $this->getValorTotalTributos(),
			'percentualDevolvido' => $this->getPercentualDevolvido(),
			'valorIpiDevolvido' => $this->getValorIpiDevolvido(),
			'informacoesAdicionais' => $this->getInformacoesAdicionais(),
			'valorSubtotal' => $this->getValorSubtotal(),
			'valorTotal' => $this->getValorTotal(),
			'cstCofins' => $this->getCstCofins(),
			'quantidadeVendidaCofins' => $this->getQuantidadeVendidaCofins(),
			'baseCalculoCofins' => $this->getBaseCalculoCofins(),
			'aliquotaCofinsPercentual' => $this->getAliquotaCofinsPercentual(),
			'aliquotaCofinsReais' => $this->getAliquotaCofinsReais(),
			'valorCofins' => $this->getValorCofins(),
			'origemMercadoria' => $this->getOrigemMercadoria(),
			'cstIcms' => $this->getCstIcms(),
			'csosn' => $this->getCsosn(),
			'modalidadeBcIcms' => $this->getModalidadeBcIcms(),
			'percentualReducaoBcIcms' => $this->getPercentualReducaoBcIcms(),
			'valorBcIcms' => $this->getValorBcIcms(),
			'aliquotaIcms' => $this->getAliquotaIcms(),
			'valorIcms' => $this->getValorIcms(),
			'motivoDesoneracaoIcms' => $this->getMotivoDesoneracaoIcms(),
			'modalidadeBcIcmsSt' => $this->getModalidadeBcIcmsSt(),
			'percentualMvaIcmsSt' => $this->getPercentualMvaIcmsSt(),
			'percentualReducaoBcIcmsSt' => $this->getPercentualReducaoBcIcmsSt(),
			'valorBaseCalculoIcmsSt' => $this->getValorBaseCalculoIcmsSt(),
			'aliquotaIcmsSt' => $this->getAliquotaIcmsSt(),
			'valorIcmsSt' => $this->getValorIcmsSt(),
			'valorBcIcmsStRetido' => $this->getValorBcIcmsStRetido(),
			'valorIcmsStRetido' => $this->getValorIcmsStRetido(),
			'valorBcIcmsStDestino' => $this->getValorBcIcmsStDestino(),
			'valorIcmsStDestino' => $this->getValorIcmsStDestino(),
			'aliquotaCreditoIcmsSn' => $this->getAliquotaCreditoIcmsSn(),
			'valorCreditoIcmsSn' => $this->getValorCreditoIcmsSn(),
			'percentualBcOperacaoPropria' => $this->getPercentualBcOperacaoPropria(),
			'ufSt' => $this->getUfSt(),
			'valorBcIi' => $this->getValorBcIi(),
			'valorDespesasAduaneiras' => $this->getValorDespesasAduaneiras(),
			'valorImpostoImportacao' => $this->getValorImpostoImportacao(),
			'valorIof' => $this->getValorIof(),
			'cnpjProdutor' => $this->getCnpjProdutor(),
			'codigoSeloIpi' => $this->getCodigoSeloIpi(),
			'quantidadeSeloIpi' => $this->getQuantidadeSeloIpi(),
			'enquadramentoLegalIpi' => $this->getEnquadramentoLegalIpi(),
			'cstIpi' => $this->getCstIpi(),
			'valorBaseCalculoIpi' => $this->getValorBaseCalculoIpi(),
			'aliquotaIpi' => $this->getAliquotaIpi(),
			'quantidadeUnidadeTributavel' => $this->getQuantidadeUnidadeTributavel(),
			'valorUnidadeTributavel' => $this->getValorUnidadeTributavel(),
			'valorIpi' => $this->getValorIpi(),
			'baseCalculoIssqn' => $this->getBaseCalculoIssqn(),
			'aliquotaIssqn' => $this->getAliquotaIssqn(),
			'valorIssqn' => $this->getValorIssqn(),
			'municipioIssqn' => $this->getMunicipioIssqn(),
			'itemListaServicos' => $this->getItemListaServicos(),
			'cstPis' => $this->getCstPis(),
			'quantidadeVendidaPis' => $this->getQuantidadeVendidaPis(),
			'valorBaseCalculoPis' => $this->getValorBaseCalculoPis(),
			'aliquotaPisPercentual' => $this->getAliquotaPisPercentual(),
			'aliquotaPisReais' => $this->getAliquotaPisReais(),
			'valorPis' => $this->getValorPis(),
			'produto' => $this->getProduto(),
			'tributOperacaoFiscal' => $this->getTributOperacaoFiscal(),
			'produtoUnidade' => $this->getProdutoUnidade(),
        ];
    }
}
