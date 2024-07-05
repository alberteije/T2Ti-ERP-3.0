<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
 * @ORM\Table(name="ESTOQUE_REAJUSTE_CABECALHO")
 */
class EstoqueReajusteCabecalho extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="date", name="DATA_REAJUSTE")
	 */
	private $dataReajuste;

	/**
	 * @ORM\Column(type="float", name="TAXA")
	 */
	private $taxa;

	/**
	 * @ORM\Column(type="string", name="TIPO_REAJUSTE")
	 */
	private $tipoReajuste;

	/**
	 * @ORM\Column(type="string", name="JUSTIFICATIVA")
	 */
	private $justificativa;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Colaborador", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COLABORADOR", referencedColumnName="id")
     */
    private $colaborador;

    /**
     * @ORM\OneToMany(targetEntity="EstoqueReajusteDetalhe", mappedBy="estoqueReajusteCabecalho", cascade={"persist", "remove"})
     */
    private $listaEstoqueReajusteDetalhe;


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

    public function getDataReajuste() 
	{
		if ($this->dataReajuste != null) {
			return $this->dataReajuste->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataReajuste($dataReajuste) 
	{
		$this->dataReajuste = $dataReajuste != null ? new \DateTime($dataReajuste) : null;
	}

    public function getTaxa() 
	{
		return $this->taxa;
	}

	public function setTaxa($taxa) 
	{
		$this->taxa = $taxa;
	}

    public function getTipoReajuste() 
	{
		return $this->tipoReajuste;
	}

	public function setTipoReajuste($tipoReajuste) 
	{
		$this->tipoReajuste = $tipoReajuste;
	}

    public function getJustificativa() 
	{
		return $this->justificativa;
	}

	public function setJustificativa($justificativa) 
	{
		$this->justificativa = $justificativa;
	}

    public function getColaborador(): ?Colaborador 
	{
		return $this->colaborador;
	}

	public function setColaborador(?Colaborador $colaborador) 
	{
		$this->colaborador = $colaborador;
	}

    public function getListaEstoqueReajusteDetalhe() 
	{
		return $this->listaEstoqueReajusteDetalhe->toArray();
	}

	public function setListaEstoqueReajusteDetalhe(array $listaEstoqueReajusteDetalhe) {
		$this->listaEstoqueReajusteDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaEstoqueReajusteDetalhe); $i++) {
			$estoqueReajusteDetalhe = $listaEstoqueReajusteDetalhe[$i];
			$estoqueReajusteDetalhe->setEstoqueReajusteCabecalho($this);
			$this->listaEstoqueReajusteDetalhe->add($estoqueReajusteDetalhe);
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

		
		$this->listaEstoqueReajusteDetalhe = new ArrayCollection();
		$listaEstoqueReajusteDetalheJson = $objetoJson->listaEstoqueReajusteDetalhe;
		if ($listaEstoqueReajusteDetalheJson != null) {
			for ($i = 0; $i < count($listaEstoqueReajusteDetalheJson); $i++) {
				$objeto = new EstoqueReajusteDetalhe($listaEstoqueReajusteDetalheJson[$i]);
				$objeto->setEstoqueReajusteCabecalho($this);
				$this->listaEstoqueReajusteDetalhe->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setDataReajuste($objeto->dataReajuste);
			$this->setTaxa($objeto->taxa);
			$this->setTipoReajuste($objeto->tipoReajuste);
			$this->setJustificativa($objeto->justificativa);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'EstoqueReajusteCabecalho');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'dataReajuste' => $this->getDataReajuste(),
			'taxa' => $this->getTaxa(),
			'tipoReajuste' => $this->getTipoReajuste(),
			'justificativa' => $this->getJustificativa(),
			'colaborador' => $this->getColaborador(),
			'listaEstoqueReajusteDetalhe' => $this->getListaEstoqueReajusteDetalhe(),
        ];
    }
}
