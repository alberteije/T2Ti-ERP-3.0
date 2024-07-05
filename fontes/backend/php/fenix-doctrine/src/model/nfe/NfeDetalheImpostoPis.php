<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_PIS] 
                                                                                
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
 * @ORM\Table(name="NFE_DETALHE_IMPOSTO_PIS")
 */
class NfeDetalheImpostoPis extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="CST_PIS")
	 */
	private $cstPis;

	/**
	 * @ORM\Column(type="float", name="VALOR_BASE_CALCULO_PIS")
	 */
	private $valorBaseCalculoPis;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_PIS_PERCENTUAL")
	 */
	private $aliquotaPisPercentual;

	/**
	 * @ORM\Column(type="float", name="VALOR_PIS")
	 */
	private $valorPis;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_VENDIDA")
	 */
	private $quantidadeVendida;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_PIS_REAIS")
	 */
	private $aliquotaPisReais;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeDetalhe", inversedBy="nfeDetalheImpostoPis")
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

    public function getCstPis() 
	{
		return $this->cstPis;
	}

	public function setCstPis($cstPis) 
	{
		$this->cstPis = $cstPis;
	}

    public function getValorBaseCalculoPis() 
	{
		return $this->valorBaseCalculoPis;
	}

	public function setValorBaseCalculoPis($valorBaseCalculoPis) 
	{
		$this->valorBaseCalculoPis = $valorBaseCalculoPis;
	}

    public function getAliquotaPisPercentual() 
	{
		return $this->aliquotaPisPercentual;
	}

	public function setAliquotaPisPercentual($aliquotaPisPercentual) 
	{
		$this->aliquotaPisPercentual = $aliquotaPisPercentual;
	}

    public function getValorPis() 
	{
		return $this->valorPis;
	}

	public function setValorPis($valorPis) 
	{
		$this->valorPis = $valorPis;
	}

    public function getQuantidadeVendida() 
	{
		return $this->quantidadeVendida;
	}

	public function setQuantidadeVendida($quantidadeVendida) 
	{
		$this->quantidadeVendida = $quantidadeVendida;
	}

    public function getAliquotaPisReais() 
	{
		return $this->aliquotaPisReais;
	}

	public function setAliquotaPisReais($aliquotaPisReais) 
	{
		$this->aliquotaPisReais = $aliquotaPisReais;
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
			$this->setCstPis($objeto->cstPis);
			$this->setValorBaseCalculoPis($objeto->valorBaseCalculoPis);
			$this->setAliquotaPisPercentual($objeto->aliquotaPisPercentual);
			$this->setValorPis($objeto->valorPis);
			$this->setQuantidadeVendida($objeto->quantidadeVendida);
			$this->setAliquotaPisReais($objeto->aliquotaPisReais);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetalheImpostoPis');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'cstPis' => $this->getCstPis(),
			'valorBaseCalculoPis' => $this->getValorBaseCalculoPis(),
			'aliquotaPisPercentual' => $this->getAliquotaPisPercentual(),
			'valorPis' => $this->getValorPis(),
			'quantidadeVendida' => $this->getQuantidadeVendida(),
			'aliquotaPisReais' => $this->getAliquotaPisReais(),
        ];
    }
}
