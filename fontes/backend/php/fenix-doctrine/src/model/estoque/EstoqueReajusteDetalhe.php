<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [ESTOQUE_REAJUSTE_DETALHE] 
                                                                                
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
 * @ORM\Table(name="ESTOQUE_REAJUSTE_DETALHE")
 */
class EstoqueReajusteDetalhe extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="float", name="VALOR_ORIGINAL")
	 */
	private $valorOriginal;

	/**
	 * @ORM\Column(type="float", name="VALOR_REAJUSTE")
	 */
	private $valorReajuste;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Produto", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_PRODUTO", referencedColumnName="id")
     */
    private $produto;

    /**
     * @ORM\ManyToOne(targetEntity="EstoqueReajusteCabecalho", inversedBy="listaEstoqueReajusteDetalhe")
     * @ORM\JoinColumn(name="ID_ESTOQUE_REAJUSTE_CABECALHO", referencedColumnName="id")
     */
    private $estoqueReajusteCabecalho;


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

    public function getValorOriginal() 
	{
		return $this->valorOriginal;
	}

	public function setValorOriginal($valorOriginal) 
	{
		$this->valorOriginal = $valorOriginal;
	}

    public function getValorReajuste() 
	{
		return $this->valorReajuste;
	}

	public function setValorReajuste($valorReajuste) 
	{
		$this->valorReajuste = $valorReajuste;
	}

    public function getEstoqueReajusteCabecalho(): ?EstoqueReajusteCabecalho 
	{
		return $this->estoqueReajusteCabecalho;
	}

	public function setEstoqueReajusteCabecalho(?EstoqueReajusteCabecalho $estoqueReajusteCabecalho) 
	{
		$this->estoqueReajusteCabecalho = $estoqueReajusteCabecalho;
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
			$this->setValorOriginal($objeto->valorOriginal);
			$this->setValorReajuste($objeto->valorReajuste);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'EstoqueReajusteDetalhe');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'valorOriginal' => $this->getValorOriginal(),
			'valorReajuste' => $this->getValorReajuste(),
			'produto' => $this->getProduto(),
        ];
    }
}
