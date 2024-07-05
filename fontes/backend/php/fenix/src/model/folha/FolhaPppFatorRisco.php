<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [FOLHA_PPP_FATOR_RISCO] 
                                                                                
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

class FolhaPppFatorRisco extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'FOLHA_PPP_FATOR_RISCO';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */
    public function folhaPpp()
    {
    	return $this->belongsTo(FolhaPpp::class, 'ID_FOLHA_PPP', 'ID');
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

    public function getDataInicioAttribute() 
	{
		return $this->attributes['DATA_INICIO'];
	}

	public function setDataInicioAttribute($dataInicio) 
	{
		$this->attributes['DATA_INICIO'] = $dataInicio;
	}

    public function getDataFimAttribute() 
	{
		return $this->attributes['DATA_FIM'];
	}

	public function setDataFimAttribute($dataFim) 
	{
		$this->attributes['DATA_FIM'] = $dataFim;
	}

    public function getTipoAttribute() 
	{
		return $this->attributes['TIPO'];
	}

	public function setTipoAttribute($tipo) 
	{
		$this->attributes['TIPO'] = $tipo;
	}

    public function getFatorRiscoAttribute() 
	{
		return $this->attributes['FATOR_RISCO'];
	}

	public function setFatorRiscoAttribute($fatorRisco) 
	{
		$this->attributes['FATOR_RISCO'] = $fatorRisco;
	}

    public function getIntensidadeAttribute() 
	{
		return $this->attributes['INTENSIDADE'];
	}

	public function setIntensidadeAttribute($intensidade) 
	{
		$this->attributes['INTENSIDADE'] = $intensidade;
	}

    public function getTecnicaUtilizadaAttribute() 
	{
		return $this->attributes['TECNICA_UTILIZADA'];
	}

	public function setTecnicaUtilizadaAttribute($tecnicaUtilizada) 
	{
		$this->attributes['TECNICA_UTILIZADA'] = $tecnicaUtilizada;
	}

    public function getEpcEficazAttribute() 
	{
		return $this->attributes['EPC_EFICAZ'];
	}

	public function setEpcEficazAttribute($epcEficaz) 
	{
		$this->attributes['EPC_EFICAZ'] = $epcEficaz;
	}

    public function getEpiEficazAttribute() 
	{
		return $this->attributes['EPI_EFICAZ'];
	}

	public function setEpiEficazAttribute($epiEficaz) 
	{
		$this->attributes['EPI_EFICAZ'] = $epiEficaz;
	}

    public function getCaEpiAttribute() 
	{
		return $this->attributes['CA_EPI'];
	}

	public function setCaEpiAttribute($caEpi) 
	{
		$this->attributes['CA_EPI'] = $caEpi;
	}

    public function getAtendimentoNr061Attribute() 
	{
		return $this->attributes['ATENDIMENTO_NR06_1'];
	}

	public function setAtendimentoNr061Attribute($atendimentoNr061) 
	{
		$this->attributes['ATENDIMENTO_NR06_1'] = $atendimentoNr061;
	}

    public function getAtendimentoNr062Attribute() 
	{
		return $this->attributes['ATENDIMENTO_NR06_2'];
	}

	public function setAtendimentoNr062Attribute($atendimentoNr062) 
	{
		$this->attributes['ATENDIMENTO_NR06_2'] = $atendimentoNr062;
	}

    public function getAtendimentoNr063Attribute() 
	{
		return $this->attributes['ATENDIMENTO_NR06_3'];
	}

	public function setAtendimentoNr063Attribute($atendimentoNr063) 
	{
		$this->attributes['ATENDIMENTO_NR06_3'] = $atendimentoNr063;
	}

    public function getAtendimentoNr064Attribute() 
	{
		return $this->attributes['ATENDIMENTO_NR06_4'];
	}

	public function setAtendimentoNr064Attribute($atendimentoNr064) 
	{
		$this->attributes['ATENDIMENTO_NR06_4'] = $atendimentoNr064;
	}

    public function getAtendimentoNr065Attribute() 
	{
		return $this->attributes['ATENDIMENTO_NR06_5'];
	}

	public function setAtendimentoNr065Attribute($atendimentoNr065) 
	{
		$this->attributes['ATENDIMENTO_NR06_5'] = $atendimentoNr065;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setDataInicioAttribute($objeto->dataInicio);
			$this->setDataFimAttribute($objeto->dataFim);
			$this->setTipoAttribute($objeto->tipo);
			$this->setFatorRiscoAttribute($objeto->fatorRisco);
			$this->setIntensidadeAttribute($objeto->intensidade);
			$this->setTecnicaUtilizadaAttribute($objeto->tecnicaUtilizada);
			$this->setEpcEficazAttribute($objeto->epcEficaz);
			$this->setEpiEficazAttribute($objeto->epiEficaz);
			$this->setCaEpiAttribute($objeto->caEpi);
			$this->setAtendimentoNr061Attribute($objeto->atendimentoNr061);
			$this->setAtendimentoNr062Attribute($objeto->atendimentoNr062);
			$this->setAtendimentoNr063Attribute($objeto->atendimentoNr063);
			$this->setAtendimentoNr064Attribute($objeto->atendimentoNr064);
			$this->setAtendimentoNr065Attribute($objeto->atendimentoNr065);

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
			'dataInicio' => $this->getDataInicioAttribute(),
			'dataFim' => $this->getDataFimAttribute(),
			'tipo' => $this->getTipoAttribute(),
			'fatorRisco' => $this->getFatorRiscoAttribute(),
			'intensidade' => $this->getIntensidadeAttribute(),
			'tecnicaUtilizada' => $this->getTecnicaUtilizadaAttribute(),
			'epcEficaz' => $this->getEpcEficazAttribute(),
			'epiEficaz' => $this->getEpiEficazAttribute(),
			'caEpi' => $this->getCaEpiAttribute(),
			'atendimentoNr061' => $this->getAtendimentoNr061Attribute(),
			'atendimentoNr062' => $this->getAtendimentoNr062Attribute(),
			'atendimentoNr063' => $this->getAtendimentoNr063Attribute(),
			'atendimentoNr064' => $this->getAtendimentoNr064Attribute(),
			'atendimentoNr065' => $this->getAtendimentoNr065Attribute(),
        ];
    }
}