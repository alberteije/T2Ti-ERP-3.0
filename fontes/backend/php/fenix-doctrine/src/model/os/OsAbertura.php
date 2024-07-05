<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [OS_ABERTURA] 
                                                                                
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
 * @ORM\Table(name="OS_ABERTURA")
 */
class OsAbertura extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="NUMERO")
	 */
	private $numero;

	/**
	 * @ORM\Column(type="date", name="DATA_INICIO")
	 */
	private $dataInicio;

	/**
	 * @ORM\Column(type="string", name="HORA_INICIO")
	 */
	private $horaInicio;

	/**
	 * @ORM\Column(type="date", name="DATA_PREVISAO")
	 */
	private $dataPrevisao;

	/**
	 * @ORM\Column(type="string", name="HORA_PREVISAO")
	 */
	private $horaPrevisao;

	/**
	 * @ORM\Column(type="date", name="DATA_FIM")
	 */
	private $dataFim;

	/**
	 * @ORM\Column(type="string", name="HORA_FIM")
	 */
	private $horaFim;

	/**
	 * @ORM\Column(type="string", name="NOME_CONTATO")
	 */
	private $nomeContato;

	/**
	 * @ORM\Column(type="string", name="FONE_CONTATO")
	 */
	private $foneContato;

	/**
	 * @ORM\Column(type="string", name="OBSERVACAO_CLIENTE")
	 */
	private $observacaoCliente;

	/**
	 * @ORM\Column(type="string", name="OBSERVACAO_ABERTURA")
	 */
	private $observacaoAbertura;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="OsStatus", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_OS_STATUS", referencedColumnName="id")
     */
    private $osStatus;

    /**
     * @ORM\OneToOne(targetEntity="Cliente", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_CLIENTE", referencedColumnName="id")
     */
    private $cliente;

    /**
     * @ORM\OneToOne(targetEntity="Colaborador", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COLABORADOR", referencedColumnName="id")
     */
    private $colaborador;

    /**
     * @ORM\OneToMany(targetEntity="OsAberturaEquipamento", mappedBy="osAbertura", cascade={"persist", "remove"})
     */
    private $listaOsAberturaEquipamento;

    /**
     * @ORM\OneToMany(targetEntity="OsEvolucao", mappedBy="osAbertura", cascade={"persist", "remove"})
     */
    private $listaOsEvolucao;

    /**
     * @ORM\OneToMany(targetEntity="OsProdutoServico", mappedBy="osAbertura", cascade={"persist", "remove"})
     */
    private $listaOsProdutoServico;


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

    public function getNumero() 
	{
		return $this->numero;
	}

	public function setNumero($numero) 
	{
		$this->numero = $numero;
	}

    public function getDataInicio() 
	{
		if ($this->dataInicio != null) {
			return $this->dataInicio->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataInicio($dataInicio) 
	{
		$this->dataInicio = $dataInicio != null ? new \DateTime($dataInicio) : null;
	}

    public function getHoraInicio() 
	{
		return $this->horaInicio;
	}

	public function setHoraInicio($horaInicio) 
	{
		$this->horaInicio = $horaInicio;
	}

    public function getDataPrevisao() 
	{
		if ($this->dataPrevisao != null) {
			return $this->dataPrevisao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataPrevisao($dataPrevisao) 
	{
		$this->dataPrevisao = $dataPrevisao != null ? new \DateTime($dataPrevisao) : null;
	}

    public function getHoraPrevisao() 
	{
		return $this->horaPrevisao;
	}

	public function setHoraPrevisao($horaPrevisao) 
	{
		$this->horaPrevisao = $horaPrevisao;
	}

    public function getDataFim() 
	{
		if ($this->dataFim != null) {
			return $this->dataFim->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataFim($dataFim) 
	{
		$this->dataFim = $dataFim != null ? new \DateTime($dataFim) : null;
	}

    public function getHoraFim() 
	{
		return $this->horaFim;
	}

	public function setHoraFim($horaFim) 
	{
		$this->horaFim = $horaFim;
	}

    public function getNomeContato() 
	{
		return $this->nomeContato;
	}

	public function setNomeContato($nomeContato) 
	{
		$this->nomeContato = $nomeContato;
	}

    public function getFoneContato() 
	{
		return $this->foneContato;
	}

	public function setFoneContato($foneContato) 
	{
		$this->foneContato = $foneContato;
	}

    public function getObservacaoCliente() 
	{
		return $this->observacaoCliente;
	}

	public function setObservacaoCliente($observacaoCliente) 
	{
		$this->observacaoCliente = $observacaoCliente;
	}

    public function getObservacaoAbertura() 
	{
		return $this->observacaoAbertura;
	}

	public function setObservacaoAbertura($observacaoAbertura) 
	{
		$this->observacaoAbertura = $observacaoAbertura;
	}

    public function getOsStatus(): ?OsStatus 
	{
		return $this->osStatus;
	}

	public function setOsStatus(?OsStatus $osStatus) 
	{
		$this->osStatus = $osStatus;
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

    public function getListaOsAberturaEquipamento() 
	{
		return $this->listaOsAberturaEquipamento->toArray();
	}

	public function setListaOsAberturaEquipamento(array $listaOsAberturaEquipamento) {
		$this->listaOsAberturaEquipamento = new ArrayCollection();
		for ($i = 0; $i < count($listaOsAberturaEquipamento); $i++) {
			$osAberturaEquipamento = $listaOsAberturaEquipamento[$i];
			$osAberturaEquipamento->setOsAbertura($this);
			$this->listaOsAberturaEquipamento->add($osAberturaEquipamento);
		}
	}

    public function getListaOsEvolucao() 
	{
		return $this->listaOsEvolucao->toArray();
	}

	public function setListaOsEvolucao(array $listaOsEvolucao) {
		$this->listaOsEvolucao = new ArrayCollection();
		for ($i = 0; $i < count($listaOsEvolucao); $i++) {
			$osEvolucao = $listaOsEvolucao[$i];
			$osEvolucao->setOsAbertura($this);
			$this->listaOsEvolucao->add($osEvolucao);
		}
	}

    public function getListaOsProdutoServico() 
	{
		return $this->listaOsProdutoServico->toArray();
	}

	public function setListaOsProdutoServico(array $listaOsProdutoServico) {
		$this->listaOsProdutoServico = new ArrayCollection();
		for ($i = 0; $i < count($listaOsProdutoServico); $i++) {
			$osProdutoServico = $listaOsProdutoServico[$i];
			$osProdutoServico->setOsAbertura($this);
			$this->listaOsProdutoServico->add($osProdutoServico);
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

		
		$this->listaOsAberturaEquipamento = new ArrayCollection();
		$listaOsAberturaEquipamentoJson = $objetoJson->listaOsAberturaEquipamento;
		if ($listaOsAberturaEquipamentoJson != null) {
			for ($i = 0; $i < count($listaOsAberturaEquipamentoJson); $i++) {
				$objeto = new OsAberturaEquipamento($listaOsAberturaEquipamentoJson[$i]);
				$objeto->setOsAbertura($this);
				$this->listaOsAberturaEquipamento->add($objeto);
			}
		}

		$this->listaOsEvolucao = new ArrayCollection();
		$listaOsEvolucaoJson = $objetoJson->listaOsEvolucao;
		if ($listaOsEvolucaoJson != null) {
			for ($i = 0; $i < count($listaOsEvolucaoJson); $i++) {
				$objeto = new OsEvolucao($listaOsEvolucaoJson[$i]);
				$objeto->setOsAbertura($this);
				$this->listaOsEvolucao->add($objeto);
			}
		}

		$this->listaOsProdutoServico = new ArrayCollection();
		$listaOsProdutoServicoJson = $objetoJson->listaOsProdutoServico;
		if ($listaOsProdutoServicoJson != null) {
			for ($i = 0; $i < count($listaOsProdutoServicoJson); $i++) {
				$objeto = new OsProdutoServico($listaOsProdutoServicoJson[$i]);
				$objeto->setOsAbertura($this);
				$this->listaOsProdutoServico->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setNumero($objeto->numero);
			$this->setDataInicio($objeto->dataInicio);
			$this->setHoraInicio($objeto->horaInicio);
			$this->setDataPrevisao($objeto->dataPrevisao);
			$this->setHoraPrevisao($objeto->horaPrevisao);
			$this->setDataFim($objeto->dataFim);
			$this->setHoraFim($objeto->horaFim);
			$this->setNomeContato($objeto->nomeContato);
			$this->setFoneContato($objeto->foneContato);
			$this->setObservacaoCliente($objeto->observacaoCliente);
			$this->setObservacaoAbertura($objeto->observacaoAbertura);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'OsAbertura');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'numero' => $this->getNumero(),
			'dataInicio' => $this->getDataInicio(),
			'horaInicio' => $this->getHoraInicio(),
			'dataPrevisao' => $this->getDataPrevisao(),
			'horaPrevisao' => $this->getHoraPrevisao(),
			'dataFim' => $this->getDataFim(),
			'horaFim' => $this->getHoraFim(),
			'nomeContato' => $this->getNomeContato(),
			'foneContato' => $this->getFoneContato(),
			'observacaoCliente' => $this->getObservacaoCliente(),
			'observacaoAbertura' => $this->getObservacaoAbertura(),
			'osStatus' => $this->getOsStatus(),
			'cliente' => $this->getCliente(),
			'colaborador' => $this->getColaborador(),
			'listaOsAberturaEquipamento' => $this->getListaOsAberturaEquipamento(),
			'listaOsEvolucao' => $this->getListaOsEvolucao(),
			'listaOsProdutoServico' => $this->getListaOsProdutoServico(),
        ];
    }
}
