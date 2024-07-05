<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [EMPRESA] 
                                                                                
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
 * @ORM\Table(name="EMPRESA")
 */
class Empresa extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="RAZAO_SOCIAL")
	 */
	private $razaoSocial;

	/**
	 * @ORM\Column(type="string", name="NOME_FANTASIA")
	 */
	private $nomeFantasia;

	/**
	 * @ORM\Column(type="string", name="CNPJ")
	 */
	private $cnpj;

	/**
	 * @ORM\Column(type="string", name="INSCRICAO_ESTADUAL")
	 */
	private $inscricaoEstadual;

	/**
	 * @ORM\Column(type="string", name="INSCRICAO_MUNICIPAL")
	 */
	private $inscricaoMunicipal;

	/**
	 * @ORM\Column(type="string", name="TIPO_REGIME")
	 */
	private $tipoRegime;

	/**
	 * @ORM\Column(type="string", name="CRT")
	 */
	private $crt;

	/**
	 * @ORM\Column(type="string", name="EMAIL")
	 */
	private $email;

	/**
	 * @ORM\Column(type="string", name="SITE")
	 */
	private $site;

	/**
	 * @ORM\Column(type="string", name="CONTATO")
	 */
	private $contato;

	/**
	 * @ORM\Column(type="date", name="DATA_CONSTITUICAO")
	 */
	private $dataConstituicao;

	/**
	 * @ORM\Column(type="string", name="TIPO")
	 */
	private $tipo;

	/**
	 * @ORM\Column(type="string", name="INSCRICAO_JUNTA_COMERCIAL")
	 */
	private $inscricaoJuntaComercial;

	/**
	 * @ORM\Column(type="date", name="DATA_INSC_JUNTA_COMERCIAL")
	 */
	private $dataInscJuntaComercial;

	/**
	 * @ORM\Column(type="integer", name="CODIGO_IBGE_CIDADE")
	 */
	private $codigoIbgeCidade;

	/**
	 * @ORM\Column(type="integer", name="CODIGO_IBGE_UF")
	 */
	private $codigoIbgeUf;

	/**
	 * @ORM\Column(type="string", name="CEI")
	 */
	private $cei;

	/**
	 * @ORM\Column(type="string", name="CODIGO_CNAE_PRINCIPAL")
	 */
	private $codigoCnaePrincipal;


	public $enderecoPrincipal;

    /**
     * Relations
     */
    
    /**
     * @ORM\OneToMany(targetEntity="EmpresaContato", mappedBy="empresa", cascade={"persist", "remove"})
     */
    private $listaEmpresaContato;

    /**
     * @ORM\OneToMany(targetEntity="EmpresaEndereco", mappedBy="empresa", cascade={"persist", "remove"})
     */
    private $listaEmpresaEndereco;

    /**
     * @ORM\OneToMany(targetEntity="EmpresaTelefone", mappedBy="empresa", cascade={"persist", "remove"})
     */
    private $listaEmpresaTelefone;


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

    public function getRazaoSocial() 
	{
		return $this->razaoSocial;
	}

	public function setRazaoSocial($razaoSocial) 
	{
		$this->razaoSocial = $razaoSocial;
	}

    public function getNomeFantasia() 
	{
		return $this->nomeFantasia;
	}

	public function setNomeFantasia($nomeFantasia) 
	{
		$this->nomeFantasia = $nomeFantasia;
	}

    public function getCnpj() 
	{
		return $this->cnpj;
	}

	public function setCnpj($cnpj) 
	{
		$this->cnpj = $cnpj;
	}

    public function getInscricaoEstadual() 
	{
		return $this->inscricaoEstadual;
	}

	public function setInscricaoEstadual($inscricaoEstadual) 
	{
		$this->inscricaoEstadual = $inscricaoEstadual;
	}

    public function getInscricaoMunicipal() 
	{
		return $this->inscricaoMunicipal;
	}

	public function setInscricaoMunicipal($inscricaoMunicipal) 
	{
		$this->inscricaoMunicipal = $inscricaoMunicipal;
	}

    public function getTipoRegime() 
	{
		return $this->tipoRegime;
	}

	public function setTipoRegime($tipoRegime) 
	{
		$this->tipoRegime = $tipoRegime;
	}

    public function getCrt() 
	{
		return $this->crt;
	}

	public function setCrt($crt) 
	{
		$this->crt = $crt;
	}

    public function getEmail() 
	{
		return $this->email;
	}

	public function setEmail($email) 
	{
		$this->email = $email;
	}

    public function getSite() 
	{
		return $this->site;
	}

	public function setSite($site) 
	{
		$this->site = $site;
	}

    public function getContato() 
	{
		return $this->contato;
	}

	public function setContato($contato) 
	{
		$this->contato = $contato;
	}

    public function getDataConstituicao() 
	{
		if ($this->dataConstituicao != null) {
			return $this->dataConstituicao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataConstituicao($dataConstituicao) 
	{
		$this->dataConstituicao = $dataConstituicao != null ? new \DateTime($dataConstituicao) : null;
	}

    public function getTipo() 
	{
		return $this->tipo;
	}

	public function setTipo($tipo) 
	{
		$this->tipo = $tipo;
	}

    public function getInscricaoJuntaComercial() 
	{
		return $this->inscricaoJuntaComercial;
	}

	public function setInscricaoJuntaComercial($inscricaoJuntaComercial) 
	{
		$this->inscricaoJuntaComercial = $inscricaoJuntaComercial;
	}

    public function getDataInscJuntaComercial() 
	{
		if ($this->dataInscJuntaComercial != null) {
			return $this->dataInscJuntaComercial->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataInscJuntaComercial($dataInscJuntaComercial) 
	{
		$this->dataInscJuntaComercial = $dataInscJuntaComercial != null ? new \DateTime($dataInscJuntaComercial) : null;
	}

    public function getCodigoIbgeCidade() 
	{
		return $this->codigoIbgeCidade;
	}

	public function setCodigoIbgeCidade($codigoIbgeCidade) 
	{
		$this->codigoIbgeCidade = $codigoIbgeCidade;
	}

    public function getCodigoIbgeUf() 
	{
		return $this->codigoIbgeUf;
	}

	public function setCodigoIbgeUf($codigoIbgeUf) 
	{
		$this->codigoIbgeUf = $codigoIbgeUf;
	}

    public function getCei() 
	{
		return $this->cei;
	}

	public function setCei($cei) 
	{
		$this->cei = $cei;
	}

    public function getCodigoCnaePrincipal() 
	{
		return $this->codigoCnaePrincipal;
	}

	public function setCodigoCnaePrincipal($codigoCnaePrincipal) 
	{
		$this->codigoCnaePrincipal = $codigoCnaePrincipal;
	}

    public function getListaEmpresaContato() 
	{
		return $this->listaEmpresaContato->toArray();
	}

	public function setListaEmpresaContato(array $listaEmpresaContato) {
		$this->listaEmpresaContato = new ArrayCollection();
		for ($i = 0; $i < count($listaEmpresaContato); $i++) {
			$empresaContato = $listaEmpresaContato[$i];
			$empresaContato->setEmpresa($this);
			$this->listaEmpresaContato->add($empresaContato);
		}
	}

    public function getListaEmpresaEndereco() 
	{
		return $this->listaEmpresaEndereco->toArray();
	}

	public function setListaEmpresaEndereco(array $listaEmpresaEndereco) {
		$this->listaEmpresaEndereco = new ArrayCollection();
		for ($i = 0; $i < count($listaEmpresaEndereco); $i++) {
			$empresaEndereco = $listaEmpresaEndereco[$i];
			$empresaEndereco->setEmpresa($this);
			$this->listaEmpresaEndereco->add($empresaEndereco);
		}
	}

    public function getListaEmpresaTelefone() 
	{
		return $this->listaEmpresaTelefone->toArray();
	}

	public function setListaEmpresaTelefone(array $listaEmpresaTelefone) {
		$this->listaEmpresaTelefone = new ArrayCollection();
		for ($i = 0; $i < count($listaEmpresaTelefone); $i++) {
			$empresaTelefone = $listaEmpresaTelefone[$i];
			$empresaTelefone->setEmpresa($this);
			$this->listaEmpresaTelefone->add($empresaTelefone);
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

		
		$this->listaEmpresaContato = new ArrayCollection();
		$listaEmpresaContatoJson = $objetoJson->listaEmpresaContato;
		if ($listaEmpresaContatoJson != null) {
			for ($i = 0; $i < count($listaEmpresaContatoJson); $i++) {
				$objeto = new EmpresaContato($listaEmpresaContatoJson[$i]);
				$objeto->setEmpresa($this);
				$this->listaEmpresaContato->add($objeto);
			}
		}

		$this->listaEmpresaEndereco = new ArrayCollection();
		$listaEmpresaEnderecoJson = $objetoJson->listaEmpresaEndereco;
		if ($listaEmpresaEnderecoJson != null) {
			for ($i = 0; $i < count($listaEmpresaEnderecoJson); $i++) {
				$objeto = new EmpresaEndereco($listaEmpresaEnderecoJson[$i]);
				$objeto->setEmpresa($this);
				$this->listaEmpresaEndereco->add($objeto);

				// principal
				if ($objeto->getPrincipal() == 'S') {
					$this->enderecoPrincipal = $objeto;
				}
			}
		}

		$this->listaEmpresaTelefone = new ArrayCollection();
		$listaEmpresaTelefoneJson = $objetoJson->listaEmpresaTelefone;
		if ($listaEmpresaTelefoneJson != null) {
			for ($i = 0; $i < count($listaEmpresaTelefoneJson); $i++) {
				$objeto = new EmpresaTelefone($listaEmpresaTelefoneJson[$i]);
				$objeto->setEmpresa($this);
				$this->listaEmpresaTelefone->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setRazaoSocial($objeto->razaoSocial);
			$this->setNomeFantasia($objeto->nomeFantasia);
			$this->setCnpj($objeto->cnpj);
			$this->setInscricaoEstadual($objeto->inscricaoEstadual);
			$this->setInscricaoMunicipal($objeto->inscricaoMunicipal);
			$this->setTipoRegime($objeto->tipoRegime);
			$this->setCrt($objeto->crt);
			$this->setEmail($objeto->email);
			$this->setSite($objeto->site);
			$this->setContato($objeto->contato);
			$this->setDataConstituicao($objeto->dataConstituicao);
			$this->setTipo($objeto->tipo);
			$this->setInscricaoJuntaComercial($objeto->inscricaoJuntaComercial);
			$this->setDataInscJuntaComercial($objeto->dataInscJuntaComercial);
			$this->setCodigoIbgeCidade($objeto->codigoIbgeCidade);
			$this->setCodigoIbgeUf($objeto->codigoIbgeUf);
			$this->setCei($objeto->cei);
			$this->setCodigoCnaePrincipal($objeto->codigoCnaePrincipal);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'Empresa');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'razaoSocial' => $this->getRazaoSocial(),
			'nomeFantasia' => $this->getNomeFantasia(),
			'cnpj' => $this->getCnpj(),
			'inscricaoEstadual' => $this->getInscricaoEstadual(),
			'inscricaoMunicipal' => $this->getInscricaoMunicipal(),
			'tipoRegime' => $this->getTipoRegime(),
			'crt' => $this->getCrt(),
			'email' => $this->getEmail(),
			'site' => $this->getSite(),
			'contato' => $this->getContato(),
			'dataConstituicao' => $this->getDataConstituicao(),
			'tipo' => $this->getTipo(),
			'inscricaoJuntaComercial' => $this->getInscricaoJuntaComercial(),
			'dataInscJuntaComercial' => $this->getDataInscJuntaComercial(),
			'codigoIbgeCidade' => $this->getCodigoIbgeCidade(),
			'codigoIbgeUf' => $this->getCodigoIbgeUf(),
			'cei' => $this->getCei(),
			'codigoCnaePrincipal' => $this->getCodigoCnaePrincipal(),
			'listaEmpresaContato' => $this->getListaEmpresaContato(),
			'listaEmpresaEndereco' => $this->getListaEmpresaEndereco(),
			'listaEmpresaTelefone' => $this->getListaEmpresaTelefone(),
        ];
    }
}
