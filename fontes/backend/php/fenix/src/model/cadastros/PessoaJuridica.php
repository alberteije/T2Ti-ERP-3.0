<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PESSOA_JURIDICA] 
                                                                                
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

class PessoaJuridica extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PESSOA_JURIDICA';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
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

    public function getCnpjAttribute() 
	{
		return $this->attributes['CNPJ'];
	}

	public function setCnpjAttribute($cnpj) 
	{
		$this->attributes['CNPJ'] = $cnpj;
	}

    public function getNomeFantasiaAttribute() 
	{
		return $this->attributes['NOME_FANTASIA'];
	}

	public function setNomeFantasiaAttribute($nomeFantasia) 
	{
		$this->attributes['NOME_FANTASIA'] = $nomeFantasia;
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

    public function getDataConstituicaoAttribute() 
	{
		return $this->attributes['DATA_CONSTITUICAO'];
	}

	public function setDataConstituicaoAttribute($dataConstituicao) 
	{
		$this->attributes['DATA_CONSTITUICAO'] = $dataConstituicao;
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


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCnpjAttribute($objeto->cnpj);
			$this->setNomeFantasiaAttribute($objeto->nomeFantasia);
			$this->setInscricaoEstadualAttribute($objeto->inscricaoEstadual);
			$this->setInscricaoMunicipalAttribute($objeto->inscricaoMunicipal);
			$this->setDataConstituicaoAttribute($objeto->dataConstituicao);
			$this->setTipoRegimeAttribute($objeto->tipoRegime);
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
			'nomeFantasia' => $this->getNomeFantasiaAttribute(),
			'inscricaoEstadual' => $this->getInscricaoEstadualAttribute(),
			'inscricaoMunicipal' => $this->getInscricaoMunicipalAttribute(),
			'dataConstituicao' => $this->getDataConstituicaoAttribute(),
			'tipoRegime' => $this->getTipoRegimeAttribute(),
			'crt' => $this->getCrtAttribute(),
        ];
    }
}