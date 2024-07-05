<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PRODUTO_PROMOCAO] 
                                                                                
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

class ProdutoPromocao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PRODUTO_PROMOCAO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['produto', ];
	
    /**
     * Relations
     */
    public function produto()
    {
    	return $this->belongsTo(Produto::class, 'ID_PRODUTO', 'ID');
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

    public function getDataInicioAttribute() 
	{
		return $this->attributes['DATA_INICIO'];
	}

	public function setDataInicioAttribute($dataInicio) 
	{
		$this->attributes['DATA_INICIO'] = $dataInicio;
	}

    public function getDataFimAttribute() 
	{
		return $this->attributes['DATA_FIM'];
	}

	public function setDataFimAttribute($dataFim) 
	{
		$this->attributes['DATA_FIM'] = $dataFim;
	}

    public function getQuantidadeEmPromocaoAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_EM_PROMOCAO'];
	}

	public function setQuantidadeEmPromocaoAttribute($quantidadeEmPromocao) 
	{
		$this->attributes['QUANTIDADE_EM_PROMOCAO'] = $quantidadeEmPromocao;
	}

    public function getQuantidadeMaximaClienteAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE_MAXIMA_CLIENTE'];
	}

	public function setQuantidadeMaximaClienteAttribute($quantidadeMaximaCliente) 
	{
		$this->attributes['QUANTIDADE_MAXIMA_CLIENTE'] = $quantidadeMaximaCliente;
	}

    public function getValorAttribute() 
	{
		return (double)$this->attributes['VALOR'];
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

			$this->setDataInicioAttribute($objeto->dataInicio);
			$this->setDataFimAttribute($objeto->dataFim);
			$this->setQuantidadeEmPromocaoAttribute($objeto->quantidadeEmPromocao);
			$this->setQuantidadeMaximaClienteAttribute($objeto->quantidadeMaximaCliente);
			$this->setValorAttribute($objeto->valor);

			// vincular objetos
			$produto = new Produto();
			$produto->mapear($objeto->produto);
			$this->produto()->associate($produto);

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
			'dataInicio' => $this->getDataInicioAttribute(),
			'dataFim' => $this->getDataFimAttribute(),
			'quantidadeEmPromocao' => $this->getQuantidadeEmPromocaoAttribute(),
			'quantidadeMaximaCliente' => $this->getQuantidadeMaximaClienteAttribute(),
			'valor' => $this->getValorAttribute(),
			'produto' => $this->produto,
        ];
    }
}