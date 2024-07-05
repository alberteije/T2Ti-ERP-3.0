<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_FATURA] 
                                                                                
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
 * @ORM\Table(name="NFE_FATURA")
 */
class NfeFatura extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="NUMERO")
	 */
	private $numero;

	/**
	 * @ORM\Column(type="float", name="VALOR_ORIGINAL")
	 */
	private $valorOriginal;

	/**
	 * @ORM\Column(type="float", name="VALOR_DESCONTO")
	 */
	private $valorDesconto;

	/**
	 * @ORM\Column(type="float", name="VALOR_LIQUIDO")
	 */
	private $valorLiquido;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="NfeCabecalho", inversedBy="nfeFatura")
     * @ORM\JoinColumn(name="ID_NFE_CABECALHO", referencedColumnName="id")
     */
    private $nfeCabecalho;

    /**
     * @ORM\OneToMany(targetEntity="NfeDuplicata", mappedBy="nfeFatura", cascade={"persist", "remove"})
     */
    private $listaNfeDuplicata;


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

    public function getNumero() 
	{
		return $this->numero;
	}

	public function setNumero($numero) 
	{
		$this->numero = $numero;
	}

    public function getValorOriginal() 
	{
		return $this->valorOriginal;
	}

	public function setValorOriginal($valorOriginal) 
	{
		$this->valorOriginal = $valorOriginal;
	}

    public function getValorDesconto() 
	{
		return $this->valorDesconto;
	}

	public function setValorDesconto($valorDesconto) 
	{
		$this->valorDesconto = $valorDesconto;
	}

    public function getValorLiquido() 
	{
		return $this->valorLiquido;
	}

	public function setValorLiquido($valorLiquido) 
	{
		$this->valorLiquido = $valorLiquido;
	}

    public function getNfeCabecalho(): ?NfeCabecalho 
	{
		return $this->nfeCabecalho;
	}

	public function setNfeCabecalho(?NfeCabecalho $nfeCabecalho) 
	{
		$this->nfeCabecalho = $nfeCabecalho;
	}

    public function getListaNfeDuplicata() 
	{
		return $this->listaNfeDuplicata->toArray();
	}

	public function setListaNfeDuplicata(array $listaNfeDuplicata) {
		$this->listaNfeDuplicata = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeDuplicata); $i++) {
			$nfeDuplicata = $listaNfeDuplicata[$i];
			$nfeDuplicata->setNfeFatura($this);
			$this->listaNfeDuplicata->add($nfeDuplicata);
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

		
		$this->listaNfeDuplicata = new ArrayCollection();
		$listaNfeDuplicataJson = $objetoJson->listaNfeDuplicata;
		if ($listaNfeDuplicataJson != null) {
			for ($i = 0; $i < count($listaNfeDuplicataJson); $i++) {
				$objeto = new NfeDuplicata($listaNfeDuplicataJson[$i]);
				$objeto->setNfeFatura($this);
				$this->listaNfeDuplicata->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setNumero($objeto->numero);
			$this->setValorOriginal($objeto->valorOriginal);
			$this->setValorDesconto($objeto->valorDesconto);
			$this->setValorLiquido($objeto->valorLiquido);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeFatura');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'numero' => $this->getNumero(),
			'valorOriginal' => $this->getValorOriginal(),
			'valorDesconto' => $this->getValorDesconto(),
			'valorLiquido' => $this->getValorLiquido(),
			'listaNfeDuplicata' => $this->getListaNfeDuplicata(),
        ];
    }
}
