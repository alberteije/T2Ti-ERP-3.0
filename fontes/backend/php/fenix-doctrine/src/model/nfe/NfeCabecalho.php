<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
 * @ORM\Table(name="NFE_CABECALHO")
 */
class NfeCabecalho extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="UF_EMITENTE")
	 */
	private $ufEmitente;

	/**
	 * @ORM\Column(type="string", name="CODIGO_NUMERICO")
	 */
	private $codigoNumerico;

	/**
	 * @ORM\Column(type="string", name="NATUREZA_OPERACAO")
	 */
	private $naturezaOperacao;

	/**
	 * @ORM\Column(type="string", name="CODIGO_MODELO")
	 */
	private $codigoModelo;

	/**
	 * @ORM\Column(type="string", name="SERIE")
	 */
	private $serie;

	/**
	 * @ORM\Column(type="string", name="NUMERO")
	 */
	private $numero;

	/**
	 * @ORM\Column(type="datetime", name="DATA_HORA_EMISSAO")
	 */
	private $dataHoraEmissao;

	/**
	 * @ORM\Column(type="datetime", name="DATA_HORA_ENTRADA_SAIDA")
	 */
	private $dataHoraEntradaSaida;

	/**
	 * @ORM\Column(type="string", name="TIPO_OPERACAO")
	 */
	private $tipoOperacao;

	/**
	 * @ORM\Column(type="string", name="LOCAL_DESTINO")
	 */
	private $localDestino;

	/**
	 * @ORM\Column(type="integer", name="CODIGO_MUNICIPIO")
	 */
	private $codigoMunicipio;

	/**
	 * @ORM\Column(type="string", name="FORMATO_IMPRESSAO_DANFE")
	 */
	private $formatoImpressaoDanfe;

	/**
	 * @ORM\Column(type="string", name="TIPO_EMISSAO")
	 */
	private $tipoEmissao;

	/**
	 * @ORM\Column(type="string", name="CHAVE_ACESSO")
	 */
	private $chaveAcesso;

	/**
	 * @ORM\Column(type="string", name="DIGITO_CHAVE_ACESSO")
	 */
	private $digitoChaveAcesso;

	/**
	 * @ORM\Column(type="string", name="AMBIENTE")
	 */
	private $ambiente;

	/**
	 * @ORM\Column(type="string", name="FINALIDADE_EMISSAO")
	 */
	private $finalidadeEmissao;

	/**
	 * @ORM\Column(type="string", name="CONSUMIDOR_OPERACAO")
	 */
	private $consumidorOperacao;

	/**
	 * @ORM\Column(type="string", name="CONSUMIDOR_PRESENCA")
	 */
	private $consumidorPresenca;

	/**
	 * @ORM\Column(type="string", name="PROCESSO_EMISSAO")
	 */
	private $processoEmissao;

	/**
	 * @ORM\Column(type="string", name="VERSAO_PROCESSO_EMISSAO")
	 */
	private $versaoProcessoEmissao;

	/**
	 * @ORM\Column(type="date", name="DATA_ENTRADA_CONTINGENCIA")
	 */
	private $dataEntradaContingencia;

	/**
	 * @ORM\Column(type="string", name="JUSTIFICATIVA_CONTINGENCIA")
	 */
	private $justificativaContingencia;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_ICMS")
	 */
	private $baseCalculoIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS")
	 */
	private $valorIcms;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_DESONERADO")
	 */
	private $valorIcmsDesonerado;

	/**
	 * @ORM\Column(type="float", name="TOTAL_ICMS_FCP_UF_DESTINO")
	 */
	private $totalIcmsFcpUfDestino;

	/**
	 * @ORM\Column(type="float", name="TOTAL_ICMS_INTERESTADUAL_UF_DESTINO")
	 */
	private $totalIcmsInterestadualUfDestino;

	/**
	 * @ORM\Column(type="float", name="TOTAL_ICMS_INTERESTADUAL_UF_REMENTE")
	 */
	private $totalIcmsInterestadualUfRemente;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL_FCP")
	 */
	private $valorTotalFcp;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_ICMS_ST")
	 */
	private $baseCalculoIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_ICMS_ST")
	 */
	private $valorIcmsSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL_FCP_ST")
	 */
	private $valorTotalFcpSt;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL_FCP_ST_RETIDO")
	 */
	private $valorTotalFcpStRetido;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL_PRODUTOS")
	 */
	private $valorTotalProdutos;

	/**
	 * @ORM\Column(type="float", name="VALOR_FRETE")
	 */
	private $valorFrete;

	/**
	 * @ORM\Column(type="float", name="VALOR_SEGURO")
	 */
	private $valorSeguro;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESCONTO")
	 */
	private $valorDesconto;

	/**
	 * @ORM\Column(type="float", name="VALOR_IMPOSTO_IMPORTACAO")
	 */
	private $valorImpostoImportacao;

	/**
	 * @ORM\Column(type="float", name="VALOR_IPI")
	 */
	private $valorIpi;

	/**
	 * @ORM\Column(type="float", name="VALOR_IPI_DEVOLVIDO")
	 */
	private $valorIpiDevolvido;

	/**
	 * @ORM\Column(type="float", name="VALOR_PIS")
	 */
	private $valorPis;

	/**
	 * @ORM\Column(type="float", name="VALOR_COFINS")
	 */
	private $valorCofins;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESPESAS_ACESSORIAS")
	 */
	private $valorDespesasAcessorias;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL")
	 */
	private $valorTotal;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL_TRIBUTOS")
	 */
	private $valorTotalTributos;

	/**
	 * @ORM\Column(type="float", name="VALOR_SERVICOS")
	 */
	private $valorServicos;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_ISSQN")
	 */
	private $baseCalculoIssqn;

	/**
	 * @ORM\Column(type="float", name="VALOR_ISSQN")
	 */
	private $valorIssqn;

	/**
	 * @ORM\Column(type="float", name="VALOR_PIS_ISSQN")
	 */
	private $valorPisIssqn;

	/**
	 * @ORM\Column(type="float", name="VALOR_COFINS_ISSQN")
	 */
	private $valorCofinsIssqn;

	/**
	 * @ORM\Column(type="date", name="DATA_PRESTACAO_SERVICO")
	 */
	private $dataPrestacaoServico;

	/**
	 * @ORM\Column(type="float", name="VALOR_DEDUCAO_ISSQN")
	 */
	private $valorDeducaoIssqn;

	/**
	 * @ORM\Column(type="float", name="OUTRAS_RETENCOES_ISSQN")
	 */
	private $outrasRetencoesIssqn;

	/**
	 * @ORM\Column(type="float", name="DESCONTO_INCONDICIONADO_ISSQN")
	 */
	private $descontoIncondicionadoIssqn;

	/**
	 * @ORM\Column(type="float", name="DESCONTO_CONDICIONADO_ISSQN")
	 */
	private $descontoCondicionadoIssqn;

	/**
	 * @ORM\Column(type="float", name="TOTAL_RETENCAO_ISSQN")
	 */
	private $totalRetencaoIssqn;

	/**
	 * @ORM\Column(type="string", name="REGIME_ESPECIAL_TRIBUTACAO")
	 */
	private $regimeEspecialTributacao;

	/**
	 * @ORM\Column(type="float", name="VALOR_RETIDO_PIS")
	 */
	private $valorRetidoPis;

	/**
	 * @ORM\Column(type="float", name="VALOR_RETIDO_COFINS")
	 */
	private $valorRetidoCofins;

	/**
	 * @ORM\Column(type="float", name="VALOR_RETIDO_CSLL")
	 */
	private $valorRetidoCsll;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_IRRF")
	 */
	private $baseCalculoIrrf;

	/**
	 * @ORM\Column(type="float", name="VALOR_RETIDO_IRRF")
	 */
	private $valorRetidoIrrf;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_PREVIDENCIA")
	 */
	private $baseCalculoPrevidencia;

	/**
	 * @ORM\Column(type="float", name="VALOR_RETIDO_PREVIDENCIA")
	 */
	private $valorRetidoPrevidencia;

	/**
	 * @ORM\Column(type="string", name="INFORMACOES_ADD_FISCO")
	 */
	private $informacoesAddFisco;

	/**
	 * @ORM\Column(type="string", name="INFORMACOES_ADD_CONTRIBUINTE")
	 */
	private $informacoesAddContribuinte;

	/**
	 * @ORM\Column(type="string", name="COMEX_UF_EMBARQUE")
	 */
	private $comexUfEmbarque;

	/**
	 * @ORM\Column(type="string", name="COMEX_LOCAL_EMBARQUE")
	 */
	private $comexLocalEmbarque;

	/**
	 * @ORM\Column(type="string", name="COMEX_LOCAL_DESPACHO")
	 */
	private $comexLocalDespacho;

	/**
	 * @ORM\Column(type="string", name="COMPRA_NOTA_EMPENHO")
	 */
	private $compraNotaEmpenho;

	/**
	 * @ORM\Column(type="string", name="COMPRA_PEDIDO")
	 */
	private $compraPedido;

	/**
	 * @ORM\Column(type="string", name="COMPRA_CONTRATO")
	 */
	private $compraContrato;

	/**
	 * @ORM\Column(type="string", name="QRCODE")
	 */
	private $qrcode;

	/**
	 * @ORM\Column(type="string", name="URL_CHAVE")
	 */
	private $urlChave;

	/**
	 * @ORM\Column(type="string", name="STATUS_NOTA")
	 */
	private $statusNota;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeCana", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $nfeCana;

    /**
     * @ORM\OneToOne(targetEntity="NfeDestinatario", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $nfeDestinatario;

    /**
     * @ORM\OneToOne(targetEntity="NfeEmitente", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $nfeEmitente;

    /**
     * @ORM\OneToOne(targetEntity="NfeFatura", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $nfeFatura;

    /**
     * @ORM\OneToOne(targetEntity="NfeInformacaoPagamento", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $nfeInformacaoPagamento;

    /**
     * @ORM\OneToOne(targetEntity="NfeLocalEntrega", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $nfeLocalEntrega;

    /**
     * @ORM\OneToOne(targetEntity="NfeLocalRetirada", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $nfeLocalRetirada;

    /**
     * @ORM\OneToOne(targetEntity="NfeResponsavelTecnico", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $nfeResponsavelTecnico;

    /**
     * @ORM\OneToOne(targetEntity="NfeTransporte", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $nfeTransporte;

    /**
     * @ORM\OneToOne(targetEntity="Vendedor", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_VENDEDOR", referencedColumnName="id")
     */
    private $vendedor;

    /**
     * @ORM\OneToOne(targetEntity="Fornecedor", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_FORNECEDOR", referencedColumnName="id")
     */
    private $fornecedor;

    /**
     * @ORM\OneToOne(targetEntity="Cliente", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_CLIENTE", referencedColumnName="id")
     */
    private $cliente;

    /**
     * @ORM\OneToOne(targetEntity="TributOperacaoFiscal", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TRIBUT_OPERACAO_FISCAL", referencedColumnName="id")
     */
    private $tributOperacaoFiscal;

    /**
     * @ORM\OneToOne(targetEntity="VendaCabecalho", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_VENDA_CABECALHO", referencedColumnName="id")
     */
    private $vendaCabecalho;

    /**
     * @ORM\OneToMany(targetEntity="NfeAcessoXml", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $listaNfeAcessoXml;

    /**
     * @ORM\OneToMany(targetEntity="NfeCteReferenciado", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $listaNfeCteReferenciado;

    /**
     * @ORM\OneToMany(targetEntity="NfeCupomFiscalReferenciado", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $listaNfeCupomFiscalReferenciado;

    /**
     * @ORM\OneToMany(targetEntity="NfeDetalhe", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $listaNfeDetalhe;

    /**
     * @ORM\OneToMany(targetEntity="NfeNfReferenciada", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $listaNfeNfReferenciada;

    /**
     * @ORM\OneToMany(targetEntity="NfeProcessoReferenciado", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $listaNfeProcessoReferenciado;

    /**
     * @ORM\OneToMany(targetEntity="NfeProdRuralReferenciada", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $listaNfeProdRuralReferenciada;

    /**
     * @ORM\OneToMany(targetEntity="NfeReferenciada", mappedBy="nfeCabecalho", cascade={"persist", "remove"})
     */
    private $listaNfeReferenciada;


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

    public function getUfEmitente() 
	{
		return $this->ufEmitente;
	}

	public function setUfEmitente($ufEmitente) 
	{
		$this->ufEmitente = $ufEmitente;
	}

    public function getCodigoNumerico() 
	{
		return $this->codigoNumerico;
	}

	public function setCodigoNumerico($codigoNumerico) 
	{
		$this->codigoNumerico = $codigoNumerico;
	}

    public function getNaturezaOperacao() 
	{
		return $this->naturezaOperacao;
	}

	public function setNaturezaOperacao($naturezaOperacao) 
	{
		$this->naturezaOperacao = $naturezaOperacao;
	}

    public function getCodigoModelo() 
	{
		return $this->codigoModelo;
	}

	public function setCodigoModelo($codigoModelo) 
	{
		$this->codigoModelo = $codigoModelo;
	}

    public function getSerie() 
	{
		return $this->serie;
	}

	public function setSerie($serie) 
	{
		$this->serie = $serie;
	}

    public function getNumero() 
	{
		return $this->numero;
	}

	public function setNumero($numero) 
	{
		$this->numero = $numero;
	}

    public function getDataHoraEmissao() 
	{
		if ($this->dataHoraEmissao != null) {
			return $this->dataHoraEmissao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataHoraEmissao($dataHoraEmissao) 
	{
		$this->dataHoraEmissao = $dataHoraEmissao != null ? new \DateTime($dataHoraEmissao) : null;
	}

    public function getDataHoraEntradaSaida() 
	{
		if ($this->dataHoraEntradaSaida != null) {
			return $this->dataHoraEntradaSaida->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataHoraEntradaSaida($dataHoraEntradaSaida) 
	{
		$this->dataHoraEntradaSaida = $dataHoraEntradaSaida != null ? new \DateTime($dataHoraEntradaSaida) : null;
	}

    public function getTipoOperacao() 
	{
		return $this->tipoOperacao;
	}

	public function setTipoOperacao($tipoOperacao) 
	{
		$this->tipoOperacao = $tipoOperacao;
	}

    public function getLocalDestino() 
	{
		return $this->localDestino;
	}

	public function setLocalDestino($localDestino) 
	{
		$this->localDestino = $localDestino;
	}

    public function getCodigoMunicipio() 
	{
		return $this->codigoMunicipio;
	}

	public function setCodigoMunicipio($codigoMunicipio) 
	{
		$this->codigoMunicipio = $codigoMunicipio;
	}

    public function getFormatoImpressaoDanfe() 
	{
		return $this->formatoImpressaoDanfe;
	}

	public function setFormatoImpressaoDanfe($formatoImpressaoDanfe) 
	{
		$this->formatoImpressaoDanfe = $formatoImpressaoDanfe;
	}

    public function getTipoEmissao() 
	{
		return $this->tipoEmissao;
	}

	public function setTipoEmissao($tipoEmissao) 
	{
		$this->tipoEmissao = $tipoEmissao;
	}

    public function getChaveAcesso() 
	{
		return $this->chaveAcesso;
	}

	public function setChaveAcesso($chaveAcesso) 
	{
		$this->chaveAcesso = $chaveAcesso;
	}

    public function getDigitoChaveAcesso() 
	{
		return $this->digitoChaveAcesso;
	}

	public function setDigitoChaveAcesso($digitoChaveAcesso) 
	{
		$this->digitoChaveAcesso = $digitoChaveAcesso;
	}

    public function getAmbiente() 
	{
		return $this->ambiente;
	}

	public function setAmbiente($ambiente) 
	{
		$this->ambiente = $ambiente;
	}

    public function getFinalidadeEmissao() 
	{
		return $this->finalidadeEmissao;
	}

	public function setFinalidadeEmissao($finalidadeEmissao) 
	{
		$this->finalidadeEmissao = $finalidadeEmissao;
	}

    public function getConsumidorOperacao() 
	{
		return $this->consumidorOperacao;
	}

	public function setConsumidorOperacao($consumidorOperacao) 
	{
		$this->consumidorOperacao = $consumidorOperacao;
	}

    public function getConsumidorPresenca() 
	{
		return $this->consumidorPresenca;
	}

	public function setConsumidorPresenca($consumidorPresenca) 
	{
		$this->consumidorPresenca = $consumidorPresenca;
	}

    public function getProcessoEmissao() 
	{
		return $this->processoEmissao;
	}

	public function setProcessoEmissao($processoEmissao) 
	{
		$this->processoEmissao = $processoEmissao;
	}

    public function getVersaoProcessoEmissao() 
	{
		return $this->versaoProcessoEmissao;
	}

	public function setVersaoProcessoEmissao($versaoProcessoEmissao) 
	{
		$this->versaoProcessoEmissao = $versaoProcessoEmissao;
	}

    public function getDataEntradaContingencia() 
	{
		if ($this->dataEntradaContingencia != null) {
			return $this->dataEntradaContingencia->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataEntradaContingencia($dataEntradaContingencia) 
	{
		$this->dataEntradaContingencia = $dataEntradaContingencia != null ? new \DateTime($dataEntradaContingencia) : null;
	}

    public function getJustificativaContingencia() 
	{
		return $this->justificativaContingencia;
	}

	public function setJustificativaContingencia($justificativaContingencia) 
	{
		$this->justificativaContingencia = $justificativaContingencia;
	}

    public function getBaseCalculoIcms() 
	{
		return $this->baseCalculoIcms;
	}

	public function setBaseCalculoIcms($baseCalculoIcms) 
	{
		$this->baseCalculoIcms = $baseCalculoIcms;
	}

    public function getValorIcms() 
	{
		return $this->valorIcms;
	}

	public function setValorIcms($valorIcms) 
	{
		$this->valorIcms = $valorIcms;
	}

    public function getValorIcmsDesonerado() 
	{
		return $this->valorIcmsDesonerado;
	}

	public function setValorIcmsDesonerado($valorIcmsDesonerado) 
	{
		$this->valorIcmsDesonerado = $valorIcmsDesonerado;
	}

    public function getTotalIcmsFcpUfDestino() 
	{
		return $this->totalIcmsFcpUfDestino;
	}

	public function setTotalIcmsFcpUfDestino($totalIcmsFcpUfDestino) 
	{
		$this->totalIcmsFcpUfDestino = $totalIcmsFcpUfDestino;
	}

    public function getTotalIcmsInterestadualUfDestino() 
	{
		return $this->totalIcmsInterestadualUfDestino;
	}

	public function setTotalIcmsInterestadualUfDestino($totalIcmsInterestadualUfDestino) 
	{
		$this->totalIcmsInterestadualUfDestino = $totalIcmsInterestadualUfDestino;
	}

    public function getTotalIcmsInterestadualUfRemente() 
	{
		return $this->totalIcmsInterestadualUfRemente;
	}

	public function setTotalIcmsInterestadualUfRemente($totalIcmsInterestadualUfRemente) 
	{
		$this->totalIcmsInterestadualUfRemente = $totalIcmsInterestadualUfRemente;
	}

    public function getValorTotalFcp() 
	{
		return $this->valorTotalFcp;
	}

	public function setValorTotalFcp($valorTotalFcp) 
	{
		$this->valorTotalFcp = $valorTotalFcp;
	}

    public function getBaseCalculoIcmsSt() 
	{
		return $this->baseCalculoIcmsSt;
	}

	public function setBaseCalculoIcmsSt($baseCalculoIcmsSt) 
	{
		$this->baseCalculoIcmsSt = $baseCalculoIcmsSt;
	}

    public function getValorIcmsSt() 
	{
		return $this->valorIcmsSt;
	}

	public function setValorIcmsSt($valorIcmsSt) 
	{
		$this->valorIcmsSt = $valorIcmsSt;
	}

    public function getValorTotalFcpSt() 
	{
		return $this->valorTotalFcpSt;
	}

	public function setValorTotalFcpSt($valorTotalFcpSt) 
	{
		$this->valorTotalFcpSt = $valorTotalFcpSt;
	}

    public function getValorTotalFcpStRetido() 
	{
		return $this->valorTotalFcpStRetido;
	}

	public function setValorTotalFcpStRetido($valorTotalFcpStRetido) 
	{
		$this->valorTotalFcpStRetido = $valorTotalFcpStRetido;
	}

    public function getValorTotalProdutos() 
	{
		return $this->valorTotalProdutos;
	}

	public function setValorTotalProdutos($valorTotalProdutos) 
	{
		$this->valorTotalProdutos = $valorTotalProdutos;
	}

    public function getValorFrete() 
	{
		return $this->valorFrete;
	}

	public function setValorFrete($valorFrete) 
	{
		$this->valorFrete = $valorFrete;
	}

    public function getValorSeguro() 
	{
		return $this->valorSeguro;
	}

	public function setValorSeguro($valorSeguro) 
	{
		$this->valorSeguro = $valorSeguro;
	}

    public function getValorDesconto() 
	{
		return $this->valorDesconto;
	}

	public function setValorDesconto($valorDesconto) 
	{
		$this->valorDesconto = $valorDesconto;
	}

    public function getValorImpostoImportacao() 
	{
		return $this->valorImpostoImportacao;
	}

	public function setValorImpostoImportacao($valorImpostoImportacao) 
	{
		$this->valorImpostoImportacao = $valorImpostoImportacao;
	}

    public function getValorIpi() 
	{
		return $this->valorIpi;
	}

	public function setValorIpi($valorIpi) 
	{
		$this->valorIpi = $valorIpi;
	}

    public function getValorIpiDevolvido() 
	{
		return $this->valorIpiDevolvido;
	}

	public function setValorIpiDevolvido($valorIpiDevolvido) 
	{
		$this->valorIpiDevolvido = $valorIpiDevolvido;
	}

    public function getValorPis() 
	{
		return $this->valorPis;
	}

	public function setValorPis($valorPis) 
	{
		$this->valorPis = $valorPis;
	}

    public function getValorCofins() 
	{
		return $this->valorCofins;
	}

	public function setValorCofins($valorCofins) 
	{
		$this->valorCofins = $valorCofins;
	}

    public function getValorDespesasAcessorias() 
	{
		return $this->valorDespesasAcessorias;
	}

	public function setValorDespesasAcessorias($valorDespesasAcessorias) 
	{
		$this->valorDespesasAcessorias = $valorDespesasAcessorias;
	}

    public function getValorTotal() 
	{
		return $this->valorTotal;
	}

	public function setValorTotal($valorTotal) 
	{
		$this->valorTotal = $valorTotal;
	}

    public function getValorTotalTributos() 
	{
		return $this->valorTotalTributos;
	}

	public function setValorTotalTributos($valorTotalTributos) 
	{
		$this->valorTotalTributos = $valorTotalTributos;
	}

    public function getValorServicos() 
	{
		return $this->valorServicos;
	}

	public function setValorServicos($valorServicos) 
	{
		$this->valorServicos = $valorServicos;
	}

    public function getBaseCalculoIssqn() 
	{
		return $this->baseCalculoIssqn;
	}

	public function setBaseCalculoIssqn($baseCalculoIssqn) 
	{
		$this->baseCalculoIssqn = $baseCalculoIssqn;
	}

    public function getValorIssqn() 
	{
		return $this->valorIssqn;
	}

	public function setValorIssqn($valorIssqn) 
	{
		$this->valorIssqn = $valorIssqn;
	}

    public function getValorPisIssqn() 
	{
		return $this->valorPisIssqn;
	}

	public function setValorPisIssqn($valorPisIssqn) 
	{
		$this->valorPisIssqn = $valorPisIssqn;
	}

    public function getValorCofinsIssqn() 
	{
		return $this->valorCofinsIssqn;
	}

	public function setValorCofinsIssqn($valorCofinsIssqn) 
	{
		$this->valorCofinsIssqn = $valorCofinsIssqn;
	}

    public function getDataPrestacaoServico() 
	{
		if ($this->dataPrestacaoServico != null) {
			return $this->dataPrestacaoServico->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataPrestacaoServico($dataPrestacaoServico) 
	{
		$this->dataPrestacaoServico = $dataPrestacaoServico != null ? new \DateTime($dataPrestacaoServico) : null;
	}

    public function getValorDeducaoIssqn() 
	{
		return $this->valorDeducaoIssqn;
	}

	public function setValorDeducaoIssqn($valorDeducaoIssqn) 
	{
		$this->valorDeducaoIssqn = $valorDeducaoIssqn;
	}

    public function getOutrasRetencoesIssqn() 
	{
		return $this->outrasRetencoesIssqn;
	}

	public function setOutrasRetencoesIssqn($outrasRetencoesIssqn) 
	{
		$this->outrasRetencoesIssqn = $outrasRetencoesIssqn;
	}

    public function getDescontoIncondicionadoIssqn() 
	{
		return $this->descontoIncondicionadoIssqn;
	}

	public function setDescontoIncondicionadoIssqn($descontoIncondicionadoIssqn) 
	{
		$this->descontoIncondicionadoIssqn = $descontoIncondicionadoIssqn;
	}

    public function getDescontoCondicionadoIssqn() 
	{
		return $this->descontoCondicionadoIssqn;
	}

	public function setDescontoCondicionadoIssqn($descontoCondicionadoIssqn) 
	{
		$this->descontoCondicionadoIssqn = $descontoCondicionadoIssqn;
	}

    public function getTotalRetencaoIssqn() 
	{
		return $this->totalRetencaoIssqn;
	}

	public function setTotalRetencaoIssqn($totalRetencaoIssqn) 
	{
		$this->totalRetencaoIssqn = $totalRetencaoIssqn;
	}

    public function getRegimeEspecialTributacao() 
	{
		return $this->regimeEspecialTributacao;
	}

	public function setRegimeEspecialTributacao($regimeEspecialTributacao) 
	{
		$this->regimeEspecialTributacao = $regimeEspecialTributacao;
	}

    public function getValorRetidoPis() 
	{
		return $this->valorRetidoPis;
	}

	public function setValorRetidoPis($valorRetidoPis) 
	{
		$this->valorRetidoPis = $valorRetidoPis;
	}

    public function getValorRetidoCofins() 
	{
		return $this->valorRetidoCofins;
	}

	public function setValorRetidoCofins($valorRetidoCofins) 
	{
		$this->valorRetidoCofins = $valorRetidoCofins;
	}

    public function getValorRetidoCsll() 
	{
		return $this->valorRetidoCsll;
	}

	public function setValorRetidoCsll($valorRetidoCsll) 
	{
		$this->valorRetidoCsll = $valorRetidoCsll;
	}

    public function getBaseCalculoIrrf() 
	{
		return $this->baseCalculoIrrf;
	}

	public function setBaseCalculoIrrf($baseCalculoIrrf) 
	{
		$this->baseCalculoIrrf = $baseCalculoIrrf;
	}

    public function getValorRetidoIrrf() 
	{
		return $this->valorRetidoIrrf;
	}

	public function setValorRetidoIrrf($valorRetidoIrrf) 
	{
		$this->valorRetidoIrrf = $valorRetidoIrrf;
	}

    public function getBaseCalculoPrevidencia() 
	{
		return $this->baseCalculoPrevidencia;
	}

	public function setBaseCalculoPrevidencia($baseCalculoPrevidencia) 
	{
		$this->baseCalculoPrevidencia = $baseCalculoPrevidencia;
	}

    public function getValorRetidoPrevidencia() 
	{
		return $this->valorRetidoPrevidencia;
	}

	public function setValorRetidoPrevidencia($valorRetidoPrevidencia) 
	{
		$this->valorRetidoPrevidencia = $valorRetidoPrevidencia;
	}

    public function getInformacoesAddFisco() 
	{
		return $this->informacoesAddFisco;
	}

	public function setInformacoesAddFisco($informacoesAddFisco) 
	{
		$this->informacoesAddFisco = $informacoesAddFisco;
	}

    public function getInformacoesAddContribuinte() 
	{
		return $this->informacoesAddContribuinte;
	}

	public function setInformacoesAddContribuinte($informacoesAddContribuinte) 
	{
		$this->informacoesAddContribuinte = $informacoesAddContribuinte;
	}

    public function getComexUfEmbarque() 
	{
		return $this->comexUfEmbarque;
	}

	public function setComexUfEmbarque($comexUfEmbarque) 
	{
		$this->comexUfEmbarque = $comexUfEmbarque;
	}

    public function getComexLocalEmbarque() 
	{
		return $this->comexLocalEmbarque;
	}

	public function setComexLocalEmbarque($comexLocalEmbarque) 
	{
		$this->comexLocalEmbarque = $comexLocalEmbarque;
	}

    public function getComexLocalDespacho() 
	{
		return $this->comexLocalDespacho;
	}

	public function setComexLocalDespacho($comexLocalDespacho) 
	{
		$this->comexLocalDespacho = $comexLocalDespacho;
	}

    public function getCompraNotaEmpenho() 
	{
		return $this->compraNotaEmpenho;
	}

	public function setCompraNotaEmpenho($compraNotaEmpenho) 
	{
		$this->compraNotaEmpenho = $compraNotaEmpenho;
	}

    public function getCompraPedido() 
	{
		return $this->compraPedido;
	}

	public function setCompraPedido($compraPedido) 
	{
		$this->compraPedido = $compraPedido;
	}

    public function getCompraContrato() 
	{
		return $this->compraContrato;
	}

	public function setCompraContrato($compraContrato) 
	{
		$this->compraContrato = $compraContrato;
	}

    public function getQrcode() 
	{
		return $this->qrcode;
	}

	public function setQrcode($qrcode) 
	{
		$this->qrcode = $qrcode;
	}

    public function getUrlChave() 
	{
		return $this->urlChave;
	}

	public function setUrlChave($urlChave) 
	{
		$this->urlChave = $urlChave;
	}

    public function getStatusNota() 
	{
		return $this->statusNota;
	}

	public function setStatusNota($statusNota) 
	{
		$this->statusNota = $statusNota;
	}

    public function getNfeCana(): ?NfeCana 
	{
		return $this->nfeCana;
	}

	public function setNfeCana(?NfeCana $nfeCana) 
	{
		$this->nfeCana = $nfeCana;
	}

    public function getNfeDestinatario(): ?NfeDestinatario 
	{
		return $this->nfeDestinatario;
	}

	public function setNfeDestinatario(?NfeDestinatario $nfeDestinatario) 
	{
		$this->nfeDestinatario = $nfeDestinatario;
	}

    public function getNfeEmitente(): ?NfeEmitente 
	{
		return $this->nfeEmitente;
	}

	public function setNfeEmitente(?NfeEmitente $nfeEmitente) 
	{
		$this->nfeEmitente = $nfeEmitente;
	}

    public function getNfeFatura(): ?NfeFatura 
	{
		return $this->nfeFatura;
	}

	public function setNfeFatura(?NfeFatura $nfeFatura) 
	{
		$this->nfeFatura = $nfeFatura;
	}

    public function getNfeInformacaoPagamento(): ?NfeInformacaoPagamento 
	{
		return $this->nfeInformacaoPagamento;
	}

	public function setNfeInformacaoPagamento(?NfeInformacaoPagamento $nfeInformacaoPagamento) 
	{
		$this->nfeInformacaoPagamento = $nfeInformacaoPagamento;
	}

    public function getNfeLocalEntrega(): ?NfeLocalEntrega 
	{
		return $this->nfeLocalEntrega;
	}

	public function setNfeLocalEntrega(?NfeLocalEntrega $nfeLocalEntrega) 
	{
		$this->nfeLocalEntrega = $nfeLocalEntrega;
	}

    public function getNfeLocalRetirada(): ?NfeLocalRetirada 
	{
		return $this->nfeLocalRetirada;
	}

	public function setNfeLocalRetirada(?NfeLocalRetirada $nfeLocalRetirada) 
	{
		$this->nfeLocalRetirada = $nfeLocalRetirada;
	}

    public function getNfeResponsavelTecnico(): ?NfeResponsavelTecnico 
	{
		return $this->nfeResponsavelTecnico;
	}

	public function setNfeResponsavelTecnico(?NfeResponsavelTecnico $nfeResponsavelTecnico) 
	{
		$this->nfeResponsavelTecnico = $nfeResponsavelTecnico;
	}

    public function getNfeTransporte(): ?NfeTransporte 
	{
		return $this->nfeTransporte;
	}

	public function setNfeTransporte(?NfeTransporte $nfeTransporte) 
	{
		$this->nfeTransporte = $nfeTransporte;
	}

    public function getVendedor(): ?Vendedor 
	{
		return $this->vendedor;
	}

	public function setVendedor(?Vendedor $vendedor) 
	{
		$this->vendedor = $vendedor;
	}

    public function getFornecedor(): ?Fornecedor 
	{
		return $this->fornecedor;
	}

	public function setFornecedor(?Fornecedor $fornecedor) 
	{
		$this->fornecedor = $fornecedor;
	}

    public function getCliente(): ?Cliente 
	{
		return $this->cliente;
	}

	public function setCliente(?Cliente $cliente) 
	{
		$this->cliente = $cliente;
	}

    public function getTributOperacaoFiscal(): ?TributOperacaoFiscal 
	{
		return $this->tributOperacaoFiscal;
	}

	public function setTributOperacaoFiscal(?TributOperacaoFiscal $tributOperacaoFiscal) 
	{
		$this->tributOperacaoFiscal = $tributOperacaoFiscal;
	}

    public function getVendaCabecalho(): ?VendaCabecalho 
	{
		return $this->vendaCabecalho;
	}

	public function setVendaCabecalho(?VendaCabecalho $vendaCabecalho) 
	{
		$this->vendaCabecalho = $vendaCabecalho;
	}

    public function getListaNfeAcessoXml() 
	{
		return $this->listaNfeAcessoXml->toArray();
	}

	public function setListaNfeAcessoXml(array $listaNfeAcessoXml) {
		$this->listaNfeAcessoXml = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeAcessoXml); $i++) {
			$nfeAcessoXml = $listaNfeAcessoXml[$i];
			$nfeAcessoXml->setNfeCabecalho($this);
			$this->listaNfeAcessoXml->add($nfeAcessoXml);
		}
	}

    public function getListaNfeCteReferenciado() 
	{
		return $this->listaNfeCteReferenciado->toArray();
	}

	public function setListaNfeCteReferenciado(array $listaNfeCteReferenciado) {
		$this->listaNfeCteReferenciado = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeCteReferenciado); $i++) {
			$nfeCteReferenciado = $listaNfeCteReferenciado[$i];
			$nfeCteReferenciado->setNfeCabecalho($this);
			$this->listaNfeCteReferenciado->add($nfeCteReferenciado);
		}
	}

    public function getListaNfeCupomFiscalReferenciado() 
	{
		return $this->listaNfeCupomFiscalReferenciado->toArray();
	}

	public function setListaNfeCupomFiscalReferenciado(array $listaNfeCupomFiscalReferenciado) {
		$this->listaNfeCupomFiscalReferenciado = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeCupomFiscalReferenciado); $i++) {
			$nfeCupomFiscalReferenciado = $listaNfeCupomFiscalReferenciado[$i];
			$nfeCupomFiscalReferenciado->setNfeCabecalho($this);
			$this->listaNfeCupomFiscalReferenciado->add($nfeCupomFiscalReferenciado);
		}
	}

    public function getListaNfeDetalhe() 
	{
		return $this->listaNfeDetalhe->toArray();
	}

	public function setListaNfeDetalhe(array $listaNfeDetalhe) {
		$this->listaNfeDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeDetalhe); $i++) {
			$nfeDetalhe = $listaNfeDetalhe[$i];
			$nfeDetalhe->setNfeCabecalho($this);
			$this->listaNfeDetalhe->add($nfeDetalhe);
		}
	}

    public function getListaNfeNfReferenciada() 
	{
		return $this->listaNfeNfReferenciada->toArray();
	}

	public function setListaNfeNfReferenciada(array $listaNfeNfReferenciada) {
		$this->listaNfeNfReferenciada = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeNfReferenciada); $i++) {
			$nfeNfReferenciada = $listaNfeNfReferenciada[$i];
			$nfeNfReferenciada->setNfeCabecalho($this);
			$this->listaNfeNfReferenciada->add($nfeNfReferenciada);
		}
	}

    public function getListaNfeProcessoReferenciado() 
	{
		return $this->listaNfeProcessoReferenciado->toArray();
	}

	public function setListaNfeProcessoReferenciado(array $listaNfeProcessoReferenciado) {
		$this->listaNfeProcessoReferenciado = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeProcessoReferenciado); $i++) {
			$nfeProcessoReferenciado = $listaNfeProcessoReferenciado[$i];
			$nfeProcessoReferenciado->setNfeCabecalho($this);
			$this->listaNfeProcessoReferenciado->add($nfeProcessoReferenciado);
		}
	}

    public function getListaNfeProdRuralReferenciada() 
	{
		return $this->listaNfeProdRuralReferenciada->toArray();
	}

	public function setListaNfeProdRuralReferenciada(array $listaNfeProdRuralReferenciada) {
		$this->listaNfeProdRuralReferenciada = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeProdRuralReferenciada); $i++) {
			$nfeProdRuralReferenciada = $listaNfeProdRuralReferenciada[$i];
			$nfeProdRuralReferenciada->setNfeCabecalho($this);
			$this->listaNfeProdRuralReferenciada->add($nfeProdRuralReferenciada);
		}
	}

    public function getListaNfeReferenciada() 
	{
		return $this->listaNfeReferenciada->toArray();
	}

	public function setListaNfeReferenciada(array $listaNfeReferenciada) {
		$this->listaNfeReferenciada = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeReferenciada); $i++) {
			$nfeReferenciada = $listaNfeReferenciada[$i];
			$nfeReferenciada->setNfeCabecalho($this);
			$this->listaNfeReferenciada->add($nfeReferenciada);
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

		if (isset($objetoJson->nfeCana)) {
			$this->setNfeCana(new NfeCana($objetoJson->nfeCana));
			$this->getNfeCana()->setNfeCabecalho($this);
		}

		if (isset($objetoJson->nfeDestinatario)) {
			$this->setNfeDestinatario(new NfeDestinatario($objetoJson->nfeDestinatario));
			$this->getNfeDestinatario()->setNfeCabecalho($this);
		}

		if (isset($objetoJson->nfeEmitente)) {
			$this->setNfeEmitente(new NfeEmitente($objetoJson->nfeEmitente));
			$this->getNfeEmitente()->setNfeCabecalho($this);
		}

		if (isset($objetoJson->nfeFatura)) {
			$this->setNfeFatura(new NfeFatura($objetoJson->nfeFatura));
			$this->getNfeFatura()->setNfeCabecalho($this);
		}

		if (isset($objetoJson->nfeInformacaoPagamento)) {
			$this->setNfeInformacaoPagamento(new NfeInformacaoPagamento($objetoJson->nfeInformacaoPagamento));
			$this->getNfeInformacaoPagamento()->setNfeCabecalho($this);
		}

		if (isset($objetoJson->nfeLocalEntrega)) {
			$this->setNfeLocalEntrega(new NfeLocalEntrega($objetoJson->nfeLocalEntrega));
			$this->getNfeLocalEntrega()->setNfeCabecalho($this);
		}

		if (isset($objetoJson->nfeLocalRetirada)) {
			$this->setNfeLocalRetirada(new NfeLocalRetirada($objetoJson->nfeLocalRetirada));
			$this->getNfeLocalRetirada()->setNfeCabecalho($this);
		}

		if (isset($objetoJson->nfeResponsavelTecnico)) {
			$this->setNfeResponsavelTecnico(new NfeResponsavelTecnico($objetoJson->nfeResponsavelTecnico));
			$this->getNfeResponsavelTecnico()->setNfeCabecalho($this);
		}

		if (isset($objetoJson->nfeTransporte)) {
			$this->setNfeTransporte(new NfeTransporte($objetoJson->nfeTransporte));
			$this->getNfeTransporte()->setNfeCabecalho($this);
		}

		// 20200630 - EIJE - inserido manualmente para instanciar a tributação - não foi gerado pelo gerador de código
		if (isset($objetoJson->tributOperacaoFiscal)) {
			$this->setTributOperacaoFiscal(new TributOperacaoFiscal($objetoJson->tributOperacaoFiscal));
		}
		
		$this->listaNfeAcessoXml = new ArrayCollection();
		$listaNfeAcessoXmlJson = $objetoJson->listaNfeAcessoXml;
		if ($listaNfeAcessoXmlJson != null) {
			for ($i = 0; $i < count($listaNfeAcessoXmlJson); $i++) {
				$objeto = new NfeAcessoXml($listaNfeAcessoXmlJson[$i]);
				$objeto->setNfeCabecalho($this);
				$this->listaNfeAcessoXml->add($objeto);
			}
		}

		$this->listaNfeCteReferenciado = new ArrayCollection();
		$listaNfeCteReferenciadoJson = $objetoJson->listaNfeCteReferenciado;
		if ($listaNfeCteReferenciadoJson != null) {
			for ($i = 0; $i < count($listaNfeCteReferenciadoJson); $i++) {
				$objeto = new NfeCteReferenciado($listaNfeCteReferenciadoJson[$i]);
				$objeto->setNfeCabecalho($this);
				$this->listaNfeCteReferenciado->add($objeto);
			}
		}

		$this->listaNfeCupomFiscalReferenciado = new ArrayCollection();
		$listaNfeCupomFiscalReferenciadoJson = $objetoJson->listaNfeCupomFiscalReferenciado;
		if ($listaNfeCupomFiscalReferenciadoJson != null) {
			for ($i = 0; $i < count($listaNfeCupomFiscalReferenciadoJson); $i++) {
				$objeto = new NfeCupomFiscalReferenciado($listaNfeCupomFiscalReferenciadoJson[$i]);
				$objeto->setNfeCabecalho($this);
				$this->listaNfeCupomFiscalReferenciado->add($objeto);
			}
		}

		$this->listaNfeDetalhe = new ArrayCollection();
		$listaNfeDetalheJson = $objetoJson->listaNfeDetalhe;
		if ($listaNfeDetalheJson != null) {
			for ($i = 0; $i < count($listaNfeDetalheJson); $i++) {
				$objeto = new NfeDetalhe($listaNfeDetalheJson[$i]);
				$objeto->setNfeCabecalho($this);
				$this->listaNfeDetalhe->add($objeto);
			}
		}

		$this->listaNfeNfReferenciada = new ArrayCollection();
		$listaNfeNfReferenciadaJson = $objetoJson->listaNfeNfReferenciada;
		if ($listaNfeNfReferenciadaJson != null) {
			for ($i = 0; $i < count($listaNfeNfReferenciadaJson); $i++) {
				$objeto = new NfeNfReferenciada($listaNfeNfReferenciadaJson[$i]);
				$objeto->setNfeCabecalho($this);
				$this->listaNfeNfReferenciada->add($objeto);
			}
		}

		$this->listaNfeProcessoReferenciado = new ArrayCollection();
		$listaNfeProcessoReferenciadoJson = $objetoJson->listaNfeProcessoReferenciado;
		if ($listaNfeProcessoReferenciadoJson != null) {
			for ($i = 0; $i < count($listaNfeProcessoReferenciadoJson); $i++) {
				$objeto = new NfeProcessoReferenciado($listaNfeProcessoReferenciadoJson[$i]);
				$objeto->setNfeCabecalho($this);
				$this->listaNfeProcessoReferenciado->add($objeto);
			}
		}

		$this->listaNfeProdRuralReferenciada = new ArrayCollection();
		$listaNfeProdRuralReferenciadaJson = $objetoJson->listaNfeProdRuralReferenciada;
		if ($listaNfeProdRuralReferenciadaJson != null) {
			for ($i = 0; $i < count($listaNfeProdRuralReferenciadaJson); $i++) {
				$objeto = new NfeProdRuralReferenciada($listaNfeProdRuralReferenciadaJson[$i]);
				$objeto->setNfeCabecalho($this);
				$this->listaNfeProdRuralReferenciada->add($objeto);
			}
		}

		$this->listaNfeReferenciada = new ArrayCollection();
		$listaNfeReferenciadaJson = $objetoJson->listaNfeReferenciada;
		if ($listaNfeReferenciadaJson != null) {
			for ($i = 0; $i < count($listaNfeReferenciadaJson); $i++) {
				$objeto = new NfeReferenciada($listaNfeReferenciadaJson[$i]);
				$objeto->setNfeCabecalho($this);
				$this->listaNfeReferenciada->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setUfEmitente($objeto->ufEmitente);
			$this->setCodigoNumerico($objeto->codigoNumerico);
			$this->setNaturezaOperacao($objeto->naturezaOperacao);
			$this->setCodigoModelo($objeto->codigoModelo);
			$this->setSerie($objeto->serie);
			$this->setNumero($objeto->numero);
			$this->setDataHoraEmissao($objeto->dataHoraEmissao);
			$this->setDataHoraEntradaSaida($objeto->dataHoraEntradaSaida);
			$this->setTipoOperacao($objeto->tipoOperacao);
			$this->setLocalDestino($objeto->localDestino);
			$this->setCodigoMunicipio($objeto->codigoMunicipio);
			$this->setFormatoImpressaoDanfe($objeto->formatoImpressaoDanfe);
			$this->setTipoEmissao($objeto->tipoEmissao);
			$this->setChaveAcesso($objeto->chaveAcesso);
			$this->setDigitoChaveAcesso($objeto->digitoChaveAcesso);
			$this->setAmbiente($objeto->ambiente);
			$this->setFinalidadeEmissao($objeto->finalidadeEmissao);
			$this->setConsumidorOperacao($objeto->consumidorOperacao);
			$this->setConsumidorPresenca($objeto->consumidorPresenca);
			$this->setProcessoEmissao($objeto->processoEmissao);
			$this->setVersaoProcessoEmissao($objeto->versaoProcessoEmissao);
			$this->setDataEntradaContingencia($objeto->dataEntradaContingencia);
			$this->setJustificativaContingencia($objeto->justificativaContingencia);
			$this->setBaseCalculoIcms($objeto->baseCalculoIcms);
			$this->setValorIcms($objeto->valorIcms);
			$this->setValorIcmsDesonerado($objeto->valorIcmsDesonerado);
			$this->setTotalIcmsFcpUfDestino($objeto->totalIcmsFcpUfDestino);
			$this->setTotalIcmsInterestadualUfDestino($objeto->totalIcmsInterestadualUfDestino);
			$this->setTotalIcmsInterestadualUfRemente($objeto->totalIcmsInterestadualUfRemente);
			$this->setValorTotalFcp($objeto->valorTotalFcp);
			$this->setBaseCalculoIcmsSt($objeto->baseCalculoIcmsSt);
			$this->setValorIcmsSt($objeto->valorIcmsSt);
			$this->setValorTotalFcpSt($objeto->valorTotalFcpSt);
			$this->setValorTotalFcpStRetido($objeto->valorTotalFcpStRetido);
			$this->setValorTotalProdutos($objeto->valorTotalProdutos);
			$this->setValorFrete($objeto->valorFrete);
			$this->setValorSeguro($objeto->valorSeguro);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setValorImpostoImportacao($objeto->valorImpostoImportacao);
			$this->setValorIpi($objeto->valorIpi);
			$this->setValorIpiDevolvido($objeto->valorIpiDevolvido);
			$this->setValorPis($objeto->valorPis);
			$this->setValorCofins($objeto->valorCofins);
			$this->setValorDespesasAcessorias($objeto->valorDespesasAcessorias);
			$this->setValorTotal($objeto->valorTotal);
			$this->setValorTotalTributos($objeto->valorTotalTributos);
			$this->setValorServicos($objeto->valorServicos);
			$this->setBaseCalculoIssqn($objeto->baseCalculoIssqn);
			$this->setValorIssqn($objeto->valorIssqn);
			$this->setValorPisIssqn($objeto->valorPisIssqn);
			$this->setValorCofinsIssqn($objeto->valorCofinsIssqn);
			$this->setDataPrestacaoServico($objeto->dataPrestacaoServico);
			$this->setValorDeducaoIssqn($objeto->valorDeducaoIssqn);
			$this->setOutrasRetencoesIssqn($objeto->outrasRetencoesIssqn);
			$this->setDescontoIncondicionadoIssqn($objeto->descontoIncondicionadoIssqn);
			$this->setDescontoCondicionadoIssqn($objeto->descontoCondicionadoIssqn);
			$this->setTotalRetencaoIssqn($objeto->totalRetencaoIssqn);
			$this->setRegimeEspecialTributacao($objeto->regimeEspecialTributacao);
			$this->setValorRetidoPis($objeto->valorRetidoPis);
			$this->setValorRetidoCofins($objeto->valorRetidoCofins);
			$this->setValorRetidoCsll($objeto->valorRetidoCsll);
			$this->setBaseCalculoIrrf($objeto->baseCalculoIrrf);
			$this->setValorRetidoIrrf($objeto->valorRetidoIrrf);
			$this->setBaseCalculoPrevidencia($objeto->baseCalculoPrevidencia);
			$this->setValorRetidoPrevidencia($objeto->valorRetidoPrevidencia);
			$this->setInformacoesAddFisco($objeto->informacoesAddFisco);
			$this->setInformacoesAddContribuinte($objeto->informacoesAddContribuinte);
			$this->setComexUfEmbarque($objeto->comexUfEmbarque);
			$this->setComexLocalEmbarque($objeto->comexLocalEmbarque);
			$this->setComexLocalDespacho($objeto->comexLocalDespacho);
			$this->setCompraNotaEmpenho($objeto->compraNotaEmpenho);
			$this->setCompraPedido($objeto->compraPedido);
			$this->setCompraContrato($objeto->compraContrato);
			$this->setQrcode($objeto->qrcode);
			$this->setUrlChave($objeto->urlChave);
			$this->setStatusNota($objeto->statusNota);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeCabecalho');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'ufEmitente' => $this->getUfEmitente(),
			'codigoNumerico' => $this->getCodigoNumerico(),
			'naturezaOperacao' => $this->getNaturezaOperacao(),
			'codigoModelo' => $this->getCodigoModelo(),
			'serie' => $this->getSerie(),
			'numero' => $this->getNumero(),
			'dataHoraEmissao' => $this->getDataHoraEmissao(),
			'dataHoraEntradaSaida' => $this->getDataHoraEntradaSaida(),
			'tipoOperacao' => $this->getTipoOperacao(),
			'localDestino' => $this->getLocalDestino(),
			'codigoMunicipio' => $this->getCodigoMunicipio(),
			'formatoImpressaoDanfe' => $this->getFormatoImpressaoDanfe(),
			'tipoEmissao' => $this->getTipoEmissao(),
			'chaveAcesso' => $this->getChaveAcesso(),
			'digitoChaveAcesso' => $this->getDigitoChaveAcesso(),
			'ambiente' => $this->getAmbiente(),
			'finalidadeEmissao' => $this->getFinalidadeEmissao(),
			'consumidorOperacao' => $this->getConsumidorOperacao(),
			'consumidorPresenca' => $this->getConsumidorPresenca(),
			'processoEmissao' => $this->getProcessoEmissao(),
			'versaoProcessoEmissao' => $this->getVersaoProcessoEmissao(),
			'dataEntradaContingencia' => $this->getDataEntradaContingencia(),
			'justificativaContingencia' => $this->getJustificativaContingencia(),
			'baseCalculoIcms' => $this->getBaseCalculoIcms(),
			'valorIcms' => $this->getValorIcms(),
			'valorIcmsDesonerado' => $this->getValorIcmsDesonerado(),
			'totalIcmsFcpUfDestino' => $this->getTotalIcmsFcpUfDestino(),
			'totalIcmsInterestadualUfDestino' => $this->getTotalIcmsInterestadualUfDestino(),
			'totalIcmsInterestadualUfRemente' => $this->getTotalIcmsInterestadualUfRemente(),
			'valorTotalFcp' => $this->getValorTotalFcp(),
			'baseCalculoIcmsSt' => $this->getBaseCalculoIcmsSt(),
			'valorIcmsSt' => $this->getValorIcmsSt(),
			'valorTotalFcpSt' => $this->getValorTotalFcpSt(),
			'valorTotalFcpStRetido' => $this->getValorTotalFcpStRetido(),
			'valorTotalProdutos' => $this->getValorTotalProdutos(),
			'valorFrete' => $this->getValorFrete(),
			'valorSeguro' => $this->getValorSeguro(),
			'valorDesconto' => $this->getValorDesconto(),
			'valorImpostoImportacao' => $this->getValorImpostoImportacao(),
			'valorIpi' => $this->getValorIpi(),
			'valorIpiDevolvido' => $this->getValorIpiDevolvido(),
			'valorPis' => $this->getValorPis(),
			'valorCofins' => $this->getValorCofins(),
			'valorDespesasAcessorias' => $this->getValorDespesasAcessorias(),
			'valorTotal' => $this->getValorTotal(),
			'valorTotalTributos' => $this->getValorTotalTributos(),
			'valorServicos' => $this->getValorServicos(),
			'baseCalculoIssqn' => $this->getBaseCalculoIssqn(),
			'valorIssqn' => $this->getValorIssqn(),
			'valorPisIssqn' => $this->getValorPisIssqn(),
			'valorCofinsIssqn' => $this->getValorCofinsIssqn(),
			'dataPrestacaoServico' => $this->getDataPrestacaoServico(),
			'valorDeducaoIssqn' => $this->getValorDeducaoIssqn(),
			'outrasRetencoesIssqn' => $this->getOutrasRetencoesIssqn(),
			'descontoIncondicionadoIssqn' => $this->getDescontoIncondicionadoIssqn(),
			'descontoCondicionadoIssqn' => $this->getDescontoCondicionadoIssqn(),
			'totalRetencaoIssqn' => $this->getTotalRetencaoIssqn(),
			'regimeEspecialTributacao' => $this->getRegimeEspecialTributacao(),
			'valorRetidoPis' => $this->getValorRetidoPis(),
			'valorRetidoCofins' => $this->getValorRetidoCofins(),
			'valorRetidoCsll' => $this->getValorRetidoCsll(),
			'baseCalculoIrrf' => $this->getBaseCalculoIrrf(),
			'valorRetidoIrrf' => $this->getValorRetidoIrrf(),
			'baseCalculoPrevidencia' => $this->getBaseCalculoPrevidencia(),
			'valorRetidoPrevidencia' => $this->getValorRetidoPrevidencia(),
			'informacoesAddFisco' => $this->getInformacoesAddFisco(),
			'informacoesAddContribuinte' => $this->getInformacoesAddContribuinte(),
			'comexUfEmbarque' => $this->getComexUfEmbarque(),
			'comexLocalEmbarque' => $this->getComexLocalEmbarque(),
			'comexLocalDespacho' => $this->getComexLocalDespacho(),
			'compraNotaEmpenho' => $this->getCompraNotaEmpenho(),
			'compraPedido' => $this->getCompraPedido(),
			'compraContrato' => $this->getCompraContrato(),
			'qrcode' => $this->getQrcode(),
			'urlChave' => $this->getUrlChave(),
			'statusNota' => $this->getStatusNota(),
			'nfeCana' => $this->getNfeCana(),
			'nfeDestinatario' => $this->getNfeDestinatario(),
			'nfeEmitente' => $this->getNfeEmitente(),
			'nfeFatura' => $this->getNfeFatura(),
			'nfeInformacaoPagamento' => $this->getNfeInformacaoPagamento(),
			'nfeLocalEntrega' => $this->getNfeLocalEntrega(),
			'nfeLocalRetirada' => $this->getNfeLocalRetirada(),
			'nfeResponsavelTecnico' => $this->getNfeResponsavelTecnico(),
			'nfeTransporte' => $this->getNfeTransporte(),
			'vendedor' => $this->getVendedor(),
			'fornecedor' => $this->getFornecedor(),
			'cliente' => $this->getCliente(),
			'tributOperacaoFiscal' => $this->getTributOperacaoFiscal(),
			'vendaCabecalho' => $this->getVendaCabecalho(),
			'listaNfeAcessoXml' => $this->getListaNfeAcessoXml(),
			'listaNfeCteReferenciado' => $this->getListaNfeCteReferenciado(),
			'listaNfeCupomFiscalReferenciado' => $this->getListaNfeCupomFiscalReferenciado(),
			'listaNfeDetalhe' => $this->getListaNfeDetalhe(),
			'listaNfeNfReferenciada' => $this->getListaNfeNfReferenciada(),
			'listaNfeProcessoReferenciado' => $this->getListaNfeProcessoReferenciado(),
			'listaNfeProdRuralReferenciada' => $this->getListaNfeProdRuralReferenciada(),
			'listaNfeReferenciada' => $this->getListaNfeReferenciada(),
        ];
    }
}
