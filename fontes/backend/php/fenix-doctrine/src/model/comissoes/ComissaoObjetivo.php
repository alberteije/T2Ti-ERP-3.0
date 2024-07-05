<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMISSAO_OBJETIVO] 
                                                                                
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
 * @ORM\Table(name="COMISSAO_OBJETIVO")
 */
class ComissaoObjetivo extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="string", name="NOME")
	 */
	private $nome;

	/**
	 * @ORM\Column(type="string", name="DESCRICAO")
	 */
	private $descricao;

	/**
	 * @ORM\Column(type="string", name="FORMA_PAGAMENTO")
	 */
	private $formaPagamento;

	/**
	 * @ORM\Column(type="float", name="TAXA_PAGAMENTO")
	 */
	private $taxaPagamento;

	/**
	 * @ORM\Column(type="float", name="VALOR_PAGAMENTO")
	 */
	private $valorPagamento;

	/**
	 * @ORM\Column(type="float", name="VALOR_META")
	 */
	private $valorMeta;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE")
	 */
	private $quantidade;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Produto", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_PRODUTO", referencedColumnName="id")
     */
    private $produto;

    /**
     * @ORM\ManyToOne(targetEntity="ComissaoPerfil", inversedBy="listaComissaoObjetivo")
     * @ORM\JoinColumn(name="ID_COMISSAO_PERFIL", referencedColumnName="id")
     */
    private $comissaoPerfil;


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

    public function getNome() 
	{
		return $this->nome;
	}

	public function setNome($nome) 
	{
		$this->nome = $nome;
	}

    public function getDescricao() 
	{
		return $this->descricao;
	}

	public function setDescricao($descricao) 
	{
		$this->descricao = $descricao;
	}

    public function getFormaPagamento() 
	{
		return $this->formaPagamento;
	}

	public function setFormaPagamento($formaPagamento) 
	{
		$this->formaPagamento = $formaPagamento;
	}

    public function getTaxaPagamento() 
	{
		return $this->taxaPagamento;
	}

	public function setTaxaPagamento($taxaPagamento) 
	{
		$this->taxaPagamento = $taxaPagamento;
	}

    public function getValorPagamento() 
	{
		return $this->valorPagamento;
	}

	public function setValorPagamento($valorPagamento) 
	{
		$this->valorPagamento = $valorPagamento;
	}

    public function getValorMeta() 
	{
		return $this->valorMeta;
	}

	public function setValorMeta($valorMeta) 
	{
		$this->valorMeta = $valorMeta;
	}

    public function getQuantidade() 
	{
		return $this->quantidade;
	}

	public function setQuantidade($quantidade) 
	{
		$this->quantidade = $quantidade;
	}

    public function getComissaoPerfil(): ?ComissaoPerfil 
	{
		return $this->comissaoPerfil;
	}

	public function setComissaoPerfil(?ComissaoPerfil $comissaoPerfil) 
	{
		$this->comissaoPerfil = $comissaoPerfil;
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
			$this->setCodigo($objeto->codigo);
			$this->setNome($objeto->nome);
			$this->setDescricao($objeto->descricao);
			$this->setFormaPagamento($objeto->formaPagamento);
			$this->setTaxaPagamento($objeto->taxaPagamento);
			$this->setValorPagamento($objeto->valorPagamento);
			$this->setValorMeta($objeto->valorMeta);
			$this->setQuantidade($objeto->quantidade);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'ComissaoObjetivo');
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
			'nome' => $this->getNome(),
			'descricao' => $this->getDescricao(),
			'formaPagamento' => $this->getFormaPagamento(),
			'taxaPagamento' => $this->getTaxaPagamento(),
			'valorPagamento' => $this->getValorPagamento(),
			'valorMeta' => $this->getValorMeta(),
			'quantidade' => $this->getQuantidade(),
			'produto' => $this->getProduto(),
        ];
    }
}
