<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FOLHA_LANCAMENTO_DETALHE] 
                                                                                
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

class FolhaLancamentoDetalhe extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FOLHA_LANCAMENTO_DETALHE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['folhaEvento', ];
	
    /**
     * Relations
     */
    public function folhaEvento()
    {
    	return $this->belongsTo(FolhaEvento::class, 'ID_FOLHA_EVENTO', 'ID');
    }

    public function folhaLancamentoCabecalho()
    {
    	return $this->belongsTo(FolhaLancamentoCabecalho::class, 'ID_FOLHA_LANCAMENTO_CABECALHO', 'ID');
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

    public function getOrigemAttribute() 
	{
		return $this->attributes['ORIGEM'];
	}

	public function setOrigemAttribute($origem) 
	{
		$this->attributes['ORIGEM'] = $origem;
	}

    public function getProventoAttribute() 
	{
		return $this->attributes['PROVENTO'];
	}

	public function setProventoAttribute($provento) 
	{
		$this->attributes['PROVENTO'] = $provento;
	}

    public function getDescontoAttribute() 
	{
		return $this->attributes['DESCONTO'];
	}

	public function setDescontoAttribute($desconto) 
	{
		$this->attributes['DESCONTO'] = $desconto;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setOrigemAttribute($objeto->origem);
			$this->setProventoAttribute($objeto->provento);
			$this->setDescontoAttribute($objeto->desconto);

			// vincular objetos
			$folhaEvento = new FolhaEvento();
			$folhaEvento->mapear($objeto->folhaEvento);
			$this->folhaEvento()->associate($folhaEvento);

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
			'origem' => $this->getOrigemAttribute(),
			'provento' => $this->getProventoAttribute(),
			'desconto' => $this->getDescontoAttribute(),
			'folhaEvento' => $this->folhaEvento,
        ];
    }
}