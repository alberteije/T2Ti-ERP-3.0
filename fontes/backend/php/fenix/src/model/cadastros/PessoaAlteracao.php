<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PESSOA_ALTERACAO] 
                                                                                
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

class PessoaAlteracao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PESSOA_ALTERACAO';

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

    public function getIdPessoaAttribute() 
	{
		return $this->attributes['ID_PESSOA'];
	}

	public function setIdPessoaAttribute($idPessoa) 
	{
		$this->attributes['ID_PESSOA'] = $idPessoa;
	}

    public function getDataAlteracaoAttribute() 
	{
		return $this->attributes['DATA_ALTERACAO'];
	}

	public function setDataAlteracaoAttribute($dataAlteracao) 
	{
		$this->attributes['DATA_ALTERACAO'] = $dataAlteracao;
	}

    public function getObjetoAntigoAttribute() 
	{
		return $this->attributes['OBJETO_ANTIGO'];
	}

	public function setObjetoAntigoAttribute($objetoAntigo) 
	{
		$this->attributes['OBJETO_ANTIGO'] = $objetoAntigo;
	}

    public function getObjetoNovoAttribute() 
	{
		return $this->attributes['OBJETO_NOVO'];
	}

	public function setObjetoNovoAttribute($objetoNovo) 
	{
		$this->attributes['OBJETO_NOVO'] = $objetoNovo;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdPessoaAttribute($objeto->idPessoa);
			$this->setDataAlteracaoAttribute($objeto->dataAlteracao);
			$this->setObjetoAntigoAttribute($objeto->objetoAntigo);
			$this->setObjetoNovoAttribute($objeto->objetoNovo);

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
			'idPessoa' => $this->getIdPessoaAttribute(),
			'dataAlteracao' => $this->getDataAlteracaoAttribute(),
			'objetoAntigo' => $this->getObjetoAntigoAttribute(),
			'objetoNovo' => $this->getObjetoNovoAttribute(),
        ];
    }
}