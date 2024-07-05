<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [CTE_AQUAVIARIO_BALSA] 
                                                                                
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

class CteAquaviarioBalsa extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'CTE_AQUAVIARIO_BALSA';

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

    public function getIdCteAquaviarioAttribute() 
	{
		return $this->attributes['ID_CTE_AQUAVIARIO'];
	}

	public function setIdCteAquaviarioAttribute($idCteAquaviario) 
	{
		$this->attributes['ID_CTE_AQUAVIARIO'] = $idCteAquaviario;
	}

    public function getNumeroViagemAttribute() 
	{
		return $this->attributes['NUMERO_VIAGEM'];
	}

	public function setNumeroViagemAttribute($numeroViagem) 
	{
		$this->attributes['NUMERO_VIAGEM'] = $numeroViagem;
	}

    public function getDirecaoAttribute() 
	{
		return $this->attributes['DIRECAO'];
	}

	public function setDirecaoAttribute($direcao) 
	{
		$this->attributes['DIRECAO'] = $direcao;
	}

    public function getPortoEmbarqueAttribute() 
	{
		return $this->attributes['PORTO_EMBARQUE'];
	}

	public function setPortoEmbarqueAttribute($portoEmbarque) 
	{
		$this->attributes['PORTO_EMBARQUE'] = $portoEmbarque;
	}

    public function getPortoTransbordoAttribute() 
	{
		return $this->attributes['PORTO_TRANSBORDO'];
	}

	public function setPortoTransbordoAttribute($portoTransbordo) 
	{
		$this->attributes['PORTO_TRANSBORDO'] = $portoTransbordo;
	}

    public function getPortoDestinoAttribute() 
	{
		return $this->attributes['PORTO_DESTINO'];
	}

	public function setPortoDestinoAttribute($portoDestino) 
	{
		$this->attributes['PORTO_DESTINO'] = $portoDestino;
	}

    public function getTipoNavegacaoAttribute() 
	{
		return $this->attributes['TIPO_NAVEGACAO'];
	}

	public function setTipoNavegacaoAttribute($tipoNavegacao) 
	{
		$this->attributes['TIPO_NAVEGACAO'] = $tipoNavegacao;
	}

    public function getIrinAttribute() 
	{
		return $this->attributes['IRIN'];
	}

	public function setIrinAttribute($irin) 
	{
		$this->attributes['IRIN'] = $irin;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdCteAquaviarioAttribute($objeto->idCteAquaviario);
			$this->setNumeroViagemAttribute($objeto->numeroViagem);
			$this->setDirecaoAttribute($objeto->direcao);
			$this->setPortoEmbarqueAttribute($objeto->portoEmbarque);
			$this->setPortoTransbordoAttribute($objeto->portoTransbordo);
			$this->setPortoDestinoAttribute($objeto->portoDestino);
			$this->setTipoNavegacaoAttribute($objeto->tipoNavegacao);
			$this->setIrinAttribute($objeto->irin);

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
			'idCteAquaviario' => $this->getIdCteAquaviarioAttribute(),
			'numeroViagem' => $this->getNumeroViagemAttribute(),
			'direcao' => $this->getDirecaoAttribute(),
			'portoEmbarque' => $this->getPortoEmbarqueAttribute(),
			'portoTransbordo' => $this->getPortoTransbordoAttribute(),
			'portoDestino' => $this->getPortoDestinoAttribute(),
			'tipoNavegacao' => $this->getTipoNavegacaoAttribute(),
			'irin' => $this->getIrinAttribute(),
        ];
    }
}