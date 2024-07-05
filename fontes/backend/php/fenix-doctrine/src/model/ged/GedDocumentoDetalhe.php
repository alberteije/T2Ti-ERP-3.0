<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
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
 * @ORM\Table(name="GED_DOCUMENTO_DETALHE")
 */
class GedDocumentoDetalhe extends ModelBase implements \JsonSerializable
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
	 * @ORM\Column(type="string", name="PALAVRAS_CHAVE")
	 */
	private $palavrasChave;

	/**
	 * @ORM\Column(type="string", name="PODE_EXCLUIR")
	 */
	private $podeExcluir;

	/**
	 * @ORM\Column(type="string", name="PODE_ALTERAR")
	 */
	private $podeAlterar;

	/**
	 * @ORM\Column(type="string", name="ASSINADO")
	 */
	private $assinado;

	/**
	 * @ORM\Column(type="date", name="DATA_FIM_VIGENCIA")
	 */
	private $dataFimVigencia;

	/**
	 * @ORM\Column(type="date", name="DATA_EXCLUSAO")
	 */
	private $dataExclusao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="GedTipoDocumento", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_GED_TIPO_DOCUMENTO", referencedColumnName="id")
     */
    private $gedTipoDocumento;

    /**
     * @ORM\OneToMany(targetEntity="GedVersaoDocumento", mappedBy="gedDocumentoDetalhe", cascade={"persist", "remove"})
     */
    private $listaGedVersaoDocumento;

    /**
     * @ORM\ManyToOne(targetEntity="GedDocumentoCabecalho", inversedBy="listaGedDocumentoDetalhe")
     * @ORM\JoinColumn(name="ID_GED_DOCUMENTO_CABECALHO", referencedColumnName="id")
     */
    private $gedDocumentoCabecalho;


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

    public function getPalavrasChave() 
	{
		return $this->palavrasChave;
	}

	public function setPalavrasChave($palavrasChave) 
	{
		$this->palavrasChave = $palavrasChave;
	}

    public function getPodeExcluir() 
	{
		return $this->podeExcluir;
	}

	public function setPodeExcluir($podeExcluir) 
	{
		$this->podeExcluir = $podeExcluir;
	}

    public function getPodeAlterar() 
	{
		return $this->podeAlterar;
	}

	public function setPodeAlterar($podeAlterar) 
	{
		$this->podeAlterar = $podeAlterar;
	}

    public function getAssinado() 
	{
		return $this->assinado;
	}

	public function setAssinado($assinado) 
	{
		$this->assinado = $assinado;
	}

    public function getDataFimVigencia() 
	{
		if ($this->dataFimVigencia != null) {
			return $this->dataFimVigencia->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataFimVigencia($dataFimVigencia) 
	{
		$this->dataFimVigencia = $dataFimVigencia != null ? new \DateTime($dataFimVigencia) : null;
	}

    public function getDataExclusao() 
	{
		if ($this->dataExclusao != null) {
			return $this->dataExclusao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataExclusao($dataExclusao) 
	{
		$this->dataExclusao = $dataExclusao != null ? new \DateTime($dataExclusao) : null;
	}

    public function getGedDocumentoCabecalho(): ?GedDocumentoCabecalho 
	{
		return $this->gedDocumentoCabecalho;
	}

	public function setGedDocumentoCabecalho(?GedDocumentoCabecalho $gedDocumentoCabecalho) 
	{
		$this->gedDocumentoCabecalho = $gedDocumentoCabecalho;
	}

    public function getGedTipoDocumento(): ?GedTipoDocumento 
	{
		return $this->gedTipoDocumento;
	}

	public function setGedTipoDocumento(?GedTipoDocumento $gedTipoDocumento) 
	{
		$this->gedTipoDocumento = $gedTipoDocumento;
	}

    public function getListaGedVersaoDocumento() 
	{
		return $this->listaGedVersaoDocumento->toArray();
	}

	public function setListaGedVersaoDocumento(array $listaGedVersaoDocumento) {
		$this->listaGedVersaoDocumento = new ArrayCollection();
		for ($i = 0; $i < count($listaGedVersaoDocumento); $i++) {
			$gedVersaoDocumento = $listaGedVersaoDocumento[$i];
			$gedVersaoDocumento->setGedDocumentoDetalhe($this);
			$this->listaGedVersaoDocumento->add($gedVersaoDocumento);
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

		
		$this->listaGedVersaoDocumento = new ArrayCollection();
		$listaGedVersaoDocumentoJson = $objetoJson->listaGedVersaoDocumento;
		if ($listaGedVersaoDocumentoJson != null) {
			for ($i = 0; $i < count($listaGedVersaoDocumentoJson); $i++) {
				$objeto = new GedVersaoDocumento($listaGedVersaoDocumentoJson[$i]);
				$objeto->setGedDocumentoDetalhe($this);
				$this->listaGedVersaoDocumento->add($objeto);
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
			$this->setPalavrasChave($objeto->palavrasChave);
			$this->setPodeExcluir($objeto->podeExcluir);
			$this->setPodeAlterar($objeto->podeAlterar);
			$this->setAssinado($objeto->assinado);
			$this->setDataFimVigencia($objeto->dataFimVigencia);
			$this->setDataExclusao($objeto->dataExclusao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'GedDocumentoDetalhe');
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
			'palavrasChave' => $this->getPalavrasChave(),
			'podeExcluir' => $this->getPodeExcluir(),
			'podeAlterar' => $this->getPodeAlterar(),
			'assinado' => $this->getAssinado(),
			'dataFimVigencia' => $this->getDataFimVigencia(),
			'dataExclusao' => $this->getDataExclusao(),
			'gedTipoDocumento' => $this->getGedTipoDocumento(),
			'listaGedVersaoDocumento' => $this->getListaGedVersaoDocumento(),
        ];
    }
}
