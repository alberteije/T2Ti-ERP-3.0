<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_PROD_RURAL_REFERENCIADA] 
                                                                                
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
 * @ORM\Table(name="NFE_PROD_RURAL_REFERENCIADA")
 */
class NfeProdRuralReferenciada extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="CODIGO_UF")
	 */
	private $codigoUf;

	/**
	 * @ORM\Column(type="string", name="ANO_MES")
	 */
	private $anoMes;

	/**
	 * @ORM\Column(type="string", name="CNPJ")
	 */
	private $cnpj;

	/**
	 * @ORM\Column(type="string", name="CPF")
	 */
	private $cpf;

	/**
	 * @ORM\Column(type="string", name="INSCRICAO_ESTADUAL")
	 */
	private $inscricaoEstadual;

	/**
	 * @ORM\Column(type="string", name="MODELO")
	 */
	private $modelo;

	/**
	 * @ORM\Column(type="string", name="SERIE")
	 */
	private $serie;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_NF")
	 */
	private $numeroNf;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="NfeCabecalho", inversedBy="listaNfeProdRuralReferenciada")
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

    public function getCodigoUf() 
	{
		return $this->codigoUf;
	}

	public function setCodigoUf($codigoUf) 
	{
		$this->codigoUf = $codigoUf;
	}

    public function getAnoMes() 
	{
		return $this->anoMes;
	}

	public function setAnoMes($anoMes) 
	{
		$this->anoMes = $anoMes;
	}

    public function getCnpj() 
	{
		return $this->cnpj;
	}

	public function setCnpj($cnpj) 
	{
		$this->cnpj = $cnpj;
	}

    public function getCpf() 
	{
		return $this->cpf;
	}

	public function setCpf($cpf) 
	{
		$this->cpf = $cpf;
	}

    public function getInscricaoEstadual() 
	{
		return $this->inscricaoEstadual;
	}

	public function setInscricaoEstadual($inscricaoEstadual) 
	{
		$this->inscricaoEstadual = $inscricaoEstadual;
	}

    public function getModelo() 
	{
		return $this->modelo;
	}

	public function setModelo($modelo) 
	{
		$this->modelo = $modelo;
	}

    public function getSerie() 
	{
		return $this->serie;
	}

	public function setSerie($serie) 
	{
		$this->serie = $serie;
	}

    public function getNumeroNf() 
	{
		return $this->numeroNf;
	}

	public function setNumeroNf($numeroNf) 
	{
		$this->numeroNf = $numeroNf;
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
			$this->setCodigoUf($objeto->codigoUf);
			$this->setAnoMes($objeto->anoMes);
			$this->setCnpj($objeto->cnpj);
			$this->setCpf($objeto->cpf);
			$this->setInscricaoEstadual($objeto->inscricaoEstadual);
			$this->setModelo($objeto->modelo);
			$this->setSerie($objeto->serie);
			$this->setNumeroNf($objeto->numeroNf);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeProdRuralReferenciada');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'codigoUf' => $this->getCodigoUf(),
			'anoMes' => $this->getAnoMes(),
			'cnpj' => $this->getCnpj(),
			'cpf' => $this->getCpf(),
			'inscricaoEstadual' => $this->getInscricaoEstadual(),
			'modelo' => $this->getModelo(),
			'serie' => $this->getSerie(),
			'numeroNf' => $this->getNumeroNf(),
        ];
    }
}
