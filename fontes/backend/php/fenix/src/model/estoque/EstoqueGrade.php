<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [ESTOQUE_GRADE] 
                                                                                
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

class EstoqueGrade extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ESTOQUE_GRADE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['estoqueMarca', 'estoqueSabor', 'estoqueTamanho', 'estoqueCor', 'produto', ];
	
    /**
     * Relations
     */
    public function estoqueMarca()
    {
    	return $this->belongsTo(EstoqueMarca::class, 'ID_ESTOQUE_MARCA', 'ID');
    }

    public function estoqueSabor()
    {
    	return $this->belongsTo(EstoqueSabor::class, 'ID_ESTOQUE_SABOR', 'ID');
    }

    public function estoqueTamanho()
    {
    	return $this->belongsTo(EstoqueTamanho::class, 'ID_ESTOQUE_TAMANHO', 'ID');
    }

    public function estoqueCor()
    {
    	return $this->belongsTo(EstoqueCor::class, 'ID_ESTOQUE_COR', 'ID');
    }

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

    public function getCodigoAttribute() 
	{
		return $this->attributes['CODIGO'];
	}

	public function setCodigoAttribute($codigo) 
	{
		$this->attributes['CODIGO'] = $codigo;
	}

    public function getQuantidadeAttribute() 
	{
		return (double)$this->attributes['QUANTIDADE'];
	}

	public function setQuantidadeAttribute($quantidade) 
	{
		$this->attributes['QUANTIDADE'] = $quantidade;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setCodigoAttribute($objeto->codigo);
			$this->setQuantidadeAttribute($objeto->quantidade);

			// vincular objetos
			$estoqueMarca = new EstoqueMarca();
			$estoqueMarca->mapear($objeto->estoqueMarca);
			$this->estoqueMarca()->associate($estoqueMarca);

			$estoqueSabor = new EstoqueSabor();
			$estoqueSabor->mapear($objeto->estoqueSabor);
			$this->estoqueSabor()->associate($estoqueSabor);

			$estoqueTamanho = new EstoqueTamanho();
			$estoqueTamanho->mapear($objeto->estoqueTamanho);
			$this->estoqueTamanho()->associate($estoqueTamanho);

			$estoqueCor = new EstoqueCor();
			$estoqueCor->mapear($objeto->estoqueCor);
			$this->estoqueCor()->associate($estoqueCor);

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
			'codigo' => $this->getCodigoAttribute(),
			'quantidade' => $this->getQuantidadeAttribute(),
			'estoqueMarca' => $this->estoqueMarca,
			'estoqueSabor' => $this->estoqueSabor,
			'estoqueTamanho' => $this->estoqueTamanho,
			'estoqueCor' => $this->estoqueCor,
			'produto' => $this->produto,
        ];
    }
}