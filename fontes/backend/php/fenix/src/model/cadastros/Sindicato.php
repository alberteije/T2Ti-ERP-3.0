<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [SINDICATO] 
                                                                                
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

class Sindicato extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'SINDICATO';

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

    public function getCodigoBancoAttribute() 
	{
		return $this->attributes['CODIGO_BANCO'];
	}

	public function setCodigoBancoAttribute($codigoBanco) 
	{
		$this->attributes['CODIGO_BANCO'] = $codigoBanco;
	}

    public function getCodigoAgenciaAttribute() 
	{
		return $this->attributes['CODIGO_AGENCIA'];
	}

	public function setCodigoAgenciaAttribute($codigoAgencia) 
	{
		$this->attributes['CODIGO_AGENCIA'] = $codigoAgencia;
	}

    public function getContaBancoAttribute() 
	{
		return $this->attributes['CONTA_BANCO'];
	}

	public function setContaBancoAttribute($contaBanco) 
	{
		$this->attributes['CONTA_BANCO'] = $contaBanco;
	}

    public function getCodigoCedenteAttribute() 
	{
		return $this->attributes['CODIGO_CEDENTE'];
	}

	public function setCodigoCedenteAttribute($codigoCedente) 
	{
		$this->attributes['CODIGO_CEDENTE'] = $codigoCedente;
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

    public function getFone1Attribute() 
	{
		return $this->attributes['FONE1'];
	}

	public function setFone1Attribute($fone1) 
	{
		$this->attributes['FONE1'] = $fone1;
	}

    public function getFone2Attribute() 
	{
		return $this->attributes['FONE2'];
	}

	public function setFone2Attribute($fone2) 
	{
		$this->attributes['FONE2'] = $fone2;
	}

    public function getEmailAttribute() 
	{
		return $this->attributes['EMAIL'];
	}

	public function setEmailAttribute($email) 
	{
		$this->attributes['EMAIL'] = $email;
	}

    public function getTipoSindicatoAttribute() 
	{
		return $this->attributes['TIPO_SINDICATO'];
	}

	public function setTipoSindicatoAttribute($tipoSindicato) 
	{
		$this->attributes['TIPO_SINDICATO'] = $tipoSindicato;
	}

    public function getDataBaseAttribute() 
	{
		return $this->attributes['DATA_BASE'];
	}

	public function setDataBaseAttribute($dataBase) 
	{
		$this->attributes['DATA_BASE'] = $dataBase;
	}

    public function getPisoSalarialAttribute() 
	{
		return (double)$this->attributes['PISO_SALARIAL'];
	}

	public function setPisoSalarialAttribute($pisoSalarial) 
	{
		$this->attributes['PISO_SALARIAL'] = $pisoSalarial;
	}

    public function getCnpjAttribute() 
	{
		return $this->attributes['CNPJ'];
	}

	public function setCnpjAttribute($cnpj) 
	{
		$this->attributes['CNPJ'] = $cnpj;
	}

    public function getClassificacaoContabilContaAttribute() 
	{
		return $this->attributes['CLASSIFICACAO_CONTABIL_CONTA'];
	}

	public function setClassificacaoContabilContaAttribute($classificacaoContabilConta) 
	{
		$this->attributes['CLASSIFICACAO_CONTABIL_CONTA'] = $classificacaoContabilConta;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNomeAttribute($objeto->nome);
			$this->setCodigoBancoAttribute($objeto->codigoBanco);
			$this->setCodigoAgenciaAttribute($objeto->codigoAgencia);
			$this->setContaBancoAttribute($objeto->contaBanco);
			$this->setCodigoCedenteAttribute($objeto->codigoCedente);
			$this->setLogradouroAttribute($objeto->logradouro);
			$this->setNumeroAttribute($objeto->numero);
			$this->setBairroAttribute($objeto->bairro);
			$this->setMunicipioIbgeAttribute($objeto->municipioIbge);
			$this->setUfAttribute($objeto->uf);
			$this->setFone1Attribute($objeto->fone1);
			$this->setFone2Attribute($objeto->fone2);
			$this->setEmailAttribute($objeto->email);
			$this->setTipoSindicatoAttribute($objeto->tipoSindicato);
			$this->setDataBaseAttribute($objeto->dataBase);
			$this->setPisoSalarialAttribute($objeto->pisoSalarial);
			$this->setCnpjAttribute($objeto->cnpj);
			$this->setClassificacaoContabilContaAttribute($objeto->classificacaoContabilConta);

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
			'codigoBanco' => $this->getCodigoBancoAttribute(),
			'codigoAgencia' => $this->getCodigoAgenciaAttribute(),
			'contaBanco' => $this->getContaBancoAttribute(),
			'codigoCedente' => $this->getCodigoCedenteAttribute(),
			'logradouro' => $this->getLogradouroAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'bairro' => $this->getBairroAttribute(),
			'municipioIbge' => $this->getMunicipioIbgeAttribute(),
			'uf' => $this->getUfAttribute(),
			'fone1' => $this->getFone1Attribute(),
			'fone2' => $this->getFone2Attribute(),
			'email' => $this->getEmailAttribute(),
			'tipoSindicato' => $this->getTipoSindicatoAttribute(),
			'dataBase' => $this->getDataBaseAttribute(),
			'pisoSalarial' => $this->getPisoSalarialAttribute(),
			'cnpj' => $this->getCnpjAttribute(),
			'classificacaoContabilConta' => $this->getClassificacaoContabilContaAttribute(),
        ];
    }
}