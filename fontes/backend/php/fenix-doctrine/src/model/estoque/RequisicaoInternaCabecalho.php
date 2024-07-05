<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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
 * @ORM\Table(name="REQUISICAO_INTERNA_CABECALHO")
 */
class RequisicaoInternaCabecalho extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="date", name="DATA_REQUISICAO")
	 */
	private $dataRequisicao;

	/**
	 * @ORM\Column(type="string", name="SITUACAO")
	 */
	private $situacao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Colaborador", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COLABORADOR", referencedColumnName="id")
     */
    private $colaborador;

    /**
     * @ORM\OneToMany(targetEntity="RequisicaoInternaDetalhe", mappedBy="requisicaoInternaCabecalho", cascade={"persist", "remove"})
     */
    private $listaRequisicaoInternaDetalhe;


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

    public function getDataRequisicao() 
	{
		if ($this->dataRequisicao != null) {
			return $this->dataRequisicao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataRequisicao($dataRequisicao) 
	{
		$this->dataRequisicao = $dataRequisicao != null ? new \DateTime($dataRequisicao) : null;
	}

    public function getSituacao() 
	{
		return $this->situacao;
	}

	public function setSituacao($situacao) 
	{
		$this->situacao = $situacao;
	}

    public function getColaborador(): ?Colaborador 
	{
		return $this->colaborador;
	}

	public function setColaborador(?Colaborador $colaborador) 
	{
		$this->colaborador = $colaborador;
	}

    public function getListaRequisicaoInternaDetalhe() 
	{
		return $this->listaRequisicaoInternaDetalhe->toArray();
	}

	public function setListaRequisicaoInternaDetalhe(array $listaRequisicaoInternaDetalhe) {
		$this->listaRequisicaoInternaDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaRequisicaoInternaDetalhe); $i++) {
			$requisicaoInternaDetalhe = $listaRequisicaoInternaDetalhe[$i];
			$requisicaoInternaDetalhe->setRequisicaoInternaCabecalho($this);
			$this->listaRequisicaoInternaDetalhe->add($requisicaoInternaDetalhe);
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

		
		$this->listaRequisicaoInternaDetalhe = new ArrayCollection();
		$listaRequisicaoInternaDetalheJson = $objetoJson->listaRequisicaoInternaDetalhe;
		if ($listaRequisicaoInternaDetalheJson != null) {
			for ($i = 0; $i < count($listaRequisicaoInternaDetalheJson); $i++) {
				$objeto = new RequisicaoInternaDetalhe($listaRequisicaoInternaDetalheJson[$i]);
				$objeto->setRequisicaoInternaCabecalho($this);
				$this->listaRequisicaoInternaDetalhe->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setDataRequisicao($objeto->dataRequisicao);
			$this->setSituacao($objeto->situacao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'RequisicaoInternaCabecalho');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'dataRequisicao' => $this->getDataRequisicao(),
			'situacao' => $this->getSituacao(),
			'colaborador' => $this->getColaborador(),
			'listaRequisicaoInternaDetalhe' => $this->getListaRequisicaoInternaDetalhe(),
        ];
    }
}
