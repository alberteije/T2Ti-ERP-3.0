<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_REQUISICAO] 
                                                                                
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
 * @ORM\Table(name="COMPRA_REQUISICAO")
 */
class CompraRequisicao extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="DESCRICAO")
	 */
	private $descricao;

	/**
	 * @ORM\Column(type="date", name="DATA_REQUISICAO")
	 */
	private $dataRequisicao;

	/**
	 * @ORM\Column(type="string", name="OBSERVACAO")
	 */
	private $observacao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="CompraTipoRequisicao", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COMPRA_TIPO_REQUISICAO", referencedColumnName="id")
     */
    private $compraTipoRequisicao;

    /**
     * @ORM\OneToOne(targetEntity="Colaborador", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COLABORADOR", referencedColumnName="id")
     */
    private $colaborador;

    /**
     * @ORM\OneToMany(targetEntity="CompraRequisicaoDetalhe", mappedBy="compraRequisicao", cascade={"persist", "remove"})
     */
    private $listaCompraRequisicaoDetalhe;


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

    public function getDescricao() 
	{
		return $this->descricao;
	}

	public function setDescricao($descricao) 
	{
		$this->descricao = $descricao;
	}

    public function getDataRequisicao() 
	{
		if ($this->dataRequisicao != null) {
			return $this->dataRequisicao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataRequisicao($dataRequisicao) 
	{
		$this->dataRequisicao = $dataRequisicao != null ? new \DateTime($dataRequisicao) : null;
	}

    public function getObservacao() 
	{
		return $this->observacao;
	}

	public function setObservacao($observacao) 
	{
		$this->observacao = $observacao;
	}

    public function getCompraTipoRequisicao(): ?CompraTipoRequisicao 
	{
		return $this->compraTipoRequisicao;
	}

	public function setCompraTipoRequisicao(?CompraTipoRequisicao $compraTipoRequisicao) 
	{
		$this->compraTipoRequisicao = $compraTipoRequisicao;
	}

    public function getColaborador(): ?Colaborador 
	{
		return $this->colaborador;
	}

	public function setColaborador(?Colaborador $colaborador) 
	{
		$this->colaborador = $colaborador;
	}

    public function getListaCompraRequisicaoDetalhe() 
	{
		return $this->listaCompraRequisicaoDetalhe->toArray();
	}

	public function setListaCompraRequisicaoDetalhe(array $listaCompraRequisicaoDetalhe) {
		$this->listaCompraRequisicaoDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaCompraRequisicaoDetalhe); $i++) {
			$compraRequisicaoDetalhe = $listaCompraRequisicaoDetalhe[$i];
			$compraRequisicaoDetalhe->setCompraRequisicao($this);
			$this->listaCompraRequisicaoDetalhe->add($compraRequisicaoDetalhe);
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

		
		$this->listaCompraRequisicaoDetalhe = new ArrayCollection();
		$listaCompraRequisicaoDetalheJson = $objetoJson->listaCompraRequisicaoDetalhe;
		if ($listaCompraRequisicaoDetalheJson != null) {
			for ($i = 0; $i < count($listaCompraRequisicaoDetalheJson); $i++) {
				$objeto = new CompraRequisicaoDetalhe($listaCompraRequisicaoDetalheJson[$i]);
				$objeto->setCompraRequisicao($this);
				$this->listaCompraRequisicaoDetalhe->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setDescricao($objeto->descricao);
			$this->setDataRequisicao($objeto->dataRequisicao);
			$this->setObservacao($objeto->observacao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'CompraRequisicao');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'descricao' => $this->getDescricao(),
			'dataRequisicao' => $this->getDataRequisicao(),
			'observacao' => $this->getObservacao(),
			'compraTipoRequisicao' => $this->getCompraTipoRequisicao(),
			'colaborador' => $this->getColaborador(),
			'listaCompraRequisicaoDetalhe' => $this->getListaCompraRequisicaoDetalhe(),
        ];
    }
}
