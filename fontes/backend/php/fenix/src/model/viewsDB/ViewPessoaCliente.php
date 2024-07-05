<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_PESSOA_CLIENTE] 
                                                                                
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

class ViewPessoaCliente extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_PESSOA_CLIENTE';

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

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}

    public function getEmailAttribute() 
	{
		return $this->attributes['EMAIL'];
	}

	public function setEmailAttribute($email) 
	{
		$this->attributes['EMAIL'] = $email;
	}

    public function getSiteAttribute() 
	{
		return $this->attributes['SITE'];
	}

	public function setSiteAttribute($site) 
	{
		$this->attributes['SITE'] = $site;
	}

    public function getCpfCnpjAttribute() 
	{
		return $this->attributes['CPF_CNPJ'];
	}

	public function setCpfCnpjAttribute($cpfCnpj) 
	{
		$this->attributes['CPF_CNPJ'] = $cpfCnpj;
	}

    public function getRgIeAttribute() 
	{
		return $this->attributes['RG_IE'];
	}

	public function setRgIeAttribute($rgIe) 
	{
		$this->attributes['RG_IE'] = $rgIe;
	}

    public function getDesdeAttribute() 
	{
		return $this->attributes['DESDE'];
	}

	public function setDesdeAttribute($desde) 
	{
		$this->attributes['DESDE'] = $desde;
	}

    public function getTaxaDescontoAttribute() 
	{
		return (double)$this->attributes['TAXA_DESCONTO'];
	}

	public function setTaxaDescontoAttribute($taxaDesconto) 
	{
		$this->attributes['TAXA_DESCONTO'] = $taxaDesconto;
	}

    public function getLimiteCreditoAttribute() 
	{
		return (double)$this->attributes['LIMITE_CREDITO'];
	}

	public function setLimiteCreditoAttribute($limiteCredito) 
	{
		$this->attributes['LIMITE_CREDITO'] = $limiteCredito;
	}

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}

	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
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

    public function getCidadeAttribute() 
	{
		return $this->attributes['CIDADE'];
	}

	public function setCidadeAttribute($cidade) 
	{
		$this->attributes['CIDADE'] = $cidade;
	}

    public function getCepAttribute() 
	{
		return $this->attributes['CEP'];
	}

	public function setCepAttribute($cep) 
	{
		$this->attributes['CEP'] = $cep;
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

    public function getIdPessoaAttribute() 
	{
		return $this->attributes['ID_PESSOA'];
	}

	public function setIdPessoaAttribute($idPessoa) 
	{
		$this->attributes['ID_PESSOA'] = $idPessoa;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNomeAttribute($objeto->nome);
			$this->setTipoAttribute($objeto->tipo);
			$this->setEmailAttribute($objeto->email);
			$this->setSiteAttribute($objeto->site);
			$this->setCpfCnpjAttribute($objeto->cpfCnpj);
			$this->setRgIeAttribute($objeto->rgIe);
			$this->setDesdeAttribute($objeto->desde);
			$this->setTaxaDescontoAttribute($objeto->taxaDesconto);
			$this->setLimiteCreditoAttribute($objeto->limiteCredito);
			$this->setDataCadastroAttribute($objeto->dataCadastro);
			$this->setObservacaoAttribute($objeto->observacao);
			$this->setLogradouroAttribute($objeto->logradouro);
			$this->setNumeroAttribute($objeto->numero);
			$this->setComplementoAttribute($objeto->complemento);
			$this->setBairroAttribute($objeto->bairro);
			$this->setCidadeAttribute($objeto->cidade);
			$this->setCepAttribute($objeto->cep);
			$this->setMunicipioIbgeAttribute($objeto->municipioIbge);
			$this->setUfAttribute($objeto->uf);
			$this->setIdPessoaAttribute($objeto->idPessoa);

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
			'tipo' => $this->getTipoAttribute(),
			'email' => $this->getEmailAttribute(),
			'site' => $this->getSiteAttribute(),
			'cpfCnpj' => $this->getCpfCnpjAttribute(),
			'rgIe' => $this->getRgIeAttribute(),
			'desde' => $this->getDesdeAttribute(),
			'taxaDesconto' => $this->getTaxaDescontoAttribute(),
			'limiteCredito' => $this->getLimiteCreditoAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'logradouro' => $this->getLogradouroAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'complemento' => $this->getComplementoAttribute(),
			'bairro' => $this->getBairroAttribute(),
			'cidade' => $this->getCidadeAttribute(),
			'cep' => $this->getCepAttribute(),
			'municipioIbge' => $this->getMunicipioIbgeAttribute(),
			'uf' => $this->getUfAttribute(),
			'idPessoa' => $this->getIdPessoaAttribute(),
        ];
    }
}