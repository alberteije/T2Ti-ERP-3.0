<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FISCAL_INSCRICOES_SUBSTITUTAS] 
                                                                                
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

class FiscalInscricoesSubstitutas extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FISCAL_INSCRICOES_SUBSTITUTAS';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['fiscalParametros', ];
	
    /**
     * Relations
     */
    public function fiscalParametros()
    {
    	return $this->belongsTo(FiscalParametros::class, 'ID_FISCAL_PARAMETROS', 'ID');
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

    public function getUfAttribute() 
	{
		return $this->attributes['UF'];
	}

	public function setUfAttribute($uf) 
	{
		$this->attributes['UF'] = $uf;
	}

    public function getInscricaoEstadualAttribute() 
	{
		return $this->attributes['INSCRICAO_ESTADUAL'];
	}

	public function setInscricaoEstadualAttribute($inscricaoEstadual) 
	{
		$this->attributes['INSCRICAO_ESTADUAL'] = $inscricaoEstadual;
	}

    public function getPmpfAttribute() 
	{
		return $this->attributes['PMPF'];
	}

	public function setPmpfAttribute($pmpf) 
	{
		$this->attributes['PMPF'] = $pmpf;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setUfAttribute($objeto->uf);
			$this->setInscricaoEstadualAttribute($objeto->inscricaoEstadual);
			$this->setPmpfAttribute($objeto->pmpf);

			// vincular objetos
			$fiscalParametros = new FiscalParametros();
			$fiscalParametros->mapear($objeto->fiscalParametros);
			$this->fiscalParametros()->associate($fiscalParametros);

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
			'uf' => $this->getUfAttribute(),
			'inscricaoEstadual' => $this->getInscricaoEstadualAttribute(),
			'pmpf' => $this->getPmpfAttribute(),
			'fiscalParametros' => $this->fiscalParametros,
        ];
    }
}