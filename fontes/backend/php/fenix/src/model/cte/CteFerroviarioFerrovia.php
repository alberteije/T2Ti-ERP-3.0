<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_FERROVIARIO_FERROVIA] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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

class CteFerroviarioFerrovia extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_FERROVIARIO_FERROVIA';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */

    /**
     * Gets e Sets
     */
    public function getIdAttribute() 
	{
		return $this->attributes['ID'];
	}

	public function setIdAttribute($id) 
	{
		$this->attributes['ID'] = $id;
	}

    public function getIdCteFerroviarioAttribute() 
	{
		return $this->attributes['ID_CTE_FERROVIARIO'];
	}

	public function setIdCteFerroviarioAttribute($idCteFerroviario) 
	{
		$this->attributes['ID_CTE_FERROVIARIO'] = $idCteFerroviario;
	}

    public function getCnpjAttribute() 
	{
		return $this->attributes['CNPJ'];
	}

	public function setCnpjAttribute($cnpj) 
	{
		$this->attributes['CNPJ'] = $cnpj;
	}

    public function getCodigoInternoAttribute() 
	{
		return $this->attributes['CODIGO_INTERNO'];
	}

	public function setCodigoInternoAttribute($codigoInterno) 
	{
		$this->attributes['CODIGO_INTERNO'] = $codigoInterno;
	}

    public function getIeAttribute() 
	{
		return $this->attributes['IE'];
	}

	public function setIeAttribute($ie) 
	{
		$this->attributes['IE'] = $ie;
	}

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getLogradouroAttribute() 
	{
		return $this->attributes['LOGRADOURO'];
	}

	public function setLogradouroAttribute($logradouro) 
	{
		$this->attributes['LOGRADOURO'] = $logradouro;
	}

    public function getNumeroAttribute() 
	{
		return $this->attributes['NUMERO'];
	}

	public function setNumeroAttribute($numero) 
	{
		$this->attributes['NUMERO'] = $numero;
	}

    public function getComplementoAttribute() 
	{
		return $this->attributes['COMPLEMENTO'];
	}

	public function setComplementoAttribute($complemento) 
	{
		$this->attributes['COMPLEMENTO'] = $complemento;
	}

    public function getBairroAttribute() 
	{
		return $this->attributes['BAIRRO'];
	}

	public function setBairroAttribute($bairro) 
	{
		$this->attributes['BAIRRO'] = $bairro;
	}

    public function getCodigoMunicipioAttribute() 
	{
		return $this->attributes['CODIGO_MUNICIPIO'];
	}

	public function setCodigoMunicipioAttribute($codigoMunicipio) 
	{
		$this->attributes['CODIGO_MUNICIPIO'] = $codigoMunicipio;
	}

    public function getNomeMunicipioAttribute() 
	{
		return $this->attributes['NOME_MUNICIPIO'];
	}

	public function setNomeMunicipioAttribute($nomeMunicipio) 
	{
		$this->attributes['NOME_MUNICIPIO'] = $nomeMunicipio;
	}

    public function getUfAttribute() 
	{
		return $this->attributes['UF'];
	}

	public function setUfAttribute($uf) 
	{
		$this->attributes['UF'] = $uf;
	}

    public function getCepAttribute() 
	{
		return $this->attributes['CEP'];
	}

	public function setCepAttribute($cep) 
	{
		$this->attributes['CEP'] = $cep;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteFerroviarioAttribute($objeto->idCteFerroviario);
			$this->setCnpjAttribute($objeto->cnpj);
			$this->setCodigoInternoAttribute($objeto->codigoInterno);
			$this->setIeAttribute($objeto->ie);
			$this->setNomeAttribute($objeto->nome);
			$this->setLogradouroAttribute($objeto->logradouro);
			$this->setNumeroAttribute($objeto->numero);
			$this->setComplementoAttribute($objeto->complemento);
			$this->setBairroAttribute($objeto->bairro);
			$this->setCodigoMunicipioAttribute($objeto->codigoMunicipio);
			$this->setNomeMunicipioAttribute($objeto->nomeMunicipio);
			$this->setUfAttribute($objeto->uf);
			$this->setCepAttribute($objeto->cep);

			// vincular objetos
        }
    }

    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getIdAttribute(),
			'idCteFerroviario' => $this->getIdCteFerroviarioAttribute(),
			'cnpj' => $this->getCnpjAttribute(),
			'codigoInterno' => $this->getCodigoInternoAttribute(),
			'ie' => $this->getIeAttribute(),
			'nome' => $this->getNomeAttribute(),
			'logradouro' => $this->getLogradouroAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'complemento' => $this->getComplementoAttribute(),
			'bairro' => $this->getBairroAttribute(),
			'codigoMunicipio' => $this->getCodigoMunicipioAttribute(),
			'nomeMunicipio' => $this->getNomeMunicipioAttribute(),
			'uf' => $this->getUfAttribute(),
			'cep' => $this->getCepAttribute(),
        ];
    }
}