<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [OS_ABERTURA_EQUIPAMENTO] 
                                                                                
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
 * @ORM\Table(name="OS_ABERTURA_EQUIPAMENTO")
 */
class OsAberturaEquipamento extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="NUMERO_SERIE")
	 */
	private $numeroSerie;

	/**
	 * @ORM\Column(type="string", name="TIPO_COBERTURA")
	 */
	private $tipoCobertura;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="OsEquipamento", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_OS_EQUIPAMENTO", referencedColumnName="id")
     */
    private $osEquipamento;

    /**
     * @ORM\ManyToOne(targetEntity="OsAbertura", inversedBy="listaOsAberturaEquipamento")
     * @ORM\JoinColumn(name="ID_OS_ABERTURA", referencedColumnName="id")
     */
    private $osAbertura;


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

    public function getNumeroSerie() 
	{
		return $this->numeroSerie;
	}

	public function setNumeroSerie($numeroSerie) 
	{
		$this->numeroSerie = $numeroSerie;
	}

    public function getTipoCobertura() 
	{
		return $this->tipoCobertura;
	}

	public function setTipoCobertura($tipoCobertura) 
	{
		$this->tipoCobertura = $tipoCobertura;
	}

    public function getOsEquipamento(): ?OsEquipamento 
	{
		return $this->osEquipamento;
	}

	public function setOsEquipamento(?OsEquipamento $osEquipamento) 
	{
		$this->osEquipamento = $osEquipamento;
	}

    public function getOsAbertura(): ?OsAbertura 
	{
		return $this->osAbertura;
	}

	public function setOsAbertura(?OsAbertura $osAbertura) 
	{
		$this->osAbertura = $osAbertura;
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
			$this->setNumeroSerie($objeto->numeroSerie);
			$this->setTipoCobertura($objeto->tipoCobertura);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'OsAberturaEquipamento');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'numeroSerie' => $this->getNumeroSerie(),
			'tipoCobertura' => $this->getTipoCobertura(),
			'osEquipamento' => $this->getOsEquipamento(),
        ];
    }
}
