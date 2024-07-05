<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [GED_VERSAO_DOCUMENTO] 
                                                                                
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
 * @ORM\Table(name="GED_VERSAO_DOCUMENTO")
 */
class GedVersaoDocumento extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="integer", name="VERSAO")
	 */
	private $versao;

	/**
	 * @ORM\Column(type="date", name="DATA_VERSAO")
	 */
	private $dataVersao;

	/**
	 * @ORM\Column(type="string", name="HORA_VERSAO")
	 */
	private $horaVersao;

	/**
	 * @ORM\Column(type="string", name="HASH_ARQUIVO")
	 */
	private $hashArquivo;

	/**
	 * @ORM\Column(type="string", name="CAMINHO")
	 */
	private $caminho;

	/**
	 * @ORM\Column(type="string", name="ACAO")
	 */
	private $acao;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToOne(targetEntity="Colaborador", fetch="EAGER")
     * @ORM\JoinColumn(name="ID_COLABORADOR", referencedColumnName="id")
     */
    private $colaborador;

    /**
     * @ORM\ManyToOne(targetEntity="GedDocumentoDetalhe", inversedBy="listaGedVersaoDocumento")
     * @ORM\JoinColumn(name="ID_GED_DOCUMENTO_DETALHE", referencedColumnName="id")
     */
    private $gedDocumentoDetalhe;


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

    public function getVersao() 
	{
		return $this->versao;
	}

	public function setVersao($versao) 
	{
		$this->versao = $versao;
	}

    public function getDataVersao() 
	{
		if ($this->dataVersao != null) {
			return $this->dataVersao->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataVersao($dataVersao) 
	{
		$this->dataVersao = $dataVersao != null ? new \DateTime($dataVersao) : null;
	}

    public function getHoraVersao() 
	{
		return $this->horaVersao;
	}

	public function setHoraVersao($horaVersao) 
	{
		$this->horaVersao = $horaVersao;
	}

    public function getHashArquivo() 
	{
		return $this->hashArquivo;
	}

	public function setHashArquivo($hashArquivo) 
	{
		$this->hashArquivo = $hashArquivo;
	}

    public function getCaminho() 
	{
		return $this->caminho;
	}

	public function setCaminho($caminho) 
	{
		$this->caminho = $caminho;
	}

    public function getAcao() 
	{
		return $this->acao;
	}

	public function setAcao($acao) 
	{
		$this->acao = $acao;
	}

    public function getGedDocumentoDetalhe(): ?GedDocumentoDetalhe 
	{
		return $this->gedDocumentoDetalhe;
	}

	public function setGedDocumentoDetalhe(?GedDocumentoDetalhe $gedDocumentoDetalhe) 
	{
		$this->gedDocumentoDetalhe = $gedDocumentoDetalhe;
	}

    public function getColaborador(): ?Colaborador 
	{
		return $this->colaborador;
	}

	public function setColaborador(?Colaborador $colaborador) 
	{
		$this->colaborador = $colaborador;
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
			$this->setVersao($objeto->versao);
			$this->setDataVersao($objeto->dataVersao);
			$this->setHoraVersao($objeto->horaVersao);
			$this->setHashArquivo($objeto->hashArquivo);
			$this->setCaminho($objeto->caminho);
			$this->setAcao($objeto->acao);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'GedVersaoDocumento');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'versao' => $this->getVersao(),
			'dataVersao' => $this->getDataVersao(),
			'horaVersao' => $this->getHoraVersao(),
			'hashArquivo' => $this->getHashArquivo(),
			'caminho' => $this->getCaminho(),
			'acao' => $this->getAcao(),
			'colaborador' => $this->getColaborador(),
        ];
    }
}
