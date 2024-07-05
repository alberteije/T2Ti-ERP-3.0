<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CONTABIL_LANCAMENTO_CABECALHO] 
                                                                                
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

class ContabilLancamentoCabecalho extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CONTABIL_LANCAMENTO_CABECALHO';

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

    public function getIdContabilLoteAttribute() 
	{
		return $this->attributes['ID_CONTABIL_LOTE'];
	}

	public function setIdContabilLoteAttribute($idContabilLote) 
	{
		$this->attributes['ID_CONTABIL_LOTE'] = $idContabilLote;
	}

    public function getDataLancamentoAttribute() 
	{
		return $this->attributes['DATA_LANCAMENTO'];
	}

	public function setDataLancamentoAttribute($dataLancamento) 
	{
		$this->attributes['DATA_LANCAMENTO'] = $dataLancamento;
	}

    public function getDataInclusaoAttribute() 
	{
		return $this->attributes['DATA_INCLUSAO'];
	}

	public function setDataInclusaoAttribute($dataInclusao) 
	{
		$this->attributes['DATA_INCLUSAO'] = $dataInclusao;
	}

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}

    public function getLiberadoAttribute() 
	{
		return $this->attributes['LIBERADO'];
	}

	public function setLiberadoAttribute($liberado) 
	{
		$this->attributes['LIBERADO'] = $liberado;
	}

    public function getValorAttribute() 
	{
		return $this->attributes['VALOR'];
	}

	public function setValorAttribute($valor) 
	{
		$this->attributes['VALOR'] = $valor;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdContabilLoteAttribute($objeto->idContabilLote);
			$this->setDataLancamentoAttribute($objeto->dataLancamento);
			$this->setDataInclusaoAttribute($objeto->dataInclusao);
			$this->setTipoAttribute($objeto->tipo);
			$this->setLiberadoAttribute($objeto->liberado);
			$this->setValorAttribute($objeto->valor);

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
			'idContabilLote' => $this->getIdContabilLoteAttribute(),
			'dataLancamento' => $this->getDataLancamentoAttribute(),
			'dataInclusao' => $this->getDataInclusaoAttribute(),
			'tipo' => $this->getTipoAttribute(),
			'liberado' => $this->getLiberadoAttribute(),
			'valor' => $this->getValorAttribute(),
        ];
    }
}