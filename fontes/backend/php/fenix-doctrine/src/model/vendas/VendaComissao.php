<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_COMISSAO] 
                                                                                
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
 * @ORM\Table(name="VENDA_COMISSAO")
 */
class VendaComissao extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="float", name="VALOR_VENDA")
	 */
	private $valorVenda;

	/**
	 * @ORM\Column(type="string", name="TIPO_CONTABIL")
	 */
	private $tipoContabil;

	/**
	 * @ORM\Column(type="float", name="VALOR_COMISSAO")
	 */
	private $valorComissao;

	/**
	 * @ORM\Column(type="string", name="SITUACAO")
	 */
	private $situacao;

	/**
	 * @ORM\Column(type="date", name="DATA_LANCAMENTO")
	 */
	private $dataLancamento;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Vendedor", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_VENDEDOR", referencedColumnName="id")
     */
    private $vendedor;

    /**
     * @ORM\ManyToOne(targetEntity="VendaCabecalho", inversedBy="listaVendaComissao")
     * @ORM\JoinColumn(name="ID_VENDA_CABECALHO", referencedColumnName="id")
     */
    private $vendaCabecalho;


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

    public function getValorVenda() 
	{
		return $this->valorVenda;
	}

	public function setValorVenda($valorVenda) 
	{
		$this->valorVenda = $valorVenda;
	}

    public function getTipoContabil() 
	{
		return $this->tipoContabil;
	}

	public function setTipoContabil($tipoContabil) 
	{
		$this->tipoContabil = $tipoContabil;
	}

    public function getValorComissao() 
	{
		return $this->valorComissao;
	}

	public function setValorComissao($valorComissao) 
	{
		$this->valorComissao = $valorComissao;
	}

    public function getSituacao() 
	{
		return $this->situacao;
	}

	public function setSituacao($situacao) 
	{
		$this->situacao = $situacao;
	}

    public function getDataLancamento() 
	{
		if ($this->dataLancamento != null) {
			return $this->dataLancamento->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataLancamento($dataLancamento) 
	{
		$this->dataLancamento = $dataLancamento != null ? new \DateTime($dataLancamento) : null;
	}

    public function getVendaCabecalho(): ?VendaCabecalho 
	{
		return $this->vendaCabecalho;
	}

	public function setVendaCabecalho(?VendaCabecalho $vendaCabecalho) 
	{
		$this->vendaCabecalho = $vendaCabecalho;
	}

    public function getVendedor(): ?Vendedor 
	{
		return $this->vendedor;
	}

	public function setVendedor(?Vendedor $vendedor) 
	{
		$this->vendedor = $vendedor;
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
			$this->setValorVenda($objeto->valorVenda);
			$this->setTipoContabil($objeto->tipoContabil);
			$this->setValorComissao($objeto->valorComissao);
			$this->setSituacao($objeto->situacao);
			$this->setDataLancamento($objeto->dataLancamento);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'VendaComissao');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'valorVenda' => $this->getValorVenda(),
			'tipoContabil' => $this->getTipoContabil(),
			'valorComissao' => $this->getValorComissao(),
			'situacao' => $this->getSituacao(),
			'dataLancamento' => $this->getDataLancamento(),
			'vendedor' => $this->getVendedor(),
        ];
    }
}
