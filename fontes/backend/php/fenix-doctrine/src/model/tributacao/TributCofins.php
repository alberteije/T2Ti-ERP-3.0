<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_COFINS] 
                                                                                
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
 * @ORM\Table(name="TRIBUT_COFINS")
 */
class TributCofins extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="CST_COFINS")
	 */
	private $cstCofins;

	/**
	 * @ORM\Column(type="string", name="EFD_TABELA_435")
	 */
	private $efdTabela435;

	/**
	 * @ORM\Column(type="string", name="MODALIDADE_BASE_CALCULO")
	 */
	private $modalidadeBaseCalculo;

	/**
	 * @ORM\Column(type="float", name="PORCENTO_BASE_CALCULO")
	 */
	private $porcentoBaseCalculo;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_PORCENTO")
	 */
	private $aliquotaPorcento;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_UNIDADE")
	 */
	private $aliquotaUnidade;

	/**
	 * @ORM\Column(type="float", name="VALOR_PRECO_MAXIMO")
	 */
	private $valorPrecoMaximo;

	/**
	 * @ORM\Column(type="float", name="VALOR_PAUTA_FISCAL")
	 */
	private $valorPautaFiscal;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="TributConfiguraOfGt", inversedBy="tributCofins")
     * @ORM\JoinColumn(name="ID_TRIBUT_CONFIGURA_OF_GT", referencedColumnName="id")
     */
    private $tributConfiguraOfGt;


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

    public function getCstCofins() 
	{
		return $this->cstCofins;
	}

	public function setCstCofins($cstCofins) 
	{
		$this->cstCofins = $cstCofins;
	}

    public function getEfdTabela435() 
	{
		return $this->efdTabela435;
	}

	public function setEfdTabela435($efdTabela435) 
	{
		$this->efdTabela435 = $efdTabela435;
	}

    public function getModalidadeBaseCalculo() 
	{
		return $this->modalidadeBaseCalculo;
	}

	public function setModalidadeBaseCalculo($modalidadeBaseCalculo) 
	{
		$this->modalidadeBaseCalculo = $modalidadeBaseCalculo;
	}

    public function getPorcentoBaseCalculo() 
	{
		return $this->porcentoBaseCalculo;
	}

	public function setPorcentoBaseCalculo($porcentoBaseCalculo) 
	{
		$this->porcentoBaseCalculo = $porcentoBaseCalculo;
	}

    public function getAliquotaPorcento() 
	{
		return $this->aliquotaPorcento;
	}

	public function setAliquotaPorcento($aliquotaPorcento) 
	{
		$this->aliquotaPorcento = $aliquotaPorcento;
	}

    public function getAliquotaUnidade() 
	{
		return $this->aliquotaUnidade;
	}

	public function setAliquotaUnidade($aliquotaUnidade) 
	{
		$this->aliquotaUnidade = $aliquotaUnidade;
	}

    public function getValorPrecoMaximo() 
	{
		return $this->valorPrecoMaximo;
	}

	public function setValorPrecoMaximo($valorPrecoMaximo) 
	{
		$this->valorPrecoMaximo = $valorPrecoMaximo;
	}

    public function getValorPautaFiscal() 
	{
		return $this->valorPautaFiscal;
	}

	public function setValorPautaFiscal($valorPautaFiscal) 
	{
		$this->valorPautaFiscal = $valorPautaFiscal;
	}

    public function getTributConfiguraOfGt(): ?TributConfiguraOfGt 
	{
		return $this->tributConfiguraOfGt;
	}

	public function setTributConfiguraOfGt(?TributConfiguraOfGt $tributConfiguraOfGt) 
	{
		$this->tributConfiguraOfGt = $tributConfiguraOfGt;
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
			$this->setCstCofins($objeto->cstCofins);
			$this->setEfdTabela435($objeto->efdTabela435);
			$this->setModalidadeBaseCalculo($objeto->modalidadeBaseCalculo);
			$this->setPorcentoBaseCalculo($objeto->porcentoBaseCalculo);
			$this->setAliquotaPorcento($objeto->aliquotaPorcento);
			$this->setAliquotaUnidade($objeto->aliquotaUnidade);
			$this->setValorPrecoMaximo($objeto->valorPrecoMaximo);
			$this->setValorPautaFiscal($objeto->valorPautaFiscal);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'TributCofins');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'cstCofins' => $this->getCstCofins(),
			'efdTabela435' => $this->getEfdTabela435(),
			'modalidadeBaseCalculo' => $this->getModalidadeBaseCalculo(),
			'porcentoBaseCalculo' => $this->getPorcentoBaseCalculo(),
			'aliquotaPorcento' => $this->getAliquotaPorcento(),
			'aliquotaUnidade' => $this->getAliquotaUnidade(),
			'valorPrecoMaximo' => $this->getValorPrecoMaximo(),
			'valorPautaFiscal' => $this->getValorPautaFiscal(),
        ];
    }
}
