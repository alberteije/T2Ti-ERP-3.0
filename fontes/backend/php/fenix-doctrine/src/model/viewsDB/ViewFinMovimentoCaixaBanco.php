<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_MOVIMENTO_CAIXA_BANCO] 
                                                                                
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
 * @ORM\Table(name="VIEW_FIN_MOVIMENTO_CAIXA_BANCO")
 */
class ViewFinMovimentoCaixaBanco extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="ID_CONTA_CAIXA")
	 */
	private $idContaCaixa;

	/**
	 * @ORM\Column(type="string", name="NOME_CONTA_CAIXA")
	 */
	private $nomeContaCaixa;

	/**
	 * @ORM\Column(type="string", name="NOME_PESSOA")
	 */
	private $nomePessoa;

	/**
	 * @ORM\Column(type="date", name="DATA_LANCAMENTO")
	 */
	private $dataLancamento;

	/**
	 * @ORM\Column(type="date", name="DATA_PAGO_RECEBIDO")
	 */
	private $dataPagoRecebido;

	/**
	 * @ORM\Column(type="string", name="MES_ANO")
	 */
	private $mesAno;

	/**
	 * @ORM\Column(type="string", name="HISTORICO")
	 */
	private $historico;

	/**
	 * @ORM\Column(type="float", name="VALOR")
	 */
	private $valor;

	/**
	 * @ORM\Column(type="string", name="DESCRICAO_DOCUMENTO_ORIGEM")
	 */
	private $descricaoDocumentoOrigem;

	/**
	 * @ORM\Column(type="string", name="OPERACAO")
	 */
	private $operacao;


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

    public function getIdContaCaixa() 
	{
		return $this->idContaCaixa;
	}

	public function setIdContaCaixa($idContaCaixa) 
	{
		$this->idContaCaixa = $idContaCaixa;
	}

    public function getNomeContaCaixa() 
	{
		return $this->nomeContaCaixa;
	}

	public function setNomeContaCaixa($nomeContaCaixa) 
	{
		$this->nomeContaCaixa = $nomeContaCaixa;
	}

    public function getNomePessoa() 
	{
		return $this->nomePessoa;
	}

	public function setNomePessoa($nomePessoa) 
	{
		$this->nomePessoa = $nomePessoa;
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

    public function getDataPagoRecebido() 
	{
		if ($this->dataPagoRecebido != null) {
			return $this->dataPagoRecebido->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataPagoRecebido($dataPagoRecebido) 
	{
		$this->dataPagoRecebido = $dataPagoRecebido != null ? new \DateTime($dataPagoRecebido) : null;
	}

    public function getMesAno() 
	{
		return $this->mesAno;
	}

	public function setMesAno($mesAno) 
	{
		$this->mesAno = $mesAno;
	}

    public function getHistorico() 
	{
		return $this->historico;
	}

	public function setHistorico($historico) 
	{
		$this->historico = $historico;
	}

    public function getValor() 
	{
		return $this->valor;
	}

	public function setValor($valor) 
	{
		$this->valor = $valor;
	}

    public function getDescricaoDocumentoOrigem() 
	{
		return $this->descricaoDocumentoOrigem;
	}

	public function setDescricaoDocumentoOrigem($descricaoDocumentoOrigem) 
	{
		$this->descricaoDocumentoOrigem = $descricaoDocumentoOrigem;
	}

    public function getOperacao() 
	{
		return $this->operacao;
	}

	public function setOperacao($operacao) 
	{
		$this->operacao = $operacao;
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
			$this->setIdContaCaixa($objeto->idContaCaixa);
			$this->setNomeContaCaixa($objeto->nomeContaCaixa);
			$this->setNomePessoa($objeto->nomePessoa);
			$this->setDataLancamento($objeto->dataLancamento);
			$this->setDataPagoRecebido($objeto->dataPagoRecebido);
			$this->setMesAno($objeto->mesAno);
			$this->setHistorico($objeto->historico);
			$this->setValor($objeto->valor);
			$this->setDescricaoDocumentoOrigem($objeto->descricaoDocumentoOrigem);
			$this->setOperacao($objeto->operacao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'ViewFinMovimentoCaixaBanco');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'idContaCaixa' => $this->getIdContaCaixa(),
			'nomeContaCaixa' => $this->getNomeContaCaixa(),
			'nomePessoa' => $this->getNomePessoa(),
			'dataLancamento' => $this->getDataLancamento(),
			'dataPagoRecebido' => $this->getDataPagoRecebido(),
			'mesAno' => $this->getMesAno(),
			'historico' => $this->getHistorico(),
			'valor' => $this->getValor(),
			'descricaoDocumentoOrigem' => $this->getDescricaoDocumentoOrigem(),
			'operacao' => $this->getOperacao(),
        ];
    }
}
