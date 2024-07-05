<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PONTO_ESCALA] 
                                                                                
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

class PontoEscala extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PONTO_ESCALA';

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

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getDescontoHoraDiaAttribute() 
	{
		return $this->attributes['DESCONTO_HORA_DIA'];
	}

	public function setDescontoHoraDiaAttribute($descontoHoraDia) 
	{
		$this->attributes['DESCONTO_HORA_DIA'] = $descontoHoraDia;
	}

    public function getDescontoDsrAttribute() 
	{
		return $this->attributes['DESCONTO_DSR'];
	}

	public function setDescontoDsrAttribute($descontoDsr) 
	{
		$this->attributes['DESCONTO_DSR'] = $descontoDsr;
	}

    public function getCodigoHorarioDomingoAttribute() 
	{
		return $this->attributes['CODIGO_HORARIO_DOMINGO'];
	}

	public function setCodigoHorarioDomingoAttribute($codigoHorarioDomingo) 
	{
		$this->attributes['CODIGO_HORARIO_DOMINGO'] = $codigoHorarioDomingo;
	}

    public function getCodigoHorarioSegundaAttribute() 
	{
		return $this->attributes['CODIGO_HORARIO_SEGUNDA'];
	}

	public function setCodigoHorarioSegundaAttribute($codigoHorarioSegunda) 
	{
		$this->attributes['CODIGO_HORARIO_SEGUNDA'] = $codigoHorarioSegunda;
	}

    public function getCodigoHorarioTercaAttribute() 
	{
		return $this->attributes['CODIGO_HORARIO_TERCA'];
	}

	public function setCodigoHorarioTercaAttribute($codigoHorarioTerca) 
	{
		$this->attributes['CODIGO_HORARIO_TERCA'] = $codigoHorarioTerca;
	}

    public function getCodigoHorarioQuartaAttribute() 
	{
		return $this->attributes['CODIGO_HORARIO_QUARTA'];
	}

	public function setCodigoHorarioQuartaAttribute($codigoHorarioQuarta) 
	{
		$this->attributes['CODIGO_HORARIO_QUARTA'] = $codigoHorarioQuarta;
	}

    public function getCodigoHorarioQuintaAttribute() 
	{
		return $this->attributes['CODIGO_HORARIO_QUINTA'];
	}

	public function setCodigoHorarioQuintaAttribute($codigoHorarioQuinta) 
	{
		$this->attributes['CODIGO_HORARIO_QUINTA'] = $codigoHorarioQuinta;
	}

    public function getCodigoHorarioSextaAttribute() 
	{
		return $this->attributes['CODIGO_HORARIO_SEXTA'];
	}

	public function setCodigoHorarioSextaAttribute($codigoHorarioSexta) 
	{
		$this->attributes['CODIGO_HORARIO_SEXTA'] = $codigoHorarioSexta;
	}

    public function getCodigoHorarioSabadoAttribute() 
	{
		return $this->attributes['CODIGO_HORARIO_SABADO'];
	}

	public function setCodigoHorarioSabadoAttribute($codigoHorarioSabado) 
	{
		$this->attributes['CODIGO_HORARIO_SABADO'] = $codigoHorarioSabado;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setNomeAttribute($objeto->nome);
			$this->setDescontoHoraDiaAttribute($objeto->descontoHoraDia);
			$this->setDescontoDsrAttribute($objeto->descontoDsr);
			$this->setCodigoHorarioDomingoAttribute($objeto->codigoHorarioDomingo);
			$this->setCodigoHorarioSegundaAttribute($objeto->codigoHorarioSegunda);
			$this->setCodigoHorarioTercaAttribute($objeto->codigoHorarioTerca);
			$this->setCodigoHorarioQuartaAttribute($objeto->codigoHorarioQuarta);
			$this->setCodigoHorarioQuintaAttribute($objeto->codigoHorarioQuinta);
			$this->setCodigoHorarioSextaAttribute($objeto->codigoHorarioSexta);
			$this->setCodigoHorarioSabadoAttribute($objeto->codigoHorarioSabado);

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
			'nome' => $this->getNomeAttribute(),
			'descontoHoraDia' => $this->getDescontoHoraDiaAttribute(),
			'descontoDsr' => $this->getDescontoDsrAttribute(),
			'codigoHorarioDomingo' => $this->getCodigoHorarioDomingoAttribute(),
			'codigoHorarioSegunda' => $this->getCodigoHorarioSegundaAttribute(),
			'codigoHorarioTerca' => $this->getCodigoHorarioTercaAttribute(),
			'codigoHorarioQuarta' => $this->getCodigoHorarioQuartaAttribute(),
			'codigoHorarioQuinta' => $this->getCodigoHorarioQuintaAttribute(),
			'codigoHorarioSexta' => $this->getCodigoHorarioSextaAttribute(),
			'codigoHorarioSabado' => $this->getCodigoHorarioSabadoAttribute(),
        ];
    }
}