<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PCP_SERVICO] 
                                                                                
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

class PcpServico extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PCP_SERVICO';

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

    public function getIdPcpOpDetalheAttribute() 
	{
		return $this->attributes['ID_PCP_OP_DETALHE'];
	}

	public function setIdPcpOpDetalheAttribute($idPcpOpDetalhe) 
	{
		$this->attributes['ID_PCP_OP_DETALHE'] = $idPcpOpDetalhe;
	}

    public function getInicioRealizadoAttribute() 
	{
		return $this->attributes['INICIO_REALIZADO'];
	}

	public function setInicioRealizadoAttribute($inicioRealizado) 
	{
		$this->attributes['INICIO_REALIZADO'] = $inicioRealizado;
	}

    public function getTerminoRealizadoAttribute() 
	{
		return $this->attributes['TERMINO_REALIZADO'];
	}

	public function setTerminoRealizadoAttribute($terminoRealizado) 
	{
		$this->attributes['TERMINO_REALIZADO'] = $terminoRealizado;
	}

    public function getHorasRealizadoAttribute() 
	{
		return $this->attributes['HORAS_REALIZADO'];
	}

	public function setHorasRealizadoAttribute($horasRealizado) 
	{
		$this->attributes['HORAS_REALIZADO'] = $horasRealizado;
	}

    public function getMinutosRealizadoAttribute() 
	{
		return $this->attributes['MINUTOS_REALIZADO'];
	}

	public function setMinutosRealizadoAttribute($minutosRealizado) 
	{
		$this->attributes['MINUTOS_REALIZADO'] = $minutosRealizado;
	}

    public function getSegundosRealizadoAttribute() 
	{
		return $this->attributes['SEGUNDOS_REALIZADO'];
	}

	public function setSegundosRealizadoAttribute($segundosRealizado) 
	{
		$this->attributes['SEGUNDOS_REALIZADO'] = $segundosRealizado;
	}

    public function getCustoRealizadoAttribute() 
	{
		return $this->attributes['CUSTO_REALIZADO'];
	}

	public function setCustoRealizadoAttribute($custoRealizado) 
	{
		$this->attributes['CUSTO_REALIZADO'] = $custoRealizado;
	}

    public function getInicioPrevistoAttribute() 
	{
		return $this->attributes['INICIO_PREVISTO'];
	}

	public function setInicioPrevistoAttribute($inicioPrevisto) 
	{
		$this->attributes['INICIO_PREVISTO'] = $inicioPrevisto;
	}

    public function getTerminoPrevistoAttribute() 
	{
		return $this->attributes['TERMINO_PREVISTO'];
	}

	public function setTerminoPrevistoAttribute($terminoPrevisto) 
	{
		$this->attributes['TERMINO_PREVISTO'] = $terminoPrevisto;
	}

    public function getHorasPrevistoAttribute() 
	{
		return $this->attributes['HORAS_PREVISTO'];
	}

	public function setHorasPrevistoAttribute($horasPrevisto) 
	{
		$this->attributes['HORAS_PREVISTO'] = $horasPrevisto;
	}

    public function getMinutosPrevistoAttribute() 
	{
		return $this->attributes['MINUTOS_PREVISTO'];
	}

	public function setMinutosPrevistoAttribute($minutosPrevisto) 
	{
		$this->attributes['MINUTOS_PREVISTO'] = $minutosPrevisto;
	}

    public function getSegundosPrevistoAttribute() 
	{
		return $this->attributes['SEGUNDOS_PREVISTO'];
	}

	public function setSegundosPrevistoAttribute($segundosPrevisto) 
	{
		$this->attributes['SEGUNDOS_PREVISTO'] = $segundosPrevisto;
	}

    public function getCustoPrevistoAttribute() 
	{
		return $this->attributes['CUSTO_PREVISTO'];
	}

	public function setCustoPrevistoAttribute($custoPrevisto) 
	{
		$this->attributes['CUSTO_PREVISTO'] = $custoPrevisto;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdPcpOpDetalheAttribute($objeto->idPcpOpDetalhe);
			$this->setInicioRealizadoAttribute($objeto->inicioRealizado);
			$this->setTerminoRealizadoAttribute($objeto->terminoRealizado);
			$this->setHorasRealizadoAttribute($objeto->horasRealizado);
			$this->setMinutosRealizadoAttribute($objeto->minutosRealizado);
			$this->setSegundosRealizadoAttribute($objeto->segundosRealizado);
			$this->setCustoRealizadoAttribute($objeto->custoRealizado);
			$this->setInicioPrevistoAttribute($objeto->inicioPrevisto);
			$this->setTerminoPrevistoAttribute($objeto->terminoPrevisto);
			$this->setHorasPrevistoAttribute($objeto->horasPrevisto);
			$this->setMinutosPrevistoAttribute($objeto->minutosPrevisto);
			$this->setSegundosPrevistoAttribute($objeto->segundosPrevisto);
			$this->setCustoPrevistoAttribute($objeto->custoPrevisto);

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
			'idPcpOpDetalhe' => $this->getIdPcpOpDetalheAttribute(),
			'inicioRealizado' => $this->getInicioRealizadoAttribute(),
			'terminoRealizado' => $this->getTerminoRealizadoAttribute(),
			'horasRealizado' => $this->getHorasRealizadoAttribute(),
			'minutosRealizado' => $this->getMinutosRealizadoAttribute(),
			'segundosRealizado' => $this->getSegundosRealizadoAttribute(),
			'custoRealizado' => $this->getCustoRealizadoAttribute(),
			'inicioPrevisto' => $this->getInicioPrevistoAttribute(),
			'terminoPrevisto' => $this->getTerminoPrevistoAttribute(),
			'horasPrevisto' => $this->getHorasPrevistoAttribute(),
			'minutosPrevisto' => $this->getMinutosPrevistoAttribute(),
			'segundosPrevisto' => $this->getSegundosPrevistoAttribute(),
			'custoPrevisto' => $this->getCustoPrevistoAttribute(),
        ];
    }
}