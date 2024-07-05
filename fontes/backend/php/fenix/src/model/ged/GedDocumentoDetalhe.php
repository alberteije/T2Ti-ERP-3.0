<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
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

class GedDocumentoDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'GED_DOCUMENTO_DETALHE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['gedTipoDocumento', ];
	
    /**
     * Relations
     */
    public function gedDocumentoCabecalho()
    {
    	return $this->belongsTo(GedDocumentoCabecalho::class, 'ID_GED_DOCUMENTO_CABECALHO', 'ID');
    }

    public function gedTipoDocumento()
    {
    	return $this->belongsTo(GedTipoDocumento::class, 'ID_GED_TIPO_DOCUMENTO', 'ID');
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

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getDescricaoAttribute() 
	{
		return $this->attributes['DESCRICAO'];
	}

	public function setDescricaoAttribute($descricao) 
	{
		$this->attributes['DESCRICAO'] = $descricao;
	}

    public function getPalavrasChaveAttribute() 
	{
		return $this->attributes['PALAVRAS_CHAVE'];
	}

	public function setPalavrasChaveAttribute($palavrasChave) 
	{
		$this->attributes['PALAVRAS_CHAVE'] = $palavrasChave;
	}

    public function getPodeExcluirAttribute() 
	{
		return $this->attributes['PODE_EXCLUIR'];
	}

	public function setPodeExcluirAttribute($podeExcluir) 
	{
		$this->attributes['PODE_EXCLUIR'] = $podeExcluir;
	}

    public function getPodeAlterarAttribute() 
	{
		return $this->attributes['PODE_ALTERAR'];
	}

	public function setPodeAlterarAttribute($podeAlterar) 
	{
		$this->attributes['PODE_ALTERAR'] = $podeAlterar;
	}

    public function getAssinadoAttribute() 
	{
		return $this->attributes['ASSINADO'];
	}

	public function setAssinadoAttribute($assinado) 
	{
		$this->attributes['ASSINADO'] = $assinado;
	}

    public function getDataFimVigenciaAttribute() 
	{
		return $this->attributes['DATA_FIM_VIGENCIA'];
	}

	public function setDataFimVigenciaAttribute($dataFimVigencia) 
	{
		$this->attributes['DATA_FIM_VIGENCIA'] = $dataFimVigencia;
	}

    public function getDataExclusaoAttribute() 
	{
		return $this->attributes['DATA_EXCLUSAO'];
	}

	public function setDataExclusaoAttribute($dataExclusao) 
	{
		$this->attributes['DATA_EXCLUSAO'] = $dataExclusao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNomeAttribute($objeto->nome);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setPalavrasChaveAttribute($objeto->palavrasChave);
			$this->setPodeExcluirAttribute($objeto->podeExcluir);
			$this->setPodeAlterarAttribute($objeto->podeAlterar);
			$this->setAssinadoAttribute($objeto->assinado);
			$this->setDataFimVigenciaAttribute($objeto->dataFimVigencia);
			$this->setDataExclusaoAttribute($objeto->dataExclusao);

			// vincular objetos
			$gedTipoDocumento = new GedTipoDocumento();
			$gedTipoDocumento->mapear($objeto->gedTipoDocumento);
			$this->gedTipoDocumento()->associate($gedTipoDocumento);

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
			'descricao' => $this->getDescricaoAttribute(),
			'palavrasChave' => $this->getPalavrasChaveAttribute(),
			'podeExcluir' => $this->getPodeExcluirAttribute(),
			'podeAlterar' => $this->getPodeAlterarAttribute(),
			'assinado' => $this->getAssinadoAttribute(),
			'dataFimVigencia' => $this->getDataFimVigenciaAttribute(),
			'dataExclusao' => $this->getDataExclusaoAttribute(),
			'gedTipoDocumento' => $this->gedTipoDocumento,
        ];
    }
}