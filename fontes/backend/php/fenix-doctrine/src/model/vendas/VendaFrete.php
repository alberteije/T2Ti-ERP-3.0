<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_FRETE] 
                                                                                
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
 * @ORM\Table(name="VENDA_FRETE")
 */
class VendaFrete extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="CONHECIMENTO")
	 */
	private $conhecimento;

	/**
	 * @ORM\Column(type="string", name="RESPONSAVEL")
	 */
	private $responsavel;

	/**
	 * @ORM\Column(type="string", name="PLACA")
	 */
	private $placa;

	/**
	 * @ORM\Column(type="string", name="UF_PLACA")
	 */
	private $ufPlaca;

	/**
	 * @ORM\Column(type="integer", name="SELO_FISCAL")
	 */
	private $seloFiscal;

	/**
	 * @ORM\Column(type="float", name="QUANTIDADE_VOLUME")
	 */
	private $quantidadeVolume;

	/**
	 * @ORM\Column(type="string", name="MARCA_VOLUME")
	 */
	private $marcaVolume;

	/**
	 * @ORM\Column(type="string", name="ESPECIE_VOLUME")
	 */
	private $especieVolume;

	/**
	 * @ORM\Column(type="float", name="PESO_BRUTO")
	 */
	private $pesoBruto;

	/**
	 * @ORM\Column(type="float", name="PESO_LIQUIDO")
	 */
	private $pesoLiquido;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="VendaCabecalho", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_VENDA_CABECALHO", referencedColumnName="id")
     */
    private $vendaCabecalho;

    /**
     * @ORM\OneToOne(targetEntity="Transportadora", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TRANSPORTADORA", referencedColumnName="id")
     */
    private $transportadora;


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

    public function getConhecimento() 
	{
		return $this->conhecimento;
	}

	public function setConhecimento($conhecimento) 
	{
		$this->conhecimento = $conhecimento;
	}

    public function getResponsavel() 
	{
		return $this->responsavel;
	}

	public function setResponsavel($responsavel) 
	{
		$this->responsavel = $responsavel;
	}

    public function getPlaca() 
	{
		return $this->placa;
	}

	public function setPlaca($placa) 
	{
		$this->placa = $placa;
	}

    public function getUfPlaca() 
	{
		return $this->ufPlaca;
	}

	public function setUfPlaca($ufPlaca) 
	{
		$this->ufPlaca = $ufPlaca;
	}

    public function getSeloFiscal() 
	{
		return $this->seloFiscal;
	}

	public function setSeloFiscal($seloFiscal) 
	{
		$this->seloFiscal = $seloFiscal;
	}

    public function getQuantidadeVolume() 
	{
		return $this->quantidadeVolume;
	}

	public function setQuantidadeVolume($quantidadeVolume) 
	{
		$this->quantidadeVolume = $quantidadeVolume;
	}

    public function getMarcaVolume() 
	{
		return $this->marcaVolume;
	}

	public function setMarcaVolume($marcaVolume) 
	{
		$this->marcaVolume = $marcaVolume;
	}

    public function getEspecieVolume() 
	{
		return $this->especieVolume;
	}

	public function setEspecieVolume($especieVolume) 
	{
		$this->especieVolume = $especieVolume;
	}

    public function getPesoBruto() 
	{
		return $this->pesoBruto;
	}

	public function setPesoBruto($pesoBruto) 
	{
		$this->pesoBruto = $pesoBruto;
	}

    public function getPesoLiquido() 
	{
		return $this->pesoLiquido;
	}

	public function setPesoLiquido($pesoLiquido) 
	{
		$this->pesoLiquido = $pesoLiquido;
	}

    public function getVendaCabecalho(): ?VendaCabecalho 
	{
		return $this->vendaCabecalho;
	}

	public function setVendaCabecalho(?VendaCabecalho $vendaCabecalho) 
	{
		$this->vendaCabecalho = $vendaCabecalho;
	}

    public function getTransportadora(): ?Transportadora 
	{
		return $this->transportadora;
	}

	public function setTransportadora(?Transportadora $transportadora) 
	{
		$this->transportadora = $transportadora;
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
			$this->setConhecimento($objeto->conhecimento);
			$this->setResponsavel($objeto->responsavel);
			$this->setPlaca($objeto->placa);
			$this->setUfPlaca($objeto->ufPlaca);
			$this->setSeloFiscal($objeto->seloFiscal);
			$this->setQuantidadeVolume($objeto->quantidadeVolume);
			$this->setMarcaVolume($objeto->marcaVolume);
			$this->setEspecieVolume($objeto->especieVolume);
			$this->setPesoBruto($objeto->pesoBruto);
			$this->setPesoLiquido($objeto->pesoLiquido);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'VendaFrete');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'conhecimento' => $this->getConhecimento(),
			'responsavel' => $this->getResponsavel(),
			'placa' => $this->getPlaca(),
			'ufPlaca' => $this->getUfPlaca(),
			'seloFiscal' => $this->getSeloFiscal(),
			'quantidadeVolume' => $this->getQuantidadeVolume(),
			'marcaVolume' => $this->getMarcaVolume(),
			'especieVolume' => $this->getEspecieVolume(),
			'pesoBruto' => $this->getPesoBruto(),
			'pesoLiquido' => $this->getPesoLiquido(),
			'vendaCabecalho' => $this->getVendaCabecalho(),
			'transportadora' => $this->getTransportadora(),
        ];
    }
}
