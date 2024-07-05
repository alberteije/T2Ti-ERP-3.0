<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE_VOLUME] 
                                                                                
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
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 * @ORM\Table(name="NFE_TRANSPORTE_VOLUME")
 */
class NfeTransporteVolume extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="QUANTIDADE")
	 */
	private $quantidade;

	/**
	 * @ORM\Column(type="string", name="ESPECIE")
	 */
	private $especie;

	/**
	 * @ORM\Column(type="string", name="MARCA")
	 */
	private $marca;

	/**
	 * @ORM\Column(type="string", name="NUMERACAO")
	 */
	private $numeracao;

	/**
	 * @ORM\Column(type="float", name="PESO_LIQUIDO")
	 */
	private $pesoLiquido;

	/**
	 * @ORM\Column(type="float", name="PESO_BRUTO")
	 */
	private $pesoBruto;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToMany(targetEntity="NfeTransporteVolumeLacre", mappedBy="nfeTransporteVolume", cascade={"persist", "remove"})
     */
    private $listaNfeTransporteVolumeLacre;

    /**
     * @ORM\ManyToOne(targetEntity="NfeTransporte", inversedBy="listaNfeTransporteVolume")
     * @ORM\JoinColumn(name="ID_NFE_TRANSPORTE", referencedColumnName="id")
     */
    private $nfeTransporte;


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

    public function getQuantidade() 
	{
		return $this->quantidade;
	}

	public function setQuantidade($quantidade) 
	{
		$this->quantidade = $quantidade;
	}

    public function getEspecie() 
	{
		return $this->especie;
	}

	public function setEspecie($especie) 
	{
		$this->especie = $especie;
	}

    public function getMarca() 
	{
		return $this->marca;
	}

	public function setMarca($marca) 
	{
		$this->marca = $marca;
	}

    public function getNumeracao() 
	{
		return $this->numeracao;
	}

	public function setNumeracao($numeracao) 
	{
		$this->numeracao = $numeracao;
	}

    public function getPesoLiquido() 
	{
		return $this->pesoLiquido;
	}

	public function setPesoLiquido($pesoLiquido) 
	{
		$this->pesoLiquido = $pesoLiquido;
	}

    public function getPesoBruto() 
	{
		return $this->pesoBruto;
	}

	public function setPesoBruto($pesoBruto) 
	{
		$this->pesoBruto = $pesoBruto;
	}

    public function getNfeTransporte(): ?NfeTransporte 
	{
		return $this->nfeTransporte;
	}

	public function setNfeTransporte(?NfeTransporte $nfeTransporte) 
	{
		$this->nfeTransporte = $nfeTransporte;
	}

    public function getListaNfeTransporteVolumeLacre() 
	{
		return $this->listaNfeTransporteVolumeLacre->toArray();
	}

	public function setListaNfeTransporteVolumeLacre(array $listaNfeTransporteVolumeLacre) {
		$this->listaNfeTransporteVolumeLacre = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeTransporteVolumeLacre); $i++) {
			$nfeTransporteVolumeLacre = $listaNfeTransporteVolumeLacre[$i];
			$nfeTransporteVolumeLacre->setNfeTransporteVolume($this);
			$this->listaNfeTransporteVolumeLacre->add($nfeTransporteVolumeLacre);
		}
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

		
		$this->listaNfeTransporteVolumeLacre = new ArrayCollection();
		$listaNfeTransporteVolumeLacreJson = $objetoJson->listaNfeTransporteVolumeLacre;
		if ($listaNfeTransporteVolumeLacreJson != null) {
			for ($i = 0; $i < count($listaNfeTransporteVolumeLacreJson); $i++) {
				$objeto = new NfeTransporteVolumeLacre($listaNfeTransporteVolumeLacreJson[$i]);
				$objeto->setNfeTransporteVolume($this);
				$this->listaNfeTransporteVolumeLacre->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setQuantidade($objeto->quantidade);
			$this->setEspecie($objeto->especie);
			$this->setMarca($objeto->marca);
			$this->setNumeracao($objeto->numeracao);
			$this->setPesoLiquido($objeto->pesoLiquido);
			$this->setPesoBruto($objeto->pesoBruto);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeTransporteVolume');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'quantidade' => $this->getQuantidade(),
			'especie' => $this->getEspecie(),
			'marca' => $this->getMarca(),
			'numeracao' => $this->getNumeracao(),
			'pesoLiquido' => $this->getPesoLiquido(),
			'pesoBruto' => $this->getPesoBruto(),
			'listaNfeTransporteVolumeLacre' => $this->getListaNfeTransporteVolumeLacre(),
        ];
    }
}
