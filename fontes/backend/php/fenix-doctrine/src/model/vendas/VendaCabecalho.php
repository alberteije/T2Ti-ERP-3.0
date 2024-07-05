<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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
 * @ORM\Table(name="VENDA_CABECALHO")
 */
class VendaCabecalho extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="date", name="DATA_VENDA")
	 */
	private $dataVenda;

	/**
	 * @ORM\Column(type="date", name="DATA_SAIDA")
	 */
	private $dataSaida;

	/**
	 * @ORM\Column(type="string", name="HORA_SAIDA")
	 */
	private $horaSaida;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_FATURA")
	 */
	private $numeroFatura;

	/**
	 * @ORM\Column(type="string", name="LOCAL_ENTREGA")
	 */
	private $localEntrega;

	/**
	 * @ORM\Column(type="string", name="LOCAL_COBRANCA")
	 */
	private $localCobranca;

	/**
	 * @ORM\Column(type="float", name="VALOR_SUBTOTAL")
	 */
	private $valorSubtotal;

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
	 * @ORM\Column(type="string", name="TIPO_FRETE")
	 */
	private $tipoFrete;

	/**
	 * @ORM\Column(type="string", name="FORMA_PAGAMENTO")
	 */
	private $formaPagamento;

	/**
	 * @ORM\Column(type="float", name="VALOR_FRETE")
	 */
	private $valorFrete;

	/**
	 * @ORM\Column(type="float", name="VALOR_SEGURO")
	 */
	private $valorSeguro;

	/**
	 * @ORM\Column(type="string", name="OBSERVACAO")
	 */
	private $observacao;

	/**
	 * @ORM\Column(type="string", name="SITUACAO")
	 */
	private $situacao;

	/**
	 * @ORM\Column(type="string", name="DIA_FIXO_PARCELA")
	 */
	private $diaFixoParcela;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="VendaOrcamentoCabecalho", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_VENDA_ORCAMENTO_CABECALHO", referencedColumnName="id")
     */
    private $vendaOrcamentoCabecalho;

    /**
     * @ORM\OneToOne(targetEntity="VendaCondicoesPagamento", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_VENDA_CONDICOES_PAGAMENTO", referencedColumnName="id")
     */
    private $vendaCondicoesPagamento;

    /**
     * @ORM\OneToOne(targetEntity="NotaFiscalTipo", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_NOTA_FISCAL_TIPO", referencedColumnName="id")
     */
    private $notaFiscalTipo;

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
     * @ORM\OneToOne(targetEntity="Vendedor", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_VENDEDOR", referencedColumnName="id")
     */
    private $vendedor;

    /**
     * @ORM\OneToMany(targetEntity="VendaComissao", mappedBy="vendaCabecalho", cascade={"persist", "remove"})
     */
    private $listaVendaComissao;

    /**
     * @ORM\OneToMany(targetEntity="VendaDetalhe", mappedBy="vendaCabecalho", cascade={"persist", "remove"})
     */
    private $listaVendaDetalhe;


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

    public function getDataVenda() 
	{
		if ($this->dataVenda != null) {
			return $this->dataVenda->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataVenda($dataVenda) 
	{
		$this->dataVenda = $dataVenda != null ? new \DateTime($dataVenda) : null;
	}

    public function getDataSaida() 
	{
		if ($this->dataSaida != null) {
			return $this->dataSaida->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataSaida($dataSaida) 
	{
		$this->dataSaida = $dataSaida != null ? new \DateTime($dataSaida) : null;
	}

    public function getHoraSaida() 
	{
		return $this->horaSaida;
	}

	public function setHoraSaida($horaSaida) 
	{
		$this->horaSaida = $horaSaida;
	}

    public function getNumeroFatura() 
	{
		return $this->numeroFatura;
	}

	public function setNumeroFatura($numeroFatura) 
	{
		$this->numeroFatura = $numeroFatura;
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

    public function getValorSubtotal() 
	{
		return $this->valorSubtotal;
	}

	public function setValorSubtotal($valorSubtotal) 
	{
		$this->valorSubtotal = $valorSubtotal;
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

    public function getObservacao() 
	{
		return $this->observacao;
	}

	public function setObservacao($observacao) 
	{
		$this->observacao = $observacao;
	}

    public function getSituacao() 
	{
		return $this->situacao;
	}

	public function setSituacao($situacao) 
	{
		$this->situacao = $situacao;
	}

    public function getDiaFixoParcela() 
	{
		return $this->diaFixoParcela;
	}

	public function setDiaFixoParcela($diaFixoParcela) 
	{
		$this->diaFixoParcela = $diaFixoParcela;
	}

    public function getVendaOrcamentoCabecalho(): ?VendaOrcamentoCabecalho 
	{
		return $this->vendaOrcamentoCabecalho;
	}

	public function setVendaOrcamentoCabecalho(?VendaOrcamentoCabecalho $vendaOrcamentoCabecalho) 
	{
		$this->vendaOrcamentoCabecalho = $vendaOrcamentoCabecalho;
	}

    public function getVendaCondicoesPagamento(): ?VendaCondicoesPagamento 
	{
		return $this->vendaCondicoesPagamento;
	}

	public function setVendaCondicoesPagamento(?VendaCondicoesPagamento $vendaCondicoesPagamento) 
	{
		$this->vendaCondicoesPagamento = $vendaCondicoesPagamento;
	}

    public function getNotaFiscalTipo(): ?NotaFiscalTipo 
	{
		return $this->notaFiscalTipo;
	}

	public function setNotaFiscalTipo(?NotaFiscalTipo $notaFiscalTipo) 
	{
		$this->notaFiscalTipo = $notaFiscalTipo;
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

    public function getVendedor(): ?Vendedor 
	{
		return $this->vendedor;
	}

	public function setVendedor(?Vendedor $vendedor) 
	{
		$this->vendedor = $vendedor;
	}

    public function getListaVendaComissao() 
	{
		return $this->listaVendaComissao->toArray();
	}

	public function setListaVendaComissao(array $listaVendaComissao) {
		$this->listaVendaComissao = new ArrayCollection();
		for ($i = 0; $i < count($listaVendaComissao); $i++) {
			$vendaComissao = $listaVendaComissao[$i];
			$vendaComissao->setVendaCabecalho($this);
			$this->listaVendaComissao->add($vendaComissao);
		}
	}

    public function getListaVendaDetalhe() 
	{
		return $this->listaVendaDetalhe->toArray();
	}

	public function setListaVendaDetalhe(array $listaVendaDetalhe) {
		$this->listaVendaDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaVendaDetalhe); $i++) {
			$vendaDetalhe = $listaVendaDetalhe[$i];
			$vendaDetalhe->setVendaCabecalho($this);
			$this->listaVendaDetalhe->add($vendaDetalhe);
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

		
		$this->listaVendaComissao = new ArrayCollection();
		$listaVendaComissaoJson = $objetoJson->listaVendaComissao;
		if ($listaVendaComissaoJson != null) {
			for ($i = 0; $i < count($listaVendaComissaoJson); $i++) {
				$objeto = new VendaComissao($listaVendaComissaoJson[$i]);
				$objeto->setVendaCabecalho($this);
				$this->listaVendaComissao->add($objeto);
			}
		}

		$this->listaVendaDetalhe = new ArrayCollection();
		$listaVendaDetalheJson = $objetoJson->listaVendaDetalhe;
		if ($listaVendaDetalheJson != null) {
			for ($i = 0; $i < count($listaVendaDetalheJson); $i++) {
				$objeto = new VendaDetalhe($listaVendaDetalheJson[$i]);
				$objeto->setVendaCabecalho($this);
				$this->listaVendaDetalhe->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setDataVenda($objeto->dataVenda);
			$this->setDataSaida($objeto->dataSaida);
			$this->setHoraSaida($objeto->horaSaida);
			$this->setNumeroFatura($objeto->numeroFatura);
			$this->setLocalEntrega($objeto->localEntrega);
			$this->setLocalCobranca($objeto->localCobranca);
			$this->setValorSubtotal($objeto->valorSubtotal);
			$this->setTaxaComissao($objeto->taxaComissao);
			$this->setValorComissao($objeto->valorComissao);
			$this->setTaxaDesconto($objeto->taxaDesconto);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setValorTotal($objeto->valorTotal);
			$this->setTipoFrete($objeto->tipoFrete);
			$this->setFormaPagamento($objeto->formaPagamento);
			$this->setValorFrete($objeto->valorFrete);
			$this->setValorSeguro($objeto->valorSeguro);
			$this->setObservacao($objeto->observacao);
			$this->setSituacao($objeto->situacao);
			$this->setDiaFixoParcela($objeto->diaFixoParcela);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'VendaCabecalho');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'dataVenda' => $this->getDataVenda(),
			'dataSaida' => $this->getDataSaida(),
			'horaSaida' => $this->getHoraSaida(),
			'numeroFatura' => $this->getNumeroFatura(),
			'localEntrega' => $this->getLocalEntrega(),
			'localCobranca' => $this->getLocalCobranca(),
			'valorSubtotal' => $this->getValorSubtotal(),
			'taxaComissao' => $this->getTaxaComissao(),
			'valorComissao' => $this->getValorComissao(),
			'taxaDesconto' => $this->getTaxaDesconto(),
			'valorDesconto' => $this->getValorDesconto(),
			'valorTotal' => $this->getValorTotal(),
			'tipoFrete' => $this->getTipoFrete(),
			'formaPagamento' => $this->getFormaPagamento(),
			'valorFrete' => $this->getValorFrete(),
			'valorSeguro' => $this->getValorSeguro(),
			'observacao' => $this->getObservacao(),
			'situacao' => $this->getSituacao(),
			'diaFixoParcela' => $this->getDiaFixoParcela(),
			'vendaOrcamentoCabecalho' => $this->getVendaOrcamentoCabecalho(),
			'vendaCondicoesPagamento' => $this->getVendaCondicoesPagamento(),
			'notaFiscalTipo' => $this->getNotaFiscalTipo(),
			'cliente' => $this->getCliente(),
			'transportadora' => $this->getTransportadora(),
			'vendedor' => $this->getVendedor(),
			'listaVendaComissao' => $this->getListaVendaComissao(),
			'listaVendaDetalhe' => $this->getListaVendaDetalhe(),
        ];
    }
}
