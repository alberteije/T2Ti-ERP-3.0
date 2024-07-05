<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [NFE_TRANSPORTE_VOLUME] 
                                                                                
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

class NfeTransporteVolume extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'NFE_TRANSPORTE_VOLUME';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
    protected $with = ['listaNfeTransporteVolumeLacre', ];
	
    /**
     * Relations
     */
    public function listaNfeTransporteVolumeLacre()
    {
    	return $this->hasMany(NfeTransporteVolumeLacre::class, 'ID_NFE_TRANSPORTE_VOLUME', 'ID');
    }

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

    public function getQuantidadeAttribute() 
	{
		return $this->attributes['QUANTIDADE'];
	}

	public function setQuantidadeAttribute($quantidade) 
	{
		$this->attributes['QUANTIDADE'] = $quantidade;
	}

    public function getEspecieAttribute() 
	{
		return $this->attributes['ESPECIE'];
	}

	public function setEspecieAttribute($especie) 
	{
		$this->attributes['ESPECIE'] = $especie;
	}

    public function getMarcaAttribute() 
	{
		return $this->attributes['MARCA'];
	}

	public function setMarcaAttribute($marca) 
	{
		$this->attributes['MARCA'] = $marca;
	}

    public function getNumeracaoAttribute() 
	{
		return $this->attributes['NUMERACAO'];
	}

	public function setNumeracaoAttribute($numeracao) 
	{
		$this->attributes['NUMERACAO'] = $numeracao;
	}

    public function getPesoLiquidoAttribute() 
	{
		return (double)$this->attributes['PESO_LIQUIDO'];
	}

	public function setPesoLiquidoAttribute($pesoLiquido) 
	{
		$this->attributes['PESO_LIQUIDO'] = $pesoLiquido;
	}

    public function getPesoBrutoAttribute() 
	{
		return (double)$this->attributes['PESO_BRUTO'];
	}

	public function setPesoBrutoAttribute($pesoBruto) 
	{
		$this->attributes['PESO_BRUTO'] = $pesoBruto;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setQuantidadeAttribute($objeto->quantidade);
			$this->setEspecieAttribute($objeto->especie);
			$this->setMarcaAttribute($objeto->marca);
			$this->setNumeracaoAttribute($objeto->numeracao);
			$this->setPesoLiquidoAttribute($objeto->pesoLiquido);
			$this->setPesoBrutoAttribute($objeto->pesoBruto);

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
			'quantidade' => $this->getQuantidadeAttribute(),
			'especie' => $this->getEspecieAttribute(),
			'marca' => $this->getMarcaAttribute(),
			'numeracao' => $this->getNumeracaoAttribute(),
			'pesoLiquido' => $this->getPesoLiquidoAttribute(),
			'pesoBruto' => $this->getPesoBrutoAttribute(),
			'listaNfeTransporteVolumeLacre' => $this->listaNfeTransporteVolumeLacre,
        ];
    }
}