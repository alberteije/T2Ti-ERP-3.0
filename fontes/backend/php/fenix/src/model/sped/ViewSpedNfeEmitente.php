<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_SPED_NFE_EMITENTE] 
                                                                                
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

class ViewSpedNfeEmitente extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_SPED_NFE_EMITENTE';

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

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getCpfAttribute() 
	{
		return $this->attributes['CPF'];
	}

	public function setCpfAttribute($cpf) 
	{
		$this->attributes['CPF'] = $cpf;
	}

    public function getCnpjAttribute() 
	{
		return $this->attributes['CNPJ'];
	}

	public function setCnpjAttribute($cnpj) 
	{
		$this->attributes['CNPJ'] = $cnpj;
	}

    public function getInscricaoEstadualAttribute() 
	{
		return $this->attributes['INSCRICAO_ESTADUAL'];
	}

	public function setInscricaoEstadualAttribute($inscricaoEstadual) 
	{
		$this->attributes['INSCRICAO_ESTADUAL'] = $inscricaoEstadual;
	}

    public function getCodigoMunicipioAttribute() 
	{
		return $this->attributes['CODIGO_MUNICIPIO'];
	}

	public function setCodigoMunicipioAttribute($codigoMunicipio) 
	{
		$this->attributes['CODIGO_MUNICIPIO'] = $codigoMunicipio;
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


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNomeAttribute($objeto->nome);
			$this->setCpfAttribute($objeto->cpf);
			$this->setCnpjAttribute($objeto->cnpj);
			$this->setInscricaoEstadualAttribute($objeto->inscricaoEstadual);
			$this->setCodigoMunicipioAttribute($objeto->codigoMunicipio);
			$this->setLogradouroAttribute($objeto->logradouro);
			$this->setNumeroAttribute($objeto->numero);
			$this->setComplementoAttribute($objeto->complemento);
			$this->setBairroAttribute($objeto->bairro);

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
			'nome' => $this->getNomeAttribute(),
			'cpf' => $this->getCpfAttribute(),
			'cnpj' => $this->getCnpjAttribute(),
			'inscricaoEstadual' => $this->getInscricaoEstadualAttribute(),
			'codigoMunicipio' => $this->getCodigoMunicipioAttribute(),
			'logradouro' => $this->getLogradouroAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'complemento' => $this->getComplementoAttribute(),
			'bairro' => $this->getBairroAttribute(),
        ];
    }
}