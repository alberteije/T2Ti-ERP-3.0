<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [SINDICATO] 
                                                                                
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
 * @ORM\Table(name="SINDICATO")
 */
class Sindicato extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="NOME")
	 */
	private $nome;

	/**
	 * @ORM\Column(type="integer", name="CODIGO_BANCO")
	 */
	private $codigoBanco;

	/**
	 * @ORM\Column(type="integer", name="CODIGO_AGENCIA")
	 */
	private $codigoAgencia;

	/**
	 * @ORM\Column(type="string", name="CONTA_BANCO")
	 */
	private $contaBanco;

	/**
	 * @ORM\Column(type="string", name="CODIGO_CEDENTE")
	 */
	private $codigoCedente;

	/**
	 * @ORM\Column(type="string", name="LOGRADOURO")
	 */
	private $logradouro;

	/**
	 * @ORM\Column(type="string", name="NUMERO")
	 */
	private $numero;

	/**
	 * @ORM\Column(type="string", name="BAIRRO")
	 */
	private $bairro;

	/**
	 * @ORM\Column(type="integer", name="MUNICIPIO_IBGE")
	 */
	private $municipioIbge;

	/**
	 * @ORM\Column(type="string", name="UF")
	 */
	private $uf;

	/**
	 * @ORM\Column(type="string", name="FONE1")
	 */
	private $fone1;

	/**
	 * @ORM\Column(type="string", name="FONE2")
	 */
	private $fone2;

	/**
	 * @ORM\Column(type="string", name="EMAIL")
	 */
	private $email;

	/**
	 * @ORM\Column(type="string", name="TIPO_SINDICATO")
	 */
	private $tipoSindicato;

	/**
	 * @ORM\Column(type="date", name="DATA_BASE")
	 */
	private $dataBase;

	/**
	 * @ORM\Column(type="float", name="PISO_SALARIAL")
	 */
	private $pisoSalarial;

	/**
	 * @ORM\Column(type="string", name="CNPJ")
	 */
	private $cnpj;

	/**
	 * @ORM\Column(type="string", name="CLASSIFICACAO_CONTABIL_CONTA")
	 */
	private $classificacaoContabilConta;


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

    public function getNome() 
	{
		return $this->nome;
	}

	public function setNome($nome) 
	{
		$this->nome = $nome;
	}

    public function getCodigoBanco() 
	{
		return $this->codigoBanco;
	}

	public function setCodigoBanco($codigoBanco) 
	{
		$this->codigoBanco = $codigoBanco;
	}

    public function getCodigoAgencia() 
	{
		return $this->codigoAgencia;
	}

	public function setCodigoAgencia($codigoAgencia) 
	{
		$this->codigoAgencia = $codigoAgencia;
	}

    public function getContaBanco() 
	{
		return $this->contaBanco;
	}

	public function setContaBanco($contaBanco) 
	{
		$this->contaBanco = $contaBanco;
	}

    public function getCodigoCedente() 
	{
		return $this->codigoCedente;
	}

	public function setCodigoCedente($codigoCedente) 
	{
		$this->codigoCedente = $codigoCedente;
	}

    public function getLogradouro() 
	{
		return $this->logradouro;
	}

	public function setLogradouro($logradouro) 
	{
		$this->logradouro = $logradouro;
	}

    public function getNumero() 
	{
		return $this->numero;
	}

	public function setNumero($numero) 
	{
		$this->numero = $numero;
	}

    public function getBairro() 
	{
		return $this->bairro;
	}

	public function setBairro($bairro) 
	{
		$this->bairro = $bairro;
	}

    public function getMunicipioIbge() 
	{
		return $this->municipioIbge;
	}

	public function setMunicipioIbge($municipioIbge) 
	{
		$this->municipioIbge = $municipioIbge;
	}

    public function getUf() 
	{
		return $this->uf;
	}

	public function setUf($uf) 
	{
		$this->uf = $uf;
	}

    public function getFone1() 
	{
		return $this->fone1;
	}

	public function setFone1($fone1) 
	{
		$this->fone1 = $fone1;
	}

    public function getFone2() 
	{
		return $this->fone2;
	}

	public function setFone2($fone2) 
	{
		$this->fone2 = $fone2;
	}

    public function getEmail() 
	{
		return $this->email;
	}

	public function setEmail($email) 
	{
		$this->email = $email;
	}

    public function getTipoSindicato() 
	{
		return $this->tipoSindicato;
	}

	public function setTipoSindicato($tipoSindicato) 
	{
		$this->tipoSindicato = $tipoSindicato;
	}

    public function getDataBase() 
	{
		if ($this->dataBase != null) {
			return $this->dataBase->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataBase($dataBase) 
	{
		$this->dataBase = $dataBase != null ? new \DateTime($dataBase) : null;
	}

    public function getPisoSalarial() 
	{
		return $this->pisoSalarial;
	}

	public function setPisoSalarial($pisoSalarial) 
	{
		$this->pisoSalarial = $pisoSalarial;
	}

    public function getCnpj() 
	{
		return $this->cnpj;
	}

	public function setCnpj($cnpj) 
	{
		$this->cnpj = $cnpj;
	}

    public function getClassificacaoContabilConta() 
	{
		return $this->classificacaoContabilConta;
	}

	public function setClassificacaoContabilConta($classificacaoContabilConta) 
	{
		$this->classificacaoContabilConta = $classificacaoContabilConta;
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
			$this->setNome($objeto->nome);
			$this->setCodigoBanco($objeto->codigoBanco);
			$this->setCodigoAgencia($objeto->codigoAgencia);
			$this->setContaBanco($objeto->contaBanco);
			$this->setCodigoCedente($objeto->codigoCedente);
			$this->setLogradouro($objeto->logradouro);
			$this->setNumero($objeto->numero);
			$this->setBairro($objeto->bairro);
			$this->setMunicipioIbge($objeto->municipioIbge);
			$this->setUf($objeto->uf);
			$this->setFone1($objeto->fone1);
			$this->setFone2($objeto->fone2);
			$this->setEmail($objeto->email);
			$this->setTipoSindicato($objeto->tipoSindicato);
			$this->setDataBase($objeto->dataBase);
			$this->setPisoSalarial($objeto->pisoSalarial);
			$this->setCnpj($objeto->cnpj);
			$this->setClassificacaoContabilConta($objeto->classificacaoContabilConta);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'Sindicato');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'nome' => $this->getNome(),
			'codigoBanco' => $this->getCodigoBanco(),
			'codigoAgencia' => $this->getCodigoAgencia(),
			'contaBanco' => $this->getContaBanco(),
			'codigoCedente' => $this->getCodigoCedente(),
			'logradouro' => $this->getLogradouro(),
			'numero' => $this->getNumero(),
			'bairro' => $this->getBairro(),
			'municipioIbge' => $this->getMunicipioIbge(),
			'uf' => $this->getUf(),
			'fone1' => $this->getFone1(),
			'fone2' => $this->getFone2(),
			'email' => $this->getEmail(),
			'tipoSindicato' => $this->getTipoSindicato(),
			'dataBase' => $this->getDataBase(),
			'pisoSalarial' => $this->getPisoSalarial(),
			'cnpj' => $this->getCnpj(),
			'classificacaoContabilConta' => $this->getClassificacaoContabilConta(),
        ];
    }
}
