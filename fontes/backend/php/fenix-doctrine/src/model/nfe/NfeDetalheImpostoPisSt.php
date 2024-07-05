<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_PIS_ST] 
                                                                                
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
 * @ORM\Table(name="NFE_DETALHE_IMPOSTO_PIS_ST")
 */
class NfeDetalheImpostoPisSt extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="float", name="VALOR_BASE_CALCULO_PIS_ST")
	 */
	private $valorBaseCalculoPisSt;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_PIS_ST_PERCENTUAL")
	 */
	private $aliquotaPisStPercentual;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_VENDIDA_PIS_ST")
	 */
	private $quantidadeVendidaPisSt;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_PIS_ST_REAIS")
	 */
	private $aliquotaPisStReais;

	/**
	 * @ORM\Column(type="float", name="VALOR_PIS_ST")
	 */
	private $valorPisSt;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeDetalhe", inversedBy="nfeDetalheImpostoPisSt")
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

    public function getValorBaseCalculoPisSt() 
	{
		return $this->valorBaseCalculoPisSt;
	}

	public function setValorBaseCalculoPisSt($valorBaseCalculoPisSt) 
	{
		$this->valorBaseCalculoPisSt = $valorBaseCalculoPisSt;
	}

    public function getAliquotaPisStPercentual() 
	{
		return $this->aliquotaPisStPercentual;
	}

	public function setAliquotaPisStPercentual($aliquotaPisStPercentual) 
	{
		$this->aliquotaPisStPercentual = $aliquotaPisStPercentual;
	}

    public function getQuantidadeVendidaPisSt() 
	{
		return $this->quantidadeVendidaPisSt;
	}

	public function setQuantidadeVendidaPisSt($quantidadeVendidaPisSt) 
	{
		$this->quantidadeVendidaPisSt = $quantidadeVendidaPisSt;
	}

    public function getAliquotaPisStReais() 
	{
		return $this->aliquotaPisStReais;
	}

	public function setAliquotaPisStReais($aliquotaPisStReais) 
	{
		$this->aliquotaPisStReais = $aliquotaPisStReais;
	}

    public function getValorPisSt() 
	{
		return $this->valorPisSt;
	}

	public function setValorPisSt($valorPisSt) 
	{
		$this->valorPisSt = $valorPisSt;
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
			$this->setValorBaseCalculoPisSt($objeto->valorBaseCalculoPisSt);
			$this->setAliquotaPisStPercentual($objeto->aliquotaPisStPercentual);
			$this->setQuantidadeVendidaPisSt($objeto->quantidadeVendidaPisSt);
			$this->setAliquotaPisStReais($objeto->aliquotaPisStReais);
			$this->setValorPisSt($objeto->valorPisSt);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetalheImpostoPisSt');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'valorBaseCalculoPisSt' => $this->getValorBaseCalculoPisSt(),
			'aliquotaPisStPercentual' => $this->getAliquotaPisStPercentual(),
			'quantidadeVendidaPisSt' => $this->getQuantidadeVendidaPisSt(),
			'aliquotaPisStReais' => $this->getAliquotaPisStReais(),
			'valorPisSt' => $this->getValorPisSt(),
        ];
    }
}
