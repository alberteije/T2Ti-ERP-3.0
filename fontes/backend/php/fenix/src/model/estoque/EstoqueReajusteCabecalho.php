<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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

class EstoqueReajusteCabecalho extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ESTOQUE_REAJUSTE_CABECALHO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['listaEstoqueReajusteDetalhe', 'colaborador', ];
	
    /**
     * Relations
     */
    public function listaEstoqueReajusteDetalhe()
    {
    	return $this->hasMany(EstoqueReajusteDetalhe::class, 'ID_ESTOQUE_REAJUSTE_CABECALHO', 'ID');
    }

    public function colaborador()
    {
    	return $this->belongsTo(Colaborador::class, 'ID_COLABORADOR', 'ID');
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

    public function getDataReajusteAttribute() 
	{
		return $this->attributes['DATA_REAJUSTE'];
	}

	public function setDataReajusteAttribute($dataReajuste) 
	{
		$this->attributes['DATA_REAJUSTE'] = $dataReajuste;
	}

    public function getTaxaAttribute() 
	{
		return (double)$this->attributes['TAXA'];
	}

	public function setTaxaAttribute($taxa) 
	{
		$this->attributes['TAXA'] = $taxa;
	}

    public function getTipoReajusteAttribute() 
	{
		return $this->attributes['TIPO_REAJUSTE'];
	}

	public function setTipoReajusteAttribute($tipoReajuste) 
	{
		$this->attributes['TIPO_REAJUSTE'] = $tipoReajuste;
	}

    public function getJustificativaAttribute() 
	{
		return $this->attributes['JUSTIFICATIVA'];
	}

	public function setJustificativaAttribute($justificativa) 
	{
		$this->attributes['JUSTIFICATIVA'] = $justificativa;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDataReajusteAttribute($objeto->dataReajuste);
			$this->setTaxaAttribute($objeto->taxa);
			$this->setTipoReajusteAttribute($objeto->tipoReajuste);
			$this->setJustificativaAttribute($objeto->justificativa);

			// vincular objetos
			$colaborador = new Colaborador();
			$colaborador->mapear($objeto->colaborador);
			$this->colaborador()->associate($colaborador);

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
			'dataReajuste' => $this->getDataReajusteAttribute(),
			'taxa' => $this->getTaxaAttribute(),
			'tipoReajuste' => $this->getTipoReajusteAttribute(),
			'justificativa' => $this->getJustificativaAttribute(),
			'colaborador' => $this->colaborador,
			'listaEstoqueReajusteDetalhe' => $this->listaEstoqueReajusteDetalhe,
        ];
    }
}