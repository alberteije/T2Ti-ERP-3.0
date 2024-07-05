<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_TRANSPORTE_REBOQUE] 
                                                                                
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

class NfeTransporteReboque extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_TRANSPORTE_REBOQUE';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function nfeTransporte()
    {
    	return $this->belongsTo(NfeTransporte::class, 'ID_NFE_TRANSPORTE', 'ID');
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

    public function getPlacaAttribute() 
	{
		return $this->attributes['PLACA'];
	}

	public function setPlacaAttribute($placa) 
	{
		$this->attributes['PLACA'] = $placa;
	}

    public function getUfAttribute() 
	{
		return $this->attributes['UF'];
	}

	public function setUfAttribute($uf) 
	{
		$this->attributes['UF'] = $uf;
	}

    public function getRntcAttribute() 
	{
		return $this->attributes['RNTC'];
	}

	public function setRntcAttribute($rntc) 
	{
		$this->attributes['RNTC'] = $rntc;
	}

    public function getVagaoAttribute() 
	{
		return $this->attributes['VAGAO'];
	}

	public function setVagaoAttribute($vagao) 
	{
		$this->attributes['VAGAO'] = $vagao;
	}

    public function getBalsaAttribute() 
	{
		return $this->attributes['BALSA'];
	}

	public function setBalsaAttribute($balsa) 
	{
		$this->attributes['BALSA'] = $balsa;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setPlacaAttribute($objeto->placa);
			$this->setUfAttribute($objeto->uf);
			$this->setRntcAttribute($objeto->rntc);
			$this->setVagaoAttribute($objeto->vagao);
			$this->setBalsaAttribute($objeto->balsa);

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
			'placa' => $this->getPlacaAttribute(),
			'uf' => $this->getUfAttribute(),
			'rntc' => $this->getRntcAttribute(),
			'vagao' => $this->getVagaoAttribute(),
			'balsa' => $this->getBalsaAttribute(),
        ];
    }
}