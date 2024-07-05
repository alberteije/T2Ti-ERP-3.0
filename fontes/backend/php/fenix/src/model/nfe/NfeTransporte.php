<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_TRANSPORTE] 
                                                                                
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

class NfeTransporte extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_TRANSPORTE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['transportadora', ];
	
    /**
     * Relations
     */
    public function nfeCabecalho()
    {
    	return $this->belongsTo(NfeCabecalho::class, 'ID_NFE_CABECALHO', 'ID');
    }

    public function transportadora()
    {
    	return $this->belongsTo(Transportadora::class, 'ID_TRANSPORTADORA', 'ID');
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

    public function getModalidadeFreteAttribute() 
	{
		return $this->attributes['MODALIDADE_FRETE'];
	}

	public function setModalidadeFreteAttribute($modalidadeFrete) 
	{
		$this->attributes['MODALIDADE_FRETE'] = $modalidadeFrete;
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

    public function getInscricaoEstadualAttribute() 
	{
		return $this->attributes['INSCRICAO_ESTADUAL'];
	}

	public function setInscricaoEstadualAttribute($inscricaoEstadual) 
	{
		$this->attributes['INSCRICAO_ESTADUAL'] = $inscricaoEstadual;
	}

    public function getEnderecoAttribute() 
	{
		return $this->attributes['ENDERECO'];
	}

	public function setEnderecoAttribute($endereco) 
	{
		$this->attributes['ENDERECO'] = $endereco;
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

    public function getValorServicoAttribute() 
	{
		return (double)$this->attributes['VALOR_SERVICO'];
	}

	public function setValorServicoAttribute($valorServico) 
	{
		$this->attributes['VALOR_SERVICO'] = $valorServico;
	}

    public function getValorBcRetencaoIcmsAttribute() 
	{
		return (double)$this->attributes['VALOR_BC_RETENCAO_ICMS'];
	}

	public function setValorBcRetencaoIcmsAttribute($valorBcRetencaoIcms) 
	{
		$this->attributes['VALOR_BC_RETENCAO_ICMS'] = $valorBcRetencaoIcms;
	}

    public function getAliquotaRetencaoIcmsAttribute() 
	{
		return (double)$this->attributes['ALIQUOTA_RETENCAO_ICMS'];
	}

	public function setAliquotaRetencaoIcmsAttribute($aliquotaRetencaoIcms) 
	{
		$this->attributes['ALIQUOTA_RETENCAO_ICMS'] = $aliquotaRetencaoIcms;
	}

    public function getValorIcmsRetidoAttribute() 
	{
		return (double)$this->attributes['VALOR_ICMS_RETIDO'];
	}

	public function setValorIcmsRetidoAttribute($valorIcmsRetido) 
	{
		$this->attributes['VALOR_ICMS_RETIDO'] = $valorIcmsRetido;
	}

    public function getCfopAttribute() 
	{
		return $this->attributes['CFOP'];
	}

	public function setCfopAttribute($cfop) 
	{
		$this->attributes['CFOP'] = $cfop;
	}

    public function getMunicipioAttribute() 
	{
		return $this->attributes['MUNICIPIO'];
	}

	public function setMunicipioAttribute($municipio) 
	{
		$this->attributes['MUNICIPIO'] = $municipio;
	}

    public function getPlacaVeiculoAttribute() 
	{
		return $this->attributes['PLACA_VEICULO'];
	}

	public function setPlacaVeiculoAttribute($placaVeiculo) 
	{
		$this->attributes['PLACA_VEICULO'] = $placaVeiculo;
	}

    public function getUfVeiculoAttribute() 
	{
		return $this->attributes['UF_VEICULO'];
	}

	public function setUfVeiculoAttribute($ufVeiculo) 
	{
		$this->attributes['UF_VEICULO'] = $ufVeiculo;
	}

    public function getRntcVeiculoAttribute() 
	{
		return $this->attributes['RNTC_VEICULO'];
	}

	public function setRntcVeiculoAttribute($rntcVeiculo) 
	{
		$this->attributes['RNTC_VEICULO'] = $rntcVeiculo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setModalidadeFreteAttribute($objeto->modalidadeFrete);
			$this->setCnpjAttribute($objeto->cnpj);
			$this->setCpfAttribute($objeto->cpf);
			$this->setNomeAttribute($objeto->nome);
			$this->setInscricaoEstadualAttribute($objeto->inscricaoEstadual);
			$this->setEnderecoAttribute($objeto->endereco);
			$this->setNomeMunicipioAttribute($objeto->nomeMunicipio);
			$this->setUfAttribute($objeto->uf);
			$this->setValorServicoAttribute($objeto->valorServico);
			$this->setValorBcRetencaoIcmsAttribute($objeto->valorBcRetencaoIcms);
			$this->setAliquotaRetencaoIcmsAttribute($objeto->aliquotaRetencaoIcms);
			$this->setValorIcmsRetidoAttribute($objeto->valorIcmsRetido);
			$this->setCfopAttribute($objeto->cfop);
			$this->setMunicipioAttribute($objeto->municipio);
			$this->setPlacaVeiculoAttribute($objeto->placaVeiculo);
			$this->setUfVeiculoAttribute($objeto->ufVeiculo);
			$this->setRntcVeiculoAttribute($objeto->rntcVeiculo);

			// vincular objetos
			$transportadora = new Transportadora();
			$transportadora->mapear($objeto->transportadora);
			$this->transportadora()->associate($transportadora);

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
			'modalidadeFrete' => $this->getModalidadeFreteAttribute(),
			'cnpj' => $this->getCnpjAttribute(),
			'cpf' => $this->getCpfAttribute(),
			'nome' => $this->getNomeAttribute(),
			'inscricaoEstadual' => $this->getInscricaoEstadualAttribute(),
			'endereco' => $this->getEnderecoAttribute(),
			'nomeMunicipio' => $this->getNomeMunicipioAttribute(),
			'uf' => $this->getUfAttribute(),
			'valorServico' => $this->getValorServicoAttribute(),
			'valorBcRetencaoIcms' => $this->getValorBcRetencaoIcmsAttribute(),
			'aliquotaRetencaoIcms' => $this->getAliquotaRetencaoIcmsAttribute(),
			'valorIcmsRetido' => $this->getValorIcmsRetidoAttribute(),
			'cfop' => $this->getCfopAttribute(),
			'municipio' => $this->getMunicipioAttribute(),
			'placaVeiculo' => $this->getPlacaVeiculoAttribute(),
			'ufVeiculo' => $this->getUfVeiculoAttribute(),
			'rntcVeiculo' => $this->getRntcVeiculoAttribute(),
			'transportadora' => $this->transportadora,
        ];
    }
}