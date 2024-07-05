<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [PESSOA] 
                                                                                
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
 * @ORM\Table(name="PESSOA")
 */
class Pessoa extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="string", name="TIPO")
	 */
	private $tipo;

	/**
	 * @ORM\Column(type="string", name="SITE")
	 */
	private $site;

	/**
	 * @ORM\Column(type="string", name="EMAIL")
	 */
	private $email;

	/**
	 * @ORM\Column(type="string", name="EH_CLIENTE")
	 */
	private $ehCliente;

	/**
	 * @ORM\Column(type="string", name="EH_FORNECEDOR")
	 */
	private $ehFornecedor;

	/**
	 * @ORM\Column(type="string", name="EH_TRANSPORTADORA")
	 */
	private $ehTransportadora;

	/**
	 * @ORM\Column(type="string", name="EH_COLABORADOR")
	 */
	private $ehColaborador;

	/**
	 * @ORM\Column(type="string", name="EH_CONTADOR")
	 */
	private $ehContador;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Cliente", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $cliente;

    /**
     * @ORM\OneToOne(targetEntity="Colaborador", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $colaborador;

    /**
     * @ORM\OneToOne(targetEntity="Contador", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $contador;

    /**
     * @ORM\OneToOne(targetEntity="Fornecedor", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $fornecedor;

    /**
     * @ORM\OneToOne(targetEntity="PessoaFisica", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $pessoaFisica;

    /**
     * @ORM\OneToOne(targetEntity="PessoaJuridica", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $pessoaJuridica;

    /**
     * @ORM\OneToOne(targetEntity="Transportadora", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $transportadora;

    /**
     * @ORM\OneToMany(targetEntity="PessoaContato", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $listaPessoaContato;

    /**
     * @ORM\OneToMany(targetEntity="PessoaEndereco", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $listaPessoaEndereco;

    /**
     * @ORM\OneToMany(targetEntity="PessoaTelefone", mappedBy="pessoa", cascade={"persist", "remove"})
     */
    private $listaPessoaTelefone;


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

    public function getTipo() 
	{
		return $this->tipo;
	}

	public function setTipo($tipo) 
	{
		$this->tipo = $tipo;
	}

    public function getSite() 
	{
		return $this->site;
	}

	public function setSite($site) 
	{
		$this->site = $site;
	}

    public function getEmail() 
	{
		return $this->email;
	}

	public function setEmail($email) 
	{
		$this->email = $email;
	}

    public function getEhCliente() 
	{
		return $this->ehCliente;
	}

	public function setEhCliente($ehCliente) 
	{
		$this->ehCliente = $ehCliente;
	}

    public function getEhFornecedor() 
	{
		return $this->ehFornecedor;
	}

	public function setEhFornecedor($ehFornecedor) 
	{
		$this->ehFornecedor = $ehFornecedor;
	}

    public function getEhTransportadora() 
	{
		return $this->ehTransportadora;
	}

	public function setEhTransportadora($ehTransportadora) 
	{
		$this->ehTransportadora = $ehTransportadora;
	}

    public function getEhColaborador() 
	{
		return $this->ehColaborador;
	}

	public function setEhColaborador($ehColaborador) 
	{
		$this->ehColaborador = $ehColaborador;
	}

    public function getEhContador() 
	{
		return $this->ehContador;
	}

	public function setEhContador($ehContador) 
	{
		$this->ehContador = $ehContador;
	}

    public function getCliente(): ?Cliente 
	{
		return $this->cliente;
	}

	public function setCliente(?Cliente $cliente) 
	{
		$this->cliente = $cliente;
	}

    public function getColaborador(): ?Colaborador 
	{
		return $this->colaborador;
	}

	public function setColaborador(?Colaborador $colaborador) 
	{
		$this->colaborador = $colaborador;
	}

    public function getContador(): ?Contador 
	{
		return $this->contador;
	}

	public function setContador(?Contador $contador) 
	{
		$this->contador = $contador;
	}

    public function getFornecedor(): ?Fornecedor 
	{
		return $this->fornecedor;
	}

	public function setFornecedor(?Fornecedor $fornecedor) 
	{
		$this->fornecedor = $fornecedor;
	}

    public function getPessoaFisica(): ?PessoaFisica 
	{
		return $this->pessoaFisica;
	}

	public function setPessoaFisica(?PessoaFisica $pessoaFisica) 
	{
		$this->pessoaFisica = $pessoaFisica;
	}

    public function getPessoaJuridica(): ?PessoaJuridica 
	{
		return $this->pessoaJuridica;
	}

	public function setPessoaJuridica(?PessoaJuridica $pessoaJuridica) 
	{
		$this->pessoaJuridica = $pessoaJuridica;
	}

    public function getTransportadora(): ?Transportadora 
	{
		return $this->transportadora;
	}

	public function setTransportadora(?Transportadora $transportadora) 
	{
		$this->transportadora = $transportadora;
	}

    public function getListaPessoaContato() 
	{
		return $this->listaPessoaContato->toArray();
	}

	public function setListaPessoaContato(array $listaPessoaContato) {
		$this->listaPessoaContato = new ArrayCollection();
		for ($i = 0; $i < count($listaPessoaContato); $i++) {
			$pessoaContato = $listaPessoaContato[$i];
			$pessoaContato->setPessoa($this);
			$this->listaPessoaContato->add($pessoaContato);
		}
	}

    public function getListaPessoaEndereco() 
	{
		return $this->listaPessoaEndereco->toArray();
	}

	public function setListaPessoaEndereco(array $listaPessoaEndereco) {
		$this->listaPessoaEndereco = new ArrayCollection();
		for ($i = 0; $i < count($listaPessoaEndereco); $i++) {
			$pessoaEndereco = $listaPessoaEndereco[$i];
			$pessoaEndereco->setPessoa($this);
			$this->listaPessoaEndereco->add($pessoaEndereco);
		}
	}

    public function getListaPessoaTelefone() 
	{
		return $this->listaPessoaTelefone->toArray();
	}

	public function setListaPessoaTelefone(array $listaPessoaTelefone) {
		$this->listaPessoaTelefone = new ArrayCollection();
		for ($i = 0; $i < count($listaPessoaTelefone); $i++) {
			$pessoaTelefone = $listaPessoaTelefone[$i];
			$pessoaTelefone->setPessoa($this);
			$this->listaPessoaTelefone->add($pessoaTelefone);
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

		if (isset($objetoJson->cliente)) {
			$this->setCliente(new Cliente($objetoJson->cliente));
			$this->getCliente()->setPessoa($this);
		}

		if (isset($objetoJson->colaborador)) {
			$this->setColaborador(new Colaborador($objetoJson->colaborador));
			$this->getColaborador()->setPessoa($this);
		}

		if (isset($objetoJson->contador)) {
			$this->setContador(new Contador($objetoJson->contador));
			$this->getContador()->setPessoa($this);
		}

		if (isset($objetoJson->fornecedor)) {
			$this->setFornecedor(new Fornecedor($objetoJson->fornecedor));
			$this->getFornecedor()->setPessoa($this);
		}

		if (isset($objetoJson->pessoaFisica)) {
			$this->setPessoaFisica(new PessoaFisica($objetoJson->pessoaFisica));
			$this->getPessoaFisica()->setPessoa($this);
		}

		if (isset($objetoJson->pessoaJuridica)) {
			$this->setPessoaJuridica(new PessoaJuridica($objetoJson->pessoaJuridica));
			$this->getPessoaJuridica()->setPessoa($this);
		}

		if (isset($objetoJson->transportadora)) {
			$this->setTransportadora(new Transportadora($objetoJson->transportadora));
			$this->getTransportadora()->setPessoa($this);
		}

		
		$this->listaPessoaContato = new ArrayCollection();
		$listaPessoaContatoJson = $objetoJson->listaPessoaContato;
		if ($listaPessoaContatoJson != null) {
			for ($i = 0; $i < count($listaPessoaContatoJson); $i++) {
				$objeto = new PessoaContato($listaPessoaContatoJson[$i]);
				$objeto->setPessoa($this);
				$this->listaPessoaContato->add($objeto);
			}
		}

		$this->listaPessoaEndereco = new ArrayCollection();
		$listaPessoaEnderecoJson = $objetoJson->listaPessoaEndereco;
		if ($listaPessoaEnderecoJson != null) {
			for ($i = 0; $i < count($listaPessoaEnderecoJson); $i++) {
				$objeto = new PessoaEndereco($listaPessoaEnderecoJson[$i]);
				$objeto->setPessoa($this);
				$this->listaPessoaEndereco->add($objeto);
			}
		}

		$this->listaPessoaTelefone = new ArrayCollection();
		$listaPessoaTelefoneJson = $objetoJson->listaPessoaTelefone;
		if ($listaPessoaTelefoneJson != null) {
			for ($i = 0; $i < count($listaPessoaTelefoneJson); $i++) {
				$objeto = new PessoaTelefone($listaPessoaTelefoneJson[$i]);
				$objeto->setPessoa($this);
				$this->listaPessoaTelefone->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setNome($objeto->nome);
			$this->setTipo($objeto->tipo);
			$this->setSite($objeto->site);
			$this->setEmail($objeto->email);
			$this->setEhCliente($objeto->ehCliente);
			$this->setEhFornecedor($objeto->ehFornecedor);
			$this->setEhTransportadora($objeto->ehTransportadora);
			$this->setEhColaborador($objeto->ehColaborador);
			$this->setEhContador($objeto->ehContador);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'Pessoa');
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
			'tipo' => $this->getTipo(),
			'site' => $this->getSite(),
			'email' => $this->getEmail(),
			'ehCliente' => $this->getEhCliente(),
			'ehFornecedor' => $this->getEhFornecedor(),
			'ehTransportadora' => $this->getEhTransportadora(),
			'ehColaborador' => $this->getEhColaborador(),
			'ehContador' => $this->getEhContador(),
			'cliente' => $this->getCliente(),
			'colaborador' => $this->getColaborador(),
			'contador' => $this->getContador(),
			'fornecedor' => $this->getFornecedor(),
			'pessoaFisica' => $this->getPessoaFisica(),
			'pessoaJuridica' => $this->getPessoaJuridica(),
			'transportadora' => $this->getTransportadora(),
			'listaPessoaContato' => $this->getListaPessoaContato(),
			'listaPessoaEndereco' => $this->getListaPessoaEndereco(),
			'listaPessoaTelefone' => $this->getListaPessoaTelefone(),
        ];
    }
}
