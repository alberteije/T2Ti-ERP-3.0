<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE] 
                                                                                
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
 * @ORM\Table(name="NFE_TRANSPORTE")
 */
class NfeTransporte extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="MODALIDADE_FRETE")
	 */
	private $modalidadeFrete;

	/**
	 * @ORM\Column(type="string", name="CNPJ")
	 */
	private $cnpj;

	/**
	 * @ORM\Column(type="string", name="CPF")
	 */
	private $cpf;

	/**
	 * @ORM\Column(type="string", name="NOME")
	 */
	private $nome;

	/**
	 * @ORM\Column(type="string", name="INSCRICAO_ESTADUAL")
	 */
	private $inscricaoEstadual;

	/**
	 * @ORM\Column(type="string", name="ENDERECO")
	 */
	private $endereco;

	/**
	 * @ORM\Column(type="string", name="NOME_MUNICIPIO")
	 */
	private $nomeMunicipio;

	/**
	 * @ORM\Column(type="string", name="UF")
	 */
	private $uf;

	/**
	 * @ORM\Column(type="float", name="VALOR_SERVICO")
	 */
	private $valorServico;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_RETENCAO_ICMS")
	 */
	private $valorBcRetencaoIcms;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_RETENCAO_ICMS")
	 */
	private $aliquotaRetencaoIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_RETIDO")
	 */
	private $valorIcmsRetido;

	/**
	 * @ORM\Column(type="integer", name="CFOP")
	 */
	private $cfop;

	/**
	 * @ORM\Column(type="integer", name="MUNICIPIO")
	 */
	private $municipio;

	/**
	 * @ORM\Column(type="string", name="PLACA_VEICULO")
	 */
	private $placaVeiculo;

	/**
	 * @ORM\Column(type="string", name="UF_VEICULO")
	 */
	private $ufVeiculo;

	/**
	 * @ORM\Column(type="string", name="RNTC_VEICULO")
	 */
	private $rntcVeiculo;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeCabecalho", inversedBy="nfeTransporte")
     * @ORM\JoinColumn(name="ID_NFE_CABECALHO", referencedColumnName="id")
     */
    private $nfeCabecalho;

    /**
     * @ORM\OneToOne(targetEntity="Transportadora", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TRANSPORTADORA", referencedColumnName="id")
     */
    private $transportadora;

    /**
     * @ORM\OneToMany(targetEntity="NfeTransporteReboque", mappedBy="nfeTransporte", cascade={"persist", "remove"})
     */
    private $listaNfeTransporteReboque;

    /**
     * @ORM\OneToMany(targetEntity="NfeTransporteVolume", mappedBy="nfeTransporte", cascade={"persist", "remove"})
     */
    private $listaNfeTransporteVolume;


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

    public function getModalidadeFrete() 
	{
		return $this->modalidadeFrete;
	}

	public function setModalidadeFrete($modalidadeFrete) 
	{
		$this->modalidadeFrete = $modalidadeFrete;
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

    public function getNome() 
	{
		return $this->nome;
	}

	public function setNome($nome) 
	{
		$this->nome = $nome;
	}

    public function getInscricaoEstadual() 
	{
		return $this->inscricaoEstadual;
	}

	public function setInscricaoEstadual($inscricaoEstadual) 
	{
		$this->inscricaoEstadual = $inscricaoEstadual;
	}

    public function getEndereco() 
	{
		return $this->endereco;
	}

	public function setEndereco($endereco) 
	{
		$this->endereco = $endereco;
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

    public function getValorServico() 
	{
		return $this->valorServico;
	}

	public function setValorServico($valorServico) 
	{
		$this->valorServico = $valorServico;
	}

    public function getValorBcRetencaoIcms() 
	{
		return $this->valorBcRetencaoIcms;
	}

	public function setValorBcRetencaoIcms($valorBcRetencaoIcms) 
	{
		$this->valorBcRetencaoIcms = $valorBcRetencaoIcms;
	}

    public function getAliquotaRetencaoIcms() 
	{
		return $this->aliquotaRetencaoIcms;
	}

	public function setAliquotaRetencaoIcms($aliquotaRetencaoIcms) 
	{
		$this->aliquotaRetencaoIcms = $aliquotaRetencaoIcms;
	}

    public function getValorIcmsRetido() 
	{
		return $this->valorIcmsRetido;
	}

	public function setValorIcmsRetido($valorIcmsRetido) 
	{
		$this->valorIcmsRetido = $valorIcmsRetido;
	}

    public function getCfop() 
	{
		return $this->cfop;
	}

	public function setCfop($cfop) 
	{
		$this->cfop = $cfop;
	}

    public function getMunicipio() 
	{
		return $this->municipio;
	}

	public function setMunicipio($municipio) 
	{
		$this->municipio = $municipio;
	}

    public function getPlacaVeiculo() 
	{
		return $this->placaVeiculo;
	}

	public function setPlacaVeiculo($placaVeiculo) 
	{
		$this->placaVeiculo = $placaVeiculo;
	}

    public function getUfVeiculo() 
	{
		return $this->ufVeiculo;
	}

	public function setUfVeiculo($ufVeiculo) 
	{
		$this->ufVeiculo = $ufVeiculo;
	}

    public function getRntcVeiculo() 
	{
		return $this->rntcVeiculo;
	}

	public function setRntcVeiculo($rntcVeiculo) 
	{
		$this->rntcVeiculo = $rntcVeiculo;
	}

    public function getNfeCabecalho(): ?NfeCabecalho 
	{
		return $this->nfeCabecalho;
	}

	public function setNfeCabecalho(?NfeCabecalho $nfeCabecalho) 
	{
		$this->nfeCabecalho = $nfeCabecalho;
	}

    public function getTransportadora(): ?Transportadora 
	{
		return $this->transportadora;
	}

	public function setTransportadora(?Transportadora $transportadora) 
	{
		$this->transportadora = $transportadora;
	}

    public function getListaNfeTransporteReboque() 
	{
		return $this->listaNfeTransporteReboque->toArray();
	}

	public function setListaNfeTransporteReboque(array $listaNfeTransporteReboque) {
		$this->listaNfeTransporteReboque = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeTransporteReboque); $i++) {
			$nfeTransporteReboque = $listaNfeTransporteReboque[$i];
			$nfeTransporteReboque->setNfeTransporte($this);
			$this->listaNfeTransporteReboque->add($nfeTransporteReboque);
		}
	}

    public function getListaNfeTransporteVolume() 
	{
		return $this->listaNfeTransporteVolume->toArray();
	}

	public function setListaNfeTransporteVolume(array $listaNfeTransporteVolume) {
		$this->listaNfeTransporteVolume = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeTransporteVolume); $i++) {
			$nfeTransporteVolume = $listaNfeTransporteVolume[$i];
			$nfeTransporteVolume->setNfeTransporte($this);
			$this->listaNfeTransporteVolume->add($nfeTransporteVolume);
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

		
		$this->listaNfeTransporteReboque = new ArrayCollection();
		$listaNfeTransporteReboqueJson = $objetoJson->listaNfeTransporteReboque;
		if ($listaNfeTransporteReboqueJson != null) {
			for ($i = 0; $i < count($listaNfeTransporteReboqueJson); $i++) {
				$objeto = new NfeTransporteReboque($listaNfeTransporteReboqueJson[$i]);
				$objeto->setNfeTransporte($this);
				$this->listaNfeTransporteReboque->add($objeto);
			}
		}

		$this->listaNfeTransporteVolume = new ArrayCollection();
		$listaNfeTransporteVolumeJson = $objetoJson->listaNfeTransporteVolume;
		if ($listaNfeTransporteVolumeJson != null) {
			for ($i = 0; $i < count($listaNfeTransporteVolumeJson); $i++) {
				$objeto = new NfeTransporteVolume($listaNfeTransporteVolumeJson[$i]);
				$objeto->setNfeTransporte($this);
				$this->listaNfeTransporteVolume->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setModalidadeFrete($objeto->modalidadeFrete);
			$this->setCnpj($objeto->cnpj);
			$this->setCpf($objeto->cpf);
			$this->setNome($objeto->nome);
			$this->setInscricaoEstadual($objeto->inscricaoEstadual);
			$this->setEndereco($objeto->endereco);
			$this->setNomeMunicipio($objeto->nomeMunicipio);
			$this->setUf($objeto->uf);
			$this->setValorServico($objeto->valorServico);
			$this->setValorBcRetencaoIcms($objeto->valorBcRetencaoIcms);
			$this->setAliquotaRetencaoIcms($objeto->aliquotaRetencaoIcms);
			$this->setValorIcmsRetido($objeto->valorIcmsRetido);
			$this->setCfop($objeto->cfop);
			$this->setMunicipio($objeto->municipio);
			$this->setPlacaVeiculo($objeto->placaVeiculo);
			$this->setUfVeiculo($objeto->ufVeiculo);
			$this->setRntcVeiculo($objeto->rntcVeiculo);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeTransporte');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'modalidadeFrete' => $this->getModalidadeFrete(),
			'cnpj' => $this->getCnpj(),
			'cpf' => $this->getCpf(),
			'nome' => $this->getNome(),
			'inscricaoEstadual' => $this->getInscricaoEstadual(),
			'endereco' => $this->getEndereco(),
			'nomeMunicipio' => $this->getNomeMunicipio(),
			'uf' => $this->getUf(),
			'valorServico' => $this->getValorServico(),
			'valorBcRetencaoIcms' => $this->getValorBcRetencaoIcms(),
			'aliquotaRetencaoIcms' => $this->getAliquotaRetencaoIcms(),
			'valorIcmsRetido' => $this->getValorIcmsRetido(),
			'cfop' => $this->getCfop(),
			'municipio' => $this->getMunicipio(),
			'placaVeiculo' => $this->getPlacaVeiculo(),
			'ufVeiculo' => $this->getUfVeiculo(),
			'rntcVeiculo' => $this->getRntcVeiculo(),
			'transportadora' => $this->getTransportadora(),
			'listaNfeTransporteReboque' => $this->getListaNfeTransporteReboque(),
			'listaNfeTransporteVolume' => $this->getListaNfeTransporteVolume(),
        ];
    }
}
