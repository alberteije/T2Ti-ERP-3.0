<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_ARMAMENTO] 
                                                                                
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
 * @ORM\Table(name="NFE_DET_ESPECIFICO_ARMAMENTO")
 */
class NfeDetEspecificoArmamento extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="TIPO_ARMA")
	 */
	private $tipoArma;

	/**
	 * @ORM\Column(type="string", name="NUMERO_SERIE_ARMA")
	 */
	private $numeroSerieArma;

	/**
	 * @ORM\Column(type="string", name="NUMERO_SERIE_CANO")
	 */
	private $numeroSerieCano;

	/**
	 * @ORM\Column(type="string", name="DESCRICAO")
	 */
	private $descricao;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="NfeDetalhe", inversedBy="listaNfeDetEspecificoArmamento")
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

    public function getTipoArma() 
	{
		return $this->tipoArma;
	}

	public function setTipoArma($tipoArma) 
	{
		$this->tipoArma = $tipoArma;
	}

    public function getNumeroSerieArma() 
	{
		return $this->numeroSerieArma;
	}

	public function setNumeroSerieArma($numeroSerieArma) 
	{
		$this->numeroSerieArma = $numeroSerieArma;
	}

    public function getNumeroSerieCano() 
	{
		return $this->numeroSerieCano;
	}

	public function setNumeroSerieCano($numeroSerieCano) 
	{
		$this->numeroSerieCano = $numeroSerieCano;
	}

    public function getDescricao() 
	{
		return $this->descricao;
	}

	public function setDescricao($descricao) 
	{
		$this->descricao = $descricao;
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
			$this->setTipoArma($objeto->tipoArma);
			$this->setNumeroSerieArma($objeto->numeroSerieArma);
			$this->setNumeroSerieCano($objeto->numeroSerieCano);
			$this->setDescricao($objeto->descricao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDetEspecificoArmamento');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'tipoArma' => $this->getTipoArma(),
			'numeroSerieArma' => $this->getNumeroSerieArma(),
			'numeroSerieCano' => $this->getNumeroSerieCano(),
			'descricao' => $this->getDescricao(),
        ];
    }
}
