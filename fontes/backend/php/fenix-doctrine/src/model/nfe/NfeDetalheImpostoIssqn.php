<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ISSQN] 
                                                                                
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
 * @ORM\Table(name="NFE_DETALHE_IMPOSTO_ISSQN")
 */
class NfeDetalheImpostoIssqn extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="float", name="BASE_CALCULO_ISSQN")
	 */
	private $baseCalculoIssqn;

	/**
	 * @ORM\Column(type="float", name="ALIQUOTA_ISSQN")
	 */
	private $aliquotaIssqn;

	/**
	 * @ORM\Column(type="float", name="VALOR_ISSQN")
	 */
	private $valorIssqn;

	/**
	 * @ORM\Column(type="integer", name="MUNICIPIO_ISSQN")
	 */
	private $municipioIssqn;

	/**
	 * @ORM\Column(type="integer", name="ITEM_LISTA_SERVICOS")
	 */
	private $itemListaServicos;

	/**
	 * @ORM\Column(type="float", name="VALOR_DEDUCAO")
	 */
	private $valorDeducao;

	/**
	 * @ORM\Column(type="float", name="VALOR_OUTRAS_RETENCOES")
	 */
	private $valorOutrasRetencoes;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESCONTO_INCONDICIONADO")
	 */
	private $valorDescontoIncondicionado;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESCONTO_CONDICIONADO")
	 */
	private $valorDescontoCondicionado;

	/**
	 * @ORM\Column(type="float", name="VALOR_RETENCAO_ISS")
	 */
	private $valorRetencaoIss;

	/**
	 * @ORM\Column(type="string", name="INDICADOR_EXIGIBILIDADE_ISS")
	 */
	private $indicadorExigibilidadeIss;

	/**
	 * @ORM\Column(type="string", name="CODIGO_SERVICO")
	 */
	private $codigoServico;

	/**
	 * @ORM\Column(type="integer", name="MUNICIPIO_INCIDENCIA")
	 */
	private $municipioIncidencia;

	/**
	 * @ORM\Column(type="integer", name="PAIS_SEVICO_PRESTADO")
	 */
	private $paisSevicoPrestado;

	/**
	 * @ORM\Column(type="string", name="NUMERO_PROCESSO")
	 */
	private $numeroProcesso;

	/**
	 * @ORM\Column(type="string", name="INDICADOR_INCENTIVO_FISCAL")
	 */
	private $indicadorIncentivoFiscal;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeDetalhe", inversedBy="nfeDetalheImpostoIssqn")
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

    public function getBaseCalculoIssqn() 
	{
		return $this->baseCalculoIssqn;
	}

	public function setBaseCalculoIssqn($baseCalculoIssqn) 
	{
		$this->baseCalculoIssqn = $baseCalculoIssqn;
	}

    public function getAliquotaIssqn() 
	{
		return $this->aliquotaIssqn;
	}

	public function setAliquotaIssqn($aliquotaIssqn) 
	{
		$this->aliquotaIssqn = $aliquotaIssqn;
	}

    public function getValorIssqn() 
	{
		return $this->valorIssqn;
	}

	public function setValorIssqn($valorIssqn) 
	{
		$this->valorIssqn = $valorIssqn;
	}

    public function getMunicipioIssqn() 
	{
		return $this->municipioIssqn;
	}

	public function setMunicipioIssqn($municipioIssqn) 
	{
		$this->municipioIssqn = $municipioIssqn;
	}

    public function getItemListaServicos() 
	{
		return $this->itemListaServicos;
	}

	public function setItemListaServicos($itemListaServicos) 
	{
		$this->itemListaServicos = $itemListaServicos;
	}

    public function getValorDeducao() 
	{
		return $this->valorDeducao;
	}

	public function setValorDeducao($valorDeducao) 
	{
		$this->valorDeducao = $valorDeducao;
	}

    public function getValorOutrasRetencoes() 
	{
		return $this->valorOutrasRetencoes;
	}

	public function setValorOutrasRetencoes($valorOutrasRetencoes) 
	{
		$this->valorOutrasRetencoes = $valorOutrasRetencoes;
	}

    public function getValorDescontoIncondicionado() 
	{
		return $this->valorDescontoIncondicionado;
	}

	public function setValorDescontoIncondicionado($valorDescontoIncondicionado) 
	{
		$this->valorDescontoIncondicionado = $valorDescontoIncondicionado;
	}

    public function getValorDescontoCondicionado() 
	{
		return $this->valorDescontoCondicionado;
	}

	public function setValorDescontoCondicionado($valorDescontoCondicionado) 
	{
		$this->valorDescontoCondicionado = $valorDescontoCondicionado;
	}

    public function getValorRetencaoIss() 
	{
		return $this->valorRetencaoIss;
	}

	public function setValorRetencaoIss($valorRetencaoIss) 
	{
		$this->valorRetencaoIss = $valorRetencaoIss;
	}

    public function getIndicadorExigibilidadeIss() 
	{
		return $this->indicadorExigibilidadeIss;
	}

	public function setIndicadorExigibilidadeIss($indicadorExigibilidadeIss) 
	{
		$this->indicadorExigibilidadeIss = $indicadorExigibilidadeIss;
	}

    public function getCodigoServico() 
	{
		return $this->codigoServico;
	}

	public function setCodigoServico($codigoServico) 
	{
		$this->codigoServico = $codigoServico;
	}

    public function getMunicipioIncidencia() 
	{
		return $this->municipioIncidencia;
	}

	public function setMunicipioIncidencia($municipioIncidencia) 
	{
		$this->municipioIncidencia = $municipioIncidencia;
	}

    public function getPaisSevicoPrestado() 
	{
		return $this->paisSevicoPrestado;
	}

	public function setPaisSevicoPrestado($paisSevicoPrestado) 
	{
		$this->paisSevicoPrestado = $paisSevicoPrestado;
	}

    public function getNumeroProcesso() 
	{
		return $this->numeroProcesso;
	}

	public function setNumeroProcesso($numeroProcesso) 
	{
		$this->numeroProcesso = $numeroProcesso;
	}

    public function getIndicadorIncentivoFiscal() 
	{
		return $this->indicadorIncentivoFiscal;
	}

	public function setIndicadorIncentivoFiscal($indicadorIncentivoFiscal) 
	{
		$this->indicadorIncentivoFiscal = $indicadorIncentivoFiscal;
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
			$this->setBaseCalculoIssqn($objeto->baseCalculoIssqn);
			$this->setAliquotaIssqn($objeto->aliquotaIssqn);
			$this->setValorIssqn($objeto->valorIssqn);
			$this->setMunicipioIssqn($objeto->municipioIssqn);
			$this->setItemListaServicos($objeto->itemListaServicos);
			$this->setValorDeducao($objeto->valorDeducao);
			$this->setValorOutrasRetencoes($objeto->valorOutrasRetencoes);
			$this->setValorDescontoIncondicionado($objeto->valorDescontoIncondicionado);
			$this->setValorDescontoCondicionado($objeto->valorDescontoCondicionado);
			$this->setValorRetencaoIss($objeto->valorRetencaoIss);
			$this->setIndicadorExigibilidadeIss($objeto->indicadorExigibilidadeIss);
			$this->setCodigoServico($objeto->codigoServico);
			$this->setMunicipioIncidencia($objeto->municipioIncidencia);
			$this->setPaisSevicoPrestado($objeto->paisSevicoPrestado);
			$this->setNumeroProcesso($objeto->numeroProcesso);
			$this->setIndicadorIncentivoFiscal($objeto->indicadorIncentivoFiscal);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetalheImpostoIssqn');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'baseCalculoIssqn' => $this->getBaseCalculoIssqn(),
			'aliquotaIssqn' => $this->getAliquotaIssqn(),
			'valorIssqn' => $this->getValorIssqn(),
			'municipioIssqn' => $this->getMunicipioIssqn(),
			'itemListaServicos' => $this->getItemListaServicos(),
			'valorDeducao' => $this->getValorDeducao(),
			'valorOutrasRetencoes' => $this->getValorOutrasRetencoes(),
			'valorDescontoIncondicionado' => $this->getValorDescontoIncondicionado(),
			'valorDescontoCondicionado' => $this->getValorDescontoCondicionado(),
			'valorRetencaoIss' => $this->getValorRetencaoIss(),
			'indicadorExigibilidadeIss' => $this->getIndicadorExigibilidadeIss(),
			'codigoServico' => $this->getCodigoServico(),
			'municipioIncidencia' => $this->getMunicipioIncidencia(),
			'paisSevicoPrestado' => $this->getPaisSevicoPrestado(),
			'numeroProcesso' => $this->getNumeroProcesso(),
			'indicadorIncentivoFiscal' => $this->getIndicadorIncentivoFiscal(),
        ];
    }
}
