<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [FIN_PARCELA_PAGAR] 
                                                                                
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
 * @ORM\Table(name="FIN_PARCELA_PAGAR")
 */
class FinParcelaPagar extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="ID_FIN_LANCAMENTO_PAGAR")
	 */
	private $idFinLancamentoPagar;
	
	/**
	 * @ORM\Column(type="integer", name="NUMERO_PARCELA")
	 */
	private $numeroParcela;

	/**
	 * @ORM\Column(type="date", name="DATA_EMISSAO")
	 */
	private $dataEmissao;

	/**
	 * @ORM\Column(type="date", name="DATA_VENCIMENTO")
	 */
	private $dataVencimento;

	/**
	 * @ORM\Column(type="date", name="DATA_PAGAMENTO")
	 */
	private $dataPagamento;
	
	/**
	 * @ORM\Column(type="date", name="DESCONTO_ATE")
	 */
	private $descontoAte;

	/**
	 * @ORM\Column(type="float", name="VALOR")
	 */
	private $valor;

	/**
	 * @ORM\Column(type="float", name="TAXA_JURO")
	 */
	private $taxaJuro;

	/**
	 * @ORM\Column(type="float", name="TAXA_MULTA")
	 */
	private $taxaMulta;

	/**
	 * @ORM\Column(type="float", name="TAXA_DESCONTO")
	 */
	private $taxaDesconto;

	/**
	 * @ORM\Column(type="float", name="VALOR_JURO")
	 */
	private $valorJuro;

	/**
	 * @ORM\Column(type="float", name="VALOR_MULTA")
	 */
	private $valorMulta;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESCONTO")
	 */
	private $valorDesconto;

	/**
	 * @ORM\Column(type="float", name="VALOR_PAGO")
	 */
	private $valorPago;

	/**
	 * @ORM\Column(type="string", name="HISTORICO")
	 */
	private $historico;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="FinStatusParcela", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_FIN_STATUS_PARCELA", referencedColumnName="id")
     */
    private $finStatusParcela;

    /**
     * @ORM\OneToOne(targetEntity="FinTipoPagamento", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_FIN_TIPO_PAGAMENTO", referencedColumnName="id")
     */
    private $finTipoPagamento;

    /**
     * @ORM\OneToOne(targetEntity="FinChequeEmitido", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_FIN_CHEQUE_EMITIDO", referencedColumnName="id")
     */
    private $finChequeEmitido;

    /**
     * @ORM\ManyToOne(targetEntity="FinLancamentoPagar", inversedBy="listaFinParcelaPagar")
     * @ORM\JoinColumn(name="ID_FIN_LANCAMENTO_PAGAR", referencedColumnName="id")
     */
    private $finLancamentoPagar;


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

    public function getIdFinLancamentoPagar() 
	{
		return $this->idFinLancamentoPagar;
	}

	public function setIdFinLancamentoPagar($idFinLancamentoPagar) 
	{
		$this->idFinLancamentoPagar = $idFinLancamentoPagar;
	}
	
    public function getNumeroParcela() 
	{
		return $this->numeroParcela;
	}

	public function setNumeroParcela($numeroParcela) 
	{
		$this->numeroParcela = $numeroParcela;
	}

    public function getDataEmissao() 
	{
		if ($this->dataEmissao != null) {
			return $this->dataEmissao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataEmissao($dataEmissao) 
	{
		$this->dataEmissao = $dataEmissao != null ? new \DateTime($dataEmissao) : null;
	}

    public function getDataVencimento() 
	{
		if ($this->dataVencimento != null) {
			return $this->dataVencimento->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataVencimento($dataVencimento) 
	{
		$this->dataVencimento = $dataVencimento != null ? new \DateTime($dataVencimento) : null;
	}

    public function getDataPagamento() 
	{
		if ($this->dataPagamento != null) {
			return $this->dataPagamento->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataPagamento($dataPagamento) 
	{
		$this->dataPagamento = $dataPagamento != null ? new \DateTime($dataPagamento) : null;
	}
	
    public function getDescontoAte() 
	{
		if ($this->descontoAte != null) {
			return $this->descontoAte->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDescontoAte($descontoAte) 
	{
		$this->descontoAte = $descontoAte != null ? new \DateTime($descontoAte) : null;
	}

    public function getValor() 
	{
		return $this->valor;
	}

	public function setValor($valor) 
	{
		$this->valor = $valor;
	}

    public function getTaxaJuro() 
	{
		return $this->taxaJuro;
	}

	public function setTaxaJuro($taxaJuro) 
	{
		$this->taxaJuro = $taxaJuro;
	}

    public function getTaxaMulta() 
	{
		return $this->taxaMulta;
	}

	public function setTaxaMulta($taxaMulta) 
	{
		$this->taxaMulta = $taxaMulta;
	}

    public function getTaxaDesconto() 
	{
		return $this->taxaDesconto;
	}

	public function setTaxaDesconto($taxaDesconto) 
	{
		$this->taxaDesconto = $taxaDesconto;
	}

    public function getValorJuro() 
	{
		return $this->valorJuro;
	}

	public function setValorJuro($valorJuro) 
	{
		$this->valorJuro = $valorJuro;
	}

    public function getValorMulta() 
	{
		return $this->valorMulta;
	}

	public function setValorMulta($valorMulta) 
	{
		$this->valorMulta = $valorMulta;
	}

    public function getValorDesconto() 
	{
		return $this->valorDesconto;
	}

	public function setValorDesconto($valorDesconto) 
	{
		$this->valorDesconto = $valorDesconto;
	}

    public function getValorPago() 
	{
		return $this->valorPago;
	}

	public function setValorPago($valorPago) 
	{
		$this->valorPago = $valorPago;
	}

    public function getHistorico() 
	{
		return $this->historico;
	}

	public function setHistorico($historico) 
	{
		$this->historico = $historico;
	}

    public function getFinLancamentoPagar(): ?FinLancamentoPagar 
	{
		return $this->finLancamentoPagar;
	}

	public function setFinLancamentoPagar(?FinLancamentoPagar $finLancamentoPagar) 
	{
		$this->finLancamentoPagar = $finLancamentoPagar;
	}

    public function getFinStatusParcela(): ?FinStatusParcela 
	{
		return $this->finStatusParcela;
	}

	public function setFinStatusParcela(?FinStatusParcela $finStatusParcela) 
	{
		$this->finStatusParcela = $finStatusParcela;
	}

    public function getFinTipoPagamento(): ?FinTipoPagamento 
	{
		return $this->finTipoPagamento;
	}

	public function setFinTipoPagamento(?FinTipoPagamento $finTipoPagamento) 
	{
		$this->finTipoPagamento = $finTipoPagamento;
	}

    public function getFinChequeEmitido(): ?FinChequeEmitido 
	{
		return $this->finChequeEmitido;
	}

	public function setFinChequeEmitido(?FinChequeEmitido $finChequeEmitido) 
	{
		$this->finChequeEmitido = $finChequeEmitido;
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
			$this->setNumeroParcela($objeto->numeroParcela);
			$this->setDataEmissao($objeto->dataEmissao);
			$this->setDataVencimento($objeto->dataVencimento);
			$this->setDescontoAte($objeto->descontoAte);
			$this->setDataPagamento($objeto->dataPagamento);
			$this->setValor($objeto->valor);
			$this->setTaxaJuro($objeto->taxaJuro);
			$this->setTaxaMulta($objeto->taxaMulta);
			$this->setTaxaDesconto($objeto->taxaDesconto);
			$this->setValorJuro($objeto->valorJuro);
			$this->setValorMulta($objeto->valorMulta);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setValorPago($objeto->valorPago);
			$this->setHistorico($objeto->historico);
			$this->setIdFinLancamentoPagar($objeto->idFinLancamentoPagar);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'FinParcelaPagar');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'idFinLancamentoPagar' => $this->getIdFinLancamentoPagar(),
			'numeroParcela' => $this->getNumeroParcela(),
			'dataEmissao' => $this->getDataEmissao(),
			'dataVencimento' => $this->getDataVencimento(),
			'dataPagamento' => $this->getDataPagamento(),
			'descontoAte' => $this->getDescontoAte(),
			'valor' => $this->getValor(),
			'taxaJuro' => $this->getTaxaJuro(),
			'taxaMulta' => $this->getTaxaMulta(),
			'taxaDesconto' => $this->getTaxaDesconto(),
			'valorJuro' => $this->getValorJuro(),
			'valorMulta' => $this->getValorMulta(),
			'valorDesconto' => $this->getValorDesconto(),
			'valorPago' => $this->getValorPago(),
			'historico' => $this->getHistorico(),
			'finStatusParcela' => $this->getFinStatusParcela(),
			'finTipoPagamento' => $this->getFinTipoPagamento(),
			'finChequeEmitido' => $this->getFinChequeEmitido(),
        ];
    }
}
