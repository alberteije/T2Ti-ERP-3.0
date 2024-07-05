<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
 * @ORM\Table(name="VENDA_ORCAMENTO_CABECALHO")
 */
class VendaOrcamentoCabecalho extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="CODIGO")
	 */
	private $codigo;

	/**
	 * @ORM\Column(type="date", name="DATA_CADASTRO")
	 */
	private $dataCadastro;

	/**
	 * @ORM\Column(type="date", name="DATA_ENTREGA")
	 */
	private $dataEntrega;

	/**
	 * @ORM\Column(type="date", name="VALIDADE")
	 */
	private $validade;

	/**
	 * @ORM\Column(type="string", name="TIPO_FRETE")
	 */
	private $tipoFrete;

	/**
	 * @ORM\Column(type="float", name="VALOR_SUBTOTAL")
	 */
	private $valorSubtotal;

	/**
	 * @ORM\Column(type="float", name="VALOR_FRETE")
	 */
	private $valorFrete;

	/**
	 * @ORM\Column(type="float", name="TAXA_COMISSAO")
	 */
	private $taxaComissao;

	/**
	 * @ORM\Column(type="float", name="VALOR_COMISSAO")
	 */
	private $valorComissao;

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
	 * @ORM\Column(type="string", name="OBSERVACAO")
	 */
	private $observacao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="VendaCondicoesPagamento", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_VENDA_CONDICOES_PAGAMENTO", referencedColumnName="id")
     */
    private $vendaCondicoesPagamento;

    /**
     * @ORM\OneToOne(targetEntity="Vendedor", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_VENDEDOR", referencedColumnName="id")
     */
    private $vendedor;

    /**
     * @ORM\OneToOne(targetEntity="Cliente", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_CLIENTE", referencedColumnName="id")
     */
    private $cliente;

    /**
     * @ORM\OneToOne(targetEntity="Transportadora", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TRANSPORTADORA", referencedColumnName="id")
     */
    private $transportadora;

    /**
     * @ORM\OneToMany(targetEntity="VendaOrcamentoDetalhe", mappedBy="vendaOrcamentoCabecalho", cascade={"persist", "remove"})
     */
    private $listaVendaOrcamentoDetalhe;


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

    public function getCodigo() 
	{
		return $this->codigo;
	}

	public function setCodigo($codigo) 
	{
		$this->codigo = $codigo;
	}

    public function getDataCadastro() 
	{
		if ($this->dataCadastro != null) {
			return $this->dataCadastro->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataCadastro($dataCadastro) 
	{
		$this->dataCadastro = $dataCadastro != null ? new \DateTime($dataCadastro) : null;
	}

    public function getDataEntrega() 
	{
		if ($this->dataEntrega != null) {
			return $this->dataEntrega->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataEntrega($dataEntrega) 
	{
		$this->dataEntrega = $dataEntrega != null ? new \DateTime($dataEntrega) : null;
	}

    public function getValidade() 
	{
		if ($this->validade != null) {
			return $this->validade->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setValidade($validade) 
	{
		$this->validade = $validade != null ? new \DateTime($validade) : null;
	}

    public function getTipoFrete() 
	{
		return $this->tipoFrete;
	}

	public function setTipoFrete($tipoFrete) 
	{
		$this->tipoFrete = $tipoFrete;
	}

    public function getValorSubtotal() 
	{
		return $this->valorSubtotal;
	}

	public function setValorSubtotal($valorSubtotal) 
	{
		$this->valorSubtotal = $valorSubtotal;
	}

    public function getValorFrete() 
	{
		return $this->valorFrete;
	}

	public function setValorFrete($valorFrete) 
	{
		$this->valorFrete = $valorFrete;
	}

    public function getTaxaComissao() 
	{
		return $this->taxaComissao;
	}

	public function setTaxaComissao($taxaComissao) 
	{
		$this->taxaComissao = $taxaComissao;
	}

    public function getValorComissao() 
	{
		return $this->valorComissao;
	}

	public function setValorComissao($valorComissao) 
	{
		$this->valorComissao = $valorComissao;
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

    public function getObservacao() 
	{
		return $this->observacao;
	}

	public function setObservacao($observacao) 
	{
		$this->observacao = $observacao;
	}

    public function getVendaCondicoesPagamento(): ?VendaCondicoesPagamento 
	{
		return $this->vendaCondicoesPagamento;
	}

	public function setVendaCondicoesPagamento(?VendaCondicoesPagamento $vendaCondicoesPagamento) 
	{
		$this->vendaCondicoesPagamento = $vendaCondicoesPagamento;
	}

    public function getVendedor(): ?Vendedor 
	{
		return $this->vendedor;
	}

	public function setVendedor(?Vendedor $vendedor) 
	{
		$this->vendedor = $vendedor;
	}

    public function getCliente(): ?Cliente 
	{
		return $this->cliente;
	}

	public function setCliente(?Cliente $cliente) 
	{
		$this->cliente = $cliente;
	}

    public function getTransportadora(): ?Transportadora 
	{
		return $this->transportadora;
	}

	public function setTransportadora(?Transportadora $transportadora) 
	{
		$this->transportadora = $transportadora;
	}

    public function getListaVendaOrcamentoDetalhe() 
	{
		return $this->listaVendaOrcamentoDetalhe->toArray();
	}

	public function setListaVendaOrcamentoDetalhe(array $listaVendaOrcamentoDetalhe) {
		$this->listaVendaOrcamentoDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaVendaOrcamentoDetalhe); $i++) {
			$vendaOrcamentoDetalhe = $listaVendaOrcamentoDetalhe[$i];
			$vendaOrcamentoDetalhe->setVendaOrcamentoCabecalho($this);
			$this->listaVendaOrcamentoDetalhe->add($vendaOrcamentoDetalhe);
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

		
		$this->listaVendaOrcamentoDetalhe = new ArrayCollection();
		$listaVendaOrcamentoDetalheJson = $objetoJson->listaVendaOrcamentoDetalhe;
		if ($listaVendaOrcamentoDetalheJson != null) {
			for ($i = 0; $i < count($listaVendaOrcamentoDetalheJson); $i++) {
				$objeto = new VendaOrcamentoDetalhe($listaVendaOrcamentoDetalheJson[$i]);
				$objeto->setVendaOrcamentoCabecalho($this);
				$this->listaVendaOrcamentoDetalhe->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setCodigo($objeto->codigo);
			$this->setDataCadastro($objeto->dataCadastro);
			$this->setDataEntrega($objeto->dataEntrega);
			$this->setValidade($objeto->validade);
			$this->setTipoFrete($objeto->tipoFrete);
			$this->setValorSubtotal($objeto->valorSubtotal);
			$this->setValorFrete($objeto->valorFrete);
			$this->setTaxaComissao($objeto->taxaComissao);
			$this->setValorComissao($objeto->valorComissao);
			$this->setTaxaDesconto($objeto->taxaDesconto);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setValorTotal($objeto->valorTotal);
			$this->setObservacao($objeto->observacao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'VendaOrcamentoCabecalho');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'codigo' => $this->getCodigo(),
			'dataCadastro' => $this->getDataCadastro(),
			'dataEntrega' => $this->getDataEntrega(),
			'validade' => $this->getValidade(),
			'tipoFrete' => $this->getTipoFrete(),
			'valorSubtotal' => $this->getValorSubtotal(),
			'valorFrete' => $this->getValorFrete(),
			'taxaComissao' => $this->getTaxaComissao(),
			'valorComissao' => $this->getValorComissao(),
			'taxaDesconto' => $this->getTaxaDesconto(),
			'valorDesconto' => $this->getValorDesconto(),
			'valorTotal' => $this->getValorTotal(),
			'observacao' => $this->getObservacao(),
			'vendaCondicoesPagamento' => $this->getVendaCondicoesPagamento(),
			'vendedor' => $this->getVendedor(),
			'cliente' => $this->getCliente(),
			'transportadora' => $this->getTransportadora(),
			'listaVendaOrcamentoDetalhe' => $this->getListaVendaOrcamentoDetalhe(),
        ];
    }
}
