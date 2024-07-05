<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COLABORADOR_RELACIONAMENTO] 
                                                                                
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
 * @ORM\Table(name="COLABORADOR_RELACIONAMENTO")
 */
class ColaboradorRelacionamento extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="date", name="DATA_NASCIMENTO")
	 */
	private $dataNascimento;

	/**
	 * @ORM\Column(type="string", name="CPF")
	 */
	private $cpf;

	/**
	 * @ORM\Column(type="string", name="REGISTRO_MATRICULA")
	 */
	private $registroMatricula;

	/**
	 * @ORM\Column(type="string", name="REGISTRO_CARTORIO")
	 */
	private $registroCartorio;

	/**
	 * @ORM\Column(type="string", name="REGISTRO_CARTORIO_NUMERO")
	 */
	private $registroCartorioNumero;

	/**
	 * @ORM\Column(type="string", name="REGISTRO_NUMERO_LIVRO")
	 */
	private $registroNumeroLivro;

	/**
	 * @ORM\Column(type="string", name="REGISTRO_NUMERO_FOLHA")
	 */
	private $registroNumeroFolha;

	/**
	 * @ORM\Column(type="date", name="DATA_ENTREGA_DOCUMENTO")
	 */
	private $dataEntregaDocumento;

	/**
	 * @ORM\Column(type="string", name="SALARIO_FAMILIA")
	 */
	private $salarioFamilia;

	/**
	 * @ORM\Column(type="integer", name="SALARIO_FAMILIA_IDADE_LIMITE")
	 */
	private $salarioFamiliaIdadeLimite;

	/**
	 * @ORM\Column(type="date", name="SALARIO_FAMILIA_DATA_FIM")
	 */
	private $salarioFamiliaDataFim;

	/**
	 * @ORM\Column(type="integer", name="IMPOSTO_RENDA_IDADE_LIMITE")
	 */
	private $impostoRendaIdadeLimite;

	/**
	 * @ORM\Column(type="integer", name="IMPOSTO_RENDA_DATA_FIM")
	 */
	private $impostoRendaDataFim;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="TipoRelacionamento", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TIPO_RELACIONAMENTO", referencedColumnName="id")
     */
    private $tipoRelacionamento;

    /**
     * @ORM\OneToOne(targetEntity="Colaborador", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COLABORADOR", referencedColumnName="id")
     */
    private $colaborador;


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

    public function getDataNascimento() 
	{
		if ($this->dataNascimento != null) {
			return $this->dataNascimento->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataNascimento($dataNascimento) 
	{
		$this->dataNascimento = $dataNascimento != null ? new \DateTime($dataNascimento) : null;
	}

    public function getCpf() 
	{
		return $this->cpf;
	}

	public function setCpf($cpf) 
	{
		$this->cpf = $cpf;
	}

    public function getRegistroMatricula() 
	{
		return $this->registroMatricula;
	}

	public function setRegistroMatricula($registroMatricula) 
	{
		$this->registroMatricula = $registroMatricula;
	}

    public function getRegistroCartorio() 
	{
		return $this->registroCartorio;
	}

	public function setRegistroCartorio($registroCartorio) 
	{
		$this->registroCartorio = $registroCartorio;
	}

    public function getRegistroCartorioNumero() 
	{
		return $this->registroCartorioNumero;
	}

	public function setRegistroCartorioNumero($registroCartorioNumero) 
	{
		$this->registroCartorioNumero = $registroCartorioNumero;
	}

    public function getRegistroNumeroLivro() 
	{
		return $this->registroNumeroLivro;
	}

	public function setRegistroNumeroLivro($registroNumeroLivro) 
	{
		$this->registroNumeroLivro = $registroNumeroLivro;
	}

    public function getRegistroNumeroFolha() 
	{
		return $this->registroNumeroFolha;
	}

	public function setRegistroNumeroFolha($registroNumeroFolha) 
	{
		$this->registroNumeroFolha = $registroNumeroFolha;
	}

    public function getDataEntregaDocumento() 
	{
		if ($this->dataEntregaDocumento != null) {
			return $this->dataEntregaDocumento->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataEntregaDocumento($dataEntregaDocumento) 
	{
		$this->dataEntregaDocumento = $dataEntregaDocumento != null ? new \DateTime($dataEntregaDocumento) : null;
	}

    public function getSalarioFamilia() 
	{
		return $this->salarioFamilia;
	}

	public function setSalarioFamilia($salarioFamilia) 
	{
		$this->salarioFamilia = $salarioFamilia;
	}

    public function getSalarioFamiliaIdadeLimite() 
	{
		return $this->salarioFamiliaIdadeLimite;
	}

	public function setSalarioFamiliaIdadeLimite($salarioFamiliaIdadeLimite) 
	{
		$this->salarioFamiliaIdadeLimite = $salarioFamiliaIdadeLimite;
	}

    public function getSalarioFamiliaDataFim() 
	{
		if ($this->salarioFamiliaDataFim != null) {
			return $this->salarioFamiliaDataFim->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setSalarioFamiliaDataFim($salarioFamiliaDataFim) 
	{
		$this->salarioFamiliaDataFim = $salarioFamiliaDataFim != null ? new \DateTime($salarioFamiliaDataFim) : null;
	}

    public function getImpostoRendaIdadeLimite() 
	{
		return $this->impostoRendaIdadeLimite;
	}

	public function setImpostoRendaIdadeLimite($impostoRendaIdadeLimite) 
	{
		$this->impostoRendaIdadeLimite = $impostoRendaIdadeLimite;
	}

    public function getImpostoRendaDataFim() 
	{
		return $this->impostoRendaDataFim;
	}

	public function setImpostoRendaDataFim($impostoRendaDataFim) 
	{
		$this->impostoRendaDataFim = $impostoRendaDataFim;
	}

    public function getTipoRelacionamento(): ?TipoRelacionamento 
	{
		return $this->tipoRelacionamento;
	}

	public function setTipoRelacionamento(?TipoRelacionamento $tipoRelacionamento) 
	{
		$this->tipoRelacionamento = $tipoRelacionamento;
	}

    public function getColaborador(): ?Colaborador 
	{
		return $this->colaborador;
	}

	public function setColaborador(?Colaborador $colaborador) 
	{
		$this->colaborador = $colaborador;
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
			$this->setDataNascimento($objeto->dataNascimento);
			$this->setCpf($objeto->cpf);
			$this->setRegistroMatricula($objeto->registroMatricula);
			$this->setRegistroCartorio($objeto->registroCartorio);
			$this->setRegistroCartorioNumero($objeto->registroCartorioNumero);
			$this->setRegistroNumeroLivro($objeto->registroNumeroLivro);
			$this->setRegistroNumeroFolha($objeto->registroNumeroFolha);
			$this->setDataEntregaDocumento($objeto->dataEntregaDocumento);
			$this->setSalarioFamilia($objeto->salarioFamilia);
			$this->setSalarioFamiliaIdadeLimite($objeto->salarioFamiliaIdadeLimite);
			$this->setSalarioFamiliaDataFim($objeto->salarioFamiliaDataFim);
			$this->setImpostoRendaIdadeLimite($objeto->impostoRendaIdadeLimite);
			$this->setImpostoRendaDataFim($objeto->impostoRendaDataFim);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'ColaboradorRelacionamento');
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
			'dataNascimento' => $this->getDataNascimento(),
			'cpf' => $this->getCpf(),
			'registroMatricula' => $this->getRegistroMatricula(),
			'registroCartorio' => $this->getRegistroCartorio(),
			'registroCartorioNumero' => $this->getRegistroCartorioNumero(),
			'registroNumeroLivro' => $this->getRegistroNumeroLivro(),
			'registroNumeroFolha' => $this->getRegistroNumeroFolha(),
			'dataEntregaDocumento' => $this->getDataEntregaDocumento(),
			'salarioFamilia' => $this->getSalarioFamilia(),
			'salarioFamiliaIdadeLimite' => $this->getSalarioFamiliaIdadeLimite(),
			'salarioFamiliaDataFim' => $this->getSalarioFamiliaDataFim(),
			'impostoRendaIdadeLimite' => $this->getImpostoRendaIdadeLimite(),
			'impostoRendaDataFim' => $this->getImpostoRendaDataFim(),
			'tipoRelacionamento' => $this->getTipoRelacionamento(),
			'colaborador' => $this->getColaborador(),
        ];
    }
}
