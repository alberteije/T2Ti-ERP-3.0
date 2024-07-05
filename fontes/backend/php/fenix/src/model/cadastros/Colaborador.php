<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [COLABORADOR] 
                                                                                
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

class Colaborador extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'COLABORADOR';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['viewPessoaColaborador', ];
	
    /**
     * Relations
     */
    public function pessoa()
    {
    	return $this->belongsTo(Pessoa::class, 'ID_PESSOA', 'ID');
    }

	public function viewPessoaColaborador()
	{
		return $this->hasOne(ViewPessoaColaborador::class, 'ID_PESSOA', 'ID');
	}

    public function cargo()
    {
    	return $this->belongsTo(Cargo::class, 'ID_CARGO', 'ID');
    }

    public function setor()
    {
    	return $this->belongsTo(Setor::class, 'ID_SETOR', 'ID');
    }

    public function colaboradorSituacao()
    {
    	return $this->belongsTo(ColaboradorSituacao::class, 'ID_COLABORADOR_SITUACAO', 'ID');
    }

    public function tipoAdmissao()
    {
    	return $this->belongsTo(TipoAdmissao::class, 'ID_TIPO_ADMISSAO', 'ID');
    }

    public function colaboradorTipo()
    {
    	return $this->belongsTo(ColaboradorTipo::class, 'ID_COLABORADOR_TIPO', 'ID');
    }

    public function sindicato()
    {
    	return $this->belongsTo(Sindicato::class, 'ID_SINDICATO', 'ID');
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


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setMatriculaAttribute($objeto->matricula);
			$this->setDataCadastroAttribute($objeto->dataCadastro);
			$this->setDataAdmissaoAttribute($objeto->dataAdmissao);
			$this->setDataDemissaoAttribute($objeto->dataDemissao);
			$this->setCtpsNumeroAttribute($objeto->ctpsNumero);
			$this->setCtpsSerieAttribute($objeto->ctpsSerie);
			$this->setCtpsDataExpedicaoAttribute($objeto->ctpsDataExpedicao);
			$this->setCtpsUfAttribute($objeto->ctpsUf);
			$this->setObservacaoAttribute($objeto->observacao);

			// vincular objetos
			$cargo = new Cargo();
			$cargo->mapear($objeto->cargo);
			$this->cargo()->associate($cargo);

			$setor = new Setor();
			$setor->mapear($objeto->setor);
			$this->setor()->associate($setor);

			$colaboradorSituacao = new ColaboradorSituacao();
			$colaboradorSituacao->mapear($objeto->colaboradorSituacao);
			$this->colaboradorSituacao()->associate($colaboradorSituacao);

			$tipoAdmissao = new TipoAdmissao();
			$tipoAdmissao->mapear($objeto->tipoAdmissao);
			$this->tipoAdmissao()->associate($tipoAdmissao);

			$colaboradorTipo = new ColaboradorTipo();
			$colaboradorTipo->mapear($objeto->colaboradorTipo);
			$this->colaboradorTipo()->associate($colaboradorTipo);

			$sindicato = new Sindicato();
			$sindicato->mapear($objeto->sindicato);
			$this->sindicato()->associate($sindicato);

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
			'matricula' => $this->getMatriculaAttribute(),
			'dataCadastro' => $this->getDataCadastroAttribute(),
			'dataAdmissao' => $this->getDataAdmissaoAttribute(),
			'dataDemissao' => $this->getDataDemissaoAttribute(),
			'ctpsNumero' => $this->getCtpsNumeroAttribute(),
			'ctpsSerie' => $this->getCtpsSerieAttribute(),
			'ctpsDataExpedicao' => $this->getCtpsDataExpedicaoAttribute(),
			'ctpsUf' => $this->getCtpsUfAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'cargo' => $this->cargo,
			'setor' => $this->setor,
			'colaboradorSituacao' => $this->colaboradorSituacao,
			'tipoAdmissao' => $this->tipoAdmissao,
			'colaboradorTipo' => $this->colaboradorTipo,
			'sindicato' => $this->sindicato,
			'viewPessoaColaborador' => $this->viewPessoaColaborador,
        ];
    }
}