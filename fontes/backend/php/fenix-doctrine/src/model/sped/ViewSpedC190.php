<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_C190] 
                                                                                
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
 * @ORM\Table(name="VIEW_SPED_C190")
 */
class ViewSpedC190 extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="CST_ICMS")
	 */
	private $cstIcms;

	/**
	 * @ORM\Column(type="integer", name="CFOP")
	 */
	private $cfop;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_ICMS")
	 */
	private $aliquotaIcms;

	/**
	 * @ORM\Column(type="datetime", name="DATA_HORA_EMISSAO")
	 */
	private $dataHoraEmissao;

	/**
	 * @ORM\Column(type="float", name="SOMA_VALOR_OPERACAO")
	 */
	private $somaValorOperacao;

	/**
	 * @ORM\Column(type="float", name="SOMA_BASE_CALCULO_ICMS")
	 */
	private $somaBaseCalculoIcms;

	/**
	 * @ORM\Column(type="float", name="SOMA_VALOR_ICMS")
	 */
	private $somaValorIcms;

	/**
	 * @ORM\Column(type="float", name="SOMA_BASE_CALCULO_ICMS_ST")
	 */
	private $somaBaseCalculoIcmsSt;

	/**
	 * @ORM\Column(type="float", name="SOMA_VALOR_ICMS_ST")
	 */
	private $somaValorIcmsSt;

	/**
	 * @ORM\Column(type="float", name="SOMA_VL_RED_BC")
	 */
	private $somaVlRedBc;

	/**
	 * @ORM\Column(type="float", name="SOMA_VALOR_IPI")
	 */
	private $somaValorIpi;


    /**
     * Relations
     */
    

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

    public function getCstIcms() 
	{
		return $this->cstIcms;
	}

	public function setCstIcms($cstIcms) 
	{
		$this->cstIcms = $cstIcms;
	}

    public function getCfop() 
	{
		return $this->cfop;
	}

	public function setCfop($cfop) 
	{
		$this->cfop = $cfop;
	}

    public function getAliquotaIcms() 
	{
		return $this->aliquotaIcms;
	}

	public function setAliquotaIcms($aliquotaIcms) 
	{
		$this->aliquotaIcms = $aliquotaIcms;
	}

    public function getDataHoraEmissao() 
	{
		if ($this->dataHoraEmissao != null) {
			return $this->dataHoraEmissao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataHoraEmissao($dataHoraEmissao) 
	{
		$this->dataHoraEmissao = $dataHoraEmissao != null ? new \DateTime($dataHoraEmissao) : null;
	}

    public function getSomaValorOperacao() 
	{
		return $this->somaValorOperacao;
	}

	public function setSomaValorOperacao($somaValorOperacao) 
	{
		$this->somaValorOperacao = $somaValorOperacao;
	}

    public function getSomaBaseCalculoIcms() 
	{
		return $this->somaBaseCalculoIcms;
	}

	public function setSomaBaseCalculoIcms($somaBaseCalculoIcms) 
	{
		$this->somaBaseCalculoIcms = $somaBaseCalculoIcms;
	}

    public function getSomaValorIcms() 
	{
		return $this->somaValorIcms;
	}

	public function setSomaValorIcms($somaValorIcms) 
	{
		$this->somaValorIcms = $somaValorIcms;
	}

    public function getSomaBaseCalculoIcmsSt() 
	{
		return $this->somaBaseCalculoIcmsSt;
	}

	public function setSomaBaseCalculoIcmsSt($somaBaseCalculoIcmsSt) 
	{
		$this->somaBaseCalculoIcmsSt = $somaBaseCalculoIcmsSt;
	}

    public function getSomaValorIcmsSt() 
	{
		return $this->somaValorIcmsSt;
	}

	public function setSomaValorIcmsSt($somaValorIcmsSt) 
	{
		$this->somaValorIcmsSt = $somaValorIcmsSt;
	}

    public function getSomaVlRedBc() 
	{
		return $this->somaVlRedBc;
	}

	public function setSomaVlRedBc($somaVlRedBc) 
	{
		$this->somaVlRedBc = $somaVlRedBc;
	}

    public function getSomaValorIpi() 
	{
		return $this->somaValorIpi;
	}

	public function setSomaValorIpi($somaValorIpi) 
	{
		$this->somaValorIpi = $somaValorIpi;
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
			$this->setCstIcms($objeto->cstIcms);
			$this->setCfop($objeto->cfop);
			$this->setAliquotaIcms($objeto->aliquotaIcms);
			$this->setDataHoraEmissao($objeto->dataHoraEmissao);
			$this->setSomaValorOperacao($objeto->somaValorOperacao);
			$this->setSomaBaseCalculoIcms($objeto->somaBaseCalculoIcms);
			$this->setSomaValorIcms($objeto->somaValorIcms);
			$this->setSomaBaseCalculoIcmsSt($objeto->somaBaseCalculoIcmsSt);
			$this->setSomaValorIcmsSt($objeto->somaValorIcmsSt);
			$this->setSomaVlRedBc($objeto->somaVlRedBc);
			$this->setSomaValorIpi($objeto->somaValorIpi);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'ViewSpedC190');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'cstIcms' => $this->getCstIcms(),
			'cfop' => $this->getCfop(),
			'aliquotaIcms' => $this->getAliquotaIcms(),
			'dataHoraEmissao' => $this->getDataHoraEmissao(),
			'somaValorOperacao' => $this->getSomaValorOperacao(),
			'somaBaseCalculoIcms' => $this->getSomaBaseCalculoIcms(),
			'somaValorIcms' => $this->getSomaValorIcms(),
			'somaBaseCalculoIcmsSt' => $this->getSomaBaseCalculoIcmsSt(),
			'somaValorIcmsSt' => $this->getSomaValorIcmsSt(),
			'somaVlRedBc' => $this->getSomaVlRedBc(),
			'somaValorIpi' => $this->getSomaValorIpi(),
        ];
    }
}
