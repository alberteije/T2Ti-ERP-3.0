<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_ICMS_CUSTOM_DET] 
                                                                                
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
 * @ORM\Table(name="TRIBUT_ICMS_CUSTOM_DET")
 */
class TributIcmsCustomDet extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="UF_DESTINO")
	 */
	private $ufDestino;

	/**
	 * @ORM\Column(type="integer", name="CFOP")
	 */
	private $cfop;

	/**
	 * @ORM\Column(type="string", name="CSOSN")
	 */
	private $csosn;

	/**
	 * @ORM\Column(type="string", name="CST")
	 */
	private $cst;

	/**
	 * @ORM\Column(type="string", name="MODALIDADE_BC")
	 */
	private $modalidadeBc;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA")
	 */
	private $aliquota;

	/**
	 * @ORM\Column(type="float", name="VALOR_PAUTA")
	 */
	private $valorPauta;

	/**
	 * @ORM\Column(type="float", name="VALOR_PRECO_MAXIMO")
	 */
	private $valorPrecoMaximo;

	/**
	 * @ORM\Column(type="float", name="MVA")
	 */
	private $mva;

	/**
	 * @ORM\Column(type="float", name="PORCENTO_BC")
	 */
	private $porcentoBc;

	/**
	 * @ORM\Column(type="string", name="MODALIDADE_BC_ST")
	 */
	private $modalidadeBcSt;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_INTERNA_ST")
	 */
	private $aliquotaInternaSt;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_INTERESTADUAL_ST")
	 */
	private $aliquotaInterestadualSt;

	/**
	 * @ORM\Column(type="float", name="PORCENTO_BC_ST")
	 */
	private $porcentoBcSt;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_ICMS_ST")
	 */
	private $aliquotaIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_PAUTA_ST")
	 */
	private $valorPautaSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_PRECO_MAXIMO_ST")
	 */
	private $valorPrecoMaximoSt;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="TributIcmsCustomCab", inversedBy="listaTributIcmsCustomDet")
     * @ORM\JoinColumn(name="ID_TRIBUT_ICMS_CUSTOM_CAB", referencedColumnName="id")
     */
    private $tributIcmsCustomCab;


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

    public function getUfDestino() 
	{
		return $this->ufDestino;
	}

	public function setUfDestino($ufDestino) 
	{
		$this->ufDestino = $ufDestino;
	}

    public function getCfop() 
	{
		return $this->cfop;
	}

	public function setCfop($cfop) 
	{
		$this->cfop = $cfop;
	}

    public function getCsosn() 
	{
		return $this->csosn;
	}

	public function setCsosn($csosn) 
	{
		$this->csosn = $csosn;
	}

    public function getCst() 
	{
		return $this->cst;
	}

	public function setCst($cst) 
	{
		$this->cst = $cst;
	}

    public function getModalidadeBc() 
	{
		return $this->modalidadeBc;
	}

	public function setModalidadeBc($modalidadeBc) 
	{
		$this->modalidadeBc = $modalidadeBc;
	}

    public function getAliquota() 
	{
		return $this->aliquota;
	}

	public function setAliquota($aliquota) 
	{
		$this->aliquota = $aliquota;
	}

    public function getValorPauta() 
	{
		return $this->valorPauta;
	}

	public function setValorPauta($valorPauta) 
	{
		$this->valorPauta = $valorPauta;
	}

    public function getValorPrecoMaximo() 
	{
		return $this->valorPrecoMaximo;
	}

	public function setValorPrecoMaximo($valorPrecoMaximo) 
	{
		$this->valorPrecoMaximo = $valorPrecoMaximo;
	}

    public function getMva() 
	{
		return $this->mva;
	}

	public function setMva($mva) 
	{
		$this->mva = $mva;
	}

    public function getPorcentoBc() 
	{
		return $this->porcentoBc;
	}

	public function setPorcentoBc($porcentoBc) 
	{
		$this->porcentoBc = $porcentoBc;
	}

    public function getModalidadeBcSt() 
	{
		return $this->modalidadeBcSt;
	}

	public function setModalidadeBcSt($modalidadeBcSt) 
	{
		$this->modalidadeBcSt = $modalidadeBcSt;
	}

    public function getAliquotaInternaSt() 
	{
		return $this->aliquotaInternaSt;
	}

	public function setAliquotaInternaSt($aliquotaInternaSt) 
	{
		$this->aliquotaInternaSt = $aliquotaInternaSt;
	}

    public function getAliquotaInterestadualSt() 
	{
		return $this->aliquotaInterestadualSt;
	}

	public function setAliquotaInterestadualSt($aliquotaInterestadualSt) 
	{
		$this->aliquotaInterestadualSt = $aliquotaInterestadualSt;
	}

    public function getPorcentoBcSt() 
	{
		return $this->porcentoBcSt;
	}

	public function setPorcentoBcSt($porcentoBcSt) 
	{
		$this->porcentoBcSt = $porcentoBcSt;
	}

    public function getAliquotaIcmsSt() 
	{
		return $this->aliquotaIcmsSt;
	}

	public function setAliquotaIcmsSt($aliquotaIcmsSt) 
	{
		$this->aliquotaIcmsSt = $aliquotaIcmsSt;
	}

    public function getValorPautaSt() 
	{
		return $this->valorPautaSt;
	}

	public function setValorPautaSt($valorPautaSt) 
	{
		$this->valorPautaSt = $valorPautaSt;
	}

    public function getValorPrecoMaximoSt() 
	{
		return $this->valorPrecoMaximoSt;
	}

	public function setValorPrecoMaximoSt($valorPrecoMaximoSt) 
	{
		$this->valorPrecoMaximoSt = $valorPrecoMaximoSt;
	}

    public function getTributIcmsCustomCab(): ?TributIcmsCustomCab 
	{
		return $this->tributIcmsCustomCab;
	}

	public function setTributIcmsCustomCab(?TributIcmsCustomCab $tributIcmsCustomCab) 
	{
		$this->tributIcmsCustomCab = $tributIcmsCustomCab;
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
			$this->setUfDestino($objeto->ufDestino);
			$this->setCfop($objeto->cfop);
			$this->setCsosn($objeto->csosn);
			$this->setCst($objeto->cst);
			$this->setModalidadeBc($objeto->modalidadeBc);
			$this->setAliquota($objeto->aliquota);
			$this->setValorPauta($objeto->valorPauta);
			$this->setValorPrecoMaximo($objeto->valorPrecoMaximo);
			$this->setMva($objeto->mva);
			$this->setPorcentoBc($objeto->porcentoBc);
			$this->setModalidadeBcSt($objeto->modalidadeBcSt);
			$this->setAliquotaInternaSt($objeto->aliquotaInternaSt);
			$this->setAliquotaInterestadualSt($objeto->aliquotaInterestadualSt);
			$this->setPorcentoBcSt($objeto->porcentoBcSt);
			$this->setAliquotaIcmsSt($objeto->aliquotaIcmsSt);
			$this->setValorPautaSt($objeto->valorPautaSt);
			$this->setValorPrecoMaximoSt($objeto->valorPrecoMaximoSt);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'TributIcmsCustomDet');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'ufDestino' => $this->getUfDestino(),
			'cfop' => $this->getCfop(),
			'csosn' => $this->getCsosn(),
			'cst' => $this->getCst(),
			'modalidadeBc' => $this->getModalidadeBc(),
			'aliquota' => $this->getAliquota(),
			'valorPauta' => $this->getValorPauta(),
			'valorPrecoMaximo' => $this->getValorPrecoMaximo(),
			'mva' => $this->getMva(),
			'porcentoBc' => $this->getPorcentoBc(),
			'modalidadeBcSt' => $this->getModalidadeBcSt(),
			'aliquotaInternaSt' => $this->getAliquotaInternaSt(),
			'aliquotaInterestadualSt' => $this->getAliquotaInterestadualSt(),
			'porcentoBcSt' => $this->getPorcentoBcSt(),
			'aliquotaIcmsSt' => $this->getAliquotaIcmsSt(),
			'valorPautaSt' => $this->getValorPautaSt(),
			'valorPrecoMaximoSt' => $this->getValorPrecoMaximoSt(),
        ];
    }
}
