<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMISSAO_PERFIL] 
                                                                                
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
 * @ORM\Table(name="COMISSAO_PERFIL")
 */
class ComissaoPerfil extends ModelBase implements \JsonSerializable
{
	/**
	 * @ORM\Id
	 * @ORM\Column(type="integer")
	 * @ORM\GeneratedValue(strategy="AUTO")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", name="CODIGO")
	 */
	private $codigo;

	/**
	 * @ORM\Column(type="string", name="NOME")
	 */
	private $nome;


    /**
     * Relations
     */
    
    /**
     * @ORM\OneToMany(targetEntity="ComissaoObjetivo", mappedBy="comissaoPerfil", cascade={"persist", "remove"})
     */
    private $listaComissaoObjetivo;


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

    public function getCodigo() 
	{
		return $this->codigo;
	}

	public function setCodigo($codigo) 
	{
		$this->codigo = $codigo;
	}

    public function getNome() 
	{
		return $this->nome;
	}

	public function setNome($nome) 
	{
		$this->nome = $nome;
	}

    public function getListaComissaoObjetivo() 
	{
		return $this->listaComissaoObjetivo->toArray();
	}

	public function setListaComissaoObjetivo(array $listaComissaoObjetivo) {
		$this->listaComissaoObjetivo = new ArrayCollection();
		for ($i = 0; $i < count($listaComissaoObjetivo); $i++) {
			$comissaoObjetivo = $listaComissaoObjetivo[$i];
			$comissaoObjetivo->setComissaoPerfil($this);
			$this->listaComissaoObjetivo->add($comissaoObjetivo);
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

		
		$this->listaComissaoObjetivo = new ArrayCollection();
		$listaComissaoObjetivoJson = $objetoJson->listaComissaoObjetivo;
		if ($listaComissaoObjetivoJson != null) {
			for ($i = 0; $i < count($listaComissaoObjetivoJson); $i++) {
				$objeto = new ComissaoObjetivo($listaComissaoObjetivoJson[$i]);
				$objeto->setComissaoPerfil($this);
				$this->listaComissaoObjetivo->add($objeto);
			}
		}

    }

    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
			$this->setCodigo($objeto->codigo);
			$this->setNome($objeto->nome);
		}
    }


    /**
     * Validation
     */
    public function validarObjetoRequisicao($objJson, $id)
    {
        return parent::validarObjeto($objJson, $id, 'ComissaoPerfil');
    }


    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getId(),
			'codigo' => $this->getCodigo(),
			'nome' => $this->getNome(),
			'listaComissaoObjetivo' => $this->getListaComissaoObjetivo(),
        ];
    }
}
