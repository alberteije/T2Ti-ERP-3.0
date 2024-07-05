<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_AQUAVIARIO] 
                                                                                
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

class CteAquaviario extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_AQUAVIARIO';

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

    public function getIdCteCabecalhoAttribute() 
	{
		return $this->attributes['ID_CTE_CABECALHO'];
	}

	public function setIdCteCabecalhoAttribute($idCteCabecalho) 
	{
		$this->attributes['ID_CTE_CABECALHO'] = $idCteCabecalho;
	}

    public function getValorPrestacaoAttribute() 
	{
		return $this->attributes['VALOR_PRESTACAO'];
	}

	public function setValorPrestacaoAttribute($valorPrestacao) 
	{
		$this->attributes['VALOR_PRESTACAO'] = $valorPrestacao;
	}

    public function getAfrmmAttribute() 
	{
		return $this->attributes['AFRMM'];
	}

	public function setAfrmmAttribute($afrmm) 
	{
		$this->attributes['AFRMM'] = $afrmm;
	}

    public function getNumeroBookingAttribute() 
	{
		return $this->attributes['NUMERO_BOOKING'];
	}

	public function setNumeroBookingAttribute($numeroBooking) 
	{
		$this->attributes['NUMERO_BOOKING'] = $numeroBooking;
	}

    public function getNumeroControleAttribute() 
	{
		return $this->attributes['NUMERO_CONTROLE'];
	}

	public function setNumeroControleAttribute($numeroControle) 
	{
		$this->attributes['NUMERO_CONTROLE'] = $numeroControle;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteCabecalhoAttribute($objeto->idCteCabecalho);
			$this->setValorPrestacaoAttribute($objeto->valorPrestacao);
			$this->setAfrmmAttribute($objeto->afrmm);
			$this->setNumeroBookingAttribute($objeto->numeroBooking);
			$this->setNumeroControleAttribute($objeto->numeroControle);

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
			'idCteCabecalho' => $this->getIdCteCabecalhoAttribute(),
			'valorPrestacao' => $this->getValorPrestacaoAttribute(),
			'afrmm' => $this->getAfrmmAttribute(),
			'numeroBooking' => $this->getNumeroBookingAttribute(),
			'numeroControle' => $this->getNumeroControleAttribute(),
        ];
    }
}