<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_EMITENTE] 
                                                                                
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

class NfeEmitente extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_EMITENTE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeCabecalho()
    {
    	return $this->belongsTo(NfeCabecalho::class, 'ID_NFE_CABECALHO', 'ID');
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

    public function getCnpjAttribute() 
	{
		return $this->attributes['CNPJ'];
	}

	public function setCnpjAttribute($cnpj) 
	{
		$this->attributes['CNPJ'] = $cnpj;
	}

    public function getCpfAttribute() 
	{
		return $this->attributes['CPF'];
	}

	public function setCpfAttribute($cpf) 
	{
		$this->attributes['CPF'] = $cpf;
	}

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getFantasiaAttribute() 
	{
		return $this->attributes['FANTASIA'];
	}

	public function setFantasiaAttribute($fantasia) 
	{
		$this->attributes['FANTASIA'] = $fantasia;
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

    public function getCodigoPaisAttribute() 
	{
		return $this->attributes['CODIGO_PAIS'];
	}

	public function setCodigoPaisAttribute($codigoPais) 
	{
		$this->attributes['CODIGO_PAIS'] = $codigoPais;
	}

    public function getNomePaisAttribute() 
	{
		return $this->attributes['NOME_PAIS'];
	}

	public function setNomePaisAttribute($nomePais) 
	{
		$this->attributes['NOME_PAIS'] = $nomePais;
	}

    public function getTelefoneAttribute() 
	{
		return $this->attributes['TELEFONE'];
	}

	public function setTelefoneAttribute($telefone) 
	{
		$this->attributes['TELEFONE'] = $telefone;
	}

    public function getInscricaoEstadualAttribute() 
	{
		return $this->attributes['INSCRICAO_ESTADUAL'];
	}

	public function setInscricaoEstadualAttribute($inscricaoEstadual) 
	{
		$this->attributes['INSCRICAO_ESTADUAL'] = $inscricaoEstadual;
	}

    public function getInscricaoEstadualStAttribute() 
	{
		return $this->attributes['INSCRICAO_ESTADUAL_ST'];
	}

	public function setInscricaoEstadualStAttribute($inscricaoEstadualSt) 
	{
		$this->attributes['INSCRICAO_ESTADUAL_ST'] = $inscricaoEstadualSt;
	}

    public function getInscricaoMunicipalAttribute() 
	{
		return $this->attributes['INSCRICAO_MUNICIPAL'];
	}

	public function setInscricaoMunicipalAttribute($inscricaoMunicipal) 
	{
		$this->attributes['INSCRICAO_MUNICIPAL'] = $inscricaoMunicipal;
	}

    public function getCnaeAttribute() 
	{
		return $this->attributes['CNAE'];
	}

	public function setCnaeAttribute($cnae) 
	{
		$this->attributes['CNAE'] = $cnae;
	}

    public function getCrtAttribute() 
	{
		return $this->attributes['CRT'];
	}

	public function setCrtAttribute($crt) 
	{
		$this->attributes['CRT'] = $crt;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCnpjAttribute($objeto->cnpj);
			$this->setCpfAttribute($objeto->cpf);
			$this->setNomeAttribute($objeto->nome);
			$this->setFantasiaAttribute($objeto->fantasia);
			$this->setLogradouroAttribute($objeto->logradouro);
			$this->setNumeroAttribute($objeto->numero);
			$this->setComplementoAttribute($objeto->complemento);
			$this->setBairroAttribute($objeto->bairro);
			$this->setCodigoMunicipioAttribute($objeto->codigoMunicipio);
			$this->setNomeMunicipioAttribute($objeto->nomeMunicipio);
			$this->setUfAttribute($objeto->uf);
			$this->setCepAttribute($objeto->cep);
			$this->setCodigoPaisAttribute($objeto->codigoPais);
			$this->setNomePaisAttribute($objeto->nomePais);
			$this->setTelefoneAttribute($objeto->telefone);
			$this->setInscricaoEstadualAttribute($objeto->inscricaoEstadual);
			$this->setInscricaoEstadualStAttribute($objeto->inscricaoEstadualSt);
			$this->setInscricaoMunicipalAttribute($objeto->inscricaoMunicipal);
			$this->setCnaeAttribute($objeto->cnae);
			$this->setCrtAttribute($objeto->crt);

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
			'cnpj' => $this->getCnpjAttribute(),
			'cpf' => $this->getCpfAttribute(),
			'nome' => $this->getNomeAttribute(),
			'fantasia' => $this->getFantasiaAttribute(),
			'logradouro' => $this->getLogradouroAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'complemento' => $this->getComplementoAttribute(),
			'bairro' => $this->getBairroAttribute(),
			'codigoMunicipio' => $this->getCodigoMunicipioAttribute(),
			'nomeMunicipio' => $this->getNomeMunicipioAttribute(),
			'uf' => $this->getUfAttribute(),
			'cep' => $this->getCepAttribute(),
			'codigoPais' => $this->getCodigoPaisAttribute(),
			'nomePais' => $this->getNomePaisAttribute(),
			'telefone' => $this->getTelefoneAttribute(),
			'inscricaoEstadual' => $this->getInscricaoEstadualAttribute(),
			'inscricaoEstadualSt' => $this->getInscricaoEstadualStAttribute(),
			'inscricaoMunicipal' => $this->getInscricaoMunicipalAttribute(),
			'cnae' => $this->getCnaeAttribute(),
			'crt' => $this->getCrtAttribute(),
        ];
    }
}