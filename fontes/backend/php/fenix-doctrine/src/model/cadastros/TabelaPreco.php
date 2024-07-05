<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TABELA_PRECO] 
                                                                                
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
 * @ORM\Table(name="TABELA_PRECO")
 */
class TabelaPreco extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="NOME")
	 */
	private $nome;

	/**
	 * @ORM\Column(type="string", name="PRINCIPAL")
	 */
	private $principal;

	/**
	 * @ORM\Column(type="float", name="COEFICIENTE")
	 */
	private $coeficiente;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToMany(targetEntity="TabelaPrecoProduto", mappedBy="tabelaPreco", cascade={"persist", "remove"})
     */
    private $listaTabelaPrecoProduto;


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

    public function getNome() 
	{
		return $this->nome;
	}

	public function setNome($nome) 
	{
		$this->nome = $nome;
	}

    public function getPrincipal() 
	{
		return $this->principal;
	}

	public function setPrincipal($principal) 
	{
		$this->principal = $principal;
	}

    public function getCoeficiente() 
	{
		return $this->coeficiente;
	}

	public function setCoeficiente($coeficiente) 
	{
		$this->coeficiente = $coeficiente;
	}

    public function getListaTabelaPrecoProduto() 
	{
		return $this->listaTabelaPrecoProduto->toArray();
	}

	public function setListaTabelaPrecoProduto(array $listaTabelaPrecoProduto) {
		$this->listaTabelaPrecoProduto = new ArrayCollection();
		for ($i = 0; $i < count($listaTabelaPrecoProduto); $i++) {
			$tabelaPrecoProduto = $listaTabelaPrecoProduto[$i];
			$tabelaPrecoProduto->setTabelaPreco($this);
			$this->listaTabelaPrecoProduto->add($tabelaPrecoProduto);
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

		
		$this->listaTabelaPrecoProduto = new ArrayCollection();
		$listaTabelaPrecoProdutoJson = $objetoJson->listaTabelaPrecoProduto;
		if ($listaTabelaPrecoProdutoJson != null) {
			for ($i = 0; $i < count($listaTabelaPrecoProdutoJson); $i++) {
				$objeto = new TabelaPrecoProduto($listaTabelaPrecoProdutoJson[$i]);
				$objeto->setTabelaPreco($this);
				$this->listaTabelaPrecoProduto->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setNome($objeto->nome);
			$this->setPrincipal($objeto->principal);
			$this->setCoeficiente($objeto->coeficiente);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'TabelaPreco');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'nome' => $this->getNome(),
			'principal' => $this->getPrincipal(),
			'coeficiente' => $this->getCoeficiente(),
			'listaTabelaPrecoProduto' => $this->getListaTabelaPrecoProduto(),
        ];
    }
}
