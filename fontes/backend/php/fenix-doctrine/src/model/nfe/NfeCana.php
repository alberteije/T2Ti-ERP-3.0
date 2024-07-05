<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CANA] 
                                                                                
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
 * @ORM\Table(name="NFE_CANA")
 */
class NfeCana extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="SAFRA")
	 */
	private $safra;

	/**
	 * @ORM\Column(type="string", name="MES_ANO_REFERENCIA")
	 */
	private $mesAnoReferencia;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeCabecalho", inversedBy="nfeCana")
     * @ORM\JoinColumn(name="ID_NFE_CABECALHO", referencedColumnName="id")
     */
    private $nfeCabecalho;

    /**
     * @ORM\OneToMany(targetEntity="NfeCanaDeducoesSafra", mappedBy="nfeCana", cascade={"persist", "remove"})
     */
    private $listaNfeCanaDeducoesSafra;

    /**
     * @ORM\OneToMany(targetEntity="NfeCanaFornecimentoDiario", mappedBy="nfeCana", cascade={"persist", "remove"})
     */
    private $listaNfeCanaFornecimentoDiario;


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

    public function getSafra() 
	{
		return $this->safra;
	}

	public function setSafra($safra) 
	{
		$this->safra = $safra;
	}

    public function getMesAnoReferencia() 
	{
		return $this->mesAnoReferencia;
	}

	public function setMesAnoReferencia($mesAnoReferencia) 
	{
		$this->mesAnoReferencia = $mesAnoReferencia;
	}

    public function getNfeCabecalho(): ?NfeCabecalho 
	{
		return $this->nfeCabecalho;
	}

	public function setNfeCabecalho(?NfeCabecalho $nfeCabecalho) 
	{
		$this->nfeCabecalho = $nfeCabecalho;
	}

    public function getListaNfeCanaDeducoesSafra() 
	{
		return $this->listaNfeCanaDeducoesSafra->toArray();
	}

	public function setListaNfeCanaDeducoesSafra(array $listaNfeCanaDeducoesSafra) {
		$this->listaNfeCanaDeducoesSafra = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeCanaDeducoesSafra); $i++) {
			$nfeCanaDeducoesSafra = $listaNfeCanaDeducoesSafra[$i];
			$nfeCanaDeducoesSafra->setNfeCana($this);
			$this->listaNfeCanaDeducoesSafra->add($nfeCanaDeducoesSafra);
		}
	}

    public function getListaNfeCanaFornecimentoDiario() 
	{
		return $this->listaNfeCanaFornecimentoDiario->toArray();
	}

	public function setListaNfeCanaFornecimentoDiario(array $listaNfeCanaFornecimentoDiario) {
		$this->listaNfeCanaFornecimentoDiario = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeCanaFornecimentoDiario); $i++) {
			$nfeCanaFornecimentoDiario = $listaNfeCanaFornecimentoDiario[$i];
			$nfeCanaFornecimentoDiario->setNfeCana($this);
			$this->listaNfeCanaFornecimentoDiario->add($nfeCanaFornecimentoDiario);
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

		
		$this->listaNfeCanaDeducoesSafra = new ArrayCollection();
		$listaNfeCanaDeducoesSafraJson = $objetoJson->listaNfeCanaDeducoesSafra;
		if ($listaNfeCanaDeducoesSafraJson != null) {
			for ($i = 0; $i < count($listaNfeCanaDeducoesSafraJson); $i++) {
				$objeto = new NfeCanaDeducoesSafra($listaNfeCanaDeducoesSafraJson[$i]);
				$objeto->setNfeCana($this);
				$this->listaNfeCanaDeducoesSafra->add($objeto);
			}
		}

		$this->listaNfeCanaFornecimentoDiario = new ArrayCollection();
		$listaNfeCanaFornecimentoDiarioJson = $objetoJson->listaNfeCanaFornecimentoDiario;
		if ($listaNfeCanaFornecimentoDiarioJson != null) {
			for ($i = 0; $i < count($listaNfeCanaFornecimentoDiarioJson); $i++) {
				$objeto = new NfeCanaFornecimentoDiario($listaNfeCanaFornecimentoDiarioJson[$i]);
				$objeto->setNfeCana($this);
				$this->listaNfeCanaFornecimentoDiario->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setSafra($objeto->safra);
			$this->setMesAnoReferencia($objeto->mesAnoReferencia);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeCana');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'safra' => $this->getSafra(),
			'mesAnoReferencia' => $this->getMesAnoReferencia(),
			'listaNfeCanaDeducoesSafra' => $this->getListaNfeCanaDeducoesSafra(),
			'listaNfeCanaFornecimentoDiario' => $this->getListaNfeCanaFornecimentoDiario(),
        ];
    }
}
