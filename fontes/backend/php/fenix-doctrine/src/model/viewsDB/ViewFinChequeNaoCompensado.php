<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_CHEQUE_NAO_COMPENSADO] 
                                                                                
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
 * @ORM\Table(name="VIEW_FIN_CHEQUE_NAO_COMPENSADO")
 */
class ViewFinChequeNaoCompensado extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="string", name="TALAO")
	 */
	private $talao;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_TALAO")
	 */
	private $numeroTalao;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_CHEQUE")
	 */
	private $numeroCheque;

	/**
	 * @ORM\Column(type="string", name="STATUS_CHEQUE")
	 */
	private $statusCheque;

	/**
	 * @ORM\Column(type="date", name="DATA_STATUS")
	 */
	private $dataStatus;

	/**
	 * @ORM\Column(type="float", name="VALOR")
	 */
	private $valor;


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

    public function getTalao() 
	{
		return $this->talao;
	}

	public function setTalao($talao) 
	{
		$this->talao = $talao;
	}

    public function getNumeroTalao() 
	{
		return $this->numeroTalao;
	}

	public function setNumeroTalao($numeroTalao) 
	{
		$this->numeroTalao = $numeroTalao;
	}

    public function getNumeroCheque() 
	{
		return $this->numeroCheque;
	}

	public function setNumeroCheque($numeroCheque) 
	{
		$this->numeroCheque = $numeroCheque;
	}

    public function getStatusCheque() 
	{
		return $this->statusCheque;
	}

	public function setStatusCheque($statusCheque) 
	{
		$this->statusCheque = $statusCheque;
	}

    public function getDataStatus() 
	{
		if ($this->dataStatus != null) {
			return $this->dataStatus->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataStatus($dataStatus) 
	{
		$this->dataStatus = $dataStatus != null ? new \DateTime($dataStatus) : null;
	}

    public function getValor() 
	{
		return $this->valor;
	}

	public function setValor($valor) 
	{
		$this->valor = $valor;
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
			$this->setTalao($objeto->talao);
			$this->setNumeroTalao($objeto->numeroTalao);
			$this->setNumeroCheque($objeto->numeroCheque);
			$this->setStatusCheque($objeto->statusCheque);
			$this->setDataStatus($objeto->dataStatus);
			$this->setValor($objeto->valor);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'ViewFinChequeNaoCompensado');
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
			'talao' => $this->getTalao(),
			'numeroTalao' => $this->getNumeroTalao(),
			'numeroCheque' => $this->getNumeroCheque(),
			'statusCheque' => $this->getStatusCheque(),
			'dataStatus' => $this->getDataStatus(),
			'valor' => $this->getValor(),
        ];
    }
}
