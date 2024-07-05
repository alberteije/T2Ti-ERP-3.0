<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS] 
                                                                                
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
 * @ORM\Table(name="NFE_DETALHE_IMPOSTO_ICMS")
 */
class NfeDetalheImpostoIcms extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="ORIGEM_MERCADORIA")
	 */
	private $origemMercadoria;

	/**
	 * @ORM\Column(type="string", name="CST_ICMS")
	 */
	private $cstIcms;

	/**
	 * @ORM\Column(type="string", name="CSOSN")
	 */
	private $csosn;

	/**
	 * @ORM\Column(type="string", name="MODALIDADE_BC_ICMS")
	 */
	private $modalidadeBcIcms;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_REDUCAO_BC_ICMS")
	 */
	private $percentualReducaoBcIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_ICMS")
	 */
	private $valorBcIcms;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_ICMS")
	 */
	private $aliquotaIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_OPERACAO")
	 */
	private $valorIcmsOperacao;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_DIFERIMENTO")
	 */
	private $percentualDiferimento;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_DIFERIDO")
	 */
	private $valorIcmsDiferido;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS")
	 */
	private $valorIcms;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_FCP")
	 */
	private $baseCalculoFcp;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_FCP")
	 */
	private $percentualFcp;

	/**
	 * @ORM\Column(type="float", name="VALOR_FCP")
	 */
	private $valorFcp;

	/**
	 * @ORM\Column(type="string", name="MODALIDADE_BC_ICMS_ST")
	 */
	private $modalidadeBcIcmsSt;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_MVA_ICMS_ST")
	 */
	private $percentualMvaIcmsSt;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_REDUCAO_BC_ICMS_ST")
	 */
	private $percentualReducaoBcIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_BASE_CALCULO_ICMS_ST")
	 */
	private $valorBaseCalculoIcmsSt;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_ICMS_ST")
	 */
	private $aliquotaIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_ST")
	 */
	private $valorIcmsSt;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_FCP_ST")
	 */
	private $baseCalculoFcpSt;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_FCP_ST")
	 */
	private $percentualFcpSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_FCP_ST")
	 */
	private $valorFcpSt;

	/**
	 * @ORM\Column(type="string", name="UF_ST")
	 */
	private $ufSt;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_BC_OPERACAO_PROPRIA")
	 */
	private $percentualBcOperacaoPropria;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_ICMS_ST_RETIDO")
	 */
	private $valorBcIcmsStRetido;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_SUPORTADA_CONSUMIDOR")
	 */
	private $aliquotaSuportadaConsumidor;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_SUBSTITUTO")
	 */
	private $valorIcmsSubstituto;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_ST_RETIDO")
	 */
	private $valorIcmsStRetido;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_FCP_ST_RETIDO")
	 */
	private $baseCalculoFcpStRetido;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_FCP_ST_RETIDO")
	 */
	private $percentualFcpStRetido;

	/**
	 * @ORM\Column(type="float", name="VALOR_FCP_ST_RETIDO")
	 */
	private $valorFcpStRetido;

	/**
	 * @ORM\Column(type="string", name="MOTIVO_DESONERACAO_ICMS")
	 */
	private $motivoDesoneracaoIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_DESONERADO")
	 */
	private $valorIcmsDesonerado;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_CREDITO_ICMS_SN")
	 */
	private $aliquotaCreditoIcmsSn;

	/**
	 * @ORM\Column(type="float", name="VALOR_CREDITO_ICMS_SN")
	 */
	private $valorCreditoIcmsSn;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_ICMS_ST_DESTINO")
	 */
	private $valorBcIcmsStDestino;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_ST_DESTINO")
	 */
	private $valorIcmsStDestino;

	/**
	 * @ORM\Column(type="float", name="PERCENTUAL_REDUCAO_BC_EFETIVO")
	 */
	private $percentualReducaoBcEfetivo;

	/**
	 * @ORM\Column(type="float", name="VALOR_BC_EFETIVO")
	 */
	private $valorBcEfetivo;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_ICMS_EFETIVO")
	 */
	private $aliquotaIcmsEfetivo;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_EFETIVO")
	 */
	private $valorIcmsEfetivo;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeDetalhe", inversedBy="nfeDetalheImpostoIcms")
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

    public function getOrigemMercadoria() 
	{
		return $this->origemMercadoria;
	}

	public function setOrigemMercadoria($origemMercadoria) 
	{
		$this->origemMercadoria = $origemMercadoria;
	}

    public function getCstIcms() 
	{
		return $this->cstIcms;
	}

	public function setCstIcms($cstIcms) 
	{
		$this->cstIcms = $cstIcms;
	}

    public function getCsosn() 
	{
		return $this->csosn;
	}

	public function setCsosn($csosn) 
	{
		$this->csosn = $csosn;
	}

    public function getModalidadeBcIcms() 
	{
		return $this->modalidadeBcIcms;
	}

	public function setModalidadeBcIcms($modalidadeBcIcms) 
	{
		$this->modalidadeBcIcms = $modalidadeBcIcms;
	}

    public function getPercentualReducaoBcIcms() 
	{
		return $this->percentualReducaoBcIcms;
	}

	public function setPercentualReducaoBcIcms($percentualReducaoBcIcms) 
	{
		$this->percentualReducaoBcIcms = $percentualReducaoBcIcms;
	}

    public function getValorBcIcms() 
	{
		return $this->valorBcIcms;
	}

	public function setValorBcIcms($valorBcIcms) 
	{
		$this->valorBcIcms = $valorBcIcms;
	}

    public function getAliquotaIcms() 
	{
		return $this->aliquotaIcms;
	}

	public function setAliquotaIcms($aliquotaIcms) 
	{
		$this->aliquotaIcms = $aliquotaIcms;
	}

    public function getValorIcmsOperacao() 
	{
		return $this->valorIcmsOperacao;
	}

	public function setValorIcmsOperacao($valorIcmsOperacao) 
	{
		$this->valorIcmsOperacao = $valorIcmsOperacao;
	}

    public function getPercentualDiferimento() 
	{
		return $this->percentualDiferimento;
	}

	public function setPercentualDiferimento($percentualDiferimento) 
	{
		$this->percentualDiferimento = $percentualDiferimento;
	}

    public function getValorIcmsDiferido() 
	{
		return $this->valorIcmsDiferido;
	}

	public function setValorIcmsDiferido($valorIcmsDiferido) 
	{
		$this->valorIcmsDiferido = $valorIcmsDiferido;
	}

    public function getValorIcms() 
	{
		return $this->valorIcms;
	}

	public function setValorIcms($valorIcms) 
	{
		$this->valorIcms = $valorIcms;
	}

    public function getBaseCalculoFcp() 
	{
		return $this->baseCalculoFcp;
	}

	public function setBaseCalculoFcp($baseCalculoFcp) 
	{
		$this->baseCalculoFcp = $baseCalculoFcp;
	}

    public function getPercentualFcp() 
	{
		return $this->percentualFcp;
	}

	public function setPercentualFcp($percentualFcp) 
	{
		$this->percentualFcp = $percentualFcp;
	}

    public function getValorFcp() 
	{
		return $this->valorFcp;
	}

	public function setValorFcp($valorFcp) 
	{
		$this->valorFcp = $valorFcp;
	}

    public function getModalidadeBcIcmsSt() 
	{
		return $this->modalidadeBcIcmsSt;
	}

	public function setModalidadeBcIcmsSt($modalidadeBcIcmsSt) 
	{
		$this->modalidadeBcIcmsSt = $modalidadeBcIcmsSt;
	}

    public function getPercentualMvaIcmsSt() 
	{
		return $this->percentualMvaIcmsSt;
	}

	public function setPercentualMvaIcmsSt($percentualMvaIcmsSt) 
	{
		$this->percentualMvaIcmsSt = $percentualMvaIcmsSt;
	}

    public function getPercentualReducaoBcIcmsSt() 
	{
		return $this->percentualReducaoBcIcmsSt;
	}

	public function setPercentualReducaoBcIcmsSt($percentualReducaoBcIcmsSt) 
	{
		$this->percentualReducaoBcIcmsSt = $percentualReducaoBcIcmsSt;
	}

    public function getValorBaseCalculoIcmsSt() 
	{
		return $this->valorBaseCalculoIcmsSt;
	}

	public function setValorBaseCalculoIcmsSt($valorBaseCalculoIcmsSt) 
	{
		$this->valorBaseCalculoIcmsSt = $valorBaseCalculoIcmsSt;
	}

    public function getAliquotaIcmsSt() 
	{
		return $this->aliquotaIcmsSt;
	}

	public function setAliquotaIcmsSt($aliquotaIcmsSt) 
	{
		$this->aliquotaIcmsSt = $aliquotaIcmsSt;
	}

    public function getValorIcmsSt() 
	{
		return $this->valorIcmsSt;
	}

	public function setValorIcmsSt($valorIcmsSt) 
	{
		$this->valorIcmsSt = $valorIcmsSt;
	}

    public function getBaseCalculoFcpSt() 
	{
		return $this->baseCalculoFcpSt;
	}

	public function setBaseCalculoFcpSt($baseCalculoFcpSt) 
	{
		$this->baseCalculoFcpSt = $baseCalculoFcpSt;
	}

    public function getPercentualFcpSt() 
	{
		return $this->percentualFcpSt;
	}

	public function setPercentualFcpSt($percentualFcpSt) 
	{
		$this->percentualFcpSt = $percentualFcpSt;
	}

    public function getValorFcpSt() 
	{
		return $this->valorFcpSt;
	}

	public function setValorFcpSt($valorFcpSt) 
	{
		$this->valorFcpSt = $valorFcpSt;
	}

    public function getUfSt() 
	{
		return $this->ufSt;
	}

	public function setUfSt($ufSt) 
	{
		$this->ufSt = $ufSt;
	}

    public function getPercentualBcOperacaoPropria() 
	{
		return $this->percentualBcOperacaoPropria;
	}

	public function setPercentualBcOperacaoPropria($percentualBcOperacaoPropria) 
	{
		$this->percentualBcOperacaoPropria = $percentualBcOperacaoPropria;
	}

    public function getValorBcIcmsStRetido() 
	{
		return $this->valorBcIcmsStRetido;
	}

	public function setValorBcIcmsStRetido($valorBcIcmsStRetido) 
	{
		$this->valorBcIcmsStRetido = $valorBcIcmsStRetido;
	}

    public function getAliquotaSuportadaConsumidor() 
	{
		return $this->aliquotaSuportadaConsumidor;
	}

	public function setAliquotaSuportadaConsumidor($aliquotaSuportadaConsumidor) 
	{
		$this->aliquotaSuportadaConsumidor = $aliquotaSuportadaConsumidor;
	}

    public function getValorIcmsSubstituto() 
	{
		return $this->valorIcmsSubstituto;
	}

	public function setValorIcmsSubstituto($valorIcmsSubstituto) 
	{
		$this->valorIcmsSubstituto = $valorIcmsSubstituto;
	}

    public function getValorIcmsStRetido() 
	{
		return $this->valorIcmsStRetido;
	}

	public function setValorIcmsStRetido($valorIcmsStRetido) 
	{
		$this->valorIcmsStRetido = $valorIcmsStRetido;
	}

    public function getBaseCalculoFcpStRetido() 
	{
		return $this->baseCalculoFcpStRetido;
	}

	public function setBaseCalculoFcpStRetido($baseCalculoFcpStRetido) 
	{
		$this->baseCalculoFcpStRetido = $baseCalculoFcpStRetido;
	}

    public function getPercentualFcpStRetido() 
	{
		return $this->percentualFcpStRetido;
	}

	public function setPercentualFcpStRetido($percentualFcpStRetido) 
	{
		$this->percentualFcpStRetido = $percentualFcpStRetido;
	}

    public function getValorFcpStRetido() 
	{
		return $this->valorFcpStRetido;
	}

	public function setValorFcpStRetido($valorFcpStRetido) 
	{
		$this->valorFcpStRetido = $valorFcpStRetido;
	}

    public function getMotivoDesoneracaoIcms() 
	{
		return $this->motivoDesoneracaoIcms;
	}

	public function setMotivoDesoneracaoIcms($motivoDesoneracaoIcms) 
	{
		$this->motivoDesoneracaoIcms = $motivoDesoneracaoIcms;
	}

    public function getValorIcmsDesonerado() 
	{
		return $this->valorIcmsDesonerado;
	}

	public function setValorIcmsDesonerado($valorIcmsDesonerado) 
	{
		$this->valorIcmsDesonerado = $valorIcmsDesonerado;
	}

    public function getAliquotaCreditoIcmsSn() 
	{
		return $this->aliquotaCreditoIcmsSn;
	}

	public function setAliquotaCreditoIcmsSn($aliquotaCreditoIcmsSn) 
	{
		$this->aliquotaCreditoIcmsSn = $aliquotaCreditoIcmsSn;
	}

    public function getValorCreditoIcmsSn() 
	{
		return $this->valorCreditoIcmsSn;
	}

	public function setValorCreditoIcmsSn($valorCreditoIcmsSn) 
	{
		$this->valorCreditoIcmsSn = $valorCreditoIcmsSn;
	}

    public function getValorBcIcmsStDestino() 
	{
		return $this->valorBcIcmsStDestino;
	}

	public function setValorBcIcmsStDestino($valorBcIcmsStDestino) 
	{
		$this->valorBcIcmsStDestino = $valorBcIcmsStDestino;
	}

    public function getValorIcmsStDestino() 
	{
		return $this->valorIcmsStDestino;
	}

	public function setValorIcmsStDestino($valorIcmsStDestino) 
	{
		$this->valorIcmsStDestino = $valorIcmsStDestino;
	}

    public function getPercentualReducaoBcEfetivo() 
	{
		return $this->percentualReducaoBcEfetivo;
	}

	public function setPercentualReducaoBcEfetivo($percentualReducaoBcEfetivo) 
	{
		$this->percentualReducaoBcEfetivo = $percentualReducaoBcEfetivo;
	}

    public function getValorBcEfetivo() 
	{
		return $this->valorBcEfetivo;
	}

	public function setValorBcEfetivo($valorBcEfetivo) 
	{
		$this->valorBcEfetivo = $valorBcEfetivo;
	}

    public function getAliquotaIcmsEfetivo() 
	{
		return $this->aliquotaIcmsEfetivo;
	}

	public function setAliquotaIcmsEfetivo($aliquotaIcmsEfetivo) 
	{
		$this->aliquotaIcmsEfetivo = $aliquotaIcmsEfetivo;
	}

    public function getValorIcmsEfetivo() 
	{
		return $this->valorIcmsEfetivo;
	}

	public function setValorIcmsEfetivo($valorIcmsEfetivo) 
	{
		$this->valorIcmsEfetivo = $valorIcmsEfetivo;
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
			$this->setOrigemMercadoria($objeto->origemMercadoria);
			$this->setCstIcms($objeto->cstIcms);
			$this->setCsosn($objeto->csosn);
			$this->setModalidadeBcIcms($objeto->modalidadeBcIcms);
			$this->setPercentualReducaoBcIcms($objeto->percentualReducaoBcIcms);
			$this->setValorBcIcms($objeto->valorBcIcms);
			$this->setAliquotaIcms($objeto->aliquotaIcms);
			$this->setValorIcmsOperacao($objeto->valorIcmsOperacao);
			$this->setPercentualDiferimento($objeto->percentualDiferimento);
			$this->setValorIcmsDiferido($objeto->valorIcmsDiferido);
			$this->setValorIcms($objeto->valorIcms);
			$this->setBaseCalculoFcp($objeto->baseCalculoFcp);
			$this->setPercentualFcp($objeto->percentualFcp);
			$this->setValorFcp($objeto->valorFcp);
			$this->setModalidadeBcIcmsSt($objeto->modalidadeBcIcmsSt);
			$this->setPercentualMvaIcmsSt($objeto->percentualMvaIcmsSt);
			$this->setPercentualReducaoBcIcmsSt($objeto->percentualReducaoBcIcmsSt);
			$this->setValorBaseCalculoIcmsSt($objeto->valorBaseCalculoIcmsSt);
			$this->setAliquotaIcmsSt($objeto->aliquotaIcmsSt);
			$this->setValorIcmsSt($objeto->valorIcmsSt);
			$this->setBaseCalculoFcpSt($objeto->baseCalculoFcpSt);
			$this->setPercentualFcpSt($objeto->percentualFcpSt);
			$this->setValorFcpSt($objeto->valorFcpSt);
			$this->setUfSt($objeto->ufSt);
			$this->setPercentualBcOperacaoPropria($objeto->percentualBcOperacaoPropria);
			$this->setValorBcIcmsStRetido($objeto->valorBcIcmsStRetido);
			$this->setAliquotaSuportadaConsumidor($objeto->aliquotaSuportadaConsumidor);
			$this->setValorIcmsSubstituto($objeto->valorIcmsSubstituto);
			$this->setValorIcmsStRetido($objeto->valorIcmsStRetido);
			$this->setBaseCalculoFcpStRetido($objeto->baseCalculoFcpStRetido);
			$this->setPercentualFcpStRetido($objeto->percentualFcpStRetido);
			$this->setValorFcpStRetido($objeto->valorFcpStRetido);
			$this->setMotivoDesoneracaoIcms($objeto->motivoDesoneracaoIcms);
			$this->setValorIcmsDesonerado($objeto->valorIcmsDesonerado);
			$this->setAliquotaCreditoIcmsSn($objeto->aliquotaCreditoIcmsSn);
			$this->setValorCreditoIcmsSn($objeto->valorCreditoIcmsSn);
			$this->setValorBcIcmsStDestino($objeto->valorBcIcmsStDestino);
			$this->setValorIcmsStDestino($objeto->valorIcmsStDestino);
			$this->setPercentualReducaoBcEfetivo($objeto->percentualReducaoBcEfetivo);
			$this->setValorBcEfetivo($objeto->valorBcEfetivo);
			$this->setAliquotaIcmsEfetivo($objeto->aliquotaIcmsEfetivo);
			$this->setValorIcmsEfetivo($objeto->valorIcmsEfetivo);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetalheImpostoIcms');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'origemMercadoria' => $this->getOrigemMercadoria(),
			'cstIcms' => $this->getCstIcms(),
			'csosn' => $this->getCsosn(),
			'modalidadeBcIcms' => $this->getModalidadeBcIcms(),
			'percentualReducaoBcIcms' => $this->getPercentualReducaoBcIcms(),
			'valorBcIcms' => $this->getValorBcIcms(),
			'aliquotaIcms' => $this->getAliquotaIcms(),
			'valorIcmsOperacao' => $this->getValorIcmsOperacao(),
			'percentualDiferimento' => $this->getPercentualDiferimento(),
			'valorIcmsDiferido' => $this->getValorIcmsDiferido(),
			'valorIcms' => $this->getValorIcms(),
			'baseCalculoFcp' => $this->getBaseCalculoFcp(),
			'percentualFcp' => $this->getPercentualFcp(),
			'valorFcp' => $this->getValorFcp(),
			'modalidadeBcIcmsSt' => $this->getModalidadeBcIcmsSt(),
			'percentualMvaIcmsSt' => $this->getPercentualMvaIcmsSt(),
			'percentualReducaoBcIcmsSt' => $this->getPercentualReducaoBcIcmsSt(),
			'valorBaseCalculoIcmsSt' => $this->getValorBaseCalculoIcmsSt(),
			'aliquotaIcmsSt' => $this->getAliquotaIcmsSt(),
			'valorIcmsSt' => $this->getValorIcmsSt(),
			'baseCalculoFcpSt' => $this->getBaseCalculoFcpSt(),
			'percentualFcpSt' => $this->getPercentualFcpSt(),
			'valorFcpSt' => $this->getValorFcpSt(),
			'ufSt' => $this->getUfSt(),
			'percentualBcOperacaoPropria' => $this->getPercentualBcOperacaoPropria(),
			'valorBcIcmsStRetido' => $this->getValorBcIcmsStRetido(),
			'aliquotaSuportadaConsumidor' => $this->getAliquotaSuportadaConsumidor(),
			'valorIcmsSubstituto' => $this->getValorIcmsSubstituto(),
			'valorIcmsStRetido' => $this->getValorIcmsStRetido(),
			'baseCalculoFcpStRetido' => $this->getBaseCalculoFcpStRetido(),
			'percentualFcpStRetido' => $this->getPercentualFcpStRetido(),
			'valorFcpStRetido' => $this->getValorFcpStRetido(),
			'motivoDesoneracaoIcms' => $this->getMotivoDesoneracaoIcms(),
			'valorIcmsDesonerado' => $this->getValorIcmsDesonerado(),
			'aliquotaCreditoIcmsSn' => $this->getAliquotaCreditoIcmsSn(),
			'valorCreditoIcmsSn' => $this->getValorCreditoIcmsSn(),
			'valorBcIcmsStDestino' => $this->getValorBcIcmsStDestino(),
			'valorIcmsStDestino' => $this->getValorIcmsStDestino(),
			'percentualReducaoBcEfetivo' => $this->getPercentualReducaoBcEfetivo(),
			'valorBcEfetivo' => $this->getValorBcEfetivo(),
			'aliquotaIcmsEfetivo' => $this->getAliquotaIcmsEfetivo(),
			'valorIcmsEfetivo' => $this->getValorIcmsEfetivo(),
        ];
    }
}
