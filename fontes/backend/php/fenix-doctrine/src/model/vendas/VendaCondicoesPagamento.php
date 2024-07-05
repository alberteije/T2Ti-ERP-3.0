<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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
 * @ORM\Table(name="VENDA_CONDICOES_PAGAMENTO")
 */
class VendaCondicoesPagamento extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="NOME")
	 */
	private $nome;

	/**
	 * @ORM\Column(type="string", name="DESCRICAO")
	 */
	private $descricao;

	/**
	 * @ORM\Column(type="float", name="FATURAMENTO_MINIMO")
	 */
	private $faturamentoMinimo;

	/**
	 * @ORM\Column(type="float", name="FATURAMENTO_MAXIMO")
	 */
	private $faturamentoMaximo;

	/**
	 * @ORM\Column(type="float", name="INDICE_CORRECAO")
	 */
	private $indiceCorrecao;

	/**
	 * @ORM\Column(type="integer", name="DIAS_TOLERANCIA")
	 */
	private $diasTolerancia;

	/**
	 * @ORM\Column(type="float", name="VALOR_TOLERANCIA")
	 */
	private $valorTolerancia;

	/**
	 * @ORM\Column(type="integer", name="PRAZO_MEDIO")
	 */
	private $prazoMedio;

	/**
	 * @ORM\Column(type="string", name="VISTA_PRAZO")
	 */
	private $vistaPrazo;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToMany(targetEntity="VendaCondicoesParcelas", mappedBy="vendaCondicoesPagamento", cascade={"persist", "remove"})
     */
    private $listaVendaCondicoesParcelas;


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

    public function getNome() 
	{
		return $this->nome;
	}

	public function setNome($nome) 
	{
		$this->nome = $nome;
	}

    public function getDescricao() 
	{
		return $this->descricao;
	}

	public function setDescricao($descricao) 
	{
		$this->descricao = $descricao;
	}

    public function getFaturamentoMinimo() 
	{
		return $this->faturamentoMinimo;
	}

	public function setFaturamentoMinimo($faturamentoMinimo) 
	{
		$this->faturamentoMinimo = $faturamentoMinimo;
	}

    public function getFaturamentoMaximo() 
	{
		return $this->faturamentoMaximo;
	}

	public function setFaturamentoMaximo($faturamentoMaximo) 
	{
		$this->faturamentoMaximo = $faturamentoMaximo;
	}

    public function getIndiceCorrecao() 
	{
		return $this->indiceCorrecao;
	}

	public function setIndiceCorrecao($indiceCorrecao) 
	{
		$this->indiceCorrecao = $indiceCorrecao;
	}

    public function getDiasTolerancia() 
	{
		return $this->diasTolerancia;
	}

	public function setDiasTolerancia($diasTolerancia) 
	{
		$this->diasTolerancia = $diasTolerancia;
	}

    public function getValorTolerancia() 
	{
		return $this->valorTolerancia;
	}

	public function setValorTolerancia($valorTolerancia) 
	{
		$this->valorTolerancia = $valorTolerancia;
	}

    public function getPrazoMedio() 
	{
		return $this->prazoMedio;
	}

	public function setPrazoMedio($prazoMedio) 
	{
		$this->prazoMedio = $prazoMedio;
	}

    public function getVistaPrazo() 
	{
		return $this->vistaPrazo;
	}

	public function setVistaPrazo($vistaPrazo) 
	{
		$this->vistaPrazo = $vistaPrazo;
	}

    public function getListaVendaCondicoesParcelas() 
	{
		return $this->listaVendaCondicoesParcelas->toArray();
	}

	public function setListaVendaCondicoesParcelas(array $listaVendaCondicoesParcelas) {
		$this->listaVendaCondicoesParcelas = new ArrayCollection();
		for ($i = 0; $i < count($listaVendaCondicoesParcelas); $i++) {
			$vendaCondicoesParcelas = $listaVendaCondicoesParcelas[$i];
			$vendaCondicoesParcelas->setVendaCondicoesPagamento($this);
			$this->listaVendaCondicoesParcelas->add($vendaCondicoesParcelas);
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

		
		$this->listaVendaCondicoesParcelas = new ArrayCollection();
		$listaVendaCondicoesParcelasJson = $objetoJson->listaVendaCondicoesParcelas;
		if ($listaVendaCondicoesParcelasJson != null) {
			for ($i = 0; $i < count($listaVendaCondicoesParcelasJson); $i++) {
				$objeto = new VendaCondicoesParcelas($listaVendaCondicoesParcelasJson[$i]);
				$objeto->setVendaCondicoesPagamento($this);
				$this->listaVendaCondicoesParcelas->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setNome($objeto->nome);
			$this->setDescricao($objeto->descricao);
			$this->setFaturamentoMinimo($objeto->faturamentoMinimo);
			$this->setFaturamentoMaximo($objeto->faturamentoMaximo);
			$this->setIndiceCorrecao($objeto->indiceCorrecao);
			$this->setDiasTolerancia($objeto->diasTolerancia);
			$this->setValorTolerancia($objeto->valorTolerancia);
			$this->setPrazoMedio($objeto->prazoMedio);
			$this->setVistaPrazo($objeto->vistaPrazo);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'VendaCondicoesPagamento');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'nome' => $this->getNome(),
			'descricao' => $this->getDescricao(),
			'faturamentoMinimo' => $this->getFaturamentoMinimo(),
			'faturamentoMaximo' => $this->getFaturamentoMaximo(),
			'indiceCorrecao' => $this->getIndiceCorrecao(),
			'diasTolerancia' => $this->getDiasTolerancia(),
			'valorTolerancia' => $this->getValorTolerancia(),
			'prazoMedio' => $this->getPrazoMedio(),
			'vistaPrazo' => $this->getVistaPrazo(),
			'listaVendaCondicoesParcelas' => $this->getListaVendaCondicoesParcelas(),
        ];
    }
}
