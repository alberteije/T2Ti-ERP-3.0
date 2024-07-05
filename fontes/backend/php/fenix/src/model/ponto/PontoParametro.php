<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PONTO_PARAMETRO] 
                                                                                
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

class PontoParametro extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PONTO_PARAMETRO';

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

    public function getMesAnoAttribute() 
	{
		return $this->attributes['MES_ANO'];
	}

	public function setMesAnoAttribute($mesAno) 
	{
		$this->attributes['MES_ANO'] = $mesAno;
	}

    public function getDiaInicialApuracaoAttribute() 
	{
		return $this->attributes['DIA_INICIAL_APURACAO'];
	}

	public function setDiaInicialApuracaoAttribute($diaInicialApuracao) 
	{
		$this->attributes['DIA_INICIAL_APURACAO'] = $diaInicialApuracao;
	}

    public function getHoraNoturnaInicioAttribute() 
	{
		return $this->attributes['HORA_NOTURNA_INICIO'];
	}

	public function setHoraNoturnaInicioAttribute($horaNoturnaInicio) 
	{
		$this->attributes['HORA_NOTURNA_INICIO'] = $horaNoturnaInicio;
	}

    public function getHoraNoturnaFimAttribute() 
	{
		return $this->attributes['HORA_NOTURNA_FIM'];
	}

	public function setHoraNoturnaFimAttribute($horaNoturnaFim) 
	{
		$this->attributes['HORA_NOTURNA_FIM'] = $horaNoturnaFim;
	}

    public function getPeriodoMinimoInterjornadaAttribute() 
	{
		return $this->attributes['PERIODO_MINIMO_INTERJORNADA'];
	}

	public function setPeriodoMinimoInterjornadaAttribute($periodoMinimoInterjornada) 
	{
		$this->attributes['PERIODO_MINIMO_INTERJORNADA'] = $periodoMinimoInterjornada;
	}

    public function getPercentualHeDiurnaAttribute() 
	{
		return $this->attributes['PERCENTUAL_HE_DIURNA'];
	}

	public function setPercentualHeDiurnaAttribute($percentualHeDiurna) 
	{
		$this->attributes['PERCENTUAL_HE_DIURNA'] = $percentualHeDiurna;
	}

    public function getPercentualHeNoturnaAttribute() 
	{
		return $this->attributes['PERCENTUAL_HE_NOTURNA'];
	}

	public function setPercentualHeNoturnaAttribute($percentualHeNoturna) 
	{
		$this->attributes['PERCENTUAL_HE_NOTURNA'] = $percentualHeNoturna;
	}

    public function getDuracaoHoraNoturnaAttribute() 
	{
		return $this->attributes['DURACAO_HORA_NOTURNA'];
	}

	public function setDuracaoHoraNoturnaAttribute($duracaoHoraNoturna) 
	{
		$this->attributes['DURACAO_HORA_NOTURNA'] = $duracaoHoraNoturna;
	}

    public function getTratamentoHoraMaisAttribute() 
	{
		return $this->attributes['TRATAMENTO_HORA_MAIS'];
	}

	public function setTratamentoHoraMaisAttribute($tratamentoHoraMais) 
	{
		$this->attributes['TRATAMENTO_HORA_MAIS'] = $tratamentoHoraMais;
	}

    public function getTratamentoHoraMenosAttribute() 
	{
		return $this->attributes['TRATAMENTO_HORA_MENOS'];
	}

	public function setTratamentoHoraMenosAttribute($tratamentoHoraMenos) 
	{
		$this->attributes['TRATAMENTO_HORA_MENOS'] = $tratamentoHoraMenos;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setMesAnoAttribute($objeto->mesAno);
			$this->setDiaInicialApuracaoAttribute($objeto->diaInicialApuracao);
			$this->setHoraNoturnaInicioAttribute($objeto->horaNoturnaInicio);
			$this->setHoraNoturnaFimAttribute($objeto->horaNoturnaFim);
			$this->setPeriodoMinimoInterjornadaAttribute($objeto->periodoMinimoInterjornada);
			$this->setPercentualHeDiurnaAttribute($objeto->percentualHeDiurna);
			$this->setPercentualHeNoturnaAttribute($objeto->percentualHeNoturna);
			$this->setDuracaoHoraNoturnaAttribute($objeto->duracaoHoraNoturna);
			$this->setTratamentoHoraMaisAttribute($objeto->tratamentoHoraMais);
			$this->setTratamentoHoraMenosAttribute($objeto->tratamentoHoraMenos);

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
			'mesAno' => $this->getMesAnoAttribute(),
			'diaInicialApuracao' => $this->getDiaInicialApuracaoAttribute(),
			'horaNoturnaInicio' => $this->getHoraNoturnaInicioAttribute(),
			'horaNoturnaFim' => $this->getHoraNoturnaFimAttribute(),
			'periodoMinimoInterjornada' => $this->getPeriodoMinimoInterjornadaAttribute(),
			'percentualHeDiurna' => $this->getPercentualHeDiurnaAttribute(),
			'percentualHeNoturna' => $this->getPercentualHeNoturnaAttribute(),
			'duracaoHoraNoturna' => $this->getDuracaoHoraNoturnaAttribute(),
			'tratamentoHoraMais' => $this->getTratamentoHoraMaisAttribute(),
			'tratamentoHoraMenos' => $this->getTratamentoHoraMenosAttribute(),
        ];
    }
}