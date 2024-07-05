<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [EMPRESA] 
                                                                                
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

class Empresa extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'EMPRESA';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['listaEmpresaContato', 'listaEmpresaEndereco', 'listaEmpresaTelefone', ];
	
    /**
     * Relations
     */
    public function listaEmpresaContato()
    {
    	return $this->hasMany(EmpresaContato::class, 'ID_EMPRESA', 'ID');
    }

    public function listaEmpresaEndereco()
    {
    	return $this->hasMany(EmpresaEndereco::class, 'ID_EMPRESA', 'ID');
    }

    public function listaEmpresaTelefone()
    {
    	return $this->hasMany(EmpresaTelefone::class, 'ID_EMPRESA', 'ID');
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

    public function getRazaoSocialAttribute() 
	{
		return $this->attributes['RAZAO_SOCIAL'];
	}

	public function setRazaoSocialAttribute($razaoSocial) 
	{
		$this->attributes['RAZAO_SOCIAL'] = $razaoSocial;
	}

    public function getNomeFantasiaAttribute() 
	{
		return $this->attributes['NOME_FANTASIA'];
	}

	public function setNomeFantasiaAttribute($nomeFantasia) 
	{
		$this->attributes['NOME_FANTASIA'] = $nomeFantasia;
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

    public function getInscricaoMunicipalAttribute() 
	{
		return $this->attributes['INSCRICAO_MUNICIPAL'];
	}

	public function setInscricaoMunicipalAttribute($inscricaoMunicipal) 
	{
		$this->attributes['INSCRICAO_MUNICIPAL'] = $inscricaoMunicipal;
	}

    public function getTipoRegimeAttribute() 
	{
		return $this->attributes['TIPO_REGIME'];
	}

	public function setTipoRegimeAttribute($tipoRegime) 
	{
		$this->attributes['TIPO_REGIME'] = $tipoRegime;
	}

    public function getCrtAttribute() 
	{
		return $this->attributes['CRT'];
	}

	public function setCrtAttribute($crt) 
	{
		$this->attributes['CRT'] = $crt;
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

    public function getContatoAttribute() 
	{
		return $this->attributes['CONTATO'];
	}

	public function setContatoAttribute($contato) 
	{
		$this->attributes['CONTATO'] = $contato;
	}

    public function getDataConstituicaoAttribute() 
	{
		return $this->attributes['DATA_CONSTITUICAO'];
	}

	public function setDataConstituicaoAttribute($dataConstituicao) 
	{
		$this->attributes['DATA_CONSTITUICAO'] = $dataConstituicao;
	}

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}

    public function getInscricaoJuntaComercialAttribute() 
	{
		return $this->attributes['INSCRICAO_JUNTA_COMERCIAL'];
	}

	public function setInscricaoJuntaComercialAttribute($inscricaoJuntaComercial) 
	{
		$this->attributes['INSCRICAO_JUNTA_COMERCIAL'] = $inscricaoJuntaComercial;
	}

    public function getDataInscJuntaComercialAttribute() 
	{
		return $this->attributes['DATA_INSC_JUNTA_COMERCIAL'];
	}

	public function setDataInscJuntaComercialAttribute($dataInscJuntaComercial) 
	{
		$this->attributes['DATA_INSC_JUNTA_COMERCIAL'] = $dataInscJuntaComercial;
	}

    public function getCodigoIbgeCidadeAttribute() 
	{
		return $this->attributes['CODIGO_IBGE_CIDADE'];
	}

	public function setCodigoIbgeCidadeAttribute($codigoIbgeCidade) 
	{
		$this->attributes['CODIGO_IBGE_CIDADE'] = $codigoIbgeCidade;
	}

    public function getCodigoIbgeUfAttribute() 
	{
		return $this->attributes['CODIGO_IBGE_UF'];
	}

	public function setCodigoIbgeUfAttribute($codigoIbgeUf) 
	{
		$this->attributes['CODIGO_IBGE_UF'] = $codigoIbgeUf;
	}

    public function getCeiAttribute() 
	{
		return $this->attributes['CEI'];
	}

	public function setCeiAttribute($cei) 
	{
		$this->attributes['CEI'] = $cei;
	}

    public function getCodigoCnaePrincipalAttribute() 
	{
		return $this->attributes['CODIGO_CNAE_PRINCIPAL'];
	}

	public function setCodigoCnaePrincipalAttribute($codigoCnaePrincipal) 
	{
		$this->attributes['CODIGO_CNAE_PRINCIPAL'] = $codigoCnaePrincipal;
	}

    public function getImagemLogotipoAttribute() 
	{
		return $this->attributes['IMAGEM_LOGOTIPO'];
	}

	public function setImagemLogotipoAttribute($imagemLogotipo) 
	{
		$this->attributes['IMAGEM_LOGOTIPO'] = $imagemLogotipo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setRazaoSocialAttribute($objeto->razaoSocial);
			$this->setNomeFantasiaAttribute($objeto->nomeFantasia);
			$this->setCnpjAttribute($objeto->cnpj);
			$this->setInscricaoEstadualAttribute($objeto->inscricaoEstadual);
			$this->setInscricaoMunicipalAttribute($objeto->inscricaoMunicipal);
			$this->setTipoRegimeAttribute($objeto->tipoRegime);
			$this->setCrtAttribute($objeto->crt);
			$this->setEmailAttribute($objeto->email);
			$this->setSiteAttribute($objeto->site);
			$this->setContatoAttribute($objeto->contato);
			$this->setDataConstituicaoAttribute($objeto->dataConstituicao);
			$this->setTipoAttribute($objeto->tipo);
			$this->setInscricaoJuntaComercialAttribute($objeto->inscricaoJuntaComercial);
			$this->setDataInscJuntaComercialAttribute($objeto->dataInscJuntaComercial);
			$this->setCodigoIbgeCidadeAttribute($objeto->codigoIbgeCidade);
			$this->setCodigoIbgeUfAttribute($objeto->codigoIbgeUf);
			$this->setCeiAttribute($objeto->cei);
			$this->setCodigoCnaePrincipalAttribute($objeto->codigoCnaePrincipal);
			$this->setImagemLogotipoAttribute($objeto->imagemLogotipo);

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
			'razaoSocial' => $this->getRazaoSocialAttribute(),
			'nomeFantasia' => $this->getNomeFantasiaAttribute(),
			'cnpj' => $this->getCnpjAttribute(),
			'inscricaoEstadual' => $this->getInscricaoEstadualAttribute(),
			'inscricaoMunicipal' => $this->getInscricaoMunicipalAttribute(),
			'tipoRegime' => $this->getTipoRegimeAttribute(),
			'crt' => $this->getCrtAttribute(),
			'email' => $this->getEmailAttribute(),
			'site' => $this->getSiteAttribute(),
			'contato' => $this->getContatoAttribute(),
			'dataConstituicao' => $this->getDataConstituicaoAttribute(),
			'tipo' => $this->getTipoAttribute(),
			'inscricaoJuntaComercial' => $this->getInscricaoJuntaComercialAttribute(),
			'dataInscJuntaComercial' => $this->getDataInscJuntaComercialAttribute(),
			'codigoIbgeCidade' => $this->getCodigoIbgeCidadeAttribute(),
			'codigoIbgeUf' => $this->getCodigoIbgeUfAttribute(),
			'cei' => $this->getCeiAttribute(),
			'codigoCnaePrincipal' => $this->getCodigoCnaePrincipalAttribute(),
			'imagemLogotipo' => $this->getImagemLogotipoAttribute(),
			'listaEmpresaContato' => $this->listaEmpresaContato,
			'listaEmpresaEndereco' => $this->listaEmpresaEndereco,
			'listaEmpresaTelefone' => $this->listaEmpresaTelefone,
        ];
    }
}