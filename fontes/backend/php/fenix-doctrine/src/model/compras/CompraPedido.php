<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_PEDIDO] 
                                                                                
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
 * @ORM\Table(name="COMPRA_PEDIDO")
 */
class CompraPedido extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="date", name="DATA_PEDIDO")
	 */
	private $dataPedido;

	/**
	 * @ORM\Column(type="date", name="DATA_PREVISTA_ENTREGA")
	 */
	private $dataPrevistaEntrega;

	/**
	 * @ORM\Column(type="date", name="DATA_PREVISAO_PAGAMENTO")
	 */
	private $dataPrevisaoPagamento;

	/**
	 * @ORM\Column(type="string", name="LOCAL_ENTREGA")
	 */
	private $localEntrega;

	/**
	 * @ORM\Column(type="string", name="LOCAL_COBRANCA")
	 */
	private $localCobranca;

	/**
	 * @ORM\Column(type="string", name="CONTATO")
	 */
	private $contato;

	/**
	 * @ORM\Column(type="float", name="VALOR_SUBTOTAL")
	 */
	private $valorSubtotal;

	/**
	 * @ORM\Column(type="float", name="TAXA_DESCONTO")
	 */
	private $taxaDesconto;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESCONTO")
	 */
	private $valorDesconto;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL")
	 */
	private $valorTotal;

	/**
	 * @ORM\Column(type="string", name="TIPO_FRETE")
	 */
	private $tipoFrete;

	/**
	 * @ORM\Column(type="string", name="FORMA_PAGAMENTO")
	 */
	private $formaPagamento;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_ICMS")
	 */
	private $baseCalculoIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS")
	 */
	private $valorIcms;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_ICMS_ST")
	 */
	private $baseCalculoIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_ST")
	 */
	private $valorIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL_PRODUTOS")
	 */
	private $valorTotalProdutos;

	/**
	 * @ORM\Column(type="float", name="VALOR_FRETE")
	 */
	private $valorFrete;

	/**
	 * @ORM\Column(type="float", name="VALOR_SEGURO")
	 */
	private $valorSeguro;

	/**
	 * @ORM\Column(type="float", name="VALOR_OUTRAS_DESPESAS")
	 */
	private $valorOutrasDespesas;

	/**
	 * @ORM\Column(type="float", name="VALOR_IPI")
	 */
	private $valorIpi;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL_NF")
	 */
	private $valorTotalNf;

	/**
	 * @ORM\Column(type="integer", name="QUANTIDADE_PARCELAS")
	 */
	private $quantidadeParcelas;

	/**
	 * @ORM\Column(type="string", name="DIA_PRIMEIRO_VENCIMENTO")
	 */
	private $diaPrimeiroVencimento;

	/**
	 * @ORM\Column(type="integer", name="INTERVALO_ENTRE_PARCELAS")
	 */
	private $intervaloEntreParcelas;

	/**
	 * @ORM\Column(type="string", name="DIA_FIXO_PARCELA")
	 */
	private $diaFixoParcela;

	/**
	 * @ORM\Column(type="string", name="CODIGO_COTACAO")
	 */
	private $codigoCotacao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="CompraTipoPedido", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COMPRA_TIPO_PEDIDO", referencedColumnName="id")
     */
    private $compraTipoPedido;

    /**
     * @ORM\OneToOne(targetEntity="Fornecedor", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_FORNECEDOR", referencedColumnName="id")
     */
    private $fornecedor;

    /**
     * @ORM\OneToOne(targetEntity="Colaborador", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COLABORADOR", referencedColumnName="id")
     */
    private $colaborador;

    /**
     * @ORM\OneToMany(targetEntity="CompraPedidoDetalhe", mappedBy="compraPedido", cascade={"persist", "remove"})
     */
    private $listaCompraPedidoDetalhe;


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

    public function getDataPedido() 
	{
		if ($this->dataPedido != null) {
			return $this->dataPedido->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataPedido($dataPedido) 
	{
		$this->dataPedido = $dataPedido != null ? new \DateTime($dataPedido) : null;
	}

    public function getDataPrevistaEntrega() 
	{
		if ($this->dataPrevistaEntrega != null) {
			return $this->dataPrevistaEntrega->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataPrevistaEntrega($dataPrevistaEntrega) 
	{
		$this->dataPrevistaEntrega = $dataPrevistaEntrega != null ? new \DateTime($dataPrevistaEntrega) : null;
	}

    public function getDataPrevisaoPagamento() 
	{
		if ($this->dataPrevisaoPagamento != null) {
			return $this->dataPrevisaoPagamento->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataPrevisaoPagamento($dataPrevisaoPagamento) 
	{
		$this->dataPrevisaoPagamento = $dataPrevisaoPagamento != null ? new \DateTime($dataPrevisaoPagamento) : null;
	}

    public function getLocalEntrega() 
	{
		return $this->localEntrega;
	}

	public function setLocalEntrega($localEntrega) 
	{
		$this->localEntrega = $localEntrega;
	}

    public function getLocalCobranca() 
	{
		return $this->localCobranca;
	}

	public function setLocalCobranca($localCobranca) 
	{
		$this->localCobranca = $localCobranca;
	}

    public function getContato() 
	{
		return $this->contato;
	}

	public function setContato($contato) 
	{
		$this->contato = $contato;
	}

    public function getValorSubtotal() 
	{
		return $this->valorSubtotal;
	}

	public function setValorSubtotal($valorSubtotal) 
	{
		$this->valorSubtotal = $valorSubtotal;
	}

    public function getTaxaDesconto() 
	{
		return $this->taxaDesconto;
	}

	public function setTaxaDesconto($taxaDesconto) 
	{
		$this->taxaDesconto = $taxaDesconto;
	}

    public function getValorDesconto() 
	{
		return $this->valorDesconto;
	}

	public function setValorDesconto($valorDesconto) 
	{
		$this->valorDesconto = $valorDesconto;
	}

    public function getValorTotal() 
	{
		return $this->valorTotal;
	}

	public function setValorTotal($valorTotal) 
	{
		$this->valorTotal = $valorTotal;
	}

    public function getTipoFrete() 
	{
		return $this->tipoFrete;
	}

	public function setTipoFrete($tipoFrete) 
	{
		$this->tipoFrete = $tipoFrete;
	}

    public function getFormaPagamento() 
	{
		return $this->formaPagamento;
	}

	public function setFormaPagamento($formaPagamento) 
	{
		$this->formaPagamento = $formaPagamento;
	}

    public function getBaseCalculoIcms() 
	{
		return $this->baseCalculoIcms;
	}

	public function setBaseCalculoIcms($baseCalculoIcms) 
	{
		$this->baseCalculoIcms = $baseCalculoIcms;
	}

    public function getValorIcms() 
	{
		return $this->valorIcms;
	}

	public function setValorIcms($valorIcms) 
	{
		$this->valorIcms = $valorIcms;
	}

    public function getBaseCalculoIcmsSt() 
	{
		return $this->baseCalculoIcmsSt;
	}

	public function setBaseCalculoIcmsSt($baseCalculoIcmsSt) 
	{
		$this->baseCalculoIcmsSt = $baseCalculoIcmsSt;
	}

    public function getValorIcmsSt() 
	{
		return $this->valorIcmsSt;
	}

	public function setValorIcmsSt($valorIcmsSt) 
	{
		$this->valorIcmsSt = $valorIcmsSt;
	}

    public function getValorTotalProdutos() 
	{
		return $this->valorTotalProdutos;
	}

	public function setValorTotalProdutos($valorTotalProdutos) 
	{
		$this->valorTotalProdutos = $valorTotalProdutos;
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

    public function getValorOutrasDespesas() 
	{
		return $this->valorOutrasDespesas;
	}

	public function setValorOutrasDespesas($valorOutrasDespesas) 
	{
		$this->valorOutrasDespesas = $valorOutrasDespesas;
	}

    public function getValorIpi() 
	{
		return $this->valorIpi;
	}

	public function setValorIpi($valorIpi) 
	{
		$this->valorIpi = $valorIpi;
	}

    public function getValorTotalNf() 
	{
		return $this->valorTotalNf;
	}

	public function setValorTotalNf($valorTotalNf) 
	{
		$this->valorTotalNf = $valorTotalNf;
	}

    public function getQuantidadeParcelas() 
	{
		return $this->quantidadeParcelas;
	}

	public function setQuantidadeParcelas($quantidadeParcelas) 
	{
		$this->quantidadeParcelas = $quantidadeParcelas;
	}

    public function getDiaPrimeiroVencimento() 
	{
		return $this->diaPrimeiroVencimento;
	}

	public function setDiaPrimeiroVencimento($diaPrimeiroVencimento) 
	{
		$this->diaPrimeiroVencimento = $diaPrimeiroVencimento;
	}

    public function getIntervaloEntreParcelas() 
	{
		return $this->intervaloEntreParcelas;
	}

	public function setIntervaloEntreParcelas($intervaloEntreParcelas) 
	{
		$this->intervaloEntreParcelas = $intervaloEntreParcelas;
	}

    public function getDiaFixoParcela() 
	{
		return $this->diaFixoParcela;
	}

	public function setDiaFixoParcela($diaFixoParcela) 
	{
		$this->diaFixoParcela = $diaFixoParcela;
	}

    public function getCodigoCotacao() 
	{
		return $this->codigoCotacao;
	}

	public function setCodigoCotacao($codigoCotacao) 
	{
		$this->codigoCotacao = $codigoCotacao;
	}

    public function getCompraTipoPedido(): ?CompraTipoPedido 
	{
		return $this->compraTipoPedido;
	}

	public function setCompraTipoPedido(?CompraTipoPedido $compraTipoPedido) 
	{
		$this->compraTipoPedido = $compraTipoPedido;
	}

    public function getFornecedor(): ?Fornecedor 
	{
		return $this->fornecedor;
	}

	public function setFornecedor(?Fornecedor $fornecedor) 
	{
		$this->fornecedor = $fornecedor;
	}

    public function getColaborador(): ?Colaborador 
	{
		return $this->colaborador;
	}

	public function setColaborador(?Colaborador $colaborador) 
	{
		$this->colaborador = $colaborador;
	}

    public function getListaCompraPedidoDetalhe() 
	{
		return $this->listaCompraPedidoDetalhe->toArray();
	}

	public function setListaCompraPedidoDetalhe(array $listaCompraPedidoDetalhe) {
		$this->listaCompraPedidoDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaCompraPedidoDetalhe); $i++) {
			$compraPedidoDetalhe = $listaCompraPedidoDetalhe[$i];
			$compraPedidoDetalhe->setCompraPedido($this);
			$this->listaCompraPedidoDetalhe->add($compraPedidoDetalhe);
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

		
		$this->listaCompraPedidoDetalhe = new ArrayCollection();
		$listaCompraPedidoDetalheJson = $objetoJson->listaCompraPedidoDetalhe;
		if ($listaCompraPedidoDetalheJson != null) {
			for ($i = 0; $i < count($listaCompraPedidoDetalheJson); $i++) {
				$objeto = new CompraPedidoDetalhe($listaCompraPedidoDetalheJson[$i]);
				$objeto->setCompraPedido($this);
				$this->listaCompraPedidoDetalhe->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setDataPedido($objeto->dataPedido);
			$this->setDataPrevistaEntrega($objeto->dataPrevistaEntrega);
			$this->setDataPrevisaoPagamento($objeto->dataPrevisaoPagamento);
			$this->setLocalEntrega($objeto->localEntrega);
			$this->setLocalCobranca($objeto->localCobranca);
			$this->setContato($objeto->contato);
			$this->setValorSubtotal($objeto->valorSubtotal);
			$this->setTaxaDesconto($objeto->taxaDesconto);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setValorTotal($objeto->valorTotal);
			$this->setTipoFrete($objeto->tipoFrete);
			$this->setFormaPagamento($objeto->formaPagamento);
			$this->setBaseCalculoIcms($objeto->baseCalculoIcms);
			$this->setValorIcms($objeto->valorIcms);
			$this->setBaseCalculoIcmsSt($objeto->baseCalculoIcmsSt);
			$this->setValorIcmsSt($objeto->valorIcmsSt);
			$this->setValorTotalProdutos($objeto->valorTotalProdutos);
			$this->setValorFrete($objeto->valorFrete);
			$this->setValorSeguro($objeto->valorSeguro);
			$this->setValorOutrasDespesas($objeto->valorOutrasDespesas);
			$this->setValorIpi($objeto->valorIpi);
			$this->setValorTotalNf($objeto->valorTotalNf);
			$this->setQuantidadeParcelas($objeto->quantidadeParcelas);
			$this->setDiaPrimeiroVencimento($objeto->diaPrimeiroVencimento);
			$this->setIntervaloEntreParcelas($objeto->intervaloEntreParcelas);
			$this->setDiaFixoParcela($objeto->diaFixoParcela);
			$this->setCodigoCotacao($objeto->codigoCotacao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'CompraPedido');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'dataPedido' => $this->getDataPedido(),
			'dataPrevistaEntrega' => $this->getDataPrevistaEntrega(),
			'dataPrevisaoPagamento' => $this->getDataPrevisaoPagamento(),
			'localEntrega' => $this->getLocalEntrega(),
			'localCobranca' => $this->getLocalCobranca(),
			'contato' => $this->getContato(),
			'valorSubtotal' => $this->getValorSubtotal(),
			'taxaDesconto' => $this->getTaxaDesconto(),
			'valorDesconto' => $this->getValorDesconto(),
			'valorTotal' => $this->getValorTotal(),
			'tipoFrete' => $this->getTipoFrete(),
			'formaPagamento' => $this->getFormaPagamento(),
			'baseCalculoIcms' => $this->getBaseCalculoIcms(),
			'valorIcms' => $this->getValorIcms(),
			'baseCalculoIcmsSt' => $this->getBaseCalculoIcmsSt(),
			'valorIcmsSt' => $this->getValorIcmsSt(),
			'valorTotalProdutos' => $this->getValorTotalProdutos(),
			'valorFrete' => $this->getValorFrete(),
			'valorSeguro' => $this->getValorSeguro(),
			'valorOutrasDespesas' => $this->getValorOutrasDespesas(),
			'valorIpi' => $this->getValorIpi(),
			'valorTotalNf' => $this->getValorTotalNf(),
			'quantidadeParcelas' => $this->getQuantidadeParcelas(),
			'diaPrimeiroVencimento' => $this->getDiaPrimeiroVencimento(),
			'intervaloEntreParcelas' => $this->getIntervaloEntreParcelas(),
			'diaFixoParcela' => $this->getDiaFixoParcela(),
			'codigoCotacao' => $this->getCodigoCotacao(),
			'compraTipoPedido' => $this->getCompraTipoPedido(),
			'fornecedor' => $this->getFornecedor(),
			'colaborador' => $this->getColaborador(),
			'listaCompraPedidoDetalhe' => $this->getListaCompraPedidoDetalhe(),
        ];
    }
}
