<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_COTACAO_DETALHE] 
                                                                                
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
 * @ORM\Table(name="COMPRA_COTACAO_DETALHE")
 */
class CompraCotacaoDetalhe extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE")
	 */
	private $quantidade;

	/**
	 * @ORM\Column(type="float", name="VALOR_UNITARIO")
	 */
	private $valorUnitario;

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
     * @ORM\OneToOne(targetEntity="Produto", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_PRODUTO", referencedColumnName="id")
     */
    private $produto;

    /**
     * @ORM\ManyToOne(targetEntity="CompraFornecedorCotacao", inversedBy="listaCompraCotacaoDetalhe")
     * @ORM\JoinColumn(name="ID_COMPRA_FORNECEDOR_COTACAO", referencedColumnName="id")
     */
    private $compraFornecedorCotacao;


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

    public function getQuantidade() 
	{
		return $this->quantidade;
	}

	public function setQuantidade($quantidade) 
	{
		$this->quantidade = $quantidade;
	}

    public function getValorUnitario() 
	{
		return $this->valorUnitario;
	}

	public function setValorUnitario($valorUnitario) 
	{
		$this->valorUnitario = $valorUnitario;
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

    public function getCompraFornecedorCotacao(): ?CompraFornecedorCotacao 
	{
		return $this->compraFornecedorCotacao;
	}

	public function setCompraFornecedorCotacao(?CompraFornecedorCotacao $compraFornecedorCotacao) 
	{
		$this->compraFornecedorCotacao = $compraFornecedorCotacao;
	}

    public function getProduto(): ?Produto 
	{
		return $this->produto;
	}

	public function setProduto(?Produto $produto) 
	{
		$this->produto = $produto;
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
			$this->setQuantidade($objeto->quantidade);
			$this->setValorUnitario($objeto->valorUnitario);
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
        return parent::validarObjeto($objJson, $id, 'CompraCotacaoDetalhe');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'quantidade' => $this->getQuantidade(),
			'valorUnitario' => $this->getValorUnitario(),
			'valorSubtotal' => $this->getValorSubtotal(),
			'taxaDesconto' => $this->getTaxaDesconto(),
			'valorDesconto' => $this->getValorDesconto(),
			'valorTotal' => $this->getValorTotal(),
			'produto' => $this->getProduto(),
        ];
    }
}
