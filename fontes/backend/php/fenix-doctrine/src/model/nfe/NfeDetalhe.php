<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE] 
                                                                                
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
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 * @ORM\Table(name="NFE_DETALHE")
 */
class NfeDetalhe extends ModelBase implements \JsonSerializable
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
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeDetEspecificoCombustivel", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetEspecificoCombustivel;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetEspecificoMedicamento", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetEspecificoMedicamento;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetEspecificoVeiculo", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetEspecificoVeiculo;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetalheImpostoCofins", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetalheImpostoCofins;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetalheImpostoCofinsSt", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetalheImpostoCofinsSt;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetalheImpostoIcms", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetalheImpostoIcms;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetalheImpostoIcmsUfdest", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetalheImpostoIcmsUfdest;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetalheImpostoIi", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetalheImpostoIi;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetalheImpostoIpi", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetalheImpostoIpi;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetalheImpostoIssqn", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetalheImpostoIssqn;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetalheImpostoPis", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetalheImpostoPis;

    /**
     * @ORM\OneToOne(targetEntity="NfeDetalheImpostoPisSt", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $nfeDetalheImpostoPisSt;

    /**
     * @ORM\OneToOne(targetEntity="Produto", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_PRODUTO", referencedColumnName="id")
     */
    private $produto;

    /**
     * @ORM\OneToMany(targetEntity="NfeDeclaracaoImportacao", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $listaNfeDeclaracaoImportacao;

    /**
     * @ORM\OneToMany(targetEntity="NfeDetEspecificoArmamento", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $listaNfeDetEspecificoArmamento;

    /**
     * @ORM\OneToMany(targetEntity="NfeExportacao", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $listaNfeExportacao;

    /**
     * @ORM\OneToMany(targetEntity="NfeItemRastreado", mappedBy="nfeDetalhe", cascade={"persist", "remove"})
     */
    private $listaNfeItemRastreado;

    /**
     * @ORM\ManyToOne(targetEntity="NfeCabecalho", inversedBy="listaNfeDetalhe")
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

    public function getNfeDetEspecificoCombustivel(): ?NfeDetEspecificoCombustivel 
	{
		return $this->nfeDetEspecificoCombustivel;
	}

	public function setNfeDetEspecificoCombustivel(?NfeDetEspecificoCombustivel $nfeDetEspecificoCombustivel) 
	{
		$this->nfeDetEspecificoCombustivel = $nfeDetEspecificoCombustivel;
	}

    public function getNfeDetEspecificoMedicamento(): ?NfeDetEspecificoMedicamento 
	{
		return $this->nfeDetEspecificoMedicamento;
	}

	public function setNfeDetEspecificoMedicamento(?NfeDetEspecificoMedicamento $nfeDetEspecificoMedicamento) 
	{
		$this->nfeDetEspecificoMedicamento = $nfeDetEspecificoMedicamento;
	}

    public function getNfeDetEspecificoVeiculo(): ?NfeDetEspecificoVeiculo 
	{
		return $this->nfeDetEspecificoVeiculo;
	}

	public function setNfeDetEspecificoVeiculo(?NfeDetEspecificoVeiculo $nfeDetEspecificoVeiculo) 
	{
		$this->nfeDetEspecificoVeiculo = $nfeDetEspecificoVeiculo;
	}

    public function getNfeDetalheImpostoCofins(): ?NfeDetalheImpostoCofins 
	{
		return $this->nfeDetalheImpostoCofins;
	}

	public function setNfeDetalheImpostoCofins(?NfeDetalheImpostoCofins $nfeDetalheImpostoCofins) 
	{
		$this->nfeDetalheImpostoCofins = $nfeDetalheImpostoCofins;
	}

    public function getNfeDetalheImpostoCofinsSt(): ?NfeDetalheImpostoCofinsSt 
	{
		return $this->nfeDetalheImpostoCofinsSt;
	}

	public function setNfeDetalheImpostoCofinsSt(?NfeDetalheImpostoCofinsSt $nfeDetalheImpostoCofinsSt) 
	{
		$this->nfeDetalheImpostoCofinsSt = $nfeDetalheImpostoCofinsSt;
	}

    public function getNfeDetalheImpostoIcms(): ?NfeDetalheImpostoIcms 
	{
		return $this->nfeDetalheImpostoIcms;
	}

	public function setNfeDetalheImpostoIcms(?NfeDetalheImpostoIcms $nfeDetalheImpostoIcms) 
	{
		$this->nfeDetalheImpostoIcms = $nfeDetalheImpostoIcms;
	}

    public function getNfeDetalheImpostoIcmsUfdest(): ?NfeDetalheImpostoIcmsUfdest 
	{
		return $this->nfeDetalheImpostoIcmsUfdest;
	}

	public function setNfeDetalheImpostoIcmsUfdest(?NfeDetalheImpostoIcmsUfdest $nfeDetalheImpostoIcmsUfdest) 
	{
		$this->nfeDetalheImpostoIcmsUfdest = $nfeDetalheImpostoIcmsUfdest;
	}

    public function getNfeDetalheImpostoIi(): ?NfeDetalheImpostoIi 
	{
		return $this->nfeDetalheImpostoIi;
	}

	public function setNfeDetalheImpostoIi(?NfeDetalheImpostoIi $nfeDetalheImpostoIi) 
	{
		$this->nfeDetalheImpostoIi = $nfeDetalheImpostoIi;
	}

    public function getNfeDetalheImpostoIpi(): ?NfeDetalheImpostoIpi 
	{
		return $this->nfeDetalheImpostoIpi;
	}

	public function setNfeDetalheImpostoIpi(?NfeDetalheImpostoIpi $nfeDetalheImpostoIpi) 
	{
		$this->nfeDetalheImpostoIpi = $nfeDetalheImpostoIpi;
	}

    public function getNfeDetalheImpostoIssqn(): ?NfeDetalheImpostoIssqn 
	{
		return $this->nfeDetalheImpostoIssqn;
	}

	public function setNfeDetalheImpostoIssqn(?NfeDetalheImpostoIssqn $nfeDetalheImpostoIssqn) 
	{
		$this->nfeDetalheImpostoIssqn = $nfeDetalheImpostoIssqn;
	}

    public function getNfeDetalheImpostoPis(): ?NfeDetalheImpostoPis 
	{
		return $this->nfeDetalheImpostoPis;
	}

	public function setNfeDetalheImpostoPis(?NfeDetalheImpostoPis $nfeDetalheImpostoPis) 
	{
		$this->nfeDetalheImpostoPis = $nfeDetalheImpostoPis;
	}

    public function getNfeDetalheImpostoPisSt(): ?NfeDetalheImpostoPisSt 
	{
		return $this->nfeDetalheImpostoPisSt;
	}

	public function setNfeDetalheImpostoPisSt(?NfeDetalheImpostoPisSt $nfeDetalheImpostoPisSt) 
	{
		$this->nfeDetalheImpostoPisSt = $nfeDetalheImpostoPisSt;
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

    public function getListaNfeDeclaracaoImportacao() 
	{
		return $this->listaNfeDeclaracaoImportacao->toArray();
	}

	public function setListaNfeDeclaracaoImportacao(array $listaNfeDeclaracaoImportacao) {
		$this->listaNfeDeclaracaoImportacao = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeDeclaracaoImportacao); $i++) {
			$nfeDeclaracaoImportacao = $listaNfeDeclaracaoImportacao[$i];
			$nfeDeclaracaoImportacao->setNfeDetalhe($this);
			$this->listaNfeDeclaracaoImportacao->add($nfeDeclaracaoImportacao);
		}
	}

    public function getListaNfeDetEspecificoArmamento() 
	{
		return $this->listaNfeDetEspecificoArmamento->toArray();
	}

	public function setListaNfeDetEspecificoArmamento(array $listaNfeDetEspecificoArmamento) {
		$this->listaNfeDetEspecificoArmamento = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeDetEspecificoArmamento); $i++) {
			$nfeDetEspecificoArmamento = $listaNfeDetEspecificoArmamento[$i];
			$nfeDetEspecificoArmamento->setNfeDetalhe($this);
			$this->listaNfeDetEspecificoArmamento->add($nfeDetEspecificoArmamento);
		}
	}

    public function getListaNfeExportacao() 
	{
		return $this->listaNfeExportacao->toArray();
	}

	public function setListaNfeExportacao(array $listaNfeExportacao) {
		$this->listaNfeExportacao = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeExportacao); $i++) {
			$nfeExportacao = $listaNfeExportacao[$i];
			$nfeExportacao->setNfeDetalhe($this);
			$this->listaNfeExportacao->add($nfeExportacao);
		}
	}

    public function getListaNfeItemRastreado() 
	{
		return $this->listaNfeItemRastreado->toArray();
	}

	public function setListaNfeItemRastreado(array $listaNfeItemRastreado) {
		$this->listaNfeItemRastreado = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeItemRastreado); $i++) {
			$nfeItemRastreado = $listaNfeItemRastreado[$i];
			$nfeItemRastreado->setNfeDetalhe($this);
			$this->listaNfeItemRastreado->add($nfeItemRastreado);
		}
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

		if (isset($objetoJson->nfeDetEspecificoCombustivel)) {
			$this->setNfeDetEspecificoCombustivel(new NfeDetEspecificoCombustivel($objetoJson->nfeDetEspecificoCombustivel));
			$this->getNfeDetEspecificoCombustivel()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetEspecificoMedicamento)) {
			$this->setNfeDetEspecificoMedicamento(new NfeDetEspecificoMedicamento($objetoJson->nfeDetEspecificoMedicamento));
			$this->getNfeDetEspecificoMedicamento()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetEspecificoVeiculo)) {
			$this->setNfeDetEspecificoVeiculo(new NfeDetEspecificoVeiculo($objetoJson->nfeDetEspecificoVeiculo));
			$this->getNfeDetEspecificoVeiculo()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetalheImpostoCofins)) {
			$this->setNfeDetalheImpostoCofins(new NfeDetalheImpostoCofins($objetoJson->nfeDetalheImpostoCofins));
			$this->getNfeDetalheImpostoCofins()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetalheImpostoCofinsSt)) {
			$this->setNfeDetalheImpostoCofinsSt(new NfeDetalheImpostoCofinsSt($objetoJson->nfeDetalheImpostoCofinsSt));
			$this->getNfeDetalheImpostoCofinsSt()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetalheImpostoIcms)) {
			$this->setNfeDetalheImpostoIcms(new NfeDetalheImpostoIcms($objetoJson->nfeDetalheImpostoIcms));
			$this->getNfeDetalheImpostoIcms()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetalheImpostoIcmsUfdest)) {
			$this->setNfeDetalheImpostoIcmsUfdest(new NfeDetalheImpostoIcmsUfdest($objetoJson->nfeDetalheImpostoIcmsUfdest));
			$this->getNfeDetalheImpostoIcmsUfdest()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetalheImpostoIi)) {
			$this->setNfeDetalheImpostoIi(new NfeDetalheImpostoIi($objetoJson->nfeDetalheImpostoIi));
			$this->getNfeDetalheImpostoIi()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetalheImpostoIpi)) {
			$this->setNfeDetalheImpostoIpi(new NfeDetalheImpostoIpi($objetoJson->nfeDetalheImpostoIpi));
			$this->getNfeDetalheImpostoIpi()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetalheImpostoIssqn)) {
			$this->setNfeDetalheImpostoIssqn(new NfeDetalheImpostoIssqn($objetoJson->nfeDetalheImpostoIssqn));
			$this->getNfeDetalheImpostoIssqn()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetalheImpostoPis)) {
			$this->setNfeDetalheImpostoPis(new NfeDetalheImpostoPis($objetoJson->nfeDetalheImpostoPis));
			$this->getNfeDetalheImpostoPis()->setNfeDetalhe($this);
		}

		if (isset($objetoJson->nfeDetalheImpostoPisSt)) {
			$this->setNfeDetalheImpostoPisSt(new NfeDetalheImpostoPisSt($objetoJson->nfeDetalheImpostoPisSt));
			$this->getNfeDetalheImpostoPisSt()->setNfeDetalhe($this);
		}

		
		$this->listaNfeDeclaracaoImportacao = new ArrayCollection();
		$listaNfeDeclaracaoImportacaoJson = $objetoJson->listaNfeDeclaracaoImportacao;
		if ($listaNfeDeclaracaoImportacaoJson != null) {
			for ($i = 0; $i < count($listaNfeDeclaracaoImportacaoJson); $i++) {
				$objeto = new NfeDeclaracaoImportacao($listaNfeDeclaracaoImportacaoJson[$i]);
				$objeto->setNfeDetalhe($this);
				$this->listaNfeDeclaracaoImportacao->add($objeto);
			}
		}

		$this->listaNfeDetEspecificoArmamento = new ArrayCollection();
		$listaNfeDetEspecificoArmamentoJson = $objetoJson->listaNfeDetEspecificoArmamento;
		if ($listaNfeDetEspecificoArmamentoJson != null) {
			for ($i = 0; $i < count($listaNfeDetEspecificoArmamentoJson); $i++) {
				$objeto = new NfeDetEspecificoArmamento($listaNfeDetEspecificoArmamentoJson[$i]);
				$objeto->setNfeDetalhe($this);
				$this->listaNfeDetEspecificoArmamento->add($objeto);
			}
		}

		$this->listaNfeExportacao = new ArrayCollection();
		$listaNfeExportacaoJson = $objetoJson->listaNfeExportacao;
		if ($listaNfeExportacaoJson != null) {
			for ($i = 0; $i < count($listaNfeExportacaoJson); $i++) {
				$objeto = new NfeExportacao($listaNfeExportacaoJson[$i]);
				$objeto->setNfeDetalhe($this);
				$this->listaNfeExportacao->add($objeto);
			}
		}

		$this->listaNfeItemRastreado = new ArrayCollection();
		$listaNfeItemRastreadoJson = $objetoJson->listaNfeItemRastreado;
		if ($listaNfeItemRastreadoJson != null) {
			for ($i = 0; $i < count($listaNfeItemRastreadoJson); $i++) {
				$objeto = new NfeItemRastreado($listaNfeItemRastreadoJson[$i]);
				$objeto->setNfeDetalhe($this);
				$this->listaNfeItemRastreado->add($objeto);
			}
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
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetalhe');
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
			'nfeDetEspecificoCombustivel' => $this->getNfeDetEspecificoCombustivel(),
			'nfeDetEspecificoMedicamento' => $this->getNfeDetEspecificoMedicamento(),
			'nfeDetEspecificoVeiculo' => $this->getNfeDetEspecificoVeiculo(),
			'nfeDetalheImpostoCofins' => $this->getNfeDetalheImpostoCofins(),
			'nfeDetalheImpostoCofinsSt' => $this->getNfeDetalheImpostoCofinsSt(),
			'nfeDetalheImpostoIcms' => $this->getNfeDetalheImpostoIcms(),
			'nfeDetalheImpostoIcmsUfdest' => $this->getNfeDetalheImpostoIcmsUfdest(),
			'nfeDetalheImpostoIi' => $this->getNfeDetalheImpostoIi(),
			'nfeDetalheImpostoIpi' => $this->getNfeDetalheImpostoIpi(),
			'nfeDetalheImpostoIssqn' => $this->getNfeDetalheImpostoIssqn(),
			'nfeDetalheImpostoPis' => $this->getNfeDetalheImpostoPis(),
			'nfeDetalheImpostoPisSt' => $this->getNfeDetalheImpostoPisSt(),
			'produto' => $this->getProduto(),
			'listaNfeDeclaracaoImportacao' => $this->getListaNfeDeclaracaoImportacao(),
			'listaNfeDetEspecificoArmamento' => $this->getListaNfeDetEspecificoArmamento(),
			'listaNfeExportacao' => $this->getListaNfeExportacao(),
			'listaNfeItemRastreado' => $this->getListaNfeItemRastreado(),
        ];
    }
}
