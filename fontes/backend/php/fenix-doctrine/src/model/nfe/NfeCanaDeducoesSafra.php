<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CANA_DEDUCOES_SAFRA] 
                                                                                
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
 * @ORM\Table(name="NFE_CANA_DEDUCOES_SAFRA")
 */
class NfeCanaDeducoesSafra extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="DECRICAO")
	 */
	private $decricao;

	/**
	 * @ORM\Column(type="float", name="VALOR_DEDUCAO")
	 */
	private $valorDeducao;

	/**
	 * @ORM\Column(type="float", name="VALOR_FORNECIMENTO")
	 */
	private $valorFornecimento;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOTAL_DEDUCAO")
	 */
	private $valorTotalDeducao;

	/**
	 * @ORM\Column(type="float", name="VALOR_LIQUIDO_FORNECIMENTO")
	 */
	private $valorLiquidoFornecimento;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="NfeCana", inversedBy="listaNfeCanaDeducoesSafra")
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

    public function getDecricao() 
	{
		return $this->decricao;
	}

	public function setDecricao($decricao) 
	{
		$this->decricao = $decricao;
	}

    public function getValorDeducao() 
	{
		return $this->valorDeducao;
	}

	public function setValorDeducao($valorDeducao) 
	{
		$this->valorDeducao = $valorDeducao;
	}

    public function getValorFornecimento() 
	{
		return $this->valorFornecimento;
	}

	public function setValorFornecimento($valorFornecimento) 
	{
		$this->valorFornecimento = $valorFornecimento;
	}

    public function getValorTotalDeducao() 
	{
		return $this->valorTotalDeducao;
	}

	public function setValorTotalDeducao($valorTotalDeducao) 
	{
		$this->valorTotalDeducao = $valorTotalDeducao;
	}

    public function getValorLiquidoFornecimento() 
	{
		return $this->valorLiquidoFornecimento;
	}

	public function setValorLiquidoFornecimento($valorLiquidoFornecimento) 
	{
		$this->valorLiquidoFornecimento = $valorLiquidoFornecimento;
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
			$this->setDecricao($objeto->decricao);
			$this->setValorDeducao($objeto->valorDeducao);
			$this->setValorFornecimento($objeto->valorFornecimento);
			$this->setValorTotalDeducao($objeto->valorTotalDeducao);
			$this->setValorLiquidoFornecimento($objeto->valorLiquidoFornecimento);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeCanaDeducoesSafra');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'decricao' => $this->getDecricao(),
			'valorDeducao' => $this->getValorDeducao(),
			'valorFornecimento' => $this->getValorFornecimento(),
			'valorTotalDeducao' => $this->getValorTotalDeducao(),
			'valorLiquidoFornecimento' => $this->getValorLiquidoFornecimento(),
        ];
    }
}
