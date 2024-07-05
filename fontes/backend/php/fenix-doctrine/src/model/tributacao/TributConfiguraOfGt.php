<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
 * @ORM\Table(name="TRIBUT_CONFIGURA_OF_GT")
 */
class TributConfiguraOfGt extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="TributCofins", mappedBy="tributConfiguraOfGt", cascade={"persist", "remove"})
     */
    private $tributCofins;

    /**
     * @ORM\OneToOne(targetEntity="TributIpi", mappedBy="tributConfiguraOfGt", cascade={"persist", "remove"})
     */
    private $tributIpi;

    /**
     * @ORM\OneToOne(targetEntity="TributPis", mappedBy="tributConfiguraOfGt", cascade={"persist", "remove"})
     */
    private $tributPis;

    /**
     * @ORM\OneToOne(targetEntity="TributGrupoTributario", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TRIBUT_GRUPO_TRIBUTARIO", referencedColumnName="id")
     */
    private $tributGrupoTributario;

    /**
     * @ORM\OneToOne(targetEntity="TributOperacaoFiscal", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TRIBUT_OPERACAO_FISCAL", referencedColumnName="id")
     */
    private $tributOperacaoFiscal;

    /**
     * @ORM\OneToMany(targetEntity="TributIcmsUf", mappedBy="tributConfiguraOfGt", cascade={"persist", "remove"})
     */
    private $listaTributIcmsUf;


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

    public function getTributCofins(): ?TributCofins 
	{
		return $this->tributCofins;
	}

	public function setTributCofins(?TributCofins $tributCofins) 
	{
		$this->tributCofins = $tributCofins;
	}

    public function getTributIpi(): ?TributIpi 
	{
		return $this->tributIpi;
	}

	public function setTributIpi(?TributIpi $tributIpi) 
	{
		$this->tributIpi = $tributIpi;
	}

    public function getTributPis(): ?TributPis 
	{
		return $this->tributPis;
	}

	public function setTributPis(?TributPis $tributPis) 
	{
		$this->tributPis = $tributPis;
	}

    public function getTributGrupoTributario(): ?TributGrupoTributario 
	{
		return $this->tributGrupoTributario;
	}

	public function setTributGrupoTributario(?TributGrupoTributario $tributGrupoTributario) 
	{
		$this->tributGrupoTributario = $tributGrupoTributario;
	}

    public function getTributOperacaoFiscal(): ?TributOperacaoFiscal 
	{
		return $this->tributOperacaoFiscal;
	}

	public function setTributOperacaoFiscal(?TributOperacaoFiscal $tributOperacaoFiscal) 
	{
		$this->tributOperacaoFiscal = $tributOperacaoFiscal;
	}

    public function getListaTributIcmsUf() 
	{
		return $this->listaTributIcmsUf->toArray();
	}

	public function setListaTributIcmsUf(array $listaTributIcmsUf) {
		$this->listaTributIcmsUf = new ArrayCollection();
		for ($i = 0; $i < count($listaTributIcmsUf); $i++) {
			$tributIcmsUf = $listaTributIcmsUf[$i];
			$tributIcmsUf->setTributConfiguraOfGt($this);
			$this->listaTributIcmsUf->add($tributIcmsUf);
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

		if (isset($objetoJson->tributCofins)) {
			$this->setTributCofins(new TributCofins($objetoJson->tributCofins));
			$this->getTributCofins()->setTributConfiguraOfGt($this);
		}

		if (isset($objetoJson->tributIpi)) {
			$this->setTributIpi(new TributIpi($objetoJson->tributIpi));
			$this->getTributIpi()->setTributConfiguraOfGt($this);
		}

		if (isset($objetoJson->tributPis)) {
			$this->setTributPis(new TributPis($objetoJson->tributPis));
			$this->getTributPis()->setTributConfiguraOfGt($this);
		}

		
		$this->listaTributIcmsUf = new ArrayCollection();
		$listaTributIcmsUfJson = $objetoJson->listaTributIcmsUf;
		if ($listaTributIcmsUfJson != null) {
			for ($i = 0; $i < count($listaTributIcmsUfJson); $i++) {
				$objeto = new TributIcmsUf($listaTributIcmsUfJson[$i]);
				$objeto->setTributConfiguraOfGt($this);
				$this->listaTributIcmsUf->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'TributConfiguraOfGt');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'tributCofins' => $this->getTributCofins(),
			'tributIpi' => $this->getTributIpi(),
			'tributPis' => $this->getTributPis(),
			'tributGrupoTributario' => $this->getTributGrupoTributario(),
			'tributOperacaoFiscal' => $this->getTributOperacaoFiscal(),
			'listaTributIcmsUf' => $this->getListaTributIcmsUf(),
        ];
    }
}
