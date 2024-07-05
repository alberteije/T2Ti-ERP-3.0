<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VENDEDOR_META] 
                                                                                
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

class VendedorMeta extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'VENDEDOR_META';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['vendedor', 'cliente', ];
	
    /**
     * Relations
     */
    public function vendedor()
    {
    	return $this->belongsTo(Vendedor::class, 'ID_VENDEDOR', 'ID');
    }

    public function cliente()
    {
    	return $this->belongsTo(Cliente::class, 'ID_CLIENTE', 'ID');
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

    public function getPeriodoMetaAttribute() 
	{
		return $this->attributes['PERIODO_META'];
	}

	public function setPeriodoMetaAttribute($periodoMeta) 
	{
		$this->attributes['PERIODO_META'] = $periodoMeta;
	}

    public function getMetaOrcadaAttribute() 
	{
		return $this->attributes['META_ORCADA'];
	}

	public function setMetaOrcadaAttribute($metaOrcada) 
	{
		$this->attributes['META_ORCADA'] = $metaOrcada;
	}

    public function getMetaRealizadaAttribute() 
	{
		return $this->attributes['META_REALIZADA'];
	}

	public function setMetaRealizadaAttribute($metaRealizada) 
	{
		$this->attributes['META_REALIZADA'] = $metaRealizada;
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


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setPeriodoMetaAttribute($objeto->periodoMeta);
			$this->setMetaOrcadaAttribute($objeto->metaOrcada);
			$this->setMetaRealizadaAttribute($objeto->metaRealizada);
			$this->setDataInicioAttribute($objeto->dataInicio);
			$this->setDataFimAttribute($objeto->dataFim);

			// vincular objetos
			$vendedor = new Vendedor();
			$vendedor->mapear($objeto->vendedor);
			$this->vendedor()->associate($vendedor);

			$cliente = new Cliente();
			$cliente->mapear($objeto->cliente);
			$this->cliente()->associate($cliente);

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
			'periodoMeta' => $this->getPeriodoMetaAttribute(),
			'metaOrcada' => $this->getMetaOrcadaAttribute(),
			'metaRealizada' => $this->getMetaRealizadaAttribute(),
			'dataInicio' => $this->getDataInicioAttribute(),
			'dataFim' => $this->getDataFimAttribute(),
			'vendedor' => $this->vendedor,
			'cliente' => $this->cliente,
        ];
    }
}