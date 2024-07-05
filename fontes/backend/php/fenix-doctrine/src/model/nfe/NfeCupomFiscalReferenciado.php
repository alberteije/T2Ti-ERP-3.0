<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CUPOM_FISCAL_REFERENCIADO] 
                                                                                
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
 * @ORM\Table(name="NFE_CUPOM_FISCAL_REFERENCIADO")
 */
class NfeCupomFiscalReferenciado extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="MODELO_DOCUMENTO_FISCAL")
	 */
	private $modeloDocumentoFiscal;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_ORDEM_ECF")
	 */
	private $numeroOrdemEcf;

	/**
	 * @ORM\Column(type="integer", name="COO")
	 */
	private $coo;

	/**
	 * @ORM\Column(type="date", name="DATA_EMISSAO_CUPOM")
	 */
	private $dataEmissaoCupom;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_CAIXA")
	 */
	private $numeroCaixa;

	/**
	 * @ORM\Column(type="string", name="NUMERO_SERIE_ECF")
	 */
	private $numeroSerieEcf;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="NfeCabecalho", inversedBy="listaNfeCupomFiscalReferenciado")
     * @ORM\JoinColumn(name="ID_NFE_CABECALHO", referencedColumnName="id")
     */
    private $nfeCabecalho;


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

    public function getModeloDocumentoFiscal() 
	{
		return $this->modeloDocumentoFiscal;
	}

	public function setModeloDocumentoFiscal($modeloDocumentoFiscal) 
	{
		$this->modeloDocumentoFiscal = $modeloDocumentoFiscal;
	}

    public function getNumeroOrdemEcf() 
	{
		return $this->numeroOrdemEcf;
	}

	public function setNumeroOrdemEcf($numeroOrdemEcf) 
	{
		$this->numeroOrdemEcf = $numeroOrdemEcf;
	}

    public function getCoo() 
	{
		return $this->coo;
	}

	public function setCoo($coo) 
	{
		$this->coo = $coo;
	}

    public function getDataEmissaoCupom() 
	{
		if ($this->dataEmissaoCupom != null) {
			return $this->dataEmissaoCupom->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataEmissaoCupom($dataEmissaoCupom) 
	{
		$this->dataEmissaoCupom = $dataEmissaoCupom != null ? new \DateTime($dataEmissaoCupom) : null;
	}

    public function getNumeroCaixa() 
	{
		return $this->numeroCaixa;
	}

	public function setNumeroCaixa($numeroCaixa) 
	{
		$this->numeroCaixa = $numeroCaixa;
	}

    public function getNumeroSerieEcf() 
	{
		return $this->numeroSerieEcf;
	}

	public function setNumeroSerieEcf($numeroSerieEcf) 
	{
		$this->numeroSerieEcf = $numeroSerieEcf;
	}

    public function getNfeCabecalho(): ?NfeCabecalho 
	{
		return $this->nfeCabecalho;
	}

	public function setNfeCabecalho(?NfeCabecalho $nfeCabecalho) 
	{
		$this->nfeCabecalho = $nfeCabecalho;
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
			$this->setModeloDocumentoFiscal($objeto->modeloDocumentoFiscal);
			$this->setNumeroOrdemEcf($objeto->numeroOrdemEcf);
			$this->setCoo($objeto->coo);
			$this->setDataEmissaoCupom($objeto->dataEmissaoCupom);
			$this->setNumeroCaixa($objeto->numeroCaixa);
			$this->setNumeroSerieEcf($objeto->numeroSerieEcf);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeCupomFiscalReferenciado');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'modeloDocumentoFiscal' => $this->getModeloDocumentoFiscal(),
			'numeroOrdemEcf' => $this->getNumeroOrdemEcf(),
			'coo' => $this->getCoo(),
			'dataEmissaoCupom' => $this->getDataEmissaoCupom(),
			'numeroCaixa' => $this->getNumeroCaixa(),
			'numeroSerieEcf' => $this->getNumeroSerieEcf(),
        ];
    }
}
