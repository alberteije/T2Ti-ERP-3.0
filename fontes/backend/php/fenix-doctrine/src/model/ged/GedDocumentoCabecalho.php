<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [GED_DOCUMENTO_CABECALHO] 
                                                                                
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
 * @ORM\Table(name="GED_DOCUMENTO_CABECALHO")
 */
class GedDocumentoCabecalho extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="date", name="DATA_INCLUSAO")
	 */
	private $dataInclusao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToMany(targetEntity="GedDocumentoDetalhe", mappedBy="gedDocumentoCabecalho", cascade={"persist", "remove"})
     */
    private $listaGedDocumentoDetalhe;


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

    public function getDataInclusao() 
	{
		if ($this->dataInclusao != null) {
			return $this->dataInclusao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataInclusao($dataInclusao) 
	{
		$this->dataInclusao = $dataInclusao != null ? new \DateTime($dataInclusao) : null;
	}

    public function getListaGedDocumentoDetalhe() 
	{
		return $this->listaGedDocumentoDetalhe->toArray();
	}

	public function setListaGedDocumentoDetalhe(array $listaGedDocumentoDetalhe) {
		$this->listaGedDocumentoDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaGedDocumentoDetalhe); $i++) {
			$gedDocumentoDetalhe = $listaGedDocumentoDetalhe[$i];
			$gedDocumentoDetalhe->setGedDocumentoCabecalho($this);
			$this->listaGedDocumentoDetalhe->add($gedDocumentoDetalhe);
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

		
		$this->listaGedDocumentoDetalhe = new ArrayCollection();
		$listaGedDocumentoDetalheJson = $objetoJson->listaGedDocumentoDetalhe;
		if ($listaGedDocumentoDetalheJson != null) {
			for ($i = 0; $i < count($listaGedDocumentoDetalheJson); $i++) {
				$objeto = new GedDocumentoDetalhe($listaGedDocumentoDetalheJson[$i]);
				$objeto->setGedDocumentoCabecalho($this);
				$this->listaGedDocumentoDetalhe->add($objeto);
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
			$this->setDataInclusao($objeto->dataInclusao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'GedDocumentoCabecalho');
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
			'dataInclusao' => $this->getDataInclusao(),
			'listaGedDocumentoDetalhe' => $this->getListaGedDocumentoDetalhe(),
        ];
    }
}
