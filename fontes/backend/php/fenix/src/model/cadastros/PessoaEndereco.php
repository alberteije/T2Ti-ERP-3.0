<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PESSOA_ENDERECO] 
                                                                                
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

class PessoaEndereco extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PESSOA_ENDERECO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['pessoa', ];
	
    /**
     * Relations
     */
    public function pessoa()
    {
    	return $this->belongsTo(Pessoa::class, 'ID_PESSOA', 'ID');
    }


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

    public function getBairroAttribute() 
	{
		return $this->attributes['BAIRRO'];
	}

	public function setBairroAttribute($bairro) 
	{
		$this->attributes['BAIRRO'] = $bairro;
	}

    public function getMunicipioIbgeAttribute() 
	{
		return $this->attributes['MUNICIPIO_IBGE'];
	}

	public function setMunicipioIbgeAttribute($municipioIbge) 
	{
		$this->attributes['MUNICIPIO_IBGE'] = $municipioIbge;
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

    public function getCidadeAttribute() 
	{
		return $this->attributes['CIDADE'];
	}

	public function setCidadeAttribute($cidade) 
	{
		$this->attributes['CIDADE'] = $cidade;
	}

    public function getComplementoAttribute() 
	{
		return $this->attributes['COMPLEMENTO'];
	}

	public function setComplementoAttribute($complemento) 
	{
		$this->attributes['COMPLEMENTO'] = $complemento;
	}

    public function getPrincipalAttribute() 
	{
		return $this->attributes['PRINCIPAL'];
	}

	public function setPrincipalAttribute($principal) 
	{
		$this->attributes['PRINCIPAL'] = $principal;
	}

    public function getEntregaAttribute() 
	{
		return $this->attributes['ENTREGA'];
	}

	public function setEntregaAttribute($entrega) 
	{
		$this->attributes['ENTREGA'] = $entrega;
	}

    public function getCobrancaAttribute() 
	{
		return $this->attributes['COBRANCA'];
	}

	public function setCobrancaAttribute($cobranca) 
	{
		$this->attributes['COBRANCA'] = $cobranca;
	}

    public function getCorrespondenciaAttribute() 
	{
		return $this->attributes['CORRESPONDENCIA'];
	}

	public function setCorrespondenciaAttribute($correspondencia) 
	{
		$this->attributes['CORRESPONDENCIA'] = $correspondencia;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setLogradouroAttribute($objeto->logradouro);
			$this->setNumeroAttribute($objeto->numero);
			$this->setBairroAttribute($objeto->bairro);
			$this->setMunicipioIbgeAttribute($objeto->municipioIbge);
			$this->setUfAttribute($objeto->uf);
			$this->setCepAttribute($objeto->cep);
			$this->setCidadeAttribute($objeto->cidade);
			$this->setComplementoAttribute($objeto->complemento);
			$this->setPrincipalAttribute($objeto->principal);
			$this->setEntregaAttribute($objeto->entrega);
			$this->setCobrancaAttribute($objeto->cobranca);
			$this->setCorrespondenciaAttribute($objeto->correspondencia);

			// vincular objetos
			$pessoa = new Pessoa();
			$pessoa->mapear($objeto->pessoa);
			$this->pessoa()->associate($pessoa);

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
			'logradouro' => $this->getLogradouroAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'bairro' => $this->getBairroAttribute(),
			'municipioIbge' => $this->getMunicipioIbgeAttribute(),
			'uf' => $this->getUfAttribute(),
			'cep' => $this->getCepAttribute(),
			'cidade' => $this->getCidadeAttribute(),
			'complemento' => $this->getComplementoAttribute(),
			'principal' => $this->getPrincipalAttribute(),
			'entrega' => $this->getEntregaAttribute(),
			'cobranca' => $this->getCobrancaAttribute(),
			'correspondencia' => $this->getCorrespondenciaAttribute(),
			'pessoa' => $this->pessoa,
        ];
    }
}