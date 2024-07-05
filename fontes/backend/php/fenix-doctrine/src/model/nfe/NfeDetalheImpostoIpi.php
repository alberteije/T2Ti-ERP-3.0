<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_IPI] 
                                                                                
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
 * @ORM\Table(name="NFE_DETALHE_IMPOSTO_IPI")
 */
class NfeDetalheImpostoIpi extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="CNPJ_PRODUTOR")
	 */
	private $cnpjProdutor;

	/**
	 * @ORM\Column(type="string", name="CODIGO_SELO_IPI")
	 */
	private $codigoSeloIpi;

	/**
	 * @ORM\Column(type="integer", name="QUANTIDADE_SELO_IPI")
	 */
	private $quantidadeSeloIpi;

	/**
	 * @ORM\Column(type="string", name="ENQUADRAMENTO_LEGAL_IPI")
	 */
	private $enquadramentoLegalIpi;

	/**
	 * @ORM\Column(type="string", name="CST_IPI")
	 */
	private $cstIpi;

	/**
	 * @ORM\Column(type="float", name="VALOR_BASE_CALCULO_IPI")
	 */
	private $valorBaseCalculoIpi;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_UNIDADE_TRIBUTAVEL")
	 */
	private $quantidadeUnidadeTributavel;

	/**
	 * @ORM\Column(type="float", name="VALOR_UNIDADE_TRIBUTAVEL")
	 */
	private $valorUnidadeTributavel;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_IPI")
	 */
	private $aliquotaIpi;

	/**
	 * @ORM\Column(type="float", name="VALOR_IPI")
	 */
	private $valorIpi;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeDetalhe", inversedBy="nfeDetalheImpostoIpi")
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

    public function getCnpjProdutor() 
	{
		return $this->cnpjProdutor;
	}

	public function setCnpjProdutor($cnpjProdutor) 
	{
		$this->cnpjProdutor = $cnpjProdutor;
	}

    public function getCodigoSeloIpi() 
	{
		return $this->codigoSeloIpi;
	}

	public function setCodigoSeloIpi($codigoSeloIpi) 
	{
		$this->codigoSeloIpi = $codigoSeloIpi;
	}

    public function getQuantidadeSeloIpi() 
	{
		return $this->quantidadeSeloIpi;
	}

	public function setQuantidadeSeloIpi($quantidadeSeloIpi) 
	{
		$this->quantidadeSeloIpi = $quantidadeSeloIpi;
	}

    public function getEnquadramentoLegalIpi() 
	{
		return $this->enquadramentoLegalIpi;
	}

	public function setEnquadramentoLegalIpi($enquadramentoLegalIpi) 
	{
		$this->enquadramentoLegalIpi = $enquadramentoLegalIpi;
	}

    public function getCstIpi() 
	{
		return $this->cstIpi;
	}

	public function setCstIpi($cstIpi) 
	{
		$this->cstIpi = $cstIpi;
	}

    public function getValorBaseCalculoIpi() 
	{
		return $this->valorBaseCalculoIpi;
	}

	public function setValorBaseCalculoIpi($valorBaseCalculoIpi) 
	{
		$this->valorBaseCalculoIpi = $valorBaseCalculoIpi;
	}

    public function getQuantidadeUnidadeTributavel() 
	{
		return $this->quantidadeUnidadeTributavel;
	}

	public function setQuantidadeUnidadeTributavel($quantidadeUnidadeTributavel) 
	{
		$this->quantidadeUnidadeTributavel = $quantidadeUnidadeTributavel;
	}

    public function getValorUnidadeTributavel() 
	{
		return $this->valorUnidadeTributavel;
	}

	public function setValorUnidadeTributavel($valorUnidadeTributavel) 
	{
		$this->valorUnidadeTributavel = $valorUnidadeTributavel;
	}

    public function getAliquotaIpi() 
	{
		return $this->aliquotaIpi;
	}

	public function setAliquotaIpi($aliquotaIpi) 
	{
		$this->aliquotaIpi = $aliquotaIpi;
	}

    public function getValorIpi() 
	{
		return $this->valorIpi;
	}

	public function setValorIpi($valorIpi) 
	{
		$this->valorIpi = $valorIpi;
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
			$this->setCnpjProdutor($objeto->cnpjProdutor);
			$this->setCodigoSeloIpi($objeto->codigoSeloIpi);
			$this->setQuantidadeSeloIpi($objeto->quantidadeSeloIpi);
			$this->setEnquadramentoLegalIpi($objeto->enquadramentoLegalIpi);
			$this->setCstIpi($objeto->cstIpi);
			$this->setValorBaseCalculoIpi($objeto->valorBaseCalculoIpi);
			$this->setQuantidadeUnidadeTributavel($objeto->quantidadeUnidadeTributavel);
			$this->setValorUnidadeTributavel($objeto->valorUnidadeTributavel);
			$this->setAliquotaIpi($objeto->aliquotaIpi);
			$this->setValorIpi($objeto->valorIpi);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetalheImpostoIpi');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'cnpjProdutor' => $this->getCnpjProdutor(),
			'codigoSeloIpi' => $this->getCodigoSeloIpi(),
			'quantidadeSeloIpi' => $this->getQuantidadeSeloIpi(),
			'enquadramentoLegalIpi' => $this->getEnquadramentoLegalIpi(),
			'cstIpi' => $this->getCstIpi(),
			'valorBaseCalculoIpi' => $this->getValorBaseCalculoIpi(),
			'quantidadeUnidadeTributavel' => $this->getQuantidadeUnidadeTributavel(),
			'valorUnidadeTributavel' => $this->getValorUnidadeTributavel(),
			'aliquotaIpi' => $this->getAliquotaIpi(),
			'valorIpi' => $this->getValorIpi(),
        ];
    }
}
