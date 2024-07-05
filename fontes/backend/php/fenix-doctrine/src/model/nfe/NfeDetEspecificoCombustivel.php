<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_COMBUSTIVEL] 
                                                                                
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
 * @ORM\Table(name="NFE_DET_ESPECIFICO_COMBUSTIVEL")
 */
class NfeDetEspecificoCombustivel extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="CODIGO_ANP")
	 */
	private $codigoAnp;

	/**
	 * @ORM\Column(type="string", name="DESCRICAO_ANP")
	 */
	private $descricaoAnp;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_GLP")
	 */
	private $percentualGlp;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_GAS_NACIONAL")
	 */
	private $percentualGasNacional;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_GAS_IMPORTADO")
	 */
	private $percentualGasImportado;

	/**
	 * @ORM\Column(type="float", name="VALOR_PARTIDA")
	 */
	private $valorPartida;

	/**
	 * @ORM\Column(type="string", name="CODIF")
	 */
	private $codif;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_TEMP_AMBIENTE")
	 */
	private $quantidadeTempAmbiente;

	/**
	 * @ORM\Column(type="string", name="UF_CONSUMO")
	 */
	private $ufConsumo;

	/**
	 * @ORM\Column(type="float", name="CIDE_BASE_CALCULO")
	 */
	private $cideBaseCalculo;

	/**
	 * @ORM\Column(type="float", name="CIDE_ALIQUOTA")
	 */
	private $cideAliquota;

	/**
	 * @ORM\Column(type="float", name="CIDE_VALOR")
	 */
	private $cideValor;

	/**
	 * @ORM\Column(type="integer", name="ENCERRANTE_BICO")
	 */
	private $encerranteBico;

	/**
	 * @ORM\Column(type="integer", name="ENCERRANTE_BOMBA")
	 */
	private $encerranteBomba;

	/**
	 * @ORM\Column(type="integer", name="ENCERRANTE_TANQUE")
	 */
	private $encerranteTanque;

	/**
	 * @ORM\Column(type="float", name="ENCERRANTE_VALOR_INICIO")
	 */
	private $encerranteValorInicio;

	/**
	 * @ORM\Column(type="float", name="ENCERRANTE_VALOR_FIM")
	 */
	private $encerranteValorFim;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeDetalhe", inversedBy="nfeDetEspecificoCombustivel")
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

    public function getCodigoAnp() 
	{
		return $this->codigoAnp;
	}

	public function setCodigoAnp($codigoAnp) 
	{
		$this->codigoAnp = $codigoAnp;
	}

    public function getDescricaoAnp() 
	{
		return $this->descricaoAnp;
	}

	public function setDescricaoAnp($descricaoAnp) 
	{
		$this->descricaoAnp = $descricaoAnp;
	}

    public function getPercentualGlp() 
	{
		return $this->percentualGlp;
	}

	public function setPercentualGlp($percentualGlp) 
	{
		$this->percentualGlp = $percentualGlp;
	}

    public function getPercentualGasNacional() 
	{
		return $this->percentualGasNacional;
	}

	public function setPercentualGasNacional($percentualGasNacional) 
	{
		$this->percentualGasNacional = $percentualGasNacional;
	}

    public function getPercentualGasImportado() 
	{
		return $this->percentualGasImportado;
	}

	public function setPercentualGasImportado($percentualGasImportado) 
	{
		$this->percentualGasImportado = $percentualGasImportado;
	}

    public function getValorPartida() 
	{
		return $this->valorPartida;
	}

	public function setValorPartida($valorPartida) 
	{
		$this->valorPartida = $valorPartida;
	}

    public function getCodif() 
	{
		return $this->codif;
	}

	public function setCodif($codif) 
	{
		$this->codif = $codif;
	}

    public function getQuantidadeTempAmbiente() 
	{
		return $this->quantidadeTempAmbiente;
	}

	public function setQuantidadeTempAmbiente($quantidadeTempAmbiente) 
	{
		$this->quantidadeTempAmbiente = $quantidadeTempAmbiente;
	}

    public function getUfConsumo() 
	{
		return $this->ufConsumo;
	}

	public function setUfConsumo($ufConsumo) 
	{
		$this->ufConsumo = $ufConsumo;
	}

    public function getCideBaseCalculo() 
	{
		return $this->cideBaseCalculo;
	}

	public function setCideBaseCalculo($cideBaseCalculo) 
	{
		$this->cideBaseCalculo = $cideBaseCalculo;
	}

    public function getCideAliquota() 
	{
		return $this->cideAliquota;
	}

	public function setCideAliquota($cideAliquota) 
	{
		$this->cideAliquota = $cideAliquota;
	}

    public function getCideValor() 
	{
		return $this->cideValor;
	}

	public function setCideValor($cideValor) 
	{
		$this->cideValor = $cideValor;
	}

    public function getEncerranteBico() 
	{
		return $this->encerranteBico;
	}

	public function setEncerranteBico($encerranteBico) 
	{
		$this->encerranteBico = $encerranteBico;
	}

    public function getEncerranteBomba() 
	{
		return $this->encerranteBomba;
	}

	public function setEncerranteBomba($encerranteBomba) 
	{
		$this->encerranteBomba = $encerranteBomba;
	}

    public function getEncerranteTanque() 
	{
		return $this->encerranteTanque;
	}

	public function setEncerranteTanque($encerranteTanque) 
	{
		$this->encerranteTanque = $encerranteTanque;
	}

    public function getEncerranteValorInicio() 
	{
		return $this->encerranteValorInicio;
	}

	public function setEncerranteValorInicio($encerranteValorInicio) 
	{
		$this->encerranteValorInicio = $encerranteValorInicio;
	}

    public function getEncerranteValorFim() 
	{
		return $this->encerranteValorFim;
	}

	public function setEncerranteValorFim($encerranteValorFim) 
	{
		$this->encerranteValorFim = $encerranteValorFim;
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
			$this->setCodigoAnp($objeto->codigoAnp);
			$this->setDescricaoAnp($objeto->descricaoAnp);
			$this->setPercentualGlp($objeto->percentualGlp);
			$this->setPercentualGasNacional($objeto->percentualGasNacional);
			$this->setPercentualGasImportado($objeto->percentualGasImportado);
			$this->setValorPartida($objeto->valorPartida);
			$this->setCodif($objeto->codif);
			$this->setQuantidadeTempAmbiente($objeto->quantidadeTempAmbiente);
			$this->setUfConsumo($objeto->ufConsumo);
			$this->setCideBaseCalculo($objeto->cideBaseCalculo);
			$this->setCideAliquota($objeto->cideAliquota);
			$this->setCideValor($objeto->cideValor);
			$this->setEncerranteBico($objeto->encerranteBico);
			$this->setEncerranteBomba($objeto->encerranteBomba);
			$this->setEncerranteTanque($objeto->encerranteTanque);
			$this->setEncerranteValorInicio($objeto->encerranteValorInicio);
			$this->setEncerranteValorFim($objeto->encerranteValorFim);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetEspecificoCombustivel');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'codigoAnp' => $this->getCodigoAnp(),
			'descricaoAnp' => $this->getDescricaoAnp(),
			'percentualGlp' => $this->getPercentualGlp(),
			'percentualGasNacional' => $this->getPercentualGasNacional(),
			'percentualGasImportado' => $this->getPercentualGasImportado(),
			'valorPartida' => $this->getValorPartida(),
			'codif' => $this->getCodif(),
			'quantidadeTempAmbiente' => $this->getQuantidadeTempAmbiente(),
			'ufConsumo' => $this->getUfConsumo(),
			'cideBaseCalculo' => $this->getCideBaseCalculo(),
			'cideAliquota' => $this->getCideAliquota(),
			'cideValor' => $this->getCideValor(),
			'encerranteBico' => $this->getEncerranteBico(),
			'encerranteBomba' => $this->getEncerranteBomba(),
			'encerranteTanque' => $this->getEncerranteTanque(),
			'encerranteValorInicio' => $this->getEncerranteValorInicio(),
			'encerranteValorFim' => $this->getEncerranteValorFim(),
        ];
    }
}
