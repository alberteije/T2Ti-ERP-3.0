<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_LANCAMENTO_PAGAR] 
                                                                                
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
 * @ORM\Table(name="VIEW_FIN_LANCAMENTO_PAGAR")
 */
class ViewFinLancamentoPagar extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="integer", name="QUANTIDADE_PARCELA")
	 */
	private $quantidadeParcela;

	/**
	 * @ORM\Column(type="float", name="VALOR_LANCAMENTO")
	 */
	private $valorLancamento;

	/**
	 * @ORM\Column(type="date", name="DATA_LANCAMENTO")
	 */
	private $dataLancamento;

	/**
	 * @ORM\Column(type="string", name="NUMERO_DOCUMENTO")
	 */
	private $numeroDocumento;

	/**
	 * @ORM\Column(type="integer", name="ID_FIN_PARCELA_PAGAR")
	 */
	private $idFinParcelaPagar;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_PARCELA")
	 */
	private $numeroParcela;

	/**
	 * @ORM\Column(type="date", name="DATA_VENCIMENTO")
	 */
	private $dataVencimento;

	/**
	 * @ORM\Column(type="date", name="DATA_PAGAMENTO")
	 */
	private $dataPagamento;
	
	/**
	 * @ORM\Column(type="float", name="VALOR_PARCELA")
	 */
	private $valorParcela;

	/**
	 * @ORM\Column(type="float", name="TAXA_JURO")
	 */
	private $taxaJuro;

	/**
	 * @ORM\Column(type="float", name="VALOR_JURO")
	 */
	private $valorJuro;

	/**
	 * @ORM\Column(type="float", name="TAXA_MULTA")
	 */
	private $taxaMulta;

	/**
	 * @ORM\Column(type="float", name="VALOR_MULTA")
	 */
	private $valorMulta;

	/**
	 * @ORM\Column(type="float", name="TAXA_DESCONTO")
	 */
	private $taxaDesconto;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESCONTO")
	 */
	private $valorDesconto;

	/**
	 * @ORM\Column(type="string", name="SIGLA_DOCUMENTO")
	 */
	private $siglaDocumento;

	/**
	 * @ORM\Column(type="string", name="NOME_FORNECEDOR")
	 */
	private $nomeFornecedor;

	/**
	 * @ORM\Column(type="integer", name="ID_FIN_STATUS_PARCELA")
	 */
	private $idFinStatusParcela;

	/**
	 * @ORM\Column(type="string", name="SITUACAO_PARCELA")
	 */
	private $situacaoParcela;

	/**
	 * @ORM\Column(type="string", name="DESCRICAO_SITUACAO_PARCELA")
	 */
	private $descricaoSituacaoParcela;

	/**
	 * @ORM\Column(type="integer", name="ID_BANCO_CONTA_CAIXA")
	 */
	private $idBancoContaCaixa;

	/**
	 * @ORM\Column(type="string", name="NOME_CONTA_CAIXA")
	 */
	private $nomeContaCaixa;


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

    public function getIdFinLancamentoPagar() 
	{
		return $this->idFinLancamentoPagar;
	}

	public function setIdFinLancamentoPagar($idFinLancamentoPagar) 
	{
		$this->idFinLancamentoPagar = $idFinLancamentoPagar;
	}

    public function getQuantidadeParcela() 
	{
		return $this->quantidadeParcela;
	}

	public function setQuantidadeParcela($quantidadeParcela) 
	{
		$this->quantidadeParcela = $quantidadeParcela;
	}

    public function getValorLancamento() 
	{
		return $this->valorLancamento;
	}

	public function setValorLancamento($valorLancamento) 
	{
		$this->valorLancamento = $valorLancamento;
	}

    public function getDataLancamento() 
	{
		if ($this->dataLancamento != null) {
			return $this->dataLancamento->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataLancamento($dataLancamento) 
	{
		$this->dataLancamento = $dataLancamento != null ? new \DateTime($dataLancamento) : null;
	}

    public function getNumeroDocumento() 
	{
		return $this->numeroDocumento;
	}

	public function setNumeroDocumento($numeroDocumento) 
	{
		$this->numeroDocumento = $numeroDocumento;
	}

    public function getIdFinParcelaPagar() 
	{
		return $this->idFinParcelaPagar;
	}

	public function setIdFinParcelaPagar($idFinParcelaPagar) 
	{
		$this->idFinParcelaPagar = $idFinParcelaPagar;
	}

    public function getNumeroParcela() 
	{
		return $this->numeroParcela;
	}

	public function setNumeroParcela($numeroParcela) 
	{
		$this->numeroParcela = $numeroParcela;
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
	
    public function getValorParcela() 
	{
		return $this->valorParcela;
	}

	public function setValorParcela($valorParcela) 
	{
		$this->valorParcela = $valorParcela;
	}

    public function getTaxaJuro() 
	{
		return $this->taxaJuro;
	}

	public function setTaxaJuro($taxaJuro) 
	{
		$this->taxaJuro = $taxaJuro;
	}

    public function getValorJuro() 
	{
		return $this->valorJuro;
	}

	public function setValorJuro($valorJuro) 
	{
		$this->valorJuro = $valorJuro;
	}

    public function getTaxaMulta() 
	{
		return $this->taxaMulta;
	}

	public function setTaxaMulta($taxaMulta) 
	{
		$this->taxaMulta = $taxaMulta;
	}

    public function getValorMulta() 
	{
		return $this->valorMulta;
	}

	public function setValorMulta($valorMulta) 
	{
		$this->valorMulta = $valorMulta;
	}

    public function getTaxaDesconto() 
	{
		return $this->taxaDesconto;
	}

	public function setTaxaDesconto($taxaDesconto) 
	{
		$this->taxaDesconto = $taxaDesconto;
	}

    public function getValorDesconto() 
	{
		return $this->valorDesconto;
	}

	public function setValorDesconto($valorDesconto) 
	{
		$this->valorDesconto = $valorDesconto;
	}

    public function getSiglaDocumento() 
	{
		return $this->siglaDocumento;
	}

	public function setSiglaDocumento($siglaDocumento) 
	{
		$this->siglaDocumento = $siglaDocumento;
	}

    public function getNomeFornecedor() 
	{
		return $this->nomeFornecedor;
	}

	public function setNomeFornecedor($nomeFornecedor) 
	{
		$this->nomeFornecedor = $nomeFornecedor;
	}

    public function getIdFinStatusParcela() 
	{
		return $this->idFinStatusParcela;
	}

	public function setIdFinStatusParcela($idFinStatusParcela) 
	{
		$this->idFinStatusParcela = $idFinStatusParcela;
	}

    public function getSituacaoParcela() 
	{
		return $this->situacaoParcela;
	}

	public function setSituacaoParcela($situacaoParcela) 
	{
		$this->situacaoParcela = $situacaoParcela;
	}

    public function getDescricaoSituacaoParcela() 
	{
		return $this->descricaoSituacaoParcela;
	}

	public function setDescricaoSituacaoParcela($descricaoSituacaoParcela) 
	{
		$this->descricaoSituacaoParcela = $descricaoSituacaoParcela;
	}

    public function getIdBancoContaCaixa() 
	{
		return $this->idBancoContaCaixa;
	}

	public function setIdBancoContaCaixa($idBancoContaCaixa) 
	{
		$this->idBancoContaCaixa = $idBancoContaCaixa;
	}

    public function getNomeContaCaixa() 
	{
		return $this->nomeContaCaixa;
	}

	public function setNomeContaCaixa($nomeContaCaixa) 
	{
		$this->nomeContaCaixa = $nomeContaCaixa;
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
			$this->setIdFinLancamentoPagar($objeto->idFinLancamentoPagar);
			$this->setQuantidadeParcela($objeto->quantidadeParcela);
			$this->setValorLancamento($objeto->valorLancamento);
			$this->setDataLancamento($objeto->dataLancamento);
			$this->setNumeroDocumento($objeto->numeroDocumento);
			$this->setIdFinParcelaPagar($objeto->idFinParcelaPagar);
			$this->setNumeroParcela($objeto->numeroParcela);
			$this->setDataVencimento($objeto->dataVencimento);
			$this->setDataPagamento($objeto->dataPagamento);
			$this->setValorParcela($objeto->valorParcela);
			$this->setTaxaJuro($objeto->taxaJuro);
			$this->setValorJuro($objeto->valorJuro);
			$this->setTaxaMulta($objeto->taxaMulta);
			$this->setValorMulta($objeto->valorMulta);
			$this->setTaxaDesconto($objeto->taxaDesconto);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setSiglaDocumento($objeto->siglaDocumento);
			$this->setNomeFornecedor($objeto->nomeFornecedor);
			$this->setIdFinStatusParcela($objeto->idFinStatusParcela);
			$this->setSituacaoParcela($objeto->situacaoParcela);
			$this->setDescricaoSituacaoParcela($objeto->descricaoSituacaoParcela);
			$this->setIdBancoContaCaixa($objeto->idBancoContaCaixa);
			$this->setNomeContaCaixa($objeto->nomeContaCaixa);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'ViewFinLancamentoPagar');
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
			'quantidadeParcela' => $this->getQuantidadeParcela(),
			'valorLancamento' => $this->getValorLancamento(),
			'dataLancamento' => $this->getDataLancamento(),
			'numeroDocumento' => $this->getNumeroDocumento(),
			'idFinParcelaPagar' => $this->getIdFinParcelaPagar(),
			'numeroParcela' => $this->getNumeroParcela(),
			'dataVencimento' => $this->getDataVencimento(),
			'dataPagamento' => $this->getDataPagamento(),
			'valorParcela' => $this->getValorParcela(),
			'taxaJuro' => $this->getTaxaJuro(),
			'valorJuro' => $this->getValorJuro(),
			'taxaMulta' => $this->getTaxaMulta(),
			'valorMulta' => $this->getValorMulta(),
			'taxaDesconto' => $this->getTaxaDesconto(),
			'valorDesconto' => $this->getValorDesconto(),
			'siglaDocumento' => $this->getSiglaDocumento(),
			'nomeFornecedor' => $this->getNomeFornecedor(),
			'idFinStatusParcela' => $this->getIdFinStatusParcela(),
			'situacaoParcela' => $this->getSituacaoParcela(),
			'descricaoSituacaoParcela' => $this->getDescricaoSituacaoParcela(),
			'idBancoContaCaixa' => $this->getIdBancoContaCaixa(),
			'nomeContaCaixa' => $this->getNomeContaCaixa(),
        ];
    }
}
