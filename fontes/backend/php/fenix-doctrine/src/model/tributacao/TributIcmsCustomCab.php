<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_ICMS_CUSTOM_CAB] 
                                                                                
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
 * @ORM\Table(name="TRIBUT_ICMS_CUSTOM_CAB")
 */
class TributIcmsCustomCab extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="string", name="ORIGEM_MERCADORIA")
	 */
	private $origemMercadoria;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToMany(targetEntity="TributIcmsCustomDet", mappedBy="tributIcmsCustomCab", cascade={"persist", "remove"})
     */
    private $listaTributIcmsCustomDet;


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

    public function getOrigemMercadoria() 
	{
		return $this->origemMercadoria;
	}

	public function setOrigemMercadoria($origemMercadoria) 
	{
		$this->origemMercadoria = $origemMercadoria;
	}

    public function getListaTributIcmsCustomDet() 
	{
		return $this->listaTributIcmsCustomDet->toArray();
	}

	public function setListaTributIcmsCustomDet(array $listaTributIcmsCustomDet) {
		$this->listaTributIcmsCustomDet = new ArrayCollection();
		for ($i = 0; $i < count($listaTributIcmsCustomDet); $i++) {
			$tributIcmsCustomDet = $listaTributIcmsCustomDet[$i];
			$tributIcmsCustomDet->setTributIcmsCustomCab($this);
			$this->listaTributIcmsCustomDet->add($tributIcmsCustomDet);
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

		
		$this->listaTributIcmsCustomDet = new ArrayCollection();
		$listaTributIcmsCustomDetJson = $objetoJson->listaTributIcmsCustomDet;
		if ($listaTributIcmsCustomDetJson != null) {
			for ($i = 0; $i < count($listaTributIcmsCustomDetJson); $i++) {
				$objeto = new TributIcmsCustomDet($listaTributIcmsCustomDetJson[$i]);
				$objeto->setTributIcmsCustomCab($this);
				$this->listaTributIcmsCustomDet->add($objeto);
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
			$this->setOrigemMercadoria($objeto->origemMercadoria);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'TributIcmsCustomCab');
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
			'origemMercadoria' => $this->getOrigemMercadoria(),
			'listaTributIcmsCustomDet' => $this->getListaTributIcmsCustomDet(),
        ];
    }
}
