<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PATRIM_APOLICE_SEGURO] 
                                                                                
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

class PatrimApoliceSeguro extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PATRIM_APOLICE_SEGURO';

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

    public function getIdPatrimBemAttribute() 
	{
		return $this->attributes['ID_PATRIM_BEM'];
	}

	public function setIdPatrimBemAttribute($idPatrimBem) 
	{
		$this->attributes['ID_PATRIM_BEM'] = $idPatrimBem;
	}

    public function getIdSeguradoraAttribute() 
	{
		return $this->attributes['ID_SEGURADORA'];
	}

	public function setIdSeguradoraAttribute($idSeguradora) 
	{
		$this->attributes['ID_SEGURADORA'] = $idSeguradora;
	}

    public function getNumeroAttribute() 
	{
		return $this->attributes['NUMERO'];
	}

	public function setNumeroAttribute($numero) 
	{
		$this->attributes['NUMERO'] = $numero;
	}

    public function getDataContratacaoAttribute() 
	{
		return $this->attributes['DATA_CONTRATACAO'];
	}

	public function setDataContratacaoAttribute($dataContratacao) 
	{
		$this->attributes['DATA_CONTRATACAO'] = $dataContratacao;
	}

    public function getDataVencimentoAttribute() 
	{
		return $this->attributes['DATA_VENCIMENTO'];
	}

	public function setDataVencimentoAttribute($dataVencimento) 
	{
		$this->attributes['DATA_VENCIMENTO'] = $dataVencimento;
	}

    public function getValorPremioAttribute() 
	{
		return $this->attributes['VALOR_PREMIO'];
	}

	public function setValorPremioAttribute($valorPremio) 
	{
		$this->attributes['VALOR_PREMIO'] = $valorPremio;
	}

    public function getValorSeguradoAttribute() 
	{
		return $this->attributes['VALOR_SEGURADO'];
	}

	public function setValorSeguradoAttribute($valorSegurado) 
	{
		$this->attributes['VALOR_SEGURADO'] = $valorSegurado;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}

    public function getImagemAttribute() 
	{
		return $this->attributes['IMAGEM'];
	}

	public function setImagemAttribute($imagem) 
	{
		$this->attributes['IMAGEM'] = $imagem;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdPatrimBemAttribute($objeto->idPatrimBem);
			$this->setIdSeguradoraAttribute($objeto->idSeguradora);
			$this->setNumeroAttribute($objeto->numero);
			$this->setDataContratacaoAttribute($objeto->dataContratacao);
			$this->setDataVencimentoAttribute($objeto->dataVencimento);
			$this->setValorPremioAttribute($objeto->valorPremio);
			$this->setValorSeguradoAttribute($objeto->valorSegurado);
			$this->setObservacaoAttribute($objeto->observacao);
			$this->setImagemAttribute($objeto->imagem);

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
			'idPatrimBem' => $this->getIdPatrimBemAttribute(),
			'idSeguradora' => $this->getIdSeguradoraAttribute(),
			'numero' => $this->getNumeroAttribute(),
			'dataContratacao' => $this->getDataContratacaoAttribute(),
			'dataVencimento' => $this->getDataVencimentoAttribute(),
			'valorPremio' => $this->getValorPremioAttribute(),
			'valorSegurado' => $this->getValorSeguradoAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
			'imagem' => $this->getImagemAttribute(),
        ];
    }
}