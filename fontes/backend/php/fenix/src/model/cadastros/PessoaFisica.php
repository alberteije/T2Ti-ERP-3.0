<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PESSOA_FISICA] 
                                                                                
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

class PessoaFisica extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PESSOA_FISICA';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['nivelFormacao', 'estadoCivil', ];
	
    /**
     * Relations
     */
    public function pessoa()
    {
    	return $this->belongsTo(Pessoa::class, 'ID_PESSOA', 'ID');
    }

    public function nivelFormacao()
    {
    	return $this->belongsTo(NivelFormacao::class, 'ID_NIVEL_FORMACAO', 'ID');
    }

    public function estadoCivil()
    {
    	return $this->belongsTo(EstadoCivil::class, 'ID_ESTADO_CIVIL', 'ID');
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

    public function getCpfAttribute() 
	{
		return $this->attributes['CPF'];
	}

	public function setCpfAttribute($cpf) 
	{
		$this->attributes['CPF'] = $cpf;
	}

    public function getRgAttribute() 
	{
		return $this->attributes['RG'];
	}

	public function setRgAttribute($rg) 
	{
		$this->attributes['RG'] = $rg;
	}

    public function getOrgaoRgAttribute() 
	{
		return $this->attributes['ORGAO_RG'];
	}

	public function setOrgaoRgAttribute($orgaoRg) 
	{
		$this->attributes['ORGAO_RG'] = $orgaoRg;
	}

    public function getDataEmissaoRgAttribute() 
	{
		return $this->attributes['DATA_EMISSAO_RG'];
	}

	public function setDataEmissaoRgAttribute($dataEmissaoRg) 
	{
		$this->attributes['DATA_EMISSAO_RG'] = $dataEmissaoRg;
	}

    public function getDataNascimentoAttribute() 
	{
		return $this->attributes['DATA_NASCIMENTO'];
	}

	public function setDataNascimentoAttribute($dataNascimento) 
	{
		$this->attributes['DATA_NASCIMENTO'] = $dataNascimento;
	}

    public function getSexoAttribute() 
	{
		return $this->attributes['SEXO'];
	}

	public function setSexoAttribute($sexo) 
	{
		$this->attributes['SEXO'] = $sexo;
	}

    public function getRacaAttribute() 
	{
		return $this->attributes['RACA'];
	}

	public function setRacaAttribute($raca) 
	{
		$this->attributes['RACA'] = $raca;
	}

    public function getNacionalidadeAttribute() 
	{
		return $this->attributes['NACIONALIDADE'];
	}

	public function setNacionalidadeAttribute($nacionalidade) 
	{
		$this->attributes['NACIONALIDADE'] = $nacionalidade;
	}

    public function getNaturalidadeAttribute() 
	{
		return $this->attributes['NATURALIDADE'];
	}

	public function setNaturalidadeAttribute($naturalidade) 
	{
		$this->attributes['NATURALIDADE'] = $naturalidade;
	}

    public function getNomePaiAttribute() 
	{
		return $this->attributes['NOME_PAI'];
	}

	public function setNomePaiAttribute($nomePai) 
	{
		$this->attributes['NOME_PAI'] = $nomePai;
	}

    public function getNomeMaeAttribute() 
	{
		return $this->attributes['NOME_MAE'];
	}

	public function setNomeMaeAttribute($nomeMae) 
	{
		$this->attributes['NOME_MAE'] = $nomeMae;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCpfAttribute($objeto->cpf);
			$this->setRgAttribute($objeto->rg);
			$this->setOrgaoRgAttribute($objeto->orgaoRg);
			$this->setDataEmissaoRgAttribute($objeto->dataEmissaoRg);
			$this->setDataNascimentoAttribute($objeto->dataNascimento);
			$this->setSexoAttribute($objeto->sexo);
			$this->setRacaAttribute($objeto->raca);
			$this->setNacionalidadeAttribute($objeto->nacionalidade);
			$this->setNaturalidadeAttribute($objeto->naturalidade);
			$this->setNomePaiAttribute($objeto->nomePai);
			$this->setNomeMaeAttribute($objeto->nomeMae);

			// vincular objetos
			$nivelFormacao = new NivelFormacao();
			$nivelFormacao->mapear($objeto->nivelFormacao);
			$this->nivelFormacao()->associate($nivelFormacao);

			$estadoCivil = new EstadoCivil();
			$estadoCivil->mapear($objeto->estadoCivil);
			$this->estadoCivil()->associate($estadoCivil);

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
			'cpf' => $this->getCpfAttribute(),
			'rg' => $this->getRgAttribute(),
			'orgaoRg' => $this->getOrgaoRgAttribute(),
			'dataEmissaoRg' => $this->getDataEmissaoRgAttribute(),
			'dataNascimento' => $this->getDataNascimentoAttribute(),
			'sexo' => $this->getSexoAttribute(),
			'raca' => $this->getRacaAttribute(),
			'nacionalidade' => $this->getNacionalidadeAttribute(),
			'naturalidade' => $this->getNaturalidadeAttribute(),
			'nomePai' => $this->getNomePaiAttribute(),
			'nomeMae' => $this->getNomeMaeAttribute(),
			'nivelFormacao' => $this->nivelFormacao,
			'estadoCivil' => $this->estadoCivil,
        ];
    }
}