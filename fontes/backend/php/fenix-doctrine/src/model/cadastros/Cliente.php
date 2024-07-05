<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [CLIENTE] 
                                                                                
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
 * @ORM\Table(name="CLIENTE")
 */
class Cliente extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="date", name="DESDE")
	 */
	private $desde;

	/**
	 * @ORM\Column(type="date", name="DATA_CADASTRO")
	 */
	private $dataCadastro;

	/**
	 * @ORM\Column(type="float", name="TAXA_DESCONTO")
	 */
	private $taxaDesconto;

	/**
	 * @ORM\Column(type="float", name="LIMITE_CREDITO")
	 */
	private $limiteCredito;

	/**
	 * @ORM\Column(type="string", name="OBSERVACAO")
	 */
	private $observacao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Pessoa", inversedBy="cliente")
     * @ORM\JoinColumn(name="ID_PESSOA", referencedColumnName="id")
     */
    private $pessoa;

    /**
     * @ORM\OneToOne(targetEntity="TabelaPreco", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_TABELA_PRECO", referencedColumnName="id")
     */
    private $tabelaPreco;


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

    public function getDesde() 
	{
		if ($this->desde != null) {
			return $this->desde->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDesde($desde) 
	{
		$this->desde = $desde != null ? new \DateTime($desde) : null;
	}

    public function getDataCadastro() 
	{
		if ($this->dataCadastro != null) {
			return $this->dataCadastro->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataCadastro($dataCadastro) 
	{
		$this->dataCadastro = $dataCadastro != null ? new \DateTime($dataCadastro) : null;
	}

    public function getTaxaDesconto() 
	{
		return $this->taxaDesconto;
	}

	public function setTaxaDesconto($taxaDesconto) 
	{
		$this->taxaDesconto = $taxaDesconto;
	}

    public function getLimiteCredito() 
	{
		return $this->limiteCredito;
	}

	public function setLimiteCredito($limiteCredito) 
	{
		$this->limiteCredito = $limiteCredito;
	}

    public function getObservacao() 
	{
		return $this->observacao;
	}

	public function setObservacao($observacao) 
	{
		$this->observacao = $observacao;
	}

    public function getPessoa(): ?Pessoa 
	{
		return $this->pessoa;
	}

	public function setPessoa(?Pessoa $pessoa) 
	{
		$this->pessoa = $pessoa;
	}

    public function getTabelaPreco(): ?TabelaPreco 
	{
		return $this->tabelaPreco;
	}

	public function setTabelaPreco(?TabelaPreco $tabelaPreco) 
	{
		$this->tabelaPreco = $tabelaPreco;
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
			$this->setDesde($objeto->desde);
			$this->setDataCadastro($objeto->dataCadastro);
			$this->setTaxaDesconto($objeto->taxaDesconto);
			$this->setLimiteCredito($objeto->limiteCredito);
			$this->setObservacao($objeto->observacao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'Cliente');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'desde' => $this->getDesde(),
			'dataCadastro' => $this->getDataCadastro(),
			'taxaDesconto' => $this->getTaxaDesconto(),
			'limiteCredito' => $this->getLimiteCredito(),
			'observacao' => $this->getObservacao(),
			'tabelaPreco' => $this->getTabelaPreco(),
        ];
    }
}
