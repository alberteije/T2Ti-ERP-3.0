<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [PONTO_MARCACAO] 
                                                                                
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

class PontoMarcacao extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'PONTO_MARCACAO';

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

    public function getIdPontoRelogioAttribute() 
	{
		return $this->attributes['ID_PONTO_RELOGIO'];
	}

	public function setIdPontoRelogioAttribute($idPontoRelogio) 
	{
		$this->attributes['ID_PONTO_RELOGIO'] = $idPontoRelogio;
	}

    public function getIdColaboradorAttribute() 
	{
		return $this->attributes['ID_COLABORADOR'];
	}

	public function setIdColaboradorAttribute($idColaborador) 
	{
		$this->attributes['ID_COLABORADOR'] = $idColaborador;
	}

    public function getNsrAttribute() 
	{
		return $this->attributes['NSR'];
	}

	public function setNsrAttribute($nsr) 
	{
		$this->attributes['NSR'] = $nsr;
	}

    public function getDataMarcacaoAttribute() 
	{
		return $this->attributes['DATA_MARCACAO'];
	}

	public function setDataMarcacaoAttribute($dataMarcacao) 
	{
		$this->attributes['DATA_MARCACAO'] = $dataMarcacao;
	}

    public function getHoraMarcacaoAttribute() 
	{
		return $this->attributes['HORA_MARCACAO'];
	}

	public function setHoraMarcacaoAttribute($horaMarcacao) 
	{
		$this->attributes['HORA_MARCACAO'] = $horaMarcacao;
	}

    public function getTipoMarcacaoAttribute() 
	{
		return $this->attributes['TIPO_MARCACAO'];
	}

	public function setTipoMarcacaoAttribute($tipoMarcacao) 
	{
		$this->attributes['TIPO_MARCACAO'] = $tipoMarcacao;
	}

    public function getTipoRegistroAttribute() 
	{
		return $this->attributes['TIPO_REGISTRO'];
	}

	public function setTipoRegistroAttribute($tipoRegistro) 
	{
		$this->attributes['TIPO_REGISTRO'] = $tipoRegistro;
	}

    public function getParEntradaSaidaAttribute() 
	{
		return $this->attributes['PAR_ENTRADA_SAIDA'];
	}

	public function setParEntradaSaidaAttribute($parEntradaSaida) 
	{
		$this->attributes['PAR_ENTRADA_SAIDA'] = $parEntradaSaida;
	}

    public function getJustificativaAttribute() 
	{
		return $this->attributes['JUSTIFICATIVA'];
	}

	public function setJustificativaAttribute($justificativa) 
	{
		$this->attributes['JUSTIFICATIVA'] = $justificativa;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdPontoRelogioAttribute($objeto->idPontoRelogio);
			$this->setIdColaboradorAttribute($objeto->idColaborador);
			$this->setNsrAttribute($objeto->nsr);
			$this->setDataMarcacaoAttribute($objeto->dataMarcacao);
			$this->setHoraMarcacaoAttribute($objeto->horaMarcacao);
			$this->setTipoMarcacaoAttribute($objeto->tipoMarcacao);
			$this->setTipoRegistroAttribute($objeto->tipoRegistro);
			$this->setParEntradaSaidaAttribute($objeto->parEntradaSaida);
			$this->setJustificativaAttribute($objeto->justificativa);

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
			'idPontoRelogio' => $this->getIdPontoRelogioAttribute(),
			'idColaborador' => $this->getIdColaboradorAttribute(),
			'nsr' => $this->getNsrAttribute(),
			'dataMarcacao' => $this->getDataMarcacaoAttribute(),
			'horaMarcacao' => $this->getHoraMarcacaoAttribute(),
			'tipoMarcacao' => $this->getTipoMarcacaoAttribute(),
			'tipoRegistro' => $this->getTipoRegistroAttribute(),
			'parEntradaSaida' => $this->getParEntradaSaidaAttribute(),
			'justificativa' => $this->getJustificativaAttribute(),
        ];
    }
}