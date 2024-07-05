<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_VEICULO] 
                                                                                
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
 * @ORM\Table(name="NFE_DET_ESPECIFICO_VEICULO")
 */
class NfeDetEspecificoVeiculo extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="TIPO_OPERACAO")
	 */
	private $tipoOperacao;

	/**
	 * @ORM\Column(type="string", name="CHASSI")
	 */
	private $chassi;

	/**
	 * @ORM\Column(type="string", name="COR")
	 */
	private $cor;

	/**
	 * @ORM\Column(type="string", name="DESCRICAO_COR")
	 */
	private $descricaoCor;

	/**
	 * @ORM\Column(type="string", name="POTENCIA_MOTOR")
	 */
	private $potenciaMotor;

	/**
	 * @ORM\Column(type="string", name="CILINDRADAS")
	 */
	private $cilindradas;

	/**
	 * @ORM\Column(type="string", name="PESO_LIQUIDO")
	 */
	private $pesoLiquido;

	/**
	 * @ORM\Column(type="string", name="PESO_BRUTO")
	 */
	private $pesoBruto;

	/**
	 * @ORM\Column(type="string", name="NUMERO_SERIE")
	 */
	private $numeroSerie;

	/**
	 * @ORM\Column(type="string", name="TIPO_COMBUSTIVEL")
	 */
	private $tipoCombustivel;

	/**
	 * @ORM\Column(type="string", name="NUMERO_MOTOR")
	 */
	private $numeroMotor;

	/**
	 * @ORM\Column(type="string", name="CAPACIDADE_MAXIMA_TRACAO")
	 */
	private $capacidadeMaximaTracao;

	/**
	 * @ORM\Column(type="string", name="DISTANCIA_EIXOS")
	 */
	private $distanciaEixos;

	/**
	 * @ORM\Column(type="string", name="ANO_MODELO")
	 */
	private $anoModelo;

	/**
	 * @ORM\Column(type="string", name="ANO_FABRICACAO")
	 */
	private $anoFabricacao;

	/**
	 * @ORM\Column(type="string", name="TIPO_PINTURA")
	 */
	private $tipoPintura;

	/**
	 * @ORM\Column(type="string", name="TIPO_VEICULO")
	 */
	private $tipoVeiculo;

	/**
	 * @ORM\Column(type="string", name="ESPECIE_VEICULO")
	 */
	private $especieVeiculo;

	/**
	 * @ORM\Column(type="string", name="CONDICAO_VIN")
	 */
	private $condicaoVin;

	/**
	 * @ORM\Column(type="string", name="CONDICAO_VEICULO")
	 */
	private $condicaoVeiculo;

	/**
	 * @ORM\Column(type="string", name="CODIGO_MARCA_MODELO")
	 */
	private $codigoMarcaModelo;

	/**
	 * @ORM\Column(type="string", name="CODIGO_COR_DENATRAN")
	 */
	private $codigoCorDenatran;

	/**
	 * @ORM\Column(type="integer", name="LOTACAO_MAXIMA")
	 */
	private $lotacaoMaxima;

	/**
	 * @ORM\Column(type="string", name="RESTRICAO")
	 */
	private $restricao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeDetalhe", inversedBy="nfeDetEspecificoVeiculo")
     * @ORM\JoinColumn(name="ID_NFE_DETALHE", referencedColumnName="id")
     */
    private $nfeDetalhe;


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

    public function getTipoOperacao() 
	{
		return $this->tipoOperacao;
	}

	public function setTipoOperacao($tipoOperacao) 
	{
		$this->tipoOperacao = $tipoOperacao;
	}

    public function getChassi() 
	{
		return $this->chassi;
	}

	public function setChassi($chassi) 
	{
		$this->chassi = $chassi;
	}

    public function getCor() 
	{
		return $this->cor;
	}

	public function setCor($cor) 
	{
		$this->cor = $cor;
	}

    public function getDescricaoCor() 
	{
		return $this->descricaoCor;
	}

	public function setDescricaoCor($descricaoCor) 
	{
		$this->descricaoCor = $descricaoCor;
	}

    public function getPotenciaMotor() 
	{
		return $this->potenciaMotor;
	}

	public function setPotenciaMotor($potenciaMotor) 
	{
		$this->potenciaMotor = $potenciaMotor;
	}

    public function getCilindradas() 
	{
		return $this->cilindradas;
	}

	public function setCilindradas($cilindradas) 
	{
		$this->cilindradas = $cilindradas;
	}

    public function getPesoLiquido() 
	{
		return $this->pesoLiquido;
	}

	public function setPesoLiquido($pesoLiquido) 
	{
		$this->pesoLiquido = $pesoLiquido;
	}

    public function getPesoBruto() 
	{
		return $this->pesoBruto;
	}

	public function setPesoBruto($pesoBruto) 
	{
		$this->pesoBruto = $pesoBruto;
	}

    public function getNumeroSerie() 
	{
		return $this->numeroSerie;
	}

	public function setNumeroSerie($numeroSerie) 
	{
		$this->numeroSerie = $numeroSerie;
	}

    public function getTipoCombustivel() 
	{
		return $this->tipoCombustivel;
	}

	public function setTipoCombustivel($tipoCombustivel) 
	{
		$this->tipoCombustivel = $tipoCombustivel;
	}

    public function getNumeroMotor() 
	{
		return $this->numeroMotor;
	}

	public function setNumeroMotor($numeroMotor) 
	{
		$this->numeroMotor = $numeroMotor;
	}

    public function getCapacidadeMaximaTracao() 
	{
		return $this->capacidadeMaximaTracao;
	}

	public function setCapacidadeMaximaTracao($capacidadeMaximaTracao) 
	{
		$this->capacidadeMaximaTracao = $capacidadeMaximaTracao;
	}

    public function getDistanciaEixos() 
	{
		return $this->distanciaEixos;
	}

	public function setDistanciaEixos($distanciaEixos) 
	{
		$this->distanciaEixos = $distanciaEixos;
	}

    public function getAnoModelo() 
	{
		return $this->anoModelo;
	}

	public function setAnoModelo($anoModelo) 
	{
		$this->anoModelo = $anoModelo;
	}

    public function getAnoFabricacao() 
	{
		return $this->anoFabricacao;
	}

	public function setAnoFabricacao($anoFabricacao) 
	{
		$this->anoFabricacao = $anoFabricacao;
	}

    public function getTipoPintura() 
	{
		return $this->tipoPintura;
	}

	public function setTipoPintura($tipoPintura) 
	{
		$this->tipoPintura = $tipoPintura;
	}

    public function getTipoVeiculo() 
	{
		return $this->tipoVeiculo;
	}

	public function setTipoVeiculo($tipoVeiculo) 
	{
		$this->tipoVeiculo = $tipoVeiculo;
	}

    public function getEspecieVeiculo() 
	{
		return $this->especieVeiculo;
	}

	public function setEspecieVeiculo($especieVeiculo) 
	{
		$this->especieVeiculo = $especieVeiculo;
	}

    public function getCondicaoVin() 
	{
		return $this->condicaoVin;
	}

	public function setCondicaoVin($condicaoVin) 
	{
		$this->condicaoVin = $condicaoVin;
	}

    public function getCondicaoVeiculo() 
	{
		return $this->condicaoVeiculo;
	}

	public function setCondicaoVeiculo($condicaoVeiculo) 
	{
		$this->condicaoVeiculo = $condicaoVeiculo;
	}

    public function getCodigoMarcaModelo() 
	{
		return $this->codigoMarcaModelo;
	}

	public function setCodigoMarcaModelo($codigoMarcaModelo) 
	{
		$this->codigoMarcaModelo = $codigoMarcaModelo;
	}

    public function getCodigoCorDenatran() 
	{
		return $this->codigoCorDenatran;
	}

	public function setCodigoCorDenatran($codigoCorDenatran) 
	{
		$this->codigoCorDenatran = $codigoCorDenatran;
	}

    public function getLotacaoMaxima() 
	{
		return $this->lotacaoMaxima;
	}

	public function setLotacaoMaxima($lotacaoMaxima) 
	{
		$this->lotacaoMaxima = $lotacaoMaxima;
	}

    public function getRestricao() 
	{
		return $this->restricao;
	}

	public function setRestricao($restricao) 
	{
		$this->restricao = $restricao;
	}

    public function getNfeDetalhe(): ?NfeDetalhe 
	{
		return $this->nfeDetalhe;
	}

	public function setNfeDetalhe(?NfeDetalhe $nfeDetalhe) 
	{
		$this->nfeDetalhe = $nfeDetalhe;
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
			$this->setTipoOperacao($objeto->tipoOperacao);
			$this->setChassi($objeto->chassi);
			$this->setCor($objeto->cor);
			$this->setDescricaoCor($objeto->descricaoCor);
			$this->setPotenciaMotor($objeto->potenciaMotor);
			$this->setCilindradas($objeto->cilindradas);
			$this->setPesoLiquido($objeto->pesoLiquido);
			$this->setPesoBruto($objeto->pesoBruto);
			$this->setNumeroSerie($objeto->numeroSerie);
			$this->setTipoCombustivel($objeto->tipoCombustivel);
			$this->setNumeroMotor($objeto->numeroMotor);
			$this->setCapacidadeMaximaTracao($objeto->capacidadeMaximaTracao);
			$this->setDistanciaEixos($objeto->distanciaEixos);
			$this->setAnoModelo($objeto->anoModelo);
			$this->setAnoFabricacao($objeto->anoFabricacao);
			$this->setTipoPintura($objeto->tipoPintura);
			$this->setTipoVeiculo($objeto->tipoVeiculo);
			$this->setEspecieVeiculo($objeto->especieVeiculo);
			$this->setCondicaoVin($objeto->condicaoVin);
			$this->setCondicaoVeiculo($objeto->condicaoVeiculo);
			$this->setCodigoMarcaModelo($objeto->codigoMarcaModelo);
			$this->setCodigoCorDenatran($objeto->codigoCorDenatran);
			$this->setLotacaoMaxima($objeto->lotacaoMaxima);
			$this->setRestricao($objeto->restricao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetEspecificoVeiculo');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'tipoOperacao' => $this->getTipoOperacao(),
			'chassi' => $this->getChassi(),
			'cor' => $this->getCor(),
			'descricaoCor' => $this->getDescricaoCor(),
			'potenciaMotor' => $this->getPotenciaMotor(),
			'cilindradas' => $this->getCilindradas(),
			'pesoLiquido' => $this->getPesoLiquido(),
			'pesoBruto' => $this->getPesoBruto(),
			'numeroSerie' => $this->getNumeroSerie(),
			'tipoCombustivel' => $this->getTipoCombustivel(),
			'numeroMotor' => $this->getNumeroMotor(),
			'capacidadeMaximaTracao' => $this->getCapacidadeMaximaTracao(),
			'distanciaEixos' => $this->getDistanciaEixos(),
			'anoModelo' => $this->getAnoModelo(),
			'anoFabricacao' => $this->getAnoFabricacao(),
			'tipoPintura' => $this->getTipoPintura(),
			'tipoVeiculo' => $this->getTipoVeiculo(),
			'especieVeiculo' => $this->getEspecieVeiculo(),
			'condicaoVin' => $this->getCondicaoVin(),
			'condicaoVeiculo' => $this->getCondicaoVeiculo(),
			'codigoMarcaModelo' => $this->getCodigoMarcaModelo(),
			'codigoCorDenatran' => $this->getCodigoCorDenatran(),
			'lotacaoMaxima' => $this->getLotacaoMaxima(),
			'restricao' => $this->getRestricao(),
        ];
    }
}
