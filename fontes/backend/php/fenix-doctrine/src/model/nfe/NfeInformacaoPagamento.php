<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_INFORMACAO_PAGAMENTO] 
                                                                                
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
 * @ORM\Table(name="NFE_INFORMACAO_PAGAMENTO")
 */
class NfeInformacaoPagamento extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="INDICADOR_PAGAMENTO")
	 */
	private $indicadorPagamento;

	/**
	 * @ORM\Column(type="string", name="MEIO_PAGAMENTO")
	 */
	private $meioPagamento;

	/**
	 * @ORM\Column(type="float", name="VALOR")
	 */
	private $valor;

	/**
	 * @ORM\Column(type="string", name="TIPO_INTEGRACAO")
	 */
	private $tipoIntegracao;

	/**
	 * @ORM\Column(type="string", name="CNPJ_OPERADORA_CARTAO")
	 */
	private $cnpjOperadoraCartao;

	/**
	 * @ORM\Column(type="string", name="BANDEIRA")
	 */
	private $bandeira;

	/**
	 * @ORM\Column(type="string", name="NUMERO_AUTORIZACAO")
	 */
	private $numeroAutorizacao;

	/**
	 * @ORM\Column(type="float", name="TROCO")
	 */
	private $troco;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeCabecalho", inversedBy="nfeInformacaoPagamento")
     * @ORM\JoinColumn(name="ID_NFE_CABECALHO", referencedColumnName="id")
     */
    private $nfeCabecalho;


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

    public function getIndicadorPagamento() 
	{
		return $this->indicadorPagamento;
	}

	public function setIndicadorPagamento($indicadorPagamento) 
	{
		$this->indicadorPagamento = $indicadorPagamento;
	}

    public function getMeioPagamento() 
	{
		return $this->meioPagamento;
	}

	public function setMeioPagamento($meioPagamento) 
	{
		$this->meioPagamento = $meioPagamento;
	}

    public function getValor() 
	{
		return $this->valor;
	}

	public function setValor($valor) 
	{
		$this->valor = $valor;
	}

    public function getTipoIntegracao() 
	{
		return $this->tipoIntegracao;
	}

	public function setTipoIntegracao($tipoIntegracao) 
	{
		$this->tipoIntegracao = $tipoIntegracao;
	}

    public function getCnpjOperadoraCartao() 
	{
		return $this->cnpjOperadoraCartao;
	}

	public function setCnpjOperadoraCartao($cnpjOperadoraCartao) 
	{
		$this->cnpjOperadoraCartao = $cnpjOperadoraCartao;
	}

    public function getBandeira() 
	{
		return $this->bandeira;
	}

	public function setBandeira($bandeira) 
	{
		$this->bandeira = $bandeira;
	}

    public function getNumeroAutorizacao() 
	{
		return $this->numeroAutorizacao;
	}

	public function setNumeroAutorizacao($numeroAutorizacao) 
	{
		$this->numeroAutorizacao = $numeroAutorizacao;
	}

    public function getTroco() 
	{
		return $this->troco;
	}

	public function setTroco($troco) 
	{
		$this->troco = $troco;
	}

    public function getNfeCabecalho(): ?NfeCabecalho 
	{
		return $this->nfeCabecalho;
	}

	public function setNfeCabecalho(?NfeCabecalho $nfeCabecalho) 
	{
		$this->nfeCabecalho = $nfeCabecalho;
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
			$this->setIndicadorPagamento($objeto->indicadorPagamento);
			$this->setMeioPagamento($objeto->meioPagamento);
			$this->setValor($objeto->valor);
			$this->setTipoIntegracao($objeto->tipoIntegracao);
			$this->setCnpjOperadoraCartao($objeto->cnpjOperadoraCartao);
			$this->setBandeira($objeto->bandeira);
			$this->setNumeroAutorizacao($objeto->numeroAutorizacao);
			$this->setTroco($objeto->troco);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeInformacaoPagamento');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'indicadorPagamento' => $this->getIndicadorPagamento(),
			'meioPagamento' => $this->getMeioPagamento(),
			'valor' => $this->getValor(),
			'tipoIntegracao' => $this->getTipoIntegracao(),
			'cnpjOperadoraCartao' => $this->getCnpjOperadoraCartao(),
			'bandeira' => $this->getBandeira(),
			'numeroAutorizacao' => $this->getNumeroAutorizacao(),
			'troco' => $this->getTroco(),
        ];
    }
}
