<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_IMPORTACAO_DETALHE] 
                                                                                
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
 * @ORM\Table(name="NFE_IMPORTACAO_DETALHE")
 */
class NfeImportacaoDetalhe extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_ADICAO")
	 */
	private $numeroAdicao;

	/**
	 * @ORM\Column(type="integer", name="NUMERO_SEQUENCIAL")
	 */
	private $numeroSequencial;

	/**
	 * @ORM\Column(type="string", name="CODIGO_FABRICANTE_ESTRANGEIRO")
	 */
	private $codigoFabricanteEstrangeiro;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESCONTO")
	 */
	private $valorDesconto;

	/**
	 * @ORM\Column(type="integer", name="DRAWBACK")
	 */
	private $drawback;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="NfeDeclaracaoImportacao", inversedBy="listaNfeImportacaoDetalhe")
     * @ORM\JoinColumn(name="ID_NFE_DECLARACAO_IMPORTACAO", referencedColumnName="id")
     */
    private $nfeDeclaracaoImportacao;


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

    public function getNumeroAdicao() 
	{
		return $this->numeroAdicao;
	}

	public function setNumeroAdicao($numeroAdicao) 
	{
		$this->numeroAdicao = $numeroAdicao;
	}

    public function getNumeroSequencial() 
	{
		return $this->numeroSequencial;
	}

	public function setNumeroSequencial($numeroSequencial) 
	{
		$this->numeroSequencial = $numeroSequencial;
	}

    public function getCodigoFabricanteEstrangeiro() 
	{
		return $this->codigoFabricanteEstrangeiro;
	}

	public function setCodigoFabricanteEstrangeiro($codigoFabricanteEstrangeiro) 
	{
		$this->codigoFabricanteEstrangeiro = $codigoFabricanteEstrangeiro;
	}

    public function getValorDesconto() 
	{
		return $this->valorDesconto;
	}

	public function setValorDesconto($valorDesconto) 
	{
		$this->valorDesconto = $valorDesconto;
	}

    public function getDrawback() 
	{
		return $this->drawback;
	}

	public function setDrawback($drawback) 
	{
		$this->drawback = $drawback;
	}

    public function getNfeDeclaracaoImportacao(): ?NfeDeclaracaoImportacao 
	{
		return $this->nfeDeclaracaoImportacao;
	}

	public function setNfeDeclaracaoImportacao(?NfeDeclaracaoImportacao $nfeDeclaracaoImportacao) 
	{
		$this->nfeDeclaracaoImportacao = $nfeDeclaracaoImportacao;
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
			$this->setNumeroAdicao($objeto->numeroAdicao);
			$this->setNumeroSequencial($objeto->numeroSequencial);
			$this->setCodigoFabricanteEstrangeiro($objeto->codigoFabricanteEstrangeiro);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setDrawback($objeto->drawback);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeImportacaoDetalhe');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'numeroAdicao' => $this->getNumeroAdicao(),
			'numeroSequencial' => $this->getNumeroSequencial(),
			'codigoFabricanteEstrangeiro' => $this->getCodigoFabricanteEstrangeiro(),
			'valorDesconto' => $this->getValorDesconto(),
			'drawback' => $this->getDrawback(),
        ];
    }
}
