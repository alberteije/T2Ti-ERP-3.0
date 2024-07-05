<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PONTO_HORARIO] 
                                                                                
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

class PontoHorario extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PONTO_HORARIO';

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

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}

    public function getCodigoAttribute() 
	{
		return $this->attributes['CODIGO'];
	}

	public function setCodigoAttribute($codigo) 
	{
		$this->attributes['CODIGO'] = $codigo;
	}

    public function getNomeAttribute() 
	{
		return $this->attributes['NOME'];
	}

	public function setNomeAttribute($nome) 
	{
		$this->attributes['NOME'] = $nome;
	}

    public function getTipoTrabalhoAttribute() 
	{
		return $this->attributes['TIPO_TRABALHO'];
	}

	public function setTipoTrabalhoAttribute($tipoTrabalho) 
	{
		$this->attributes['TIPO_TRABALHO'] = $tipoTrabalho;
	}

    public function getCargaHorariaAttribute() 
	{
		return $this->attributes['CARGA_HORARIA'];
	}

	public function setCargaHorariaAttribute($cargaHoraria) 
	{
		$this->attributes['CARGA_HORARIA'] = $cargaHoraria;
	}

    public function getEntrada01Attribute() 
	{
		return $this->attributes['ENTRADA01'];
	}

	public function setEntrada01Attribute($entrada01) 
	{
		$this->attributes['ENTRADA01'] = $entrada01;
	}

    public function getSaida01Attribute() 
	{
		return $this->attributes['SAIDA01'];
	}

	public function setSaida01Attribute($saida01) 
	{
		$this->attributes['SAIDA01'] = $saida01;
	}

    public function getEntrada02Attribute() 
	{
		return $this->attributes['ENTRADA02'];
	}

	public function setEntrada02Attribute($entrada02) 
	{
		$this->attributes['ENTRADA02'] = $entrada02;
	}

    public function getSaida02Attribute() 
	{
		return $this->attributes['SAIDA02'];
	}

	public function setSaida02Attribute($saida02) 
	{
		$this->attributes['SAIDA02'] = $saida02;
	}

    public function getEntrada03Attribute() 
	{
		return $this->attributes['ENTRADA03'];
	}

	public function setEntrada03Attribute($entrada03) 
	{
		$this->attributes['ENTRADA03'] = $entrada03;
	}

    public function getSaida03Attribute() 
	{
		return $this->attributes['SAIDA03'];
	}

	public function setSaida03Attribute($saida03) 
	{
		$this->attributes['SAIDA03'] = $saida03;
	}

    public function getEntrada04Attribute() 
	{
		return $this->attributes['ENTRADA04'];
	}

	public function setEntrada04Attribute($entrada04) 
	{
		$this->attributes['ENTRADA04'] = $entrada04;
	}

    public function getSaida04Attribute() 
	{
		return $this->attributes['SAIDA04'];
	}

	public function setSaida04Attribute($saida04) 
	{
		$this->attributes['SAIDA04'] = $saida04;
	}

    public function getEntrada05Attribute() 
	{
		return $this->attributes['ENTRADA05'];
	}

	public function setEntrada05Attribute($entrada05) 
	{
		$this->attributes['ENTRADA05'] = $entrada05;
	}

    public function getSaida05Attribute() 
	{
		return $this->attributes['SAIDA05'];
	}

	public function setSaida05Attribute($saida05) 
	{
		$this->attributes['SAIDA05'] = $saida05;
	}

    public function getHoraInicioJornadaAttribute() 
	{
		return $this->attributes['HORA_INICIO_JORNADA'];
	}

	public function setHoraInicioJornadaAttribute($horaInicioJornada) 
	{
		$this->attributes['HORA_INICIO_JORNADA'] = $horaInicioJornada;
	}

    public function getHoraFimJornadaAttribute() 
	{
		return $this->attributes['HORA_FIM_JORNADA'];
	}

	public function setHoraFimJornadaAttribute($horaFimJornada) 
	{
		$this->attributes['HORA_FIM_JORNADA'] = $horaFimJornada;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setTipoAttribute($objeto->tipo);
			$this->setCodigoAttribute($objeto->codigo);
			$this->setNomeAttribute($objeto->nome);
			$this->setTipoTrabalhoAttribute($objeto->tipoTrabalho);
			$this->setCargaHorariaAttribute($objeto->cargaHoraria);
			$this->setEntrada01Attribute($objeto->entrada01);
			$this->setSaida01Attribute($objeto->saida01);
			$this->setEntrada02Attribute($objeto->entrada02);
			$this->setSaida02Attribute($objeto->saida02);
			$this->setEntrada03Attribute($objeto->entrada03);
			$this->setSaida03Attribute($objeto->saida03);
			$this->setEntrada04Attribute($objeto->entrada04);
			$this->setSaida04Attribute($objeto->saida04);
			$this->setEntrada05Attribute($objeto->entrada05);
			$this->setSaida05Attribute($objeto->saida05);
			$this->setHoraInicioJornadaAttribute($objeto->horaInicioJornada);
			$this->setHoraFimJornadaAttribute($objeto->horaFimJornada);

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
			'tipo' => $this->getTipoAttribute(),
			'codigo' => $this->getCodigoAttribute(),
			'nome' => $this->getNomeAttribute(),
			'tipoTrabalho' => $this->getTipoTrabalhoAttribute(),
			'cargaHoraria' => $this->getCargaHorariaAttribute(),
			'entrada01' => $this->getEntrada01Attribute(),
			'saida01' => $this->getSaida01Attribute(),
			'entrada02' => $this->getEntrada02Attribute(),
			'saida02' => $this->getSaida02Attribute(),
			'entrada03' => $this->getEntrada03Attribute(),
			'saida03' => $this->getSaida03Attribute(),
			'entrada04' => $this->getEntrada04Attribute(),
			'saida04' => $this->getSaida04Attribute(),
			'entrada05' => $this->getEntrada05Attribute(),
			'saida05' => $this->getSaida05Attribute(),
			'horaInicioJornada' => $this->getHoraInicioJornadaAttribute(),
			'horaFimJornada' => $this->getHoraFimJornadaAttribute(),
        ];
    }
}