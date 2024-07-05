<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DESTINATARIO] 
                                                                                
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
 * @ORM\Table(name="NFE_DESTINATARIO")
 */
class NfeDestinatario extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="CNPJ")
	 */
	private $cnpj;

	/**
	 * @ORM\Column(type="string", name="CPF")
	 */
	private $cpf;

	/**
	 * @ORM\Column(type="string", name="ESTRANGEIRO_IDENTIFICACAO")
	 */
	private $estrangeiroIdentificacao;

	/**
	 * @ORM\Column(type="string", name="NOME")
	 */
	private $nome;

	/**
	 * @ORM\Column(type="string", name="LOGRADOURO")
	 */
	private $logradouro;

	/**
	 * @ORM\Column(type="string", name="NUMERO")
	 */
	private $numero;

	/**
	 * @ORM\Column(type="string", name="COMPLEMENTO")
	 */
	private $complemento;

	/**
	 * @ORM\Column(type="string", name="BAIRRO")
	 */
	private $bairro;

	/**
	 * @ORM\Column(type="integer", name="CODIGO_MUNICIPIO")
	 */
	private $codigoMunicipio;

	/**
	 * @ORM\Column(type="string", name="NOME_MUNICIPIO")
	 */
	private $nomeMunicipio;

	/**
	 * @ORM\Column(type="string", name="UF")
	 */
	private $uf;

	/**
	 * @ORM\Column(type="string", name="CEP")
	 */
	private $cep;

	/**
	 * @ORM\Column(type="integer", name="CODIGO_PAIS")
	 */
	private $codigoPais;

	/**
	 * @ORM\Column(type="string", name="NOME_PAIS")
	 */
	private $nomePais;

	/**
	 * @ORM\Column(type="string", name="TELEFONE")
	 */
	private $telefone;

	/**
	 * @ORM\Column(type="string", name="INDICADOR_IE")
	 */
	private $indicadorIe;

	/**
	 * @ORM\Column(type="string", name="INSCRICAO_ESTADUAL")
	 */
	private $inscricaoEstadual;

	/**
	 * @ORM\Column(type="integer", name="SUFRAMA")
	 */
	private $suframa;

	/**
	 * @ORM\Column(type="string", name="INSCRICAO_MUNICIPAL")
	 */
	private $inscricaoMunicipal;

	/**
	 * @ORM\Column(type="string", name="EMAIL")
	 */
	private $email;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeCabecalho", inversedBy="nfeDestinatario")
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

    public function getEstrangeiroIdentificacao() 
	{
		return $this->estrangeiroIdentificacao;
	}

	public function setEstrangeiroIdentificacao($estrangeiroIdentificacao) 
	{
		$this->estrangeiroIdentificacao = $estrangeiroIdentificacao;
	}

    public function getNome() 
	{
		return $this->nome;
	}

	public function setNome($nome) 
	{
		$this->nome = $nome;
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

    public function getComplemento() 
	{
		return $this->complemento;
	}

	public function setComplemento($complemento) 
	{
		$this->complemento = $complemento;
	}

    public function getBairro() 
	{
		return $this->bairro;
	}

	public function setBairro($bairro) 
	{
		$this->bairro = $bairro;
	}

    public function getCodigoMunicipio() 
	{
		return $this->codigoMunicipio;
	}

	public function setCodigoMunicipio($codigoMunicipio) 
	{
		$this->codigoMunicipio = $codigoMunicipio;
	}

    public function getNomeMunicipio() 
	{
		return $this->nomeMunicipio;
	}

	public function setNomeMunicipio($nomeMunicipio) 
	{
		$this->nomeMunicipio = $nomeMunicipio;
	}

    public function getUf() 
	{
		return $this->uf;
	}

	public function setUf($uf) 
	{
		$this->uf = $uf;
	}

    public function getCep() 
	{
		return $this->cep;
	}

	public function setCep($cep) 
	{
		$this->cep = $cep;
	}

    public function getCodigoPais() 
	{
		return $this->codigoPais;
	}

	public function setCodigoPais($codigoPais) 
	{
		$this->codigoPais = $codigoPais;
	}

    public function getNomePais() 
	{
		return $this->nomePais;
	}

	public function setNomePais($nomePais) 
	{
		$this->nomePais = $nomePais;
	}

    public function getTelefone() 
	{
		return $this->telefone;
	}

	public function setTelefone($telefone) 
	{
		$this->telefone = $telefone;
	}

    public function getIndicadorIe() 
	{
		return $this->indicadorIe;
	}

	public function setIndicadorIe($indicadorIe) 
	{
		$this->indicadorIe = $indicadorIe;
	}

    public function getInscricaoEstadual() 
	{
		return $this->inscricaoEstadual;
	}

	public function setInscricaoEstadual($inscricaoEstadual) 
	{
		$this->inscricaoEstadual = $inscricaoEstadual;
	}

    public function getSuframa() 
	{
		return $this->suframa;
	}

	public function setSuframa($suframa) 
	{
		$this->suframa = $suframa;
	}

    public function getInscricaoMunicipal() 
	{
		return $this->inscricaoMunicipal;
	}

	public function setInscricaoMunicipal($inscricaoMunicipal) 
	{
		$this->inscricaoMunicipal = $inscricaoMunicipal;
	}

    public function getEmail() 
	{
		return $this->email;
	}

	public function setEmail($email) 
	{
		$this->email = $email;
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
			$this->setCnpj($objeto->cnpj);
			$this->setCpf($objeto->cpf);
			$this->setEstrangeiroIdentificacao($objeto->estrangeiroIdentificacao);
			$this->setNome($objeto->nome);
			$this->setLogradouro($objeto->logradouro);
			$this->setNumero($objeto->numero);
			$this->setComplemento($objeto->complemento);
			$this->setBairro($objeto->bairro);
			$this->setCodigoMunicipio($objeto->codigoMunicipio);
			$this->setNomeMunicipio($objeto->nomeMunicipio);
			$this->setUf($objeto->uf);
			$this->setCep($objeto->cep);
			$this->setCodigoPais($objeto->codigoPais);
			$this->setNomePais($objeto->nomePais);
			$this->setTelefone($objeto->telefone);
			$this->setIndicadorIe($objeto->indicadorIe);
			$this->setInscricaoEstadual($objeto->inscricaoEstadual);
			$this->setSuframa($objeto->suframa);
			$this->setInscricaoMunicipal($objeto->inscricaoMunicipal);
			$this->setEmail($objeto->email);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDestinatario');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'cnpj' => $this->getCnpj(),
			'cpf' => $this->getCpf(),
			'estrangeiroIdentificacao' => $this->getEstrangeiroIdentificacao(),
			'nome' => $this->getNome(),
			'logradouro' => $this->getLogradouro(),
			'numero' => $this->getNumero(),
			'complemento' => $this->getComplemento(),
			'bairro' => $this->getBairro(),
			'codigoMunicipio' => $this->getCodigoMunicipio(),
			'nomeMunicipio' => $this->getNomeMunicipio(),
			'uf' => $this->getUf(),
			'cep' => $this->getCep(),
			'codigoPais' => $this->getCodigoPais(),
			'nomePais' => $this->getNomePais(),
			'telefone' => $this->getTelefone(),
			'indicadorIe' => $this->getIndicadorIe(),
			'inscricaoEstadual' => $this->getInscricaoEstadual(),
			'suframa' => $this->getSuframa(),
			'inscricaoMunicipal' => $this->getInscricaoMunicipal(),
			'email' => $this->getEmail(),
        ];
    }
}
