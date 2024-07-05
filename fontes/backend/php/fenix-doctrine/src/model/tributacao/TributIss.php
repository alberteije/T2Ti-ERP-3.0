<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_ISS] 
                                                                                
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
 * @ORM\Table(name="TRIBUT_ISS")
 */
class TributIss extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="MODALIDADE_BASE_CALCULO")
	 */
	private $modalidadeBaseCalculo;

	/**
	 * @ORM\Column(type="float", name="PORCENTO_BASE_CALCULO")
	 */
	private $porcentoBaseCalculo;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_PORCENTO")
	 */
	private $aliquotaPorcento;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_UNIDADE")
	 */
	private $aliquotaUnidade;

	/**
	 * @ORM\Column(type="float", name="VALOR_PRECO_MAXIMO")
	 */
	private $valorPrecoMaximo;

	/**
	 * @ORM\Column(type="float", name="VALOR_PAUTA_FISCAL")
	 */
	private $valorPautaFiscal;

	/**
	 * @ORM\Column(type="integer", name="ITEM_LISTA_SERVICO")
	 */
	private $itemListaServico;

	/**
	 * @ORM\Column(type="string", name="CODIGO_TRIBUTACAO")
	 */
	private $codigoTributacao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="TributOperacaoFiscal", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TRIBUT_OPERACAO_FISCAL", referencedColumnName="id")
     */
    private $tributOperacaoFiscal;


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

    public function getModalidadeBaseCalculo() 
	{
		return $this->modalidadeBaseCalculo;
	}

	public function setModalidadeBaseCalculo($modalidadeBaseCalculo) 
	{
		$this->modalidadeBaseCalculo = $modalidadeBaseCalculo;
	}

    public function getPorcentoBaseCalculo() 
	{
		return $this->porcentoBaseCalculo;
	}

	public function setPorcentoBaseCalculo($porcentoBaseCalculo) 
	{
		$this->porcentoBaseCalculo = $porcentoBaseCalculo;
	}

    public function getAliquotaPorcento() 
	{
		return $this->aliquotaPorcento;
	}

	public function setAliquotaPorcento($aliquotaPorcento) 
	{
		$this->aliquotaPorcento = $aliquotaPorcento;
	}

    public function getAliquotaUnidade() 
	{
		return $this->aliquotaUnidade;
	}

	public function setAliquotaUnidade($aliquotaUnidade) 
	{
		$this->aliquotaUnidade = $aliquotaUnidade;
	}

    public function getValorPrecoMaximo() 
	{
		return $this->valorPrecoMaximo;
	}

	public function setValorPrecoMaximo($valorPrecoMaximo) 
	{
		$this->valorPrecoMaximo = $valorPrecoMaximo;
	}

    public function getValorPautaFiscal() 
	{
		return $this->valorPautaFiscal;
	}

	public function setValorPautaFiscal($valorPautaFiscal) 
	{
		$this->valorPautaFiscal = $valorPautaFiscal;
	}

    public function getItemListaServico() 
	{
		return $this->itemListaServico;
	}

	public function setItemListaServico($itemListaServico) 
	{
		$this->itemListaServico = $itemListaServico;
	}

    public function getCodigoTributacao() 
	{
		return $this->codigoTributacao;
	}

	public function setCodigoTributacao($codigoTributacao) 
	{
		$this->codigoTributacao = $codigoTributacao;
	}

    public function getTributOperacaoFiscal(): ?TributOperacaoFiscal 
	{
		return $this->tributOperacaoFiscal;
	}

	public function setTributOperacaoFiscal(?TributOperacaoFiscal $tributOperacaoFiscal) 
	{
		$this->tributOperacaoFiscal = $tributOperacaoFiscal;
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
			$this->setModalidadeBaseCalculo($objeto->modalidadeBaseCalculo);
			$this->setPorcentoBaseCalculo($objeto->porcentoBaseCalculo);
			$this->setAliquotaPorcento($objeto->aliquotaPorcento);
			$this->setAliquotaUnidade($objeto->aliquotaUnidade);
			$this->setValorPrecoMaximo($objeto->valorPrecoMaximo);
			$this->setValorPautaFiscal($objeto->valorPautaFiscal);
			$this->setItemListaServico($objeto->itemListaServico);
			$this->setCodigoTributacao($objeto->codigoTributacao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'TributIss');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'modalidadeBaseCalculo' => $this->getModalidadeBaseCalculo(),
			'porcentoBaseCalculo' => $this->getPorcentoBaseCalculo(),
			'aliquotaPorcento' => $this->getAliquotaPorcento(),
			'aliquotaUnidade' => $this->getAliquotaUnidade(),
			'valorPrecoMaximo' => $this->getValorPrecoMaximo(),
			'valorPautaFiscal' => $this->getValorPautaFiscal(),
			'itemListaServico' => $this->getItemListaServico(),
			'codigoTributacao' => $this->getCodigoTributacao(),
			'tributOperacaoFiscal' => $this->getTributOperacaoFiscal(),
        ];
    }
}
