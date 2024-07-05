<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DECLARACAO_IMPORTACAO] 
                                                                                
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
 * @ORM\Table(name="NFE_DECLARACAO_IMPORTACAO")
 */
class NfeDeclaracaoImportacao extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="NUMERO_DOCUMENTO")
	 */
	private $numeroDocumento;

	/**
	 * @ORM\Column(type="date", name="DATA_REGISTRO")
	 */
	private $dataRegistro;

	/**
	 * @ORM\Column(type="string", name="LOCAL_DESEMBARACO")
	 */
	private $localDesembaraco;

	/**
	 * @ORM\Column(type="string", name="UF_DESEMBARACO")
	 */
	private $ufDesembaraco;

	/**
	 * @ORM\Column(type="date", name="DATA_DESEMBARACO")
	 */
	private $dataDesembaraco;

	/**
	 * @ORM\Column(type="string", name="VIA_TRANSPORTE")
	 */
	private $viaTransporte;

	/**
	 * @ORM\Column(type="float", name="VALOR_AFRMM")
	 */
	private $valorAfrmm;

	/**
	 * @ORM\Column(type="string", name="FORMA_INTERMEDIACAO")
	 */
	private $formaIntermediacao;

	/**
	 * @ORM\Column(type="string", name="CNPJ")
	 */
	private $cnpj;

	/**
	 * @ORM\Column(type="string", name="UF_TERCEIRO")
	 */
	private $ufTerceiro;

	/**
	 * @ORM\Column(type="string", name="CODIGO_EXPORTADOR")
	 */
	private $codigoExportador;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToMany(targetEntity="NfeImportacaoDetalhe", mappedBy="nfeDeclaracaoImportacao", cascade={"persist", "remove"})
     */
    private $listaNfeImportacaoDetalhe;

    /**
     * @ORM\ManyToOne(targetEntity="NfeDetalhe", inversedBy="listaNfeDeclaracaoImportacao")
     * @ORM\JoinColumn(name="ID_NFE_DETALHE", referencedColumnName="id")
     */
    private $nfeDetalhe;


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

    public function getNumeroDocumento() 
	{
		return $this->numeroDocumento;
	}

	public function setNumeroDocumento($numeroDocumento) 
	{
		$this->numeroDocumento = $numeroDocumento;
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

    public function getLocalDesembaraco() 
	{
		return $this->localDesembaraco;
	}

	public function setLocalDesembaraco($localDesembaraco) 
	{
		$this->localDesembaraco = $localDesembaraco;
	}

    public function getUfDesembaraco() 
	{
		return $this->ufDesembaraco;
	}

	public function setUfDesembaraco($ufDesembaraco) 
	{
		$this->ufDesembaraco = $ufDesembaraco;
	}

    public function getDataDesembaraco() 
	{
		if ($this->dataDesembaraco != null) {
			return $this->dataDesembaraco->format('Y-m-d');
		} else {
			return null;
		}
	}
	public function setDataDesembaraco($dataDesembaraco) 
	{
		$this->dataDesembaraco = $dataDesembaraco != null ? new \DateTime($dataDesembaraco) : null;
	}

    public function getViaTransporte() 
	{
		return $this->viaTransporte;
	}

	public function setViaTransporte($viaTransporte) 
	{
		$this->viaTransporte = $viaTransporte;
	}

    public function getValorAfrmm() 
	{
		return $this->valorAfrmm;
	}

	public function setValorAfrmm($valorAfrmm) 
	{
		$this->valorAfrmm = $valorAfrmm;
	}

    public function getFormaIntermediacao() 
	{
		return $this->formaIntermediacao;
	}

	public function setFormaIntermediacao($formaIntermediacao) 
	{
		$this->formaIntermediacao = $formaIntermediacao;
	}

    public function getCnpj() 
	{
		return $this->cnpj;
	}

	public function setCnpj($cnpj) 
	{
		$this->cnpj = $cnpj;
	}

    public function getUfTerceiro() 
	{
		return $this->ufTerceiro;
	}

	public function setUfTerceiro($ufTerceiro) 
	{
		$this->ufTerceiro = $ufTerceiro;
	}

    public function getCodigoExportador() 
	{
		return $this->codigoExportador;
	}

	public function setCodigoExportador($codigoExportador) 
	{
		$this->codigoExportador = $codigoExportador;
	}

    public function getNfeDetalhe(): ?NfeDetalhe 
	{
		return $this->nfeDetalhe;
	}

	public function setNfeDetalhe(?NfeDetalhe $nfeDetalhe) 
	{
		$this->nfeDetalhe = $nfeDetalhe;
	}

    public function getListaNfeImportacaoDetalhe() 
	{
		return $this->listaNfeImportacaoDetalhe->toArray();
	}

	public function setListaNfeImportacaoDetalhe(array $listaNfeImportacaoDetalhe) {
		$this->listaNfeImportacaoDetalhe = new ArrayCollection();
		for ($i = 0; $i < count($listaNfeImportacaoDetalhe); $i++) {
			$nfeImportacaoDetalhe = $listaNfeImportacaoDetalhe[$i];
			$nfeImportacaoDetalhe->setNfeDeclaracaoImportacao($this);
			$this->listaNfeImportacaoDetalhe->add($nfeImportacaoDetalhe);
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

		
		$this->listaNfeImportacaoDetalhe = new ArrayCollection();
		$listaNfeImportacaoDetalheJson = $objetoJson->listaNfeImportacaoDetalhe;
		if ($listaNfeImportacaoDetalheJson != null) {
			for ($i = 0; $i < count($listaNfeImportacaoDetalheJson); $i++) {
				$objeto = new NfeImportacaoDetalhe($listaNfeImportacaoDetalheJson[$i]);
				$objeto->setNfeDeclaracaoImportacao($this);
				$this->listaNfeImportacaoDetalhe->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setNumeroDocumento($objeto->numeroDocumento);
			$this->setDataRegistro($objeto->dataRegistro);
			$this->setLocalDesembaraco($objeto->localDesembaraco);
			$this->setUfDesembaraco($objeto->ufDesembaraco);
			$this->setDataDesembaraco($objeto->dataDesembaraco);
			$this->setViaTransporte($objeto->viaTransporte);
			$this->setValorAfrmm($objeto->valorAfrmm);
			$this->setFormaIntermediacao($objeto->formaIntermediacao);
			$this->setCnpj($objeto->cnpj);
			$this->setUfTerceiro($objeto->ufTerceiro);
			$this->setCodigoExportador($objeto->codigoExportador);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'NfeDeclaracaoImportacao');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'numeroDocumento' => $this->getNumeroDocumento(),
			'dataRegistro' => $this->getDataRegistro(),
			'localDesembaraco' => $this->getLocalDesembaraco(),
			'ufDesembaraco' => $this->getUfDesembaraco(),
			'dataDesembaraco' => $this->getDataDesembaraco(),
			'viaTransporte' => $this->getViaTransporte(),
			'valorAfrmm' => $this->getValorAfrmm(),
			'formaIntermediacao' => $this->getFormaIntermediacao(),
			'cnpj' => $this->getCnpj(),
			'ufTerceiro' => $this->getUfTerceiro(),
			'codigoExportador' => $this->getCodigoExportador(),
			'listaNfeImportacaoDetalhe' => $this->getListaNfeImportacaoDetalhe(),
        ];
    }
}
