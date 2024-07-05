<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_PESSOA_VENDEDOR] 
                                                                                
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

class ViewPessoaVendedor extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VIEW_PESSOA_VENDEDOR';

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

    public function getMatriculaAttribute() 
	{
		return $this->attributes['MATRICULA'];
	}

	public function setMatriculaAttribute($matricula) 
	{
		$this->attributes['MATRICULA'] = $matricula;
	}

    public function getDataCadastroAttribute() 
	{
		return $this->attributes['DATA_CADASTRO'];
	}

	public function setDataCadastroAttribute($dataCadastro) 
	{
		$this->attributes['DATA_CADASTRO'] = $dataCadastro;
	}

    public function getDataAdmissaoAttribute() 
	{
		return $this->attributes['DATA_ADMISSAO'];
	}

	public function setDataAdmissaoAttribute($dataAdmissao) 
	{
		$this->attributes['DATA_ADMISSAO'] = $dataAdmissao;
	}

    public function getDataDemissaoAttribute() 
	{
		return $this->attributes['DATA_DEMISSAO'];
	}

	public function setDataDemissaoAttribute($dataDemissao) 
	{
		$this->attributes['DATA_DEMISSAO'] = $dataDemissao;
	}

    public function getCtpsNumeroAttribute() 
	{
		return $this->attributes['CTPS_NUMERO'];
	}

	public function setCtpsNumeroAttribute($ctpsNumero) 
	{
		$this->attributes['CTPS_NUMERO'] = $ctpsNumero;
	}

    public function getCtpsSerieAttribute() 
	{
		return $this->attributes['CTPS_SERIE'];
	}

	public function setCtpsSerieAttribute($ctpsSerie) 
	{
		$this->attributes['CTPS_SERIE'] = $ctpsSerie;
	}

    public function getCtpsDataExpedicaoAttribute() 
	{
		return $this->attributes['CTPS_DATA_EXPEDICAO'];
	}

	public function setCtpsDataExpedicaoAttribute($ctpsDataExpedicao) 
	{
		$this->attributes['CTPS_DATA_EXPEDICAO'] = $ctpsDataExpedicao;
	}

    public function getCtpsUfAttribute() 
	{
		return $this->attributes['CTPS_UF'];
	}

	public function setCtpsUfAttribute($ctpsUf) 
	{
		$this->attributes['CTPS_UF'] = $ctpsUf;
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

    public function getIdCargoAttribute() 
	{
		return $this->attributes['ID_CARGO'];
	}

	public function setIdCargoAttribute($idCargo) 
	{
		$this->attributes['ID_CARGO'] = $idCargo;
	}

    public function getIdSetorAttribute() 
	{
		return $this->attributes['ID_SETOR'];
	}

	public function setIdSetorAttribute($idSetor) 
	{
		$this->attributes['ID_SETOR'] = $idSetor;
	}

    public function getComissaoAttribute() 
	{
		return (double)$this->attributes['COMISSAO'];
	}

	public function setComissaoAttribute($comissao) 
	{
		$this->attributes['COMISSAO'] = $comissao;
	}

    public function getMetaVendaAttribute() 
	{
		return (double)$this->attributes['META_VENDA'];
	}

	public function setMetaVendaAttribute($metaVenda) 
	{
		$this->attributes['META_VENDA'] = $metaVenda;
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
			$this->setMatriculaAttribute($objeto->matricula);
			$this->setDataCadastroAttribute($objeto->dataCadastro);
			$this->setDataAdmissaoAttribute($objeto->dataAdmissao);
			$this->setDataDemissaoAttribute($objeto->dataDemissao);
			$this->setCtpsNumeroAttribute($objeto->ctpsNumero);
			$this->setCtpsSerieAttribute($objeto->ctpsSerie);
			$this->setCtpsDataExpedicaoAttribute($objeto->ctpsDataExpedicao);
			$this->setCtpsUfAttribute($objeto->ctpsUf);
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
			$this->setIdCargoAttribute($objeto->idCargo);
			$this->setIdSetorAttribute($objeto->idSetor);
			$this->setComissaoAttribute($objeto->comissao);
			$this->setMetaVendaAttribute($objeto->metaVenda);

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
			'matricula' => $this->getMatriculaAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'dataAdmissao' => $this->getDataAdmissaoAttribute(),
			'dataDemissao' => $this->getDataDemissaoAttribute(),
			'ctpsNumero' => $this->getCtpsNumeroAttribute(),
			'ctpsSerie' => $this->getCtpsSerieAttribute(),
			'ctpsDataExpedicao' => $this->getCtpsDataExpedicaoAttribute(),
			'ctpsUf' => $this->getCtpsUfAttribute(),
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
			'idCargo' => $this->getIdCargoAttribute(),
			'idSetor' => $this->getIdSetorAttribute(),
			'comissao' => $this->getComissaoAttribute(),
			'metaVenda' => $this->getMetaVendaAttribute(),
        ];
    }
}