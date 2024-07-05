<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE_REBOQUE] 
                                                                                
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
 * @ORM\Table(name="NFE_TRANSPORTE_REBOQUE")
 */
class NfeTransporteReboque extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="PLACA")
	 */
	private $placa;

	/**
	 * @ORM\Column(type="string", name="UF")
	 */
	private $uf;

	/**
	 * @ORM\Column(type="string", name="RNTC")
	 */
	private $rntc;

	/**
	 * @ORM\Column(type="string", name="VAGAO")
	 */
	private $vagao;

	/**
	 * @ORM\Column(type="string", name="BALSA")
	 */
	private $balsa;


    /**
     * Relations
     */
    
    /**
     * @ORM\ManyToOne(targetEntity="NfeTransporte", inversedBy="listaNfeTransporteReboque")
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

    public function getPlaca() 
	{
		return $this->placa;
	}

	public function setPlaca($placa) 
	{
		$this->placa = $placa;
	}

    public function getUf() 
	{
		return $this->uf;
	}

	public function setUf($uf) 
	{
		$this->uf = $uf;
	}

    public function getRntc() 
	{
		return $this->rntc;
	}

	public function setRntc($rntc) 
	{
		$this->rntc = $rntc;
	}

    public function getVagao() 
	{
		return $this->vagao;
	}

	public function setVagao($vagao) 
	{
		$this->vagao = $vagao;
	}

    public function getBalsa() 
	{
		return $this->balsa;
	}

	public function setBalsa($balsa) 
	{
		$this->balsa = $balsa;
	}

    public function getNfeTransporte(): ?NfeTransporte 
	{
		return $this->nfeTransporte;
	}

	public function setNfeTransporte(?NfeTransporte $nfeTransporte) 
	{
		$this->nfeTransporte = $nfeTransporte;
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
			$this->setPlaca($objeto->placa);
			$this->setUf($objeto->uf);
			$this->setRntc($objeto->rntc);
			$this->setVagao($objeto->vagao);
			$this->setBalsa($objeto->balsa);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeTransporteReboque');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'placa' => $this->getPlaca(),
			'uf' => $this->getUf(),
			'rntc' => $this->getRntc(),
			'vagao' => $this->getVagao(),
			'balsa' => $this->getBalsa(),
        ];
    }
}
