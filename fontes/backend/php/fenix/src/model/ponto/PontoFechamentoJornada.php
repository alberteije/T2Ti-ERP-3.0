<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PONTO_FECHAMENTO_JORNADA] 
                                                                                
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

class PontoFechamentoJornada extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PONTO_FECHAMENTO_JORNADA';

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

    public function getIdPontoClassificacaoJornadaAttribute() 
	{
		return $this->attributes['ID_PONTO_CLASSIFICACAO_JORNADA'];
	}

	public function setIdPontoClassificacaoJornadaAttribute($idPontoClassificacaoJornada) 
	{
		$this->attributes['ID_PONTO_CLASSIFICACAO_JORNADA'] = $idPontoClassificacaoJornada;
	}

    public function getIdColaboradorAttribute() 
	{
		return $this->attributes['ID_COLABORADOR'];
	}

	public function setIdColaboradorAttribute($idColaborador) 
	{
		$this->attributes['ID_COLABORADOR'] = $idColaborador;
	}

    public function getDataFechamentoAttribute() 
	{
		return $this->attributes['DATA_FECHAMENTO'];
	}

	public function setDataFechamentoAttribute($dataFechamento) 
	{
		$this->attributes['DATA_FECHAMENTO'] = $dataFechamento;
	}

    public function getDiaSemanaAttribute() 
	{
		return $this->attributes['DIA_SEMANA'];
	}

	public function setDiaSemanaAttribute($diaSemana) 
	{
		$this->attributes['DIA_SEMANA'] = $diaSemana;
	}

    public function getCodigoHorarioAttribute() 
	{
		return $this->attributes['CODIGO_HORARIO'];
	}

	public function setCodigoHorarioAttribute($codigoHorario) 
	{
		$this->attributes['CODIGO_HORARIO'] = $codigoHorario;
	}

    public function getCargaHorariaEsperadaAttribute() 
	{
		return $this->attributes['CARGA_HORARIA_ESPERADA'];
	}

	public function setCargaHorariaEsperadaAttribute($cargaHorariaEsperada) 
	{
		$this->attributes['CARGA_HORARIA_ESPERADA'] = $cargaHorariaEsperada;
	}

    public function getCargaHorariaDiurnaAttribute() 
	{
		return $this->attributes['CARGA_HORARIA_DIURNA'];
	}

	public function setCargaHorariaDiurnaAttribute($cargaHorariaDiurna) 
	{
		$this->attributes['CARGA_HORARIA_DIURNA'] = $cargaHorariaDiurna;
	}

    public function getCargaHorariaNoturnaAttribute() 
	{
		return $this->attributes['CARGA_HORARIA_NOTURNA'];
	}

	public function setCargaHorariaNoturnaAttribute($cargaHorariaNoturna) 
	{
		$this->attributes['CARGA_HORARIA_NOTURNA'] = $cargaHorariaNoturna;
	}

    public function getCargaHorariaTotalAttribute() 
	{
		return $this->attributes['CARGA_HORARIA_TOTAL'];
	}

	public function setCargaHorariaTotalAttribute($cargaHorariaTotal) 
	{
		$this->attributes['CARGA_HORARIA_TOTAL'] = $cargaHorariaTotal;
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

    public function getHoraExtra01Attribute() 
	{
		return $this->attributes['HORA_EXTRA01'];
	}

	public function setHoraExtra01Attribute($horaExtra01) 
	{
		$this->attributes['HORA_EXTRA01'] = $horaExtra01;
	}

    public function getPercentualHoraExtra01Attribute() 
	{
		return $this->attributes['PERCENTUAL_HORA_EXTRA01'];
	}

	public function setPercentualHoraExtra01Attribute($percentualHoraExtra01) 
	{
		$this->attributes['PERCENTUAL_HORA_EXTRA01'] = $percentualHoraExtra01;
	}

    public function getModalidadeHoraExtra01Attribute() 
	{
		return $this->attributes['MODALIDADE_HORA_EXTRA01'];
	}

	public function setModalidadeHoraExtra01Attribute($modalidadeHoraExtra01) 
	{
		$this->attributes['MODALIDADE_HORA_EXTRA01'] = $modalidadeHoraExtra01;
	}

    public function getHoraExtra02Attribute() 
	{
		return $this->attributes['HORA_EXTRA02'];
	}

	public function setHoraExtra02Attribute($horaExtra02) 
	{
		$this->attributes['HORA_EXTRA02'] = $horaExtra02;
	}

    public function getPercentualHoraExtra02Attribute() 
	{
		return $this->attributes['PERCENTUAL_HORA_EXTRA02'];
	}

	public function setPercentualHoraExtra02Attribute($percentualHoraExtra02) 
	{
		$this->attributes['PERCENTUAL_HORA_EXTRA02'] = $percentualHoraExtra02;
	}

    public function getModalidadeHoraExtra02Attribute() 
	{
		return $this->attributes['MODALIDADE_HORA_EXTRA02'];
	}

	public function setModalidadeHoraExtra02Attribute($modalidadeHoraExtra02) 
	{
		$this->attributes['MODALIDADE_HORA_EXTRA02'] = $modalidadeHoraExtra02;
	}

    public function getHoraExtra03Attribute() 
	{
		return $this->attributes['HORA_EXTRA03'];
	}

	public function setHoraExtra03Attribute($horaExtra03) 
	{
		$this->attributes['HORA_EXTRA03'] = $horaExtra03;
	}

    public function getPercentualHoraExtra03Attribute() 
	{
		return $this->attributes['PERCENTUAL_HORA_EXTRA03'];
	}

	public function setPercentualHoraExtra03Attribute($percentualHoraExtra03) 
	{
		$this->attributes['PERCENTUAL_HORA_EXTRA03'] = $percentualHoraExtra03;
	}

    public function getModalidadeHoraExtra03Attribute() 
	{
		return $this->attributes['MODALIDADE_HORA_EXTRA03'];
	}

	public function setModalidadeHoraExtra03Attribute($modalidadeHoraExtra03) 
	{
		$this->attributes['MODALIDADE_HORA_EXTRA03'] = $modalidadeHoraExtra03;
	}

    public function getHoraExtra04Attribute() 
	{
		return $this->attributes['HORA_EXTRA04'];
	}

	public function setHoraExtra04Attribute($horaExtra04) 
	{
		$this->attributes['HORA_EXTRA04'] = $horaExtra04;
	}

    public function getPercentualHoraExtra04Attribute() 
	{
		return $this->attributes['PERCENTUAL_HORA_EXTRA04'];
	}

	public function setPercentualHoraExtra04Attribute($percentualHoraExtra04) 
	{
		$this->attributes['PERCENTUAL_HORA_EXTRA04'] = $percentualHoraExtra04;
	}

    public function getModalidadeHoraExtra04Attribute() 
	{
		return $this->attributes['MODALIDADE_HORA_EXTRA04'];
	}

	public function setModalidadeHoraExtra04Attribute($modalidadeHoraExtra04) 
	{
		$this->attributes['MODALIDADE_HORA_EXTRA04'] = $modalidadeHoraExtra04;
	}

    public function getFaltaAtrasoAttribute() 
	{
		return $this->attributes['FALTA_ATRASO'];
	}

	public function setFaltaAtrasoAttribute($faltaAtraso) 
	{
		$this->attributes['FALTA_ATRASO'] = $faltaAtraso;
	}

    public function getCompensarAttribute() 
	{
		return $this->attributes['COMPENSAR'];
	}

	public function setCompensarAttribute($compensar) 
	{
		$this->attributes['COMPENSAR'] = $compensar;
	}

    public function getBancoHorasAttribute() 
	{
		return $this->attributes['BANCO_HORAS'];
	}

	public function setBancoHorasAttribute($bancoHoras) 
	{
		$this->attributes['BANCO_HORAS'] = $bancoHoras;
	}

    public function getObservacaoAttribute() 
	{
		return $this->attributes['OBSERVACAO'];
	}

	public function setObservacaoAttribute($observacao) 
	{
		$this->attributes['OBSERVACAO'] = $observacao;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdPontoClassificacaoJornadaAttribute($objeto->idPontoClassificacaoJornada);
			$this->setIdColaboradorAttribute($objeto->idColaborador);
			$this->setDataFechamentoAttribute($objeto->dataFechamento);
			$this->setDiaSemanaAttribute($objeto->diaSemana);
			$this->setCodigoHorarioAttribute($objeto->codigoHorario);
			$this->setCargaHorariaEsperadaAttribute($objeto->cargaHorariaEsperada);
			$this->setCargaHorariaDiurnaAttribute($objeto->cargaHorariaDiurna);
			$this->setCargaHorariaNoturnaAttribute($objeto->cargaHorariaNoturna);
			$this->setCargaHorariaTotalAttribute($objeto->cargaHorariaTotal);
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
			$this->setHoraExtra01Attribute($objeto->horaExtra01);
			$this->setPercentualHoraExtra01Attribute($objeto->percentualHoraExtra01);
			$this->setModalidadeHoraExtra01Attribute($objeto->modalidadeHoraExtra01);
			$this->setHoraExtra02Attribute($objeto->horaExtra02);
			$this->setPercentualHoraExtra02Attribute($objeto->percentualHoraExtra02);
			$this->setModalidadeHoraExtra02Attribute($objeto->modalidadeHoraExtra02);
			$this->setHoraExtra03Attribute($objeto->horaExtra03);
			$this->setPercentualHoraExtra03Attribute($objeto->percentualHoraExtra03);
			$this->setModalidadeHoraExtra03Attribute($objeto->modalidadeHoraExtra03);
			$this->setHoraExtra04Attribute($objeto->horaExtra04);
			$this->setPercentualHoraExtra04Attribute($objeto->percentualHoraExtra04);
			$this->setModalidadeHoraExtra04Attribute($objeto->modalidadeHoraExtra04);
			$this->setFaltaAtrasoAttribute($objeto->faltaAtraso);
			$this->setCompensarAttribute($objeto->compensar);
			$this->setBancoHorasAttribute($objeto->bancoHoras);
			$this->setObservacaoAttribute($objeto->observacao);

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
			'idPontoClassificacaoJornada' => $this->getIdPontoClassificacaoJornadaAttribute(),
			'idColaborador' => $this->getIdColaboradorAttribute(),
			'dataFechamento' => $this->getDataFechamentoAttribute(),
			'diaSemana' => $this->getDiaSemanaAttribute(),
			'codigoHorario' => $this->getCodigoHorarioAttribute(),
			'cargaHorariaEsperada' => $this->getCargaHorariaEsperadaAttribute(),
			'cargaHorariaDiurna' => $this->getCargaHorariaDiurnaAttribute(),
			'cargaHorariaNoturna' => $this->getCargaHorariaNoturnaAttribute(),
			'cargaHorariaTotal' => $this->getCargaHorariaTotalAttribute(),
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
			'horaExtra01' => $this->getHoraExtra01Attribute(),
			'percentualHoraExtra01' => $this->getPercentualHoraExtra01Attribute(),
			'modalidadeHoraExtra01' => $this->getModalidadeHoraExtra01Attribute(),
			'horaExtra02' => $this->getHoraExtra02Attribute(),
			'percentualHoraExtra02' => $this->getPercentualHoraExtra02Attribute(),
			'modalidadeHoraExtra02' => $this->getModalidadeHoraExtra02Attribute(),
			'horaExtra03' => $this->getHoraExtra03Attribute(),
			'percentualHoraExtra03' => $this->getPercentualHoraExtra03Attribute(),
			'modalidadeHoraExtra03' => $this->getModalidadeHoraExtra03Attribute(),
			'horaExtra04' => $this->getHoraExtra04Attribute(),
			'percentualHoraExtra04' => $this->getPercentualHoraExtra04Attribute(),
			'modalidadeHoraExtra04' => $this->getModalidadeHoraExtra04Attribute(),
			'faltaAtraso' => $this->getFaltaAtrasoAttribute(),
			'compensar' => $this->getCompensarAttribute(),
			'bancoHoras' => $this->getBancoHorasAttribute(),
			'observacao' => $this->getObservacaoAttribute(),
        ];
    }
}