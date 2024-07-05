<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CANA_FORNECIMENTO_DIARIO] 
                                                                                
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
 * @ORM\Table(name="NFE_CANA_FORNECIMENTO_DIARIO")
 */
class NfeCanaFornecimentoDiario extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="DIA")
	 */
	private $dia;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE")
	 */
	private $quantidade;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_TOTAL_MES")
	 */
	private $quantidadeTotalMes;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_TOTAL_ANTERIOR")
	 */
	private $quantidadeTotalAnterior;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_TOTAL_GERAL")
	 */
	private $quantidadeTotalGeral;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="NfeCana", inversedBy="listaNfeCanaFornecimentoDiario")
     * @ORM\JoinColumn(name="ID_NFE_CANA", referencedColumnName="id")
     */
    private $nfeCana;


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

    public function getDia() 
	{
		return $this->dia;
	}

	public function setDia($dia) 
	{
		$this->dia = $dia;
	}

    public function getQuantidade() 
	{
		return $this->quantidade;
	}

	public function setQuantidade($quantidade) 
	{
		$this->quantidade = $quantidade;
	}

    public function getQuantidadeTotalMes() 
	{
		return $this->quantidadeTotalMes;
	}

	public function setQuantidadeTotalMes($quantidadeTotalMes) 
	{
		$this->quantidadeTotalMes = $quantidadeTotalMes;
	}

    public function getQuantidadeTotalAnterior() 
	{
		return $this->quantidadeTotalAnterior;
	}

	public function setQuantidadeTotalAnterior($quantidadeTotalAnterior) 
	{
		$this->quantidadeTotalAnterior = $quantidadeTotalAnterior;
	}

    public function getQuantidadeTotalGeral() 
	{
		return $this->quantidadeTotalGeral;
	}

	public function setQuantidadeTotalGeral($quantidadeTotalGeral) 
	{
		$this->quantidadeTotalGeral = $quantidadeTotalGeral;
	}

    public function getNfeCana(): ?NfeCana 
	{
		return $this->nfeCana;
	}

	public function setNfeCana(?NfeCana $nfeCana) 
	{
		$this->nfeCana = $nfeCana;
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
			$this->setDia($objeto->dia);
			$this->setQuantidade($objeto->quantidade);
			$this->setQuantidadeTotalMes($objeto->quantidadeTotalMes);
			$this->setQuantidadeTotalAnterior($objeto->quantidadeTotalAnterior);
			$this->setQuantidadeTotalGeral($objeto->quantidadeTotalGeral);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeCanaFornecimentoDiario');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'dia' => $this->getDia(),
			'quantidade' => $this->getQuantidade(),
			'quantidadeTotalMes' => $this->getQuantidadeTotalMes(),
			'quantidadeTotalAnterior' => $this->getQuantidadeTotalAnterior(),
			'quantidadeTotalGeral' => $this->getQuantidadeTotalGeral(),
        ];
    }
}
