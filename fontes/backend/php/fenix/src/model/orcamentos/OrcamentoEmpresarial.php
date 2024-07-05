<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [ORCAMENTO_EMPRESARIAL] 
                                                                                
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

class OrcamentoEmpresarial extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ORCAMENTO_EMPRESARIAL';

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

    public function getIdOrcamentoPeriodoAttribute() 
	{
		return $this->attributes['ID_ORCAMENTO_PERIODO'];
	}

	public function setIdOrcamentoPeriodoAttribute($idOrcamentoPeriodo) 
	{
		$this->attributes['ID_ORCAMENTO_PERIODO'] = $idOrcamentoPeriodo;
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

    public function getDataInicialAttribute() 
	{
		return $this->attributes['DATA_INICIAL'];
	}

	public function setDataInicialAttribute($dataInicial) 
	{
		$this->attributes['DATA_INICIAL'] = $dataInicial;
	}

    public function getNumeroPeriodosAttribute() 
	{
		return $this->attributes['NUMERO_PERIODOS'];
	}

	public function setNumeroPeriodosAttribute($numeroPeriodos) 
	{
		$this->attributes['NUMERO_PERIODOS'] = $numeroPeriodos;
	}

    public function getDataBaseAttribute() 
	{
		return $this->attributes['DATA_BASE'];
	}

	public function setDataBaseAttribute($dataBase) 
	{
		$this->attributes['DATA_BASE'] = $dataBase;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdOrcamentoPeriodoAttribute($objeto->idOrcamentoPeriodo);
			$this->setNomeAttribute($objeto->nome);
			$this->setDescricaoAttribute($objeto->descricao);
			$this->setDataInicialAttribute($objeto->dataInicial);
			$this->setNumeroPeriodosAttribute($objeto->numeroPeriodos);
			$this->setDataBaseAttribute($objeto->dataBase);

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
			'idOrcamentoPeriodo' => $this->getIdOrcamentoPeriodoAttribute(),
			'nome' => $this->getNomeAttribute(),
			'descricao' => $this->getDescricaoAttribute(),
			'dataInicial' => $this->getDataInicialAttribute(),
			'numeroPeriodos' => $this->getNumeroPeriodosAttribute(),
			'dataBase' => $this->getDataBaseAttribute(),
        ];
    }
}