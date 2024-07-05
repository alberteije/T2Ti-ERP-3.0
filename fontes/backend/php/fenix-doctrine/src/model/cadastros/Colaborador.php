<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COLABORADOR] 
                                                                                
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
 * @ORM\Table(name="COLABORADOR")
 */
class Colaborador extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="MATRICULA")
	 */
	private $matricula;

	/**
	 * @ORM\Column(type="date", name="DATA_CADASTRO")
	 */
	private $dataCadastro;

	/**
	 * @ORM\Column(type="date", name="DATA_ADMISSAO")
	 */
	private $dataAdmissao;

	/**
	 * @ORM\Column(type="date", name="DATA_DEMISSAO")
	 */
	private $dataDemissao;

	/**
	 * @ORM\Column(type="string", name="CTPS_NUMERO")
	 */
	private $ctpsNumero;

	/**
	 * @ORM\Column(type="string", name="CTPS_SERIE")
	 */
	private $ctpsSerie;

	/**
	 * @ORM\Column(type="date", name="CTPS_DATA_EXPEDICAO")
	 */
	private $ctpsDataExpedicao;

	/**
	 * @ORM\Column(type="string", name="CTPS_UF")
	 */
	private $ctpsUf;

	/**
	 * @ORM\Column(type="string", name="OBSERVACAO")
	 */
	private $observacao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Pessoa", inversedBy="colaborador")
     * @ORM\JoinColumn(name="ID_PESSOA", referencedColumnName="id")
     */
    private $pessoa;

    /**
     * @ORM\OneToOne(targetEntity="Cargo", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_CARGO", referencedColumnName="id")
     */
    private $cargo;

    /**
     * @ORM\OneToOne(targetEntity="Setor", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_SETOR", referencedColumnName="id")
     */
    private $setor;

    /**
     * @ORM\OneToOne(targetEntity="ColaboradorSituacao", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COLABORADOR_SITUACAO", referencedColumnName="id")
     */
    private $colaboradorSituacao;

    /**
     * @ORM\OneToOne(targetEntity="TipoAdmissao", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TIPO_ADMISSAO", referencedColumnName="id")
     */
    private $tipoAdmissao;

    /**
     * @ORM\OneToOne(targetEntity="ColaboradorTipo", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COLABORADOR_TIPO", referencedColumnName="id")
     */
    private $colaboradorTipo;

    /**
     * @ORM\OneToOne(targetEntity="Sindicato", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_SINDICATO", referencedColumnName="id")
     */
    private $sindicato;


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

    public function getMatricula() 
	{
		return $this->matricula;
	}

	public function setMatricula($matricula) 
	{
		$this->matricula = $matricula;
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

    public function getDataAdmissao() 
	{
		if ($this->dataAdmissao != null) {
			return $this->dataAdmissao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataAdmissao($dataAdmissao) 
	{
		$this->dataAdmissao = $dataAdmissao != null ? new \DateTime($dataAdmissao) : null;
	}

    public function getDataDemissao() 
	{
		if ($this->dataDemissao != null) {
			return $this->dataDemissao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataDemissao($dataDemissao) 
	{
		$this->dataDemissao = $dataDemissao != null ? new \DateTime($dataDemissao) : null;
	}

    public function getCtpsNumero() 
	{
		return $this->ctpsNumero;
	}

	public function setCtpsNumero($ctpsNumero) 
	{
		$this->ctpsNumero = $ctpsNumero;
	}

    public function getCtpsSerie() 
	{
		return $this->ctpsSerie;
	}

	public function setCtpsSerie($ctpsSerie) 
	{
		$this->ctpsSerie = $ctpsSerie;
	}

    public function getCtpsDataExpedicao() 
	{
		if ($this->ctpsDataExpedicao != null) {
			return $this->ctpsDataExpedicao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setCtpsDataExpedicao($ctpsDataExpedicao) 
	{
		$this->ctpsDataExpedicao = $ctpsDataExpedicao != null ? new \DateTime($ctpsDataExpedicao) : null;
	}

    public function getCtpsUf() 
	{
		return $this->ctpsUf;
	}

	public function setCtpsUf($ctpsUf) 
	{
		$this->ctpsUf = $ctpsUf;
	}

    public function getObservacao() 
	{
		return $this->observacao;
	}

	public function setObservacao($observacao) 
	{
		$this->observacao = $observacao;
	}

    public function getPessoa(): ?Pessoa 
	{
		return $this->pessoa;
	}

	public function setPessoa(?Pessoa $pessoa) 
	{
		$this->pessoa = $pessoa;
	}

    public function getCargo(): ?Cargo 
	{
		return $this->cargo;
	}

	public function setCargo(?Cargo $cargo) 
	{
		$this->cargo = $cargo;
	}

    public function getSetor(): ?Setor 
	{
		return $this->setor;
	}

	public function setSetor(?Setor $setor) 
	{
		$this->setor = $setor;
	}

    public function getColaboradorSituacao(): ?ColaboradorSituacao 
	{
		return $this->colaboradorSituacao;
	}

	public function setColaboradorSituacao(?ColaboradorSituacao $colaboradorSituacao) 
	{
		$this->colaboradorSituacao = $colaboradorSituacao;
	}

    public function getTipoAdmissao(): ?TipoAdmissao 
	{
		return $this->tipoAdmissao;
	}

	public function setTipoAdmissao(?TipoAdmissao $tipoAdmissao) 
	{
		$this->tipoAdmissao = $tipoAdmissao;
	}

    public function getColaboradorTipo(): ?ColaboradorTipo 
	{
		return $this->colaboradorTipo;
	}

	public function setColaboradorTipo(?ColaboradorTipo $colaboradorTipo) 
	{
		$this->colaboradorTipo = $colaboradorTipo;
	}

    public function getSindicato(): ?Sindicato 
	{
		return $this->sindicato;
	}

	public function setSindicato(?Sindicato $sindicato) 
	{
		$this->sindicato = $sindicato;
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
			$this->setMatricula($objeto->matricula);
			$this->setDataCadastro($objeto->dataCadastro);
			$this->setDataAdmissao($objeto->dataAdmissao);
			$this->setDataDemissao($objeto->dataDemissao);
			$this->setCtpsNumero($objeto->ctpsNumero);
			$this->setCtpsSerie($objeto->ctpsSerie);
			$this->setCtpsDataExpedicao($objeto->ctpsDataExpedicao);
			$this->setCtpsUf($objeto->ctpsUf);
			$this->setObservacao($objeto->observacao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'Colaborador');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'matricula' => $this->getMatricula(),
			'dataCadastro' => $this->getDataCadastro(),
			'dataAdmissao' => $this->getDataAdmissao(),
			'dataDemissao' => $this->getDataDemissao(),
			'ctpsNumero' => $this->getCtpsNumero(),
			'ctpsSerie' => $this->getCtpsSerie(),
			'ctpsDataExpedicao' => $this->getCtpsDataExpedicao(),
			'ctpsUf' => $this->getCtpsUf(),
			'observacao' => $this->getObservacao(),
			'cargo' => $this->getCargo(),
			'setor' => $this->getSetor(),
			'colaboradorSituacao' => $this->getColaboradorSituacao(),
			'tipoAdmissao' => $this->getTipoAdmissao(),
			'colaboradorTipo' => $this->getColaboradorTipo(),
			'sindicato' => $this->getSindicato(),
        ];
    }
}
