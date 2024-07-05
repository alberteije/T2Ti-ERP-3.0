<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [OS_EVOLUCAO] 
                                                                                
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
 * @ORM\Table(name="OS_EVOLUCAO")
 */
class OsEvolucao extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="date", name="DATA_REGISTRO")
	 */
	private $dataRegistro;

	/**
	 * @ORM\Column(type="string", name="HORA_REGISTRO")
	 */
	private $horaRegistro;

	/**
	 * @ORM\Column(type="string", name="OBSERVACAO")
	 */
	private $observacao;

	/**
	 * @ORM\Column(type="string", name="ENVIAR_EMAIL")
	 */
	private $enviarEmail;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="OsAbertura", inversedBy="listaOsEvolucao")
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

    public function getDataRegistro() 
	{
		if ($this->dataRegistro != null) {
			return $this->dataRegistro->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataRegistro($dataRegistro) 
	{
		$this->dataRegistro = $dataRegistro != null ? new \DateTime($dataRegistro) : null;
	}

    public function getHoraRegistro() 
	{
		return $this->horaRegistro;
	}

	public function setHoraRegistro($horaRegistro) 
	{
		$this->horaRegistro = $horaRegistro;
	}

    public function getObservacao() 
	{
		return $this->observacao;
	}

	public function setObservacao($observacao) 
	{
		$this->observacao = $observacao;
	}

    public function getEnviarEmail() 
	{
		return $this->enviarEmail;
	}

	public function setEnviarEmail($enviarEmail) 
	{
		$this->enviarEmail = $enviarEmail;
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
			$this->setDataRegistro($objeto->dataRegistro);
			$this->setHoraRegistro($objeto->horaRegistro);
			$this->setObservacao($objeto->observacao);
			$this->setEnviarEmail($objeto->enviarEmail);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'OsEvolucao');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'dataRegistro' => $this->getDataRegistro(),
			'horaRegistro' => $this->getHoraRegistro(),
			'observacao' => $this->getObservacao(),
			'enviarEmail' => $this->getEnviarEmail(),
        ];
    }
}
