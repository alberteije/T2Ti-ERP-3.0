<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_COTACAO] 
                                                                                
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
 * @ORM\Table(name="COMPRA_COTACAO")
 */
class CompraCotacao extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="date", name="DATA_COTACAO")
	 */
	private $dataCotacao;

	/**
	 * @ORM\Column(type="string", name="DESCRICAO")
	 */
	private $descricao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="CompraRequisicao", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COMPRA_REQUISICAO", referencedColumnName="id")
     */
    private $compraRequisicao;

    /**
     * @ORM\OneToMany(targetEntity="CompraFornecedorCotacao", mappedBy="compraCotacao", cascade={"persist", "remove"})
     */
    private $listaCompraFornecedorCotacao;


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

    public function getDataCotacao() 
	{
		if ($this->dataCotacao != null) {
			return $this->dataCotacao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataCotacao($dataCotacao) 
	{
		$this->dataCotacao = $dataCotacao != null ? new \DateTime($dataCotacao) : null;
	}

    public function getDescricao() 
	{
		return $this->descricao;
	}

	public function setDescricao($descricao) 
	{
		$this->descricao = $descricao;
	}

    public function getCompraRequisicao(): ?CompraRequisicao 
	{
		return $this->compraRequisicao;
	}

	public function setCompraRequisicao(?CompraRequisicao $compraRequisicao) 
	{
		$this->compraRequisicao = $compraRequisicao;
	}

    public function getListaCompraFornecedorCotacao() 
	{
		return $this->listaCompraFornecedorCotacao->toArray();
	}

	public function setListaCompraFornecedorCotacao(array $listaCompraFornecedorCotacao) {
		$this->listaCompraFornecedorCotacao = new ArrayCollection();
		for ($i = 0; $i < count($listaCompraFornecedorCotacao); $i++) {
			$compraFornecedorCotacao = $listaCompraFornecedorCotacao[$i];
			$compraFornecedorCotacao->setCompraCotacao($this);
			$this->listaCompraFornecedorCotacao->add($compraFornecedorCotacao);
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

		
		$this->listaCompraFornecedorCotacao = new ArrayCollection();
		$listaCompraFornecedorCotacaoJson = $objetoJson->listaCompraFornecedorCotacao;
		if ($listaCompraFornecedorCotacaoJson != null) {
			for ($i = 0; $i < count($listaCompraFornecedorCotacaoJson); $i++) {
				$objeto = new CompraFornecedorCotacao($listaCompraFornecedorCotacaoJson[$i]);
				$objeto->setCompraCotacao($this);
				$this->listaCompraFornecedorCotacao->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setDataCotacao($objeto->dataCotacao);
			$this->setDescricao($objeto->descricao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'CompraCotacao');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'dataCotacao' => $this->getDataCotacao(),
			'descricao' => $this->getDescricao(),
			'compraRequisicao' => $this->getCompraRequisicao(),
			'listaCompraFornecedorCotacao' => $this->getListaCompraFornecedorCotacao(),
        ];
    }
}
