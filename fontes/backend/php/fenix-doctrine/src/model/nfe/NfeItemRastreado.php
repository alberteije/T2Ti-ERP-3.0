<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_ITEM_RASTREADO] 
                                                                                
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
 * @ORM\Table(name="NFE_ITEM_RASTREADO")
 */
class NfeItemRastreado extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="NUMERO_LOTE")
	 */
	private $numeroLote;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_ITENS")
	 */
	private $quantidadeItens;

	/**
	 * @ORM\Column(type="date", name="DATA_FABRICACAO")
	 */
	private $dataFabricacao;

	/**
	 * @ORM\Column(type="date", name="DATA_VALIDADE")
	 */
	private $dataValidade;

	/**
	 * @ORM\Column(type="string", name="CODIGO_AGREGACAO")
	 */
	private $codigoAgregacao;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="NfeDetalhe", inversedBy="listaNfeItemRastreado")
     * @ORM\JoinColumn(name="ID_NFE_DETALHE", referencedColumnName="id")
     */
    private $nfeDetalhe;


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

    public function getNumeroLote() 
	{
		return $this->numeroLote;
	}

	public function setNumeroLote($numeroLote) 
	{
		$this->numeroLote = $numeroLote;
	}

    public function getQuantidadeItens() 
	{
		return $this->quantidadeItens;
	}

	public function setQuantidadeItens($quantidadeItens) 
	{
		$this->quantidadeItens = $quantidadeItens;
	}

    public function getDataFabricacao() 
	{
		if ($this->dataFabricacao != null) {
			return $this->dataFabricacao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataFabricacao($dataFabricacao) 
	{
		$this->dataFabricacao = $dataFabricacao != null ? new \DateTime($dataFabricacao) : null;
	}

    public function getDataValidade() 
	{
		if ($this->dataValidade != null) {
			return $this->dataValidade->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataValidade($dataValidade) 
	{
		$this->dataValidade = $dataValidade != null ? new \DateTime($dataValidade) : null;
	}

    public function getCodigoAgregacao() 
	{
		return $this->codigoAgregacao;
	}

	public function setCodigoAgregacao($codigoAgregacao) 
	{
		$this->codigoAgregacao = $codigoAgregacao;
	}

    public function getNfeDetalhe(): ?NfeDetalhe 
	{
		return $this->nfeDetalhe;
	}

	public function setNfeDetalhe(?NfeDetalhe $nfeDetalhe) 
	{
		$this->nfeDetalhe = $nfeDetalhe;
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
			$this->setNumeroLote($objeto->numeroLote);
			$this->setQuantidadeItens($objeto->quantidadeItens);
			$this->setDataFabricacao($objeto->dataFabricacao);
			$this->setDataValidade($objeto->dataValidade);
			$this->setCodigoAgregacao($objeto->codigoAgregacao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeItemRastreado');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'numeroLote' => $this->getNumeroLote(),
			'quantidadeItens' => $this->getQuantidadeItens(),
			'dataFabricacao' => $this->getDataFabricacao(),
			'dataValidade' => $this->getDataValidade(),
			'codigoAgregacao' => $this->getCodigoAgregacao(),
        ];
    }
}
