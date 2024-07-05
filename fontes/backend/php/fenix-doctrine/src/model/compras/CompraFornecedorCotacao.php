<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_FORNECEDOR_COTACAO] 
                                                                                
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
 * @ORM\Table(name="COMPRA_FORNECEDOR_COTACAO")
 */
class CompraFornecedorCotacao extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="string", name="PRAZO_ENTREGA")
	 */
	private $prazoEntrega;

	/**
	 * @ORM\Column(type="string", name="VENDA_CONDICOES_PAGAMENTO")
	 */
	private $vendaCondicoesPagamento;

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
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Fornecedor", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_FORNECEDOR", referencedColumnName="id")
     */
    private $fornecedor;

    /**
     * @ORM\OneToMany(targetEntity="CompraCotacaoDetalhe", mappedBy="compraFornecedorCotacao", cascade={"persist", "remove"})
     */
    private $listaCompraCotacaoDetalhe;

    /**
     * @ORM\ManyToOne(targetEntity="CompraCotacao", inversedBy="listaCompraFornecedorCotacao")
     * @ORM\JoinColumn(name="ID_COMPRA_COTACAO", referencedColumnName="id")
     */
    private $compraCotacao;


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

    public function getPrazoEntrega() 
	{
		return $this->prazoEntrega;
	}

	public function setPrazoEntrega($prazoEntrega) 
	{
		$this->prazoEntrega = $prazoEntrega;
	}

    public function getVendaCondicoesPagamento() 
	{
		return $this->vendaCondicoesPagamento;
	}

	public function setVendaCondicoesPagamento($vendaCondicoesPagamento) 
	{
		$this->vendaCondicoesPagamento = $vendaCondicoesPagamento;
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

    public function getCompraCotacao(): ?CompraCotacao 
	{
		return $this->compraCotacao;
	}

	public function setCompraCotacao(?CompraCotacao $compraCotacao) 
	{
		$this->compraCotacao = $compraCotacao;
	}

    public function getFornecedor(): ?Fornecedor 
	{
		return $this->fornecedor;
	}

	public function setFornecedor(?Fornecedor $fornecedor) 
	{
		$this->fornecedor = $fornecedor;
	}

    public function getListaCompraCotacaoDetalhe() 
	{
		return $this->listaCompraCotacaoDetalhe->toArray();
	}

	public function setListaCompraCotacaoDetalhe(array $listaCompraCotacaoDetalhe) {
		$this->listaCompraCotacaoDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaCompraCotacaoDetalhe); $i++) {
			$compraCotacaoDetalhe = $listaCompraCotacaoDetalhe[$i];
			$compraCotacaoDetalhe->setCompraFornecedorCotacao($this);
			$this->listaCompraCotacaoDetalhe->add($compraCotacaoDetalhe);
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

		
		$this->listaCompraCotacaoDetalhe = new ArrayCollection();
		$listaCompraCotacaoDetalheJson = $objetoJson->listaCompraCotacaoDetalhe;
		if ($listaCompraCotacaoDetalheJson != null) {
			for ($i = 0; $i < count($listaCompraCotacaoDetalheJson); $i++) {
				$objeto = new CompraCotacaoDetalhe($listaCompraCotacaoDetalheJson[$i]);
				$objeto->setCompraFornecedorCotacao($this);
				$this->listaCompraCotacaoDetalhe->add($objeto);
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
			$this->setPrazoEntrega($objeto->prazoEntrega);
			$this->setVendaCondicoesPagamento($objeto->vendaCondicoesPagamento);
			$this->setValorSubtotal($objeto->valorSubtotal);
			$this->setTaxaDesconto($objeto->taxaDesconto);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setValorTotal($objeto->valorTotal);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'CompraFornecedorCotacao');
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
			'prazoEntrega' => $this->getPrazoEntrega(),
			'vendaCondicoesPagamento' => $this->getVendaCondicoesPagamento(),
			'valorSubtotal' => $this->getValorSubtotal(),
			'taxaDesconto' => $this->getTaxaDesconto(),
			'valorDesconto' => $this->getValorDesconto(),
			'valorTotal' => $this->getValorTotal(),
			'fornecedor' => $this->getFornecedor(),
			'listaCompraCotacaoDetalhe' => $this->getListaCompraCotacaoDetalhe(),
        ];
    }
}
