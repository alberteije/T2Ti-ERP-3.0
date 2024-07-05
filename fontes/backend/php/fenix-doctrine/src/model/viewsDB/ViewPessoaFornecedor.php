<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_PESSOA_FORNECEDOR] 
                                                                                
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
 * @ORM\Table(name="VIEW_PESSOA_FORNECEDOR")
 */
class ViewPessoaFornecedor extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="string", name="EMAIL")
	 */
	private $email;

	/**
	 * @ORM\Column(type="string", name="SITE")
	 */
	private $site;

	/**
	 * @ORM\Column(type="string", name="CPF_CNPJ")
	 */
	private $cpfCnpj;

	/**
	 * @ORM\Column(type="string", name="RG_IE")
	 */
	private $rgIe;

	/**
	 * @ORM\Column(type="date", name="DESDE")
	 */
	private $desde;

	/**
	 * @ORM\Column(type="date", name="DATA_CADASTRO")
	 */
	private $dataCadastro;

	/**
	 * @ORM\Column(type="string", name="OBSERVACAO")
	 */
	private $observacao;

	/**
	 * @ORM\Column(type="integer", name="ID_PESSOA")
	 */
	private $idPessoa;


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

    public function getTipo() 
	{
		return $this->tipo;
	}

	public function setTipo($tipo) 
	{
		$this->tipo = $tipo;
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

    public function getCpfCnpj() 
	{
		return $this->cpfCnpj;
	}

	public function setCpfCnpj($cpfCnpj) 
	{
		$this->cpfCnpj = $cpfCnpj;
	}

    public function getRgIe() 
	{
		return $this->rgIe;
	}

	public function setRgIe($rgIe) 
	{
		$this->rgIe = $rgIe;
	}

    public function getDesde() 
	{
		if ($this->desde != null) {
			return $this->desde->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDesde($desde) 
	{
		$this->desde = $desde != null ? new \DateTime($desde) : null;
	}

    public function getDataCadastro() 
	{
		if ($this->dataCadastro != null) {
			return $this->dataCadastro->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataCadastro($dataCadastro) 
	{
		$this->dataCadastro = $dataCadastro != null ? new \DateTime($dataCadastro) : null;
	}

    public function getObservacao() 
	{
		return $this->observacao;
	}

	public function setObservacao($observacao) 
	{
		$this->observacao = $observacao;
	}

    public function getIdPessoa() 
	{
		return $this->idPessoa;
	}

	public function setIdPessoa($idPessoa) 
	{
		$this->idPessoa = $idPessoa;
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
			$this->setTipo($objeto->tipo);
			$this->setEmail($objeto->email);
			$this->setSite($objeto->site);
			$this->setCpfCnpj($objeto->cpfCnpj);
			$this->setRgIe($objeto->rgIe);
			$this->setDesde($objeto->desde);
			$this->setDataCadastro($objeto->dataCadastro);
			$this->setObservacao($objeto->observacao);
			$this->setIdPessoa($objeto->idPessoa);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'ViewPessoaFornecedor');
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
			'email' => $this->getEmail(),
			'site' => $this->getSite(),
			'cpfCnpj' => $this->getCpfCnpj(),
			'rgIe' => $this->getRgIe(),
			'desde' => $this->getDesde(),
			'dataCadastro' => $this->getDataCadastro(),
			'observacao' => $this->getObservacao(),
			'idPessoa' => $this->getIdPessoa(),
        ];
    }
}
