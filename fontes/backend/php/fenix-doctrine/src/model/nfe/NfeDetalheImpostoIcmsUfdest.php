<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS_UFDEST] 
                                                                                
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
 * @ORM\Table(name="NFE_DETALHE_IMPOSTO_ICMS_UFDEST")
 */
class NfeDetalheImpostoIcmsUfdest extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_ICMS_UF_DESTINO")
	 */
	private $valorBcIcmsUfDestino;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_FCP_UF_DESTINO")
	 */
	private $valorBcFcpUfDestino;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_FCP_UF_DESTINO")
	 */
	private $percentualFcpUfDestino;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_INTERNA_UF_DESTINO")
	 */
	private $aliquotaInternaUfDestino;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_INTERESDATUAL_UF_ENVOLVIDAS")
	 */
	private $aliquotaInteresdatualUfEnvolvidas;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_PROVISORIO_PARTILHA_ICMS")
	 */
	private $percentualProvisorioPartilhaIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_FCP_UF_DESTINO")
	 */
	private $valorIcmsFcpUfDestino;

	/**
	 * @ORM\Column(type="float", name="VALOR_INTERESTADUAL_UF_DESTINO")
	 */
	private $valorInterestadualUfDestino;

	/**
	 * @ORM\Column(type="float", name="VALOR_INTERESTADUAL_UF_REMETENTE")
	 */
	private $valorInterestadualUfRemetente;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeDetalhe", inversedBy="nfeDetalheImpostoIcmsUfdest")
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

    public function getValorBcIcmsUfDestino() 
	{
		return $this->valorBcIcmsUfDestino;
	}

	public function setValorBcIcmsUfDestino($valorBcIcmsUfDestino) 
	{
		$this->valorBcIcmsUfDestino = $valorBcIcmsUfDestino;
	}

    public function getValorBcFcpUfDestino() 
	{
		return $this->valorBcFcpUfDestino;
	}

	public function setValorBcFcpUfDestino($valorBcFcpUfDestino) 
	{
		$this->valorBcFcpUfDestino = $valorBcFcpUfDestino;
	}

    public function getPercentualFcpUfDestino() 
	{
		return $this->percentualFcpUfDestino;
	}

	public function setPercentualFcpUfDestino($percentualFcpUfDestino) 
	{
		$this->percentualFcpUfDestino = $percentualFcpUfDestino;
	}

    public function getAliquotaInternaUfDestino() 
	{
		return $this->aliquotaInternaUfDestino;
	}

	public function setAliquotaInternaUfDestino($aliquotaInternaUfDestino) 
	{
		$this->aliquotaInternaUfDestino = $aliquotaInternaUfDestino;
	}

    public function getAliquotaInteresdatualUfEnvolvidas() 
	{
		return $this->aliquotaInteresdatualUfEnvolvidas;
	}

	public function setAliquotaInteresdatualUfEnvolvidas($aliquotaInteresdatualUfEnvolvidas) 
	{
		$this->aliquotaInteresdatualUfEnvolvidas = $aliquotaInteresdatualUfEnvolvidas;
	}

    public function getPercentualProvisorioPartilhaIcms() 
	{
		return $this->percentualProvisorioPartilhaIcms;
	}

	public function setPercentualProvisorioPartilhaIcms($percentualProvisorioPartilhaIcms) 
	{
		$this->percentualProvisorioPartilhaIcms = $percentualProvisorioPartilhaIcms;
	}

    public function getValorIcmsFcpUfDestino() 
	{
		return $this->valorIcmsFcpUfDestino;
	}

	public function setValorIcmsFcpUfDestino($valorIcmsFcpUfDestino) 
	{
		$this->valorIcmsFcpUfDestino = $valorIcmsFcpUfDestino;
	}

    public function getValorInterestadualUfDestino() 
	{
		return $this->valorInterestadualUfDestino;
	}

	public function setValorInterestadualUfDestino($valorInterestadualUfDestino) 
	{
		$this->valorInterestadualUfDestino = $valorInterestadualUfDestino;
	}

    public function getValorInterestadualUfRemetente() 
	{
		return $this->valorInterestadualUfRemetente;
	}

	public function setValorInterestadualUfRemetente($valorInterestadualUfRemetente) 
	{
		$this->valorInterestadualUfRemetente = $valorInterestadualUfRemetente;
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
			$this->setValorBcIcmsUfDestino($objeto->valorBcIcmsUfDestino);
			$this->setValorBcFcpUfDestino($objeto->valorBcFcpUfDestino);
			$this->setPercentualFcpUfDestino($objeto->percentualFcpUfDestino);
			$this->setAliquotaInternaUfDestino($objeto->aliquotaInternaUfDestino);
			$this->setAliquotaInteresdatualUfEnvolvidas($objeto->aliquotaInteresdatualUfEnvolvidas);
			$this->setPercentualProvisorioPartilhaIcms($objeto->percentualProvisorioPartilhaIcms);
			$this->setValorIcmsFcpUfDestino($objeto->valorIcmsFcpUfDestino);
			$this->setValorInterestadualUfDestino($objeto->valorInterestadualUfDestino);
			$this->setValorInterestadualUfRemetente($objeto->valorInterestadualUfRemetente);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetalheImpostoIcmsUfdest');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'valorBcIcmsUfDestino' => $this->getValorBcIcmsUfDestino(),
			'valorBcFcpUfDestino' => $this->getValorBcFcpUfDestino(),
			'percentualFcpUfDestino' => $this->getPercentualFcpUfDestino(),
			'aliquotaInternaUfDestino' => $this->getAliquotaInternaUfDestino(),
			'aliquotaInteresdatualUfEnvolvidas' => $this->getAliquotaInteresdatualUfEnvolvidas(),
			'percentualProvisorioPartilhaIcms' => $this->getPercentualProvisorioPartilhaIcms(),
			'valorIcmsFcpUfDestino' => $this->getValorIcmsFcpUfDestino(),
			'valorInterestadualUfDestino' => $this->getValorInterestadualUfDestino(),
			'valorInterestadualUfRemetente' => $this->getValorInterestadualUfRemetente(),
        ];
    }
}
